package com.team.realestate.interceptor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/page"})
public class AuthenticationFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String pageName = httpRequest.getParameter("name");
        HttpSession session = httpRequest.getSession(false);
        
        // Check if user is trying to access login or sign_up pages while logged in
        if (("login".equals(pageName) || "sign_up".equals(pageName) || "forgot_password".equals(pageName))
                && session != null && session.getAttribute("userId") != null) {
            // User is logged in, redirect to home
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/page?name=home");
            return;
        }
        
        // Check if user is trying to access protected pages without login
        if (("profile".equals(pageName) || "favourite".equals(pageName) || "edit_profile".equals(pageName) 
                || "property_listing".equals(pageName) || "dashboard".equals(pageName) 
                || "properties".equals(pageName) || "users".equals(pageName) || "contact".equals(pageName))
                && (session == null || session.getAttribute("userId") == null)) {
            // User is not logged in, redirect to login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/page?name=login");
            return;
        }
        
        chain.doFilter(request, response);
    }
    
    @Override
    public void init(FilterConfig config) throws ServletException {}
    
    @Override
    public void destroy() {}
}
