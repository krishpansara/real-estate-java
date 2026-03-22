<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>List Property - Real Estate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
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
      --border: #e9ecef;
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

    /* ── Section card ─────────────────────── */
    .scard {
      background: var(--card); border-radius: 15px;
      padding: 24px; box-shadow: 0 5px 20px rgba(0,0,0,.06);
      margin-bottom: 20px;
    }
    .scard-title {
      font-size: .95rem; font-weight: 600;
      margin-bottom: 18px;
      display: flex; align-items: center; gap: 8px;
    }
    .scard-title i { color: var(--primary); }

    /* ── Form controls ────────────────────── */
    .form-label { font-size: 13px; font-weight: 500; color: var(--ink); margin-bottom: 6px; }
    .form-control,
    .form-select {
      border-radius: 10px !important;
      border: 1.5px solid var(--border) !important;
      background: var(--bg) !important;
      font-family: 'Poppins', sans-serif;
      font-size: 13.5px; color: var(--ink);
      padding: 10px 14px;
    }
    .form-control:focus,
    .form-select:focus {
      border-color: var(--primary) !important;
      box-shadow: 0 0 0 3px rgba(29,209,161,.15) !important;
      background: #fff !important;
    }
    textarea.form-control { resize: none; }
    .form-text { font-size: 12px; color: var(--muted); margin-top: 5px; }

    /* ── Upload zone ──────────────────────── */
    .upload-zone {
      border: 2px dashed rgba(29,209,161,.4);
      border-radius: 12px;
      background: rgba(29,209,161,.03);
      padding: 32px 20px; text-align: center;
      cursor: pointer; position: relative;
      transition: border-color .2s, background .2s;
    }
    .upload-zone:hover,
    .upload-zone.dragover {
      border-color: var(--primary);
      background: rgba(29,209,161,.07);
    }
    .upload-zone input[type="file"] {
      position: absolute; inset: 0;
      opacity: 0; cursor: pointer; width: 100%; height: 100%;
    }
    .upload-zone i { font-size: 2.2rem; color: var(--primary); margin-bottom: 10px; }
    .upload-zone p { font-size: 14px; color: var(--muted); margin: 0; }
    .upload-zone span { font-size: 13px; color: var(--primary); font-weight: 500; }

    /* Preview thumbnails */
    #previewGrid { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 14px; }
    .preview-thumb {
      width: 88px; height: 72px; border-radius: 10px;
      overflow: hidden; position: relative; border: 2px solid var(--border);
    }
    .preview-thumb img { width: 100%; height: 100%; object-fit: cover; display: block; }
    .preview-thumb .remove-img {
      position: absolute; top: 3px; right: 3px;
      width: 20px; height: 20px; border-radius: 50%;
      background: rgba(0,0,0,.55); border: none; cursor: pointer;
      display: grid; place-items: center; color: #fff; font-size: 9px;
    }

    /* ── Submit button ────────────────────── */
    .btn-submit {
      background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
      color: #fff; border: none; border-radius: 11px;
      padding: 14px; font-weight: 600; font-size: 15px;
      font-family: 'Poppins', sans-serif;
      width: 100%; cursor: pointer;
      display: flex; align-items: center; justify-content: center; gap: 9px;
      transition: opacity .2s, transform .15s;
      box-shadow: 0 6px 20px rgba(29,209,161,.35);
    }
    .btn-submit:hover { opacity: .92; transform: translateY(-1px); }

    /* ── Animations ───────────────────────── */
    @keyframes fadeUp { from { opacity:0; transform:translateY(18px); } to { opacity:1; transform:translateY(0); } }
    .fu  { animation: fadeUp .5s ease both; }
    .fu1 { animation-delay: .04s; }
    .fu2 { animation-delay: .10s; }
    .fu3 { animation-delay: .16s; }
    .fu4 { animation-delay: .22s; }
    .fu5 { animation-delay: .28s; }
    .fu6 { animation-delay: .34s; }
  </style>
  <style>
