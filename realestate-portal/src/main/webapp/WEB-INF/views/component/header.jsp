<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a href="${pageContext.request.contextPath}/page?name=top_offers">Top offers</a>
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
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
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
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="dropdown-icon">
                            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                        </svg>
                        My Profile
                    </a>

                    <a href="${pageContext.request.contextPath}/page?name=property_listing" class="dropdown-item" role="menuitem">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="dropdown-icon">
                            <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
                        </svg>
                        Post / Manage Properties
                    </a>

                    <a href="${pageContext.request.contextPath}/page?name=favourite" class="dropdown-item" role="menuitem">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="dropdown-icon">
                            <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
                        </svg>
                        Favorite Properties
                    </a>

                    <div class="dropdown-divider"></div>

                    <a href="${pageContext.request.contextPath}/logout" class="dropdown-item dropdown-item-logout" role="menuitem">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="dropdown-icon">
                            <path d="M17 7l-1.41 1.41L18.17 11H8v2h10.17l-2.58 2.58L17 17l5-5zM4 5h8V3H4c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h8v-2H4V5z"/>
                        </svg>
                        Logout
                    </a>
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
</script>
