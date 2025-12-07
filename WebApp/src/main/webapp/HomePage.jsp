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

    <nav class="navbar navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="home.jsp">Employee Management System</a>
        </div>
    </nav>

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
                <a href="view" class="btn btn-success btn-lg w-100">
                    👁️ View Employees
                </a>
            </div>

            <!-- Update Employee -->
            <div class="col-md-3 mb-3">
                <!-- You will later create updateEmployee.jsp or servlet -->
                <a href="updateEmployee.jsp" class="btn btn-warning btn-lg w-100">
                    ✏️ Update Employee
                </a>
            </div>

            <!-- Delete Employee -->
            <div class="col-md-3 mb-3">
                <!-- redirect to delete page or list page -->
                <a href="deleteEmployee.jsp" class="btn btn-danger btn-lg w-100">
                    ❌ Delete Employee
                </a>
            </div>

        </div>

    </div>

</body>
</html>
