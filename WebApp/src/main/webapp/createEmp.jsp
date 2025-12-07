<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Employee</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">
	<%@ include file="header.jsp" %>

<div class="container mt-5">

    <div class="card shadow">
<div class="card-header bg-primary text-white">
    <div class="d-flex justify-content-between align-items-center">
        
        <h3 class="mb-0">Create Employee</h3>
        
    </div>
</div>


        <div class="card-body">

            <form action="FirstServlet" method="post">

                <div class="mb-3">
                    <label class="form-label">First Name</label>
                    <input type="text" name="fname" class="form-control" placeholder="Enter First Name" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="lname" class="form-control" placeholder="Enter Last Name" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Enter Email" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phone" class="form-control" placeholder="Enter Phone Number" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Department</label>
                    <input type="text" name="department" class="form-control" placeholder="Enter Department">
                </div>

                <div class="mb-3">
                    <label class="form-label">Designation</label>
                    <input type="text" name="designation" class="form-control" placeholder="Enter Designation">
                </div>

                <div class="mb-3">
                    <label class="form-label">Salary</label>
                    <input type="number" name="salary" class="form-control" placeholder="Enter Salary" required>
                </div>

                <button type="submit" class="btn btn-success">Save Employee</button>
                <a href="home.jsp" class="btn btn-secondary ms-2">Back</a>

            </form>

        </div>
    </div>

</div>

</body>
</html>
