<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="footer">

    <div class="container footer-grid">

        <!-- Brand -->
        <div class="footer-col">
            <h3>🏠 Real Estate</h3>
            <p>
                Modern real estate platform connecting people
                with their dream homes. Buy, rent or invest
                with confidence.
            </p>
        </div>

        <!-- Navigation -->
        <div class="footer-col">
            <h4>Explore</h4>
            <a href="#">Top offers</a>
            <a href="#">Search properties</a>
            <a href="#">References</a>
            <a href="#">Our team</a>
        </div>

        <!-- Contact -->
        <div class="footer-col">
            <h4>Contact</h4>
            <p>Email: info@realestate.com</p>
            <p>Phone: +91 98765 43210</p>
            <p>Location: Mumbai, India</p>
        </div>

        <!-- Social -->
        <div class="footer-col">
            <h4>Follow us</h4>
            <div class="social">
                <a href="#">🌐</a>
                <a href="#">📘</a>
                <a href="#">📸</a>
                <a href="#">🐦</a>
            </div>
        </div>

    </div>

    <!-- Bottom bar -->
    <div class="footer-bottom">
        © <span id="year"></span> Real Estate. All rights reserved.
    </div>

</footer>

<script>
document.getElementById("year").textContent =
    new Date().getFullYear();
</script>
