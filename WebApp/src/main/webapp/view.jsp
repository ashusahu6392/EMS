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
<title>All Employees</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<%@ include file="header.jsp" %>

<div class="container mt-4">
    <h2 class="text-center mb-4">Employee List</h2>

    <%
        List<Employee> empList = null;
        try (Session hsession = HibernateUtil.getSessionFactory().openSession()) {
            Query<Employee> query = hsession.createQuery("from Employee", Employee.class);
            empList = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Salary</th>
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
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="8" class="text-center text-danger">No Employees Found</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    
    <!-- Delete Employee Section -->
<div class="container mt-5">
    <div class="row justify-content-center">
        
        <!-- Delete Form -->
        <div class="col-md-4">
            <h4>Delete Employee</h4>
            <form action="DeleteServlet" method="post" class="d-flex">
                <input type="number" name="emp_id" class="form-control" placeholder="Enter Employee ID" required>
                <button type="submit" class="btn btn-danger ms-2">Delete</button>
            </form>
        </div>

        <!-- Success / Error Message (Right Side) -->
        <div class="col-md-4">
            <%
                String msg = (String) request.getAttribute("msg");
                if(msg != null){
            %>
                <div class="alert alert-success mt-2">
                    <%= msg %>
                </div>
            <% 
                }
            %>
        </div>

    </div>
</div>
    

    <div class="text-center">
        <a href="HomePage.jsp" class="btn btn-primary">Back to Home</a>
    </div>
</div>

</body>
</html>
