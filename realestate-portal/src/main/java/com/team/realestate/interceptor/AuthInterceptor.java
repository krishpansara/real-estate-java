package com.team.realestate.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import java.util.Arrays;
import java.util.List;

public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession(false);
        String role = (session != null) ? (String) session.getAttribute("userRole") : null;
        boolean isAuthenticated = (session != null && session.getAttribute("userId") != null);

        // Admin restricted pages
        List<String> adminPages = Arrays.asList("dashboard", "properties", "users", "contact");
        // User restricted pages
        List<String> userPages = Arrays.asList("profile", "favourite", "edit_profile", "property_listing");

        // If requesting /page endpoints
        if (requestURI.endsWith("/page")) {
            String pageName = request.getParameter("name");
            if (pageName == null) return true; // Let controller handle lack of name

            // First, block Admin from accessing ANYTHING outside of adminPages
            if ("Admin".equalsIgnoreCase(role)) {
                if (!adminPages.contains(pageName)) {
                    String referer = request.getHeader("Referer");
                    response.sendRedirect(referer != null ? referer + (referer.contains("?") ? "&" : "?") + "error=admin_restricted" : request.getContextPath() + "/page?name=dashboard&error=admin_restricted");
                    return false;
                }
            } else {
                // Not an Admin (either User or Unauthenticated)
                if (adminPages.contains(pageName)) {
                    if (!isAuthenticated) {
                        response.sendRedirect(request.getContextPath() + "/page?name=login&error=login_required");
                        return false;
                    } else {
                        // Logged in as User, trying to access Admin page
                        String referer = request.getHeader("Referer");
                        response.sendRedirect(referer != null ? referer + (referer.contains("?") ? "&" : "?") + "error=access_denied" : request.getContextPath() + "/page?name=home&error=access_denied");
                        return false;
                    }
                } else if (userPages.contains(pageName)) {
                    if (!isAuthenticated) {
                        response.sendRedirect(request.getContextPath() + "/page?name=login&error=login_required");
                        return false;
                    }
                }
            }
        } else if (requestURI.endsWith("/property/add")) {
            // Also user restricted, Admin cannot access
            if (!isAuthenticated) {
                response.sendRedirect(request.getContextPath() + "/page?name=login&error=login_required");
                return false;
            } else if ("Admin".equalsIgnoreCase(role)) {
                String referer = request.getHeader("Referer");
                response.sendRedirect(referer != null ? referer + (referer.contains("?") ? "&" : "?") + "error=admin_restricted" : request.getContextPath() + "/page?name=dashboard&error=admin_restricted");
                return false;
            }
        }
        
        return true;
    }
}
