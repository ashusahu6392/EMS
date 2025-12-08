<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Employee</title>
  <!-- Bootstrap CSS (use your version/location) -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
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
          <h3 class="mb-0">Update Employee</h3>
          <a href="HomePage.jsp" class="btn btn-outline-secondary">Back to Home</a>
        </div>

        <!-- Feedback message (set by servlet as request attribute "message") -->
        <c:if test="${not empty message}">
          <div class="alert alert-info">${message}</div>
        </c:if>

        <div class="table-responsive">
          <table class="table table-hover align-middle">
            <thead class="table-dark">
              <tr>
                <th scope="col">ID</th>
                <th scope="col">First</th>
                <th scope="col">Last</th>
                <th scope="col">Email</th>
                <th scope="col">Phone</th>
                <th scope="col">Department</th>
                <th scope="col">Designation</th>
                <th scope="col">Salary</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
              <!-- 'employees' should be set by controller/servlet as request attribute (List<Employee>) -->
              <c:forEach var="emp" items="${employees}">
                <tr>
                  <!-- each row is a form so update affects only that employee -->
                  <form action="UpdateServlet" method="post">
                    <!-- emp_id hidden -->
                    <td>
                      <input type="hidden" name="emp_id" value="${emp.emp_id}" />
                      ${emp.emp_id}
                    </td>

                    <td>
                      <input name="fname" class="table-input" value="${emp.fname}" required />
                    </td>

                    <td>
                      <input name="lname" class="table-input" value="${emp.lname}" required />
                    </td>

                    <td>
                      <input name="email" type="email" class="table-input" value="${emp.email}" required />
                    </td>

                    <td>
                      <input name="phone" class="table-input" value="${emp.phone}" />
                    </td>

                    <td>
                      <!-- You can replace with select if you have fixed departments -->
                      <input name="department" class="table-input" value="${emp.department}" />
                    </td>

                    <td>
                      <input name="designation" class="table-input" value="${emp.designation}" />
                    </td>

                    <td>
                      <input name="salary" type="number" step="0.01" class="table-input" value="${emp.salary}" />
                    </td>

                    <td>
                      <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-sm btn-primary" onclick="return confirm('Update this employee?')">Update</button>
                        <!-- optional: a Cancel button to reload the page / revert -->
                        <button type="button" class="btn btn-sm btn-secondary" onclick="window.location.reload();">Cancel</button>
                      </div>
                    </td>
                  </form>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div> <!-- table-responsive -->
      </div> <!-- card-body -->
    </div> <!-- card -->
  </div> <!-- container -->

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
