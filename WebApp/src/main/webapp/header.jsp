<%-- header.jsp --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- top dark strip with centered app name (matches your screenshot) -->
<div class="bg-dark">
  <div class="container text-center py-1">
    <span class="text-light small fw-semibold" style="letter-spacing:0.6px;">
      Employee Management System
    </span>
  </div>
</div>

<!-- main navigation bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container">

    <!-- Brand / logo (left) -->
    <a class="navbar-brand d-flex align-items-center" href="HomePage.jsp">
      <img src="assets/logo.png" alt="logo" style="height:34px; width:auto; margin-right:8px;">
      <span class="fw-bold">EMS</span>
    </a>

    <!-- toggler for mobile -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar"
      aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- nav links -->
    <div class="collapse navbar-collapse" id="mainNavbar">
      <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link fw-medium" href="HomePage.jsp"><i class="bi bi-house-door-fill me-1"></i>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-medium" href="createEmp.jsp"><i class="bi bi-person-plus-fill me-1"></i>Create</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-medium" href="view.jsp"><i class="bi bi-eye-fill me-1"></i>View</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-medium" href="update.jsp"><i class="bi bi-pencil-fill me-1"></i>Update</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-medium text-danger" href="delete.jsp"><i class="bi bi-x-circle-fill me-1"></i>Delete</a>
        </li>
      </ul>

      <!-- right side: user / help -->
      <div class="d-flex align-items-center">
        <a class="btn btn-outline-secondary btn-sm me-2" href="contact.jsp">
          <i class="bi bi-envelope-fill me-1"></i>Contact
        </a>

        <div class="dropdown">
          <a class="btn btn-outline-dark btn-sm dropdown-toggle" href="#" role="button" id="userMenu" data-bs-toggle="dropdown"
             aria-expanded="false">
            <i class="bi bi-person-circle"></i> Admin
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userMenu">
            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
            <li><a class="dropdown-item" href="settings.jsp">Settings</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-danger" href="logout">Logout</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</nav>