.error {
  color: red;
  font-size: 12px;
  margin-top: 4px;
}
</style>
</head>
<body>

  <%-- ═══════════ HEADER ═══════════ --%>
  <jsp:include page="/WEB-INF/views/component/header.jsp" />

  <div class="container py-4" style="max-width:860px">

    <%-- Page Heading + Back --%>
    <div class="page-head fu fu1">
      <button class="back-btn" onclick="history.back()" title="Go Back">
        <i class="fas fa-arrow-left"></i>
      </button>
      <div>
        <h1>List Your Property</h1>
        <p>Fill in the details below to post your property listing</p>
      </div>
    </div>

    <%-- Form posts to your property listing servlet --%>
    <form id="propertyForm" action="${pageContext.request.contextPath}/property/add" method="post" enctype="multipart/form-data">

      <%-- ── Basic Information ─────────────────── --%>
      <div class="scard fu fu2">
        <div class="scard-title"><i class="fas fa-home"></i> Basic Information</div>

        <%-- Property Title --%>
        <div class="mb-3">
          <label class="form-label">Property Title</label>
          <input type="text" class="form-control" name="title"
                 placeholder="e.g. 2 BHK Flat in Navrangpura" >
                 <small class="error text-danger"></small>
        </div>

        <%-- Purpose + Type --%>
        <div class="row g-3 mb-3">
          <div class="col-md-6">
            <label class="form-label">Purpose</label>
            <select class="form-select" name="purpose" >
              <option value="">Select Purpose</option>
              <option value="SALE">SALE</option>
              <option value="RENT">RENT</option>
            </select>
            <small class="error text-danger"></small>
          </div>
          <div class="col-md-6">
            <label class="form-label">Property Type</label>
            <select class="form-select" name="propertyType" >
              <option value="">Select Type</option>
              <option value="Flat">Flat</option>
              <option value="House">House</option>
              <option value="Villa">Villa</option>
              <option value="Plot">Plot</option>
            </select>
            <small class="error text-danger"></small>
          </div>
        </div>

        <%-- Price --%>
        <div class="mb-0">
          <label class="form-label">Price (&#8377;)</label>
          <input type="number" class="form-control" name="price"
                 placeholder="Enter amount" min="0" >
                 <small class="error text-danger"></small>
          <div class="form-text">
            <i class="fas fa-info-circle me-1"></i>
            For Rent &rarr; Monthly amount &nbsp;|&nbsp; For Sale &rarr; Total amount
          </div>
        </div>
      </div>

      <%-- ── Location ──────────────────────────── --%>
      <div class="scard fu fu3">
        <div class="scard-title"><i class="fas fa-map-marker-alt"></i> Location</div>

        <div class="row g-3 mb-3">
          <div class="col-md-6">
            <label class="form-label">City</label>
            <input type="text" class="form-control" name="city"
                   placeholder="e.g. Ahmedabad" >
                   <small class="error text-danger"></small>
          </div>
          <div class="col-md-6">
            <label class="form-label">Locality</label>
            <input type="text" class="form-control" name="locality"
                   placeholder="e.g. Navrangpura" >
                   <small class="error text-danger"></small>
          </div>
        </div>

        <div class="mb-0">
          <label class="form-label">Google Maps Embed URL</label>
          <input type="url" class="form-control" name="mapEmbedUrl"
                 placeholder="Paste the src URL from Google Maps embed code" >
                 <small class="error text-danger"></small>
          <div class="form-text">
            <i class="fas fa-info-circle me-1"></i>
            Google Maps &rarr; Share &rarr; Embed a map &rarr; Copy the src URL
          </div>
        </div>
      </div>

      <%-- ── Property Details ──────────────────── --%>
      <div class="scard fu fu4">
        <div class="scard-title"><i class="fas fa-list-ul"></i> Property Details</div>

        <div class="row g-3 mb-3">
          <div class="col-md-4">
            <label class="form-label">Bedrooms</label>
            <input type="number" class="form-control" name="bedrooms"
                   placeholder="e.g. 2" min="0" >
                   <small class="error text-danger"></small>
          </div>
          <div class="col-md-4">
            <label class="form-label">Bathrooms</label>
            <input type="number" class="form-control" name="bathrooms"
                   placeholder="e.g. 2" min="0" >
                   <small class="error text-danger"></small>
          </div>
          <div class="col-md-4">
            <label class="form-label">Area Size (sq ft)</label>
            <input type="number" class="form-control" name="areaSize"
                   placeholder="e.g. 1100" min="0" >
                   <small class="error text-danger"></small>
          </div>
        </div>

        <div class="row g-3 mb-3">
          <div class="col-md-4">
            <label class="form-label">Property Age (years)</label>
            <input type="number" class="form-control" name="propertyAge"
                   placeholder="e.g. 5" min="0">
                   <small class="error text-danger"></small>
          </div>
          <div class="col-md-4">
            <label class="form-label">Furnishing</label>
            <select class="form-select" name="furnishing">
              <option value="">Select</option>
              <option value="Furnished">Furnished</option>
              <option value="Semi-Furnished">Semi-Furnished</option>
              <option value="Unfurnished">Unfurnished</option>
            </select>
            <small class="error text-danger"></small>
          </div>
          <div class="col-md-4">
            <label class="form-label">Facing</label>
            <select class="form-select" name="facing">
              <option value="">Select</option>
              <option value="North">North</option>
              <option value="East">East</option>
              <option value="South">South</option>
              <option value="West">West</option>
            </select>
            <small class="error text-danger"></small>
          </div>
        </div>

        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">Availability</label>
            <select class="form-select" name="availability">
              <option value="">Select</option>
              <option value="Immediate">Immediate</option>
              <option value="Within 30 Days">Within 30 Days</option>
            </select>
            <small class="error text-danger"></small>
          </div>
          <div class="col-md-6">
            <label class="form-label">Price Negotiable</label>
            <select class="form-select" name="negotiable">
              <option value="">Select</option>
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
            <small class="error text-danger"></small>
          </div>
        </div>
      </div>

      <%-- ── Description ────────────────────────── --%>
      <div class="scard fu fu5">
        <div class="scard-title"><i class="fas fa-align-left"></i> Description</div>
        <textarea class="form-control" name="description" rows="4"
                  placeholder="Describe your property — highlights, surroundings, special features..."
                  ></textarea>
                  <small class="error text-danger"></small>
      </div>

      <%-- ── Property Images ─────────────────────── --%>
      <div class="scard fu fu5">
        <div class="scard-title"><i class="fas fa-images"></i> Property Images</div>

        <div class="upload-zone" id="uploadZone">
          <input type="file" id="imgInput" name="images" accept="image/*" multiple 
                 onchange="previewImages(event)">
          <i class="fas fa-cloud-upload-alt"></i>
          <p class="mt-2">Drag &amp; drop images here, or <span>browse files</span></p>
          <p style="font-size:12px;margin-top:4px">JPG, PNG, WEBP &mdash; multiple allowed</p>
        </div>

        <div id="previewGrid"></div>
         <small id="imageError" class="text-danger"></small>
      </div>

      <%-- ── Submit ──────────────────────────────── --%>
      <div class="fu fu6">
        <button type="submit" class="btn-submit">
          <i class="fas fa-paper-plane"></i> Submit Property
        </button>
      </div>

    </form>
  </div>

  <%-- ═══════════ FOOTER ═══════════ --%>
  <jsp:include page="/WEB-INF/views/component/footer.jsp" />

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    // ── Image preview ────────────────────────────
    let selectedFiles = [];

    function previewImages(e) {
      selectedFiles = [...selectedFiles, ...Array.from(e.target.files)];
      renderPreviews();
    }

    function renderPreviews() {
      const grid = document.getElementById('previewGrid');
      grid.innerHTML = '';
      selectedFiles.forEach((file, idx) => {
        const reader = new FileReader();
        reader.onload = ev => {
          const wrap = document.createElement('div');
          wrap.className = 'preview-thumb';
          wrap.innerHTML =
            '<img src="' + ev.target.result + '" alt="preview">' +
            '<button class="remove-img" onclick="removeImage(' + idx + ')" type="button">' +
            '<i class="fas fa-times"></i></button>';
          grid.appendChild(wrap);
        };
        reader.readAsDataURL(file);
      });
    }

    function removeImage(idx) {
      selectedFiles.splice(idx, 1);
      renderPreviews();
    }

    // ── Drag & drop highlight ────────────────────
    const zone = document.getElementById('uploadZone');
    zone.addEventListener('dragover',  function(e) { e.preventDefault(); zone.classList.add('dragover'); });
    zone.addEventListener('dragleave', function()  { zone.classList.remove('dragover'); });
    zone.addEventListener('drop', function(e) {
      e.preventDefault();
      zone.classList.remove('dragover');
      selectedFiles = [...selectedFiles, ...Array.from(e.dataTransfer.files)];
      renderPreviews();
    });
  </script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script>
$("#propertyForm").validate({

    rules: {

        title: {
            required: true,
            minlength: 3
        },

        purpose: {
            required: true
        },

        propertyType: {
            required: true
        },

        price: {
            required: true,
            number: true,
            min: 1
        },

        city: {
            required: true
        },

        locality: {
            required: true
        },

        mapEmbedUrl: {
            required: true,
            url: true
        },

        bedrooms: {
            required: true,
            number: true,
            min: 0
        },

        bathrooms: {
            required: true,
            number: true,
            min: 0
        },

        areaSize: {
            required: true,
            number: true,
            min: 1
        },

        propertyAge: {
            number: true,
            min: 0
        },

        furnishing: {
            required: true
        },

        facing: {
            required: true
        },

        availability: {
            required: true
        },

        negotiable: {
            required: true
        },

        description: {
            required: true,
            minlength: 10
        }
    },

    messages: {

        title: {
            required: "Please enter property title",
            minlength: "Minimum 3 characters required"
        },

        purpose: {
            required: "Please select purpose"
        },

        propertyType: {
            required: "Please select property type"
        },

        price: {
            required: "Please enter price",
            number: "Only numbers allowed",
            min: "Price must be greater than 0"
        },

        city: {
            required: "Please enter city name"
        },

        locality: {
            required: "Please enter locality"
        },

        mapEmbedUrl: {
            required: "Please provide map URL",
            url: "Enter valid URL"
        },

        bedrooms: {
            required: "Enter bedrooms",
            number: "Invalid number",
            min: "Cannot be negative"
        },

        bathrooms: {
            required: "Enter bathrooms",
            number: "Invalid number",
            min: "Cannot be negative"
        },

        areaSize: {
            required: "Enter area size",
            number: "Invalid number",
            min: "Must be greater than 0"
        },

        propertyAge: {
            number: "Invalid number",
            min: "Cannot be negative"
        },

        furnishing: {
            required: "Select furnishing"
        },

        facing: {
            required: "Select facing"
        },

        availability: {
            required: "Select availability"
        },

        negotiable: {
            required: "Select option"
        },

        description: {
            required: "Enter description",
            minlength: "Minimum 10 characters required"
        }
    },

    errorElement: "small",
    errorClass: "error",

    highlight: function(element) {
        $(element).addClass("is-invalid");
    },

    unhighlight: function(element) {
        $(element).removeClass("is-invalid");
    }
});
</script>
<script>
$("#propertyForm").submit(function(e){

    if ($("#imgInput")[0].files.length === 0) {
        $("#imageError").text("Please upload at least one property image");
        e.preventDefault();
    }
});

$("#imgInput").on("change", function(){
    $("#imageError").text("");
});
</script>


</body>
</html>