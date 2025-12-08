<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Employee</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .table-input { border: none; background: transparent; width: 100%; }
    .table-input:focus { outline: none; background: #fff; border: 1px solid #ced4da; border-radius: 4px; padding: 3px; }
    .card { margin: 30px; }
  </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
  <div class="card shadow-sm">
    <div class="card-body">

      <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Update Employee</h3>
        <a href="HomePage.jsp" class="btn btn-outline-secondary">Back to Home</a>
      </div>

      <!-- Show success / error message -->
      <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
      </c:if>

      <div class="table-responsive">
        <table class="table table-hover align-middle">
          <thead class="table-dark">
            <tr>
              <th>ID</th>
              <th>First</th>
              <th>Last</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Department</th>
              <th>Designation</th>
              <th>Salary</th>
              <th>Action</th>
            </tr>
          </thead>

          <tbody>

            <!-- IF EMPTY -->
            <c:if test="${empty employees}">
              <tr><td colspan="9" class="text-center">No employees found.</td></tr>
            </c:if>

            <!-- LOOP -->
            <c:forEach var="emp" items="${employees}">
              <tr>
                <form action="UpdateServlet" method="post">

                  <!-- Hidden ID -->
                  <td>
                    <input type="hidden" name="emp_id" value="${emp.emp_id}">
                    ${emp.emp_id}
                  </td>

                  <td><input name="fname" class="table-input" value="${emp.fname}" /></td>
                  <td><input name="lname" class="table-input" value="${emp.lname}" /></td>
                  <td><input name="email" class="table-input" value="${emp.email}" /></td>
                  <td><input name="phone" class="table-input" value="${emp.phone}" /></td>
                  <td><input name="department" class="table-input" value="${emp.department}" /></td>
                  <td><input name="designation" class="table-input" value="${emp.designation}" /></td>
                  <td><input name="salary" class="table-input" value="${emp.salary}" /></td>

                  <td>
                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                  </td>

                </form>
              </tr>
            </c:forEach>

          </tbody>
        </table>
      </div>

    </div>
  </div>
</div>

</body>
</html>
