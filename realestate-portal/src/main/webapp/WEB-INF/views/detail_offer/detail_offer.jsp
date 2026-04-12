<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>${property.title} - Real Estate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">

  <style>
    :root {
      --primary:      #1dd1a1;
      --primary-dark: #10ac84;
      --bg:     #f8f9fa;
      --card:   #ffffff;
      --ink:    #2d3436;
      --muted:  #636e72;
      --border: #f0f0f0;
    }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: 'Poppins', sans-serif; background: var(--bg); color: var(--ink); font-size: 15px; }
    .page-head { display: flex; align-items: center; gap: 14px; margin-bottom: 28px; }
    .back-btn { width: 40px; height: 40px; border-radius: 50%; border: none; background: var(--card); box-shadow: 0 3px 12px rgba(0,0,0,.1); display: grid; place-items: center; cursor: pointer; flex-shrink: 0; transition: box-shadow .2s, transform .2s; }
    .back-btn:hover { transform: translateX(-2px); box-shadow: 0 5px 16px rgba(0,0,0,.14); }
    .back-btn i { color: var(--primary-dark); font-size: .95rem; }
    .page-head h1 { font-size: 1.5rem; font-weight: 700; margin: 0; }
    .page-head p  { font-size: 13px; color: var(--muted); margin: 0; }
    .prop-carousel { border-radius: 16px; overflow: hidden; position: relative; }
    .prop-carousel .carousel-item img { width: 100%; height: 400px; object-fit: cover; display: block; }
    .prop-carousel .carousel-control-prev, .prop-carousel .carousel-control-next { width: 40px; height: 40px; background: rgba(255,255,255,.92); border-radius: 50%; top: 50%; transform: translateY(-50%); opacity: 1; margin: 0 12px; box-shadow: 0 3px 12px rgba(0,0,0,.15); transition: background .2s; }
    .prop-carousel .carousel-control-prev-icon, .prop-carousel .carousel-control-next-icon { filter: invert(48%) sepia(79%) saturate(476%) hue-rotate(118deg) brightness(90%); width: 16px; height: 16px; }
    .prop-carousel .carousel-indicators { bottom: 12px; }
    .prop-carousel .carousel-indicators button { width: 8px; height: 8px; border-radius: 50%; border: none; background: rgba(255,255,255,.55); }
    .prop-carousel .carousel-indicators button.active { background: var(--primary); transform: scale(1.3); }
    .img-counter { position: absolute; bottom: 14px; right: 14px; background: rgba(0,0,0,.48); color: #fff; font-size: 12px; font-weight: 500; padding: 4px 12px; border-radius: 20px; z-index: 10; }
    .wishlist-btn { position: absolute; top: 14px; right: 14px; width: 44px; height: 44px; border-radius: 50%; background: rgba(255,255,255,.92); border: none; display: grid; place-items: center; cursor: pointer; box-shadow: 0 3px 12px rgba(0,0,0,.18); transition: background .2s, transform .2s; z-index: 5; }
    .wishlist-btn i { font-size: 1.15rem; color: #b2bec3; transition: color .25s, transform .25s; }
    .wishlist-btn:hover i { color: #ff6b6b; }
    .wishlist-btn.wishlisted i { color: #ff6b6b; }
    .pill { display: inline-flex; align-items: center; gap: 5px; font-size: 11px; font-weight: 600; letter-spacing: .06em; text-transform: uppercase; padding: 5px 13px; border-radius: 100px; }
    .pill-rent   { background: rgba(29,209,161,.12); color: var(--primary-dark); }
    .pill-sale   { background: rgba(255,107,107,.12); color: #c0392b; }
    .pill-active { background: rgba(29,209,161,.12); color: var(--primary-dark); }
    .price-tag { font-size: 2rem; font-weight: 700; color: var(--primary-dark); line-height: 1; }
    .price-tag small { font-size: .9rem; font-weight: 400; color: var(--muted); }
    .stat-chip { background: var(--card); border-radius: 12px; padding: 14px 16px; display: flex; align-items: center; gap: 12px; box-shadow: 0 3px 12px rgba(0,0,0,.06); transition: transform .2s, box-shadow .2s; }
    .stat-chip:hover { transform: translateY(-2px); box-shadow: 0 8px 22px rgba(0,0,0,.1); }
    .stat-chip .icon { width: 40px; height: 40px; background: rgba(29,209,161,.12); border-radius: 10px; display: grid; place-items: center; font-size: 1.05rem; color: var(--primary-dark); flex-shrink: 0; }
    .stat-chip .lbl { font-size: 11px; color: var(--muted); text-transform: uppercase; letter-spacing: .05em; }
    .stat-chip .val { font-weight: 600; font-size: 14px; margin-top: 1px; }
    .scard { background: var(--card); border-radius: 15px; padding: 24px; box-shadow: 0 5px 20px rgba(0,0,0,.06); }
    .scard-title { font-size: .95rem; font-weight: 600; margin-bottom: 16px; display: flex; align-items: center; gap: 8px; }
    .scard-title i { color: var(--primary); }
    .ftag { display: inline-flex; align-items: center; gap: 6px; background: rgba(29,209,161,.08); border: 1px solid rgba(29,209,161,.2); border-radius: 8px; padding: 7px 14px; font-size: 13px; }
    .ftag i { color: var(--primary-dark); font-size: .85rem; }
    .map-frame { width: 100%; height: 260px; border: 0; border-radius: 12px; display: block; }

    /* Owner avatar */
    .owner-avatar-wrap { width: 56px; height: 56px; border-radius: 50%; border: 3px solid rgba(29,209,161,.3); overflow: hidden; flex-shrink: 0; }
    .owner-avatar-wrap img { width: 100%; height: 100%; object-fit: cover; display: block; }
    .owner-avatar-initials {
        width: 56px; height: 56px; border-radius: 50%;
        background: linear-gradient(135deg, #1dd1a1, #10ac84);
        border: 3px solid rgba(29,209,161,.3);
        display: flex; align-items: center; justify-content: center;
        font-size: 1.2rem; font-weight: 600; color: white;
        flex-shrink: 0; text-transform: uppercase;
    }

    .btn-send { background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%); color: #fff; border: none; border-radius: 10px; padding: 12px; font-weight: 600; font-size: 14px; font-family: 'Poppins', sans-serif; width: 100%; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 8px; transition: opacity .2s, transform .15s; }
    .btn-send:hover { opacity: .9; transform: translateY(-1px); }
    .form-control { border-radius: 10px !important; border: 1.5px solid #e9ecef !important; background: var(--bg) !important; font-family: 'Poppins', sans-serif; font-size: 13.5px; }
    .form-control:focus { border-color: var(--primary) !important; box-shadow: 0 0 0 3px rgba(29,209,161,.15) !important; background: #fff !important; }
    textarea.form-control { resize: none; }
    .form-label { font-size: 13px; font-weight: 500; margin-bottom: 6px; }
    label.error { color: #dc3545; font-size: 0.78rem; margin-top: 5px; display: block; font-family: 'Poppins', sans-serif; font-weight: 400; }
    textarea.error { border-color: #dc3545 !important; box-shadow: 0 0 0 3px rgba(220,53,69,.12) !important; }
    textarea.valid { border-color: #198754 !important; box-shadow: 0 0 0 3px rgba(25,135,84,.12) !important; }
    @media (min-width: 992px) { .sticky-side { position: sticky; top: 24px; } }
    @keyframes fadeUp { from { opacity:0; transform:translateY(20px); } to { opacity:1; transform:translateY(0); } }
    .fu  { animation: fadeUp .5s ease both; }
    .fu1 { animation-delay: .05s; }
    .fu2 { animation-delay: .12s; }
    .fu3 { animation-delay: .19s; }
    .fu4 { animation-delay: .26s; }
    hr { border-color: var(--border); }
  </style>
</head>
<body>

  <jsp:include page="/WEB-INF/views/component/header.jsp" />

  <div class="container py-4" style="max-width:1160px">

    <%-- Success / Error Alert --%>
    <c:if test="${status == 'sent'}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        ✅ Your message has been sent to the owner successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
    </c:if>
    <c:if test="${status == 'error'}">
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        ❌ Something went wrong. Please try again.
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
    </c:if>

    <div class="page-head fu fu1">
      <button class="back-btn" onclick="history.back()" title="Go Back">
        <i class="fas fa-arrow-left"></i>
      </button>
      <div>
        <h1>Property Details</h1>
        <p>${property.title}</p>
      </div>
    </div>

    <div class="row g-4 align-items-start">

      <%-- LEFT COLUMN --%>
      <div class="col-lg-8">

        <%-- IMAGE CAROUSEL --%>
        <div class="prop-carousel mb-4 fu fu1">
          <div id="imgCarousel" class="carousel slide" data-bs-ride="false">
            <div class="carousel-indicators" id="carouselDots"></div>
            <div class="carousel-inner">
              <c:choose>
                <c:when test="${not empty property.images}">
                  <c:forEach var="img" items="${property.images}" varStatus="loop">
                    <div class="carousel-item ${loop.first ? 'active' : ''}">
                      <img src="${pageContext.request.contextPath}/assets/images/property_images/${img}" alt="Photo ${loop.index + 1}">
                    </div>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <div class="carousel-item active">
                    <img src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=1000&q=85" alt="No Image">
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#imgCarousel" data-bs-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#imgCarousel" data-bs-slide="next">
              <span class="carousel-control-next-icon"></span>
            </button>
          </div>
          <div class="img-counter">
            <i class="fas fa-images me-1"></i>
            <span id="imgCurrent">1</span> / <span id="imgTotal"></span>
          </div>
          <button class="wishlist-btn" id="wishlistBtn" onclick="toggleWishlist()" title="Save to Wishlist">
            <i class="far fa-heart" id="heartIcon"></i>
          </button>
        </div>

        <%-- TITLE + PRICE --%>
        <div class="fu fu2 mb-4">
          <div class="d-flex gap-2 mb-2">
            <span class="pill ${property.purpose == 'rent' ? 'pill-rent' : 'pill-sale'}">
              <i class="fas fa-tag"></i> ${property.purpose}
            </span>
            <span class="pill pill-active">
              <i class="fas fa-circle" style="font-size:7px"></i> ${property.status}
            </span>
          </div>
          <h2 style="font-size:1.75rem;font-weight:700;margin-bottom:.3rem">${property.title}</h2>
          <p class="mb-3" style="color:var(--muted);font-size:14px">
            <i class="fas fa-map-marker-alt me-1" style="color:var(--primary)"></i>
            ${property.locality}, ${property.city}
          </p>
          <div class="price-tag">
            &#8377; <fmt:formatNumber value="${property.price}" pattern="#,##,##0" />
            <c:if test="${property.purpose == 'rent'}"><small>/ month</small></c:if>
          </div>
        </div>

        <%-- STATS --%>
        <div class="row g-3 mb-4 fu fu2">
          <div class="col-6 col-sm-3">
            <div class="stat-chip">
              <div class="icon"><i class="fas fa-door-open"></i></div>
              <div><div class="lbl">Bedrooms</div><div class="val">${property.bedrooms} BHK</div></div>
            </div>
          </div>
          <div class="col-6 col-sm-3">
            <div class="stat-chip">
              <div class="icon"><i class="fas fa-bath"></i></div>
              <div><div class="lbl">Bathrooms</div><div class="val">${property.bathrooms}</div></div>
            </div>
          </div>
          <div class="col-6 col-sm-3">
            <div class="stat-chip">
              <div class="icon"><i class="fas fa-vector-square"></i></div>
              <div><div class="lbl">Area</div><div class="val">${property.areaSize} sq ft</div></div>
            </div>
          </div>
          <div class="col-6 col-sm-3">
            <div class="stat-chip">
              <div class="icon"><i class="fas fa-building"></i></div>
              <div><div class="lbl">Property Age</div><div class="val">${property.propertyAge} Yrs</div></div>
            </div>
          </div>
        </div>

        <%-- DETAILS + DESCRIPTION --%>
        <div class="scard mb-4 fu fu3">
          <div class="scard-title"><i class="fas fa-info-circle"></i> Property Details</div>
          <div class="d-flex flex-wrap gap-2 mb-4">
            <span class="ftag"><i class="fas fa-building"></i> ${property.propertyType}</span>
            <c:if test="${not empty property.furnishing}">
              <span class="ftag"><i class="fas fa-couch"></i> ${property.furnishing}</span>
            </c:if>
            <c:if test="${not empty property.facing}">
              <span class="ftag"><i class="fas fa-compass"></i> ${property.facing} Facing</span>
            </c:if>
            <c:if test="${not empty property.availability}">
              <span class="ftag"><i class="fas fa-calendar-check"></i> ${property.availability}</span>
            </c:if>
            <c:if test="${property.priceNegotiable}">
              <span class="ftag"><i class="fas fa-comments"></i> Negotiable</span>
            </c:if>
          </div>
          <hr>
          <div class="scard-title mt-3"><i class="fas fa-align-left"></i> Description</div>
          <p style="color:var(--muted);line-height:1.8;font-size:14px">${property.description}</p>
        </div>

        <%-- MAP --%>
        <c:if test="${not empty property.googleMapUrl}">
          <div class="scard fu fu4">
            <div class="scard-title"><i class="fas fa-map-marked-alt"></i> Location</div>
            <iframe class="map-frame" src="${property.googleMapUrl}"
              loading="lazy" allowfullscreen referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
        </c:if>

      </div>

      <%-- RIGHT SIDEBAR --%>
      <div class="col-lg-4">
        <div class="sticky-side">
          <div class="scard fu fu2">
            <div class="scard-title"><i class="fas fa-user-circle"></i> Contact Owner</div>

            <div class="d-flex align-items-center gap-3 mb-4 p-3"
                 style="background:rgba(29,209,161,.05);border-radius:12px;border:1px solid rgba(29,209,161,.15)">

              <%-- Owner avatar: real photo from DB, or initials fallback via JS (no fn taglib needed) --%>
              <c:choose>
                <c:when test="${not empty property.ownerProfilePicture}">
                  <div class="owner-avatar-wrap">
                    <img src="${pageContext.request.contextPath}/assets/images/profile_pictures/${property.ownerProfilePicture}"
                         alt="${property.ownerFirstName}">
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="owner-avatar-initials" id="ownerInitials"></div>
                </c:otherwise>
              </c:choose>

              <div>
                <div style="font-weight:600;font-size:15px" id="ownerFullName">
                  ${property.ownerFirstName} ${property.ownerLastName}
                </div>
                <div style="font-size:13px;color:var(--muted);margin-top:3px">
                  <i class="fas fa-envelope me-1" style="color:var(--primary)"></i>${property.ownerEmail}
                </div>
                <c:if test="${not empty property.ownerPhone}">
                  <div style="font-size:13px;color:var(--muted)">
                    <i class="fas fa-phone me-1" style="color:var(--primary)"></i>${property.ownerPhone}
                  </div>
                </c:if>
              </div>
            </div>

            <%-- Message Form --%>
            <form id="contactOwnerForm"
                  action="${pageContext.request.contextPath}/message/send"
                  method="post" novalidate>

              <input type="hidden" name="propertyId" value="${property.propertyId}">

              <div class="mb-3">
                <label class="form-label">
                  <i class="fas fa-comment-dots me-1" style="color:var(--primary)"></i>Your Message
                </label>
                <textarea class="form-control" name="message" rows="4"
                          placeholder="Write your message here..."></textarea>
              </div>
              <button type="submit" class="btn-send">
                <i class="fas fa-paper-plane"></i> Send Message
              </button>
            </form>

          </div>
        </div>
      </div>

    </div>
  </div>

  <jsp:include page="/WEB-INF/views/component/footer.jsp" />

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

<script>
  const contextPath = "${pageContext.request.contextPath}";
  const propertyId  = "${property.propertyId}";

  // ── Initials avatar — reads the name already rendered in the DOM.
  //    No fn taglib needed at all.
  (function () {
    const el = document.getElementById('ownerInitials');
    if (!el) return; // owner has a photo, initials div not rendered
    const name   = (document.getElementById('ownerFullName').textContent || '').trim();
    const parts  = name.split(/\s+/).filter(Boolean);
    const initials = parts.length >= 2
      ? parts[0][0] + parts[parts.length - 1][0]
      : parts[0] ? parts[0][0] : '?';
    el.textContent = initials.toUpperCase();
  })();

  // ── Wishlist toggle ────────────────────────────────────────────────────
  function toggleWishlist() {
    $.post(contextPath + "/favorite/toggle", { propertyId: propertyId }, function(res) {
      if (res === "NOT_LOGGED_IN") {
        alert("Please log in to save favorites.");
        window.location.href = contextPath + "/page?name=login";
        return;
      }
      const added = (res === "ADDED");
      $("#wishlistBtn").toggleClass("wishlisted", added);
      $("#heartIcon").attr("class", added ? "fas fa-heart" : "far fa-heart");
    });
  }

  $(document).ready(function () {

    // ── Check if already favorited ─────────────────────────────────────
    $.get(contextPath + "/favorite/check", { propertyId: propertyId }, function(res) {
      if (res === "YES") {
        $("#wishlistBtn").addClass("wishlisted");
        $("#heartIcon").attr("class", "fas fa-heart");
      }
    });

    // ── Carousel counter + dots ────────────────────────────────────────
    const carousel = document.getElementById('imgCarousel');
    const slides   = carousel.querySelectorAll('.carousel-item');
    const total    = slides.length;
    document.getElementById('imgTotal').textContent = total;

    const dotsWrap = document.getElementById('carouselDots');
    slides.forEach((_, i) => {
      const btn = document.createElement('button');
      btn.type  = 'button';
      btn.setAttribute('data-bs-target', '#imgCarousel');
      btn.setAttribute('data-bs-slide-to', i);
      if (i === 0) { btn.classList.add('active'); btn.setAttribute('aria-current', 'true'); }
      dotsWrap.appendChild(btn);
    });

    carousel.addEventListener('slid.bs.carousel', e => {
      document.getElementById('imgCurrent').textContent = e.to + 1;
    });

    // ── jQuery Validation ──────────────────────────────────────────────
    $("#contactOwnerForm").validate({
      rules: {
        message: { required: true, minlength: 10, maxlength: 500 }
      },
      messages: {
        message: {
          required:  "Please enter your message before sending.",
          minlength: "Your message must be at least 10 characters long.",
          maxlength: "Your message cannot exceed 500 characters."
        }
      },
      errorElement: "label",
      errorClass: "error",
      validClass: "valid",
      highlight: function (element) {
        $(element).removeClass("valid").addClass("error");
      },
      unhighlight: function (element) {
        var val = $(element).val();
        if (val && val.trim() !== "") {
          $(element).removeClass("error").addClass("valid");
        } else {
          $(element).removeClass("error").removeClass("valid");
        }
      },
      submitHandler: function (form) { form.submit(); }
    });

    $(".btn-send").on("click", function () {
      $("#contactOwnerForm textarea").blur();
    });
  });
</script>

</body>
</html>
