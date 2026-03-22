<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Property Details - Real Estate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome (FIXED) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- Project CSS -->
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

    body {
      font-family: 'Poppins', sans-serif;
      background: var(--bg);
      color: var(--ink);
      font-size: 15px;
    }

    /* ── Page heading + back ──────────────── */
    .page-head {
      display: flex; align-items: center; gap: 14px;
      margin-bottom: 28px;
    }
    .back-btn {
      width: 40px; height: 40px; border-radius: 50%;
      border: none; background: var(--card);
      box-shadow: 0 3px 12px rgba(0,0,0,.1);
      display: grid; place-items: center;
      cursor: pointer; flex-shrink: 0;
      transition: box-shadow .2s, transform .2s;
    }
    .back-btn:hover { transform: translateX(-2px); box-shadow: 0 5px 16px rgba(0,0,0,.14); }
    .back-btn i { color: var(--primary-dark); font-size: .95rem; }
    .page-head h1 { font-size: 1.5rem; font-weight: 700; margin: 0; }
    .page-head p  { font-size: 13px; color: var(--muted); margin: 0; }

    /* ── Carousel ─────────────────────────── */
    .prop-carousel { border-radius: 16px; overflow: hidden; position: relative; }
    .prop-carousel .carousel-item img {
      width: 100%; height: 400px;
      object-fit: cover; display: block;
    }
    .prop-carousel .carousel-control-prev,
    .prop-carousel .carousel-control-next {
      width: 40px; height: 40px;
      background: rgba(255,255,255,.92); border-radius: 50%;
      top: 50%; transform: translateY(-50%);
      opacity: 1; margin: 0 12px;
      box-shadow: 0 3px 12px rgba(0,0,0,.15);
      transition: background .2s;
    }
    .prop-carousel .carousel-control-prev:hover,
    .prop-carousel .carousel-control-next:hover { background: #fff; }
    .prop-carousel .carousel-control-prev-icon,
    .prop-carousel .carousel-control-next-icon {
      filter: invert(48%) sepia(79%) saturate(476%) hue-rotate(118deg) brightness(90%);
      width: 16px; height: 16px;
    }
    .prop-carousel .carousel-indicators { bottom: 12px; }
    .prop-carousel .carousel-indicators button {
      width: 8px; height: 8px; border-radius: 50%;
      border: none; background: rgba(255,255,255,.55);
      transition: background .2s, transform .2s;
    }
    .prop-carousel .carousel-indicators button.active {
      background: var(--primary); transform: scale(1.3);
    }
    .img-counter {
      position: absolute; bottom: 14px; right: 14px;
      background: rgba(0,0,0,.48); color: #fff;
      font-size: 12px; font-weight: 500;
      padding: 4px 12px; border-radius: 20px;
      z-index: 10; pointer-events: none;
    }

    /* ── Wishlist heart ───────────────────── */
    .wishlist-btn {
      position: absolute; top: 14px; right: 14px;
      width: 44px; height: 44px; border-radius: 50%;
      background: rgba(255,255,255,.92); border: none;
      display: grid; place-items: center; cursor: pointer;
      box-shadow: 0 3px 12px rgba(0,0,0,.18);
      transition: background .2s, transform .2s; z-index: 5;
    }
    .wishlist-btn i { font-size: 1.15rem; color: #b2bec3; transition: color .25s, transform .25s; }
    .wishlist-btn:hover { background: #fff; transform: scale(1.1); }
    .wishlist-btn:hover i { color: #ff6b6b; }
    .wishlist-btn.wishlisted { background: #fff5f5; }
    .wishlist-btn.wishlisted i { color: #ff6b6b; transform: scale(1.15); }

    /* ── Pills ────────────────────────────── */
    .pill {
      display: inline-flex; align-items: center; gap: 5px;
      font-size: 11px; font-weight: 600;
      letter-spacing: .06em; text-transform: uppercase;
      padding: 5px 13px; border-radius: 100px;
    }
    .pill-rent   { background: rgba(29,209,161,.12); color: var(--primary-dark); }
    .pill-active { background: rgba(29,209,161,.12); color: var(--primary-dark); }

    /* ── Price ────────────────────────────── */
    .price-tag { font-size: 2rem; font-weight: 700; color: var(--primary-dark); line-height: 1; }
    .price-tag small { font-size: .9rem; font-weight: 400; color: var(--muted); }

    /* ── Stat chips ───────────────────────── */
    .stat-chip {
      background: var(--card); border-radius: 12px; padding: 14px 16px;
      display: flex; align-items: center; gap: 12px;
      box-shadow: 0 3px 12px rgba(0,0,0,.06);
      transition: transform .2s, box-shadow .2s;
    }
    .stat-chip:hover { transform: translateY(-2px); box-shadow: 0 8px 22px rgba(0,0,0,.1); }
    .stat-chip .icon {
      width: 40px; height: 40px; background: rgba(29,209,161,.12);
      border-radius: 10px; display: grid; place-items: center;
      font-size: 1.05rem; color: var(--primary-dark); flex-shrink: 0;
    }
    .stat-chip .lbl { font-size: 11px; color: var(--muted); text-transform: uppercase; letter-spacing: .05em; }
    .stat-chip .val { font-weight: 600; font-size: 14px; margin-top: 1px; }

    /* ── Section card ─────────────────────── */
    .scard { background: var(--card); border-radius: 15px; padding: 24px; box-shadow: 0 5px 20px rgba(0,0,0,.06); }
    .scard-title { font-size: .95rem; font-weight: 600; margin-bottom: 16px; display: flex; align-items: center; gap: 8px; }
    .scard-title i { color: var(--primary); }

    /* ── Feature tags ─────────────────────── */
    .ftag {
      display: inline-flex; align-items: center; gap: 6px;
      background: rgba(29,209,161,.08);
      border: 1px solid rgba(29,209,161,.2);
      border-radius: 8px; padding: 7px 14px; font-size: 13px;
    }
    .ftag i { color: var(--primary-dark); font-size: .85rem; }

    /* ── Map ──────────────────────────────── */
    .map-frame { width: 100%; height: 260px; border: 0; border-radius: 12px; display: block; }

    /* ── Owner avatar ─────────────────────── */
    .owner-avatar { width: 56px; height: 56px; border-radius: 50%; object-fit: cover; border: 3px solid rgba(29,209,161,.3); }

    /* ── Send button ──────────────────────── */
    .btn-send {
      background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
      color: #fff; border: none; border-radius: 10px;
      padding: 12px; font-weight: 600; font-size: 14px;
      font-family: 'Poppins', sans-serif; width: 100%; cursor: pointer;
      display: flex; align-items: center; justify-content: center; gap: 8px;
      transition: opacity .2s, transform .15s;
    }
    .btn-send:hover { opacity: .9; transform: translateY(-1px); }

    /* ── Form ─────────────────────────────── */
    .form-control {
      border-radius: 10px !important;
      border: 1.5px solid #e9ecef !important;
      background: var(--bg) !important;
      font-family: 'Poppins', sans-serif; font-size: 13.5px;
    }
    .form-control:focus {
      border-color: var(--primary) !important;
      box-shadow: 0 0 0 3px rgba(29,209,161,.15) !important;
      background: #fff !important;
    }
    textarea.form-control { resize: none; }
    .form-label { font-size: 13px; font-weight: 500; margin-bottom: 6px; }

    /* ── Sticky sidebar ───────────────────── */
    @media (min-width: 992px) { .sticky-side { position: sticky; top: 24px; } }

    /* ── Animations ───────────────────────── */
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

  <%-- ═══════════ HEADER ═══════════ --%>
  <jsp:include page="/WEB-INF/views/component/header.jsp" />

  <div class="container py-4" style="max-width:1160px">

    <%-- Page Heading + Back --%>
    <div class="page-head fu fu1">
      <button class="back-btn" onclick="history.back()" title="Go Back">
        <i class="fas fa-arrow-left"></i>
      </button>
      <div>
        <h1>Property Details</h1>
        <p>2 BHK Flat in Navrangpura, Ahmedabad</p>
      </div>
    </div>

    <div class="row g-4 align-items-start">

      <%-- ═══ LEFT COLUMN ═══ --%>
      <div class="col-lg-8">

        <%-- Image Carousel + Wishlist Heart --%>
        <div class="prop-carousel mb-4 fu fu1">

          <div id="imgCarousel" class="carousel slide" data-bs-ride="false">

            <%-- Dot indicators — built dynamically by JS --%>
            <div class="carousel-indicators" id="carouselDots"></div>

            <%-- Slides --%>
            <div class="carousel-inner" id="carouselSlides">
              <div class="carousel-item active">
                <img src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=1000&q=85" alt="Photo 1">
              </div>
              <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=1000&q=80" alt="Photo 2">
              </div>
              <div class="carousel-item">
                <img src="https://images.unsplash.com/photo-1615529328331-f8917597711f?w=1000&q=80" alt="Photo 3">
              </div>
            </div>

            <%-- Prev / Next arrows --%>
            <button class="carousel-control-prev" type="button" data-bs-target="#imgCarousel" data-bs-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#imgCarousel" data-bs-slide="next">
              <span class="carousel-control-next-icon"></span>
            </button>
          </div>

          <%-- Image counter badge --%>
          <div class="img-counter">
            <i class="fas fa-images me-1"></i>
            <span id="imgCurrent">1</span> / <span id="imgTotal"></span>
          </div>

          <%-- Wishlist heart --%>
          <button class="wishlist-btn" id="wishlistBtn" onclick="toggleWishlist()" title="Save to Wishlist">
            <i class="far fa-heart" id="heartIcon"></i>
          </button>
        </div>

        <%-- Title + Price --%>
        <div class="fu fu2 mb-4">
          <div class="d-flex gap-2 mb-2">
            <span class="pill pill-rent"><i class="fas fa-tag"></i> Rent</span>
            <span class="pill pill-active"><i class="fas fa-circle" style="font-size:7px"></i> Active</span>
          </div>
          <h2 style="font-size:1.75rem;font-weight:700;margin-bottom:.3rem">2 BHK Flat in Navrangpura</h2>
          <p class="mb-3" style="color:var(--muted);font-size:14px">
            <i class="fas fa-map-marker-alt me-1" style="color:var(--primary)"></i> Navrangpura, Ahmedabad
          </p>
          <div class="price-tag">&#8377; 15,000 <small>/ month</small></div>
        </div>

        <%-- Stat Chips --%>
        <div class="row g-3 mb-4 fu fu2">
          <div class="col-6 col-sm-3">
            <div class="stat-chip">
              <div class="icon"><i class="fas fa-door-open"></i></div>
              <div><div class="lbl">Bedrooms</div><div class="val">2 BHK</div></div>
            </div>
          </div>
          <div class="col-6 col-sm-3">
            <div class="stat-chip">
              <div class="icon"><i class="fas fa-bath"></i></div>
              <div><div class="lbl">Bathrooms</div><div class="val">2</div></div>
            </div>
          </div>
          <div class="col-6 col-sm-3">
            <div class="stat-chip">
              <div class="icon"><i class="fas fa-vector-square"></i></div>
              <div><div class="lbl">Area</div><div class="val">1100 sq ft</div></div>
            </div>
          </div>
          <div class="col-6 col-sm-3">
            <div class="stat-chip">
              <div class="icon"><i class="fas fa-building"></i></div>
              <div><div class="lbl">Property Age</div><div class="val">5 Years</div></div>
            </div>
          </div>
        </div>

        <%-- Property Details Card --%>
        <div class="scard mb-4 fu fu3">
          <div class="scard-title"><i class="fas fa-info-circle"></i> Property Details</div>
          <div class="d-flex flex-wrap gap-2 mb-4">
            <span class="ftag"><i class="fas fa-building"></i> Flat</span>
            <span class="ftag"><i class="fas fa-couch"></i> Semi-Furnished</span>
            <span class="ftag"><i class="fas fa-compass"></i> East Facing</span>
            <span class="ftag"><i class="fas fa-calendar-check"></i> Immediate</span>
            <span class="ftag"><i class="fas fa-comments"></i> Negotiable</span>
          </div>

          <hr>

          <div class="scard-title mt-3"><i class="fas fa-align-left"></i> Description</div>
          <p style="color:var(--muted);line-height:1.8;font-size:14px">
            Well-maintained 2 BHK flat located in a prime residential area
            with excellent connectivity and nearby amenities.
          </p>
        </div>

        <%-- Map --%>
        <div class="scard fu fu4">
          <div class="scard-title"><i class="fas fa-map-marked-alt"></i> Location</div>
          <iframe class="map-frame"
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3680.605102684762!2d70.9216!3d22.2431!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959b4a660019ee9%3A0x3d6254f36ed0e794!2sRK%20University!5e0!3m2!1sen!2sin!4v1700000000000"
            loading="lazy" allowfullscreen referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>

      </div>
      <%-- end left col --%>

      <%-- ═══ RIGHT SIDEBAR ═══ --%>
      <div class="col-lg-4">
        <div class="sticky-side">
          <div class="scard fu fu2">
            <div class="scard-title"><i class="fas fa-user-circle"></i> Contact Owner</div>

            <%-- Owner info --%>
            <div class="d-flex align-items-center gap-3 mb-4 p-3"
                 style="background:rgba(29,209,161,.05);border-radius:12px;border:1px solid rgba(29,209,161,.15)">
              <img src="https://i.pravatar.cc/150?img=12" class="owner-avatar" alt="Rahul Sharma">
              <div>
                <div style="font-weight:600;font-size:15px">Rahul Sharma</div>
                <div style="font-size:13px;color:var(--muted);margin-top:3px">
                  <i class="fas fa-envelope me-1" style="color:var(--primary)"></i>rahul@gmail.com
                </div>
                <div style="font-size:13px;color:var(--muted)">
                  <i class="fas fa-phone me-1" style="color:var(--primary)"></i>+91 98765 43210
                </div>
              </div>
            </div>

            <%-- Contact form --%>
            <form action="${pageContext.request.contextPath}/message/send" method="post">
              <div class="mb-3">
                <label class="form-label">
                  <i class="fas fa-comment-dots me-1" style="color:var(--primary)"></i>Your Message
                </label>
                <textarea class="form-control" name="message" rows="4"
                          placeholder="Write your message here..." required></textarea>
              </div>
              <button type="submit" class="btn-send">
                <i class="fas fa-paper-plane"></i> Send Message
              </button>
            </form>
          </div>
        </div>
      </div>
      <%-- end right sidebar --%>

    </div>
  </div>

  <%-- ═══════════ FOOTER ═══════════ --%>
  <jsp:include page="/WEB-INF/views/component/footer.jsp" />

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    // ── Wishlist toggle ──────────────────────────
    let wishlisted = false;
    function toggleWishlist() {
      wishlisted = !wishlisted;
      const btn  = document.getElementById('wishlistBtn');
      const icon = document.getElementById('heartIcon');
      btn.classList.toggle('wishlisted', wishlisted);
      icon.className = wishlisted ? 'fas fa-heart' : 'far fa-heart';
    }

    // ── Carousel counter + dynamic dots ─────────
    const carousel = document.getElementById('imgCarousel');
    const slides   = carousel.querySelectorAll('.carousel-item');
    const total    = slides.length;

    document.getElementById('imgTotal').textContent = total;

    // Build dot indicators dynamically (works for any number of images)
    const dotsWrap = document.getElementById('carouselDots');
    slides.forEach((_, i) => {
      const btn = document.createElement('button');
      btn.type  = 'button';
      btn.setAttribute('data-bs-target', '#imgCarousel');
      btn.setAttribute('data-bs-slide-to', i);
      if (i === 0) { btn.classList.add('active'); btn.setAttribute('aria-current', 'true'); }
      dotsWrap.appendChild(btn);
    });

    // Update "1 / N" counter on every slide change
    carousel.addEventListener('slid.bs.carousel', e => {
      document.getElementById('imgCurrent').textContent = e.to + 1;
    });
  </script>

</body>
</html>