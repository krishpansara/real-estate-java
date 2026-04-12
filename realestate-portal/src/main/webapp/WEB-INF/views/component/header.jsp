<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
    /* Wrapper: positions the dropdown relative to the profile button */
    .profile-dropdown-wrapper {
        position: relative;
        display: inline-flex;
        align-items: center;
    }

    /* Profile icon button – keep your existing styles, just remove the <a> tag */
    .profile-icon {
        background: none;
        border: none;
        cursor: pointer;
        padding: 0;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        color: inherit;           /* inherits colour from your navbar */
    }

    .profile-icon svg {
        width: 32px;
        height: 32px;
    }

    /* ── Dropdown card ── */
    .profile-dropdown {
        display: none;                /* hidden by default  */
        position: absolute;
        top: calc(100% + 12px);       /* just below the button */
        right: 0;
        min-width: 220px;
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
        z-index: 9999;
        overflow: hidden;
        animation: dropdownFadeIn 0.18s ease;
    }

    .profile-dropdown.open {
        display: block;
    }

    @keyframes dropdownFadeIn {
        from { opacity: 0; transform: translateY(-6px); }
        to   { opacity: 1; transform: translateY(0);    }
    }

    /* ── User info block at top ── */
    .dropdown-user-info {
        padding: 14px 16px 12px;
        display: flex;
        flex-direction: column;
        gap: 2px;
    }

    .dropdown-user-name {
        font-weight: 700;
        font-size: 0.95rem;
        color: #1a1a2e;
    }

    .dropdown-user-email {
        font-size: 0.78rem;
        color: #6b7280;
    }

    /* ── Thin divider ── */
    .dropdown-divider {
        height: 1px;
        background: #f0f0f0;
        margin: 0;
    }

    /* ── Menu items ── */
    .dropdown-item {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 12px 16px;
        font-size: 0.9rem;
        color: #374151;
        text-decoration: none;
        transition: background 0.15s ease;
        cursor: pointer;
    }

    .dropdown-item:hover {
        background: #f5f7ff;
        color: #4f46e5;           /* accent – change to match your brand colour */
    }

    .dropdown-item:hover .dropdown-icon {
        color: #4f46e5;
    }

    .dropdown-icon {
        width: 18px;
        height: 18px;
        flex-shrink: 0;
        color: #6b7280;
        transition: color 0.15s ease;
    }

    /* Logout item gets a subtle red tint on hover */
    .dropdown-item-logout:hover {
        background: #fff5f5;
        color: #dc2626;
    }

    .dropdown-item-logout:hover .dropdown-icon {
        color: #dc2626;
    }
</style>

<header class="header">
    <div class="container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/assets/images/Logo.jpg" alt="Real Estate Logo" class="logo-image">
            <span class="logo-text">Real Estate</span>
        </div>

        <nav class="nav">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/page?name=explore">Explore</a>
            <a href="${pageContext.request.contextPath}/page?name=about">About us</a>
            <a href="${pageContext.request.contextPath}/page?name=contact_us">Contact us</a>
            
            <% if(session.getAttribute("userId") == null){ %>
            
            <div class="auth-buttons">
                <a href="${pageContext.request.contextPath}/page?name=login" class="btn-login">Login</a>
                <a href="${pageContext.request.contextPath}/page?name=sign_up" class="btn-signup">Sign Up</a>
            </div>
            
            <% }else{ %>
			<%-- Profile dropdown --%>
            <div class="profile-dropdown-wrapper" id="profileDropdownWrapper">

                <%-- Trigger button --%>
                <button class="profile-icon" id="profileBtn" title="Profile" aria-expanded="false" aria-haspopup="true">
                    <i class="fa fa-user-circle"></i>
                </button>

                <%-- Dropdown menu --%>
                <div class="profile-dropdown" id="profileDropdown" role="menu">

                    <%-- User info header --%>
                    <div class="dropdown-user-info">
                        <span class="dropdown-user-name">${sessionScope.userName != null ? sessionScope.userName : 'User'}</span>
                        <span class="dropdown-user-email">${sessionScope.userEmail != null ? sessionScope.userEmail : ''}</span>
                    </div>

                    <div class="dropdown-divider"></div>

                    <%-- Menu items --%>
                    <a href="${pageContext.request.contextPath}/page?name=profile" class="dropdown-item" role="menuitem">
                        <i class="fa fa-user me-2"></i>
                        My Profile
                    </a>

                    <a href="${pageContext.request.contextPath}/page?name=property_listing" class="dropdown-item" role="menuitem">
                        <i class="fa fa-home me-2"></i>
                        Post / Manage Properties
                    </a>

                    <a href="${pageContext.request.contextPath}/page?name=favourite" class="dropdown-item" role="menuitem">
                        <i class="fa fa-heart me-2"></i>
                        Favorite Properties
                    </a>

                    <div class="dropdown-divider"></div>
                    <form method="post" action="${pageContext.request.contextPath}/logout" style="display:inline;">
					    <button class="dropdown-item dropdown-item-logout">
					       <i class="fa fa-sign-out-alt me-2"></i>Logout
					    </button>
					</form>
                </div>
            </div>

            <% } %>
        </nav>
    </div>
</header>

<script>
    (function () {
        const btn      = document.getElementById('profileBtn');
        const dropdown = document.getElementById('profileDropdown');

        if (!btn || !dropdown) return;

        /* Toggle on button click */
        btn.addEventListener('click', function (e) {
            e.stopPropagation();
            const isOpen = dropdown.classList.toggle('open');
            btn.setAttribute('aria-expanded', isOpen);
        });

        /* Close when clicking anywhere outside */
        document.addEventListener('click', function (e) {
            if (!dropdown.contains(e.target) && e.target !== btn) {
                dropdown.classList.remove('open');
                btn.setAttribute('aria-expanded', 'false');
            }
        });

        /* Close on Escape key */
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') {
                dropdown.classList.remove('open');
                btn.setAttribute('aria-expanded', 'false');
                btn.focus();
            }
        });
    })();
    
    // Check for access denied error in URL and show alert
    (function () {
        const url = new URL(window.location);
        const error = url.searchParams.get('error');
        
        if (error === 'access_denied') {
            // Show alert
            alert('⛔ Access Denied! You do not have permission to access the admin panel. Only admins can access this area.');
            
            // Remove error parameter from URL (clean up)
            url.searchParams.delete('error');
            window.history.replaceState({}, document.title, url.toString());
        } else if (error === 'admin_restricted') {
            // Show alert for admin restricted pages
            alert('⛔ Restricted Access! This page is for users only. Admins cannot access user-specific pages.');
            
            // Remove error parameter from URL (clean up)
            url.searchParams.delete('error');
            window.history.replaceState({}, document.title, url.toString());
        }
    })();
</script>
