<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System - Home</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">
	<%@ include file="header.jsp" %>

   

    <div class="container mt-5">

        <h2 class="text-center mb-4">Welcome to Employee Management System</h2>

        <div class="row text-center">

            <!-- Create Employee -->
            <div class="col-md-3 mb-3">
                <a href="createEmp.jsp" class="btn btn-primary btn-lg w-100">
                    ➕ Create Employee
                </a>
            </div>

            <!-- View Employees -->
            <div class="col-md-3 mb-3">
                <a href="view.jsp" class="btn btn-success btn-lg w-100">
                    👁️ View Employees
                </a>
            </div>

            <!-- Update Employee -->
            <div class="col-md-3 mb-3">
                <!-- You will later create updateEmployee.jsp or servlet -->
                <a href="update.jsp" class="btn btn-warning btn-lg w-100">
                    ✏️ Update Employee
                </a>
            </div>

            <!-- Delete Employee -->
            <div class="col-md-3 mb-3">
                <!-- redirect to delete page or list page -->
                <a href="delete.jsp" class="btn btn-danger btn-lg w-100">
                    ❌ Delete Employee
                </a>
            </div>

        </div>

    </div>
    
    <%
    String msg = request.getParameter("msg");
%>

<% if ("success".equals(msg)) { %>

<div id="successMsg" class="alert alert-success alert-dismissible fade show" role="alert"
     style="max-width: 400px;">
    <strong>Success!</strong> Employee saved successfully.
</div>

<script>
    // Auto-hide after 2 seconds
    setTimeout(function() {
        var alertBox = document.getElementById("successMsg");
        if (alertBox) {
            // Bootstrap fade-out effect
            alertBox.classList.remove("show");
            alertBox.classList.add("hide");
            setTimeout(() => alertBox.style.display = "none", 500); // wait for fade transition
        }
    }, 2000);
</script>

<% } %>
    
    
    
    <div class="container mt-5">
    <div class="row text-center">

        <div class="col-md-3">
            <div class="card shadow-sm p-3">
                <h4>Total Employees</h4>
                <p class="display-6">43</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm p-3">
                <h4>Active Employees</h4>
                <p class="display-6">41</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm p-3">
                <h4>Departments</h4>
                <p class="display-6">6</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow-sm p-3">
                <h4>New This Month</h4>
                <p class="display-6">3</p>
            </div>
        </div>

    </div>
</div>
    
<%@ include file="footer.jsp" %>

</body>
</html>
