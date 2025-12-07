<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<main class="flex-grow-1">
  <div class="container py-5">

    <!-- Page title -->
    <div class="text-center mb-4">
      <h2 class="fw-bold">Contact Us</h2>
      <p class="text-muted">Have a question or need help? Send us a message and we'll get back to you shortly.</p>
    </div>

    <!-- Success message (auto-hide) -->
    <%
      String msg = request.getParameter("msg");
    %>
    <% if ("sent".equals(msg)) { %>
      <div id="successMsg" class="alert alert-success alert-dismissible fade show mx-auto" style="max-width:900px;">
        <strong>Thanks!</strong> Your message has been sent successfully.
      </div>

      <script>
        setTimeout(function() {
          var el = document.getElementById('successMsg');
          if (!el) return;
          el.classList.remove('show');
          el.classList.add('hide');
          setTimeout(function(){ el.style.display='none'; }, 400);
        }, 2000);
      </script>
    <% } %>

    <div class="row g-4">

      <!-- Left: Contact form -->
      <div class="col-lg-7">
        <div class="card shadow-sm">
          <div class="card-body">
            <h5 class="card-title mb-3">Send a Message</h5>

            <!-- If you have a ContactServlet use action="/ContactServlet" method="post" -->
            <form action="ContactServlet" method="post" id="contactForm" novalidate>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="name" class="form-label">Full Name</label>
                  <input type="text" class="form-control" id="name" name="name" placeholder="Your name" required>
                  <div class="invalid-feedback">Please enter your name.</div>
                </div>

                <div class="col-md-6 mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
                  <div class="invalid-feedback">Please enter a valid email.</div>
                </div>

                <div class="col-12 mb-3">
                  <label for="subject" class="form-label">Subject</label>
                  <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
                  <div class="invalid-feedback">Please provide a subject.</div>
                </div>

                <div class="col-12 mb-3">
                  <label for="message" class="form-label">Message</label>
                  <textarea class="form-control" id="message" name="message" rows="6" placeholder="Write your message..." required></textarea>
                  <div class="invalid-feedback">Please write a message.</div>
                </div>
              </div>

              <div class="d-flex justify-content-end">
                <button type="reset" class="btn btn-outline-secondary me-2">Reset</button>
                <button type="submit" class="btn btn-primary">Send Message</button>
              </div>
            </form>

          </div>
        </div>
      </div>

      <!-- Right: Contact info + Map -->
      <div class="col-lg-5">
        <div class="mb-3">
          <div class="card mb-3 shadow-sm">
            <div class="card-body">
              <h6 class="fw-semibold">Office</h6>
              <p class="mb-1">Employee Management System Pvt. Ltd.</p>
              <p class="mb-0 text-muted">123, Tech Park, City, Country</p>
            </div>
          </div>

          <div class="card mb-3 shadow-sm">
            <div class="card-body">
              <h6 class="fw-semibold">Email</h6>
              <p class="mb-0"><a href="mailto:support@ems.com">support@ems.com</a></p>
            </div>
          </div>

          <div class="card mb-3 shadow-sm">
            <div class="card-body">
              <h6 class="fw-semibold">Phone</h6>
              <p class="mb-0">+91 12345 67890</p>
            </div>
          </div>
        </div>

        <!-- Map placeholder (replace src with Google Maps embed if you want) -->
        <div class="card shadow-sm">
          <div class="card-body p-0">
            <iframe
              src="https://www.google.com/maps?q=New+Delhi,+India&output=embed"
              width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
          </div>
        </div>
      </div>
    </div>

  </div>


<%@ include file="footer.jsp" %>

<!-- Bootstrap JS (only include once site-wide) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Client-side validation (Bootstrap 5 style) -->
<script>
  (function () {
    'use strict'
    var forms = document.querySelectorAll('#contactForm')
    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
  })()
</script>


</body>
</html>