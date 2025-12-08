<%@ page import="java.util.*" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.app.entity.Employee" %>
<%@ page import="com.app.util.HibernateUtil" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%@ include file="header.jsp" %>

<div class="container my-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h3 class="card-title mb-4">Delete Employee</h3>

            <div class="mb-3">
                <a href="HomePage.jsp" class="btn btn-outline-secondary">Back to Home</a>
            </div>

            <%
                List<Employee> empList = Collections.emptyList();
                try (Session hsession = HibernateUtil.getSessionFactory().openSession()) {
                    Query<Employee> query = hsession.createQuery("from Employee", Employee.class);
                    empList = query.list();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <%
                String msg = request.getParameter("msg");
                if ("deleted".equals(msg)) {
            %>
                <div class="alert alert-success">Employee deleted successfully.</div>
            <%
                } else if ("error".equals(msg)) {
            %>
                <div class="alert alert-danger">Something went wrong. Try again.</div>
            <%
                }
            %>

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
                    <%
                        if (empList != null && !empList.isEmpty()) {
                            for (Employee emp : empList) {
                    %>
                        <tr>
                            <td><%= emp.getEmp_id() %></td>
                            <td><%= emp.getFname() %></td>
                            <td><%= emp.getLname() %></td>
                            <td><%= emp.getEmail() %></td>
                            <td><%= emp.getPhone() %></td>
                            <td><%= emp.getDepartment() %></td>
                            <td><%= emp.getDesignation() %></td>
                            <td><%= emp.getSalary() %></td>
                            <td>
                                <!-- Delete button triggers modal -->
                                <button type="button" class="btn btn-sm btn-danger"
                                    onclick="confirmDelete(<%= emp.getEmp_id() %>, '<%= emp.getFname().replace("'", "\\'") %> <%= emp.getLname().replace("'", "\\'") %>')">
                                    Delete
                                </button>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="9" class="text-center text-muted">No employees found.</td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Delete confirmation modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form id="deleteForm" method="post" action="DeleteServlet">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="emp_id" id="emp_id_input" value="">
          <p>Are you sure you want to delete <strong id="empName"></strong> (ID: <span id="empIdText"></span>)?</p>
          <p class="text-danger small">This action cannot be undone.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-danger">Yes, Delete</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS (and dependencies) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // show modal and set values
    function confirmDelete(empId, empFullName) {
        document.getElementById('emp_id_input').value = empId;
        document.getElementById('empName').innerText = empFullName;
        document.getElementById('empIdText').innerText = empId;

        var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'), {});
        deleteModal.show();
    }
</script>

</body>
</html>
