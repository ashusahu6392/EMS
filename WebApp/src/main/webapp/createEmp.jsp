<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<form action="addEmployee" method="post">

    <label>First Name:</label>
    <input type="text" name="fname" placeholder="Enter First Name" required>
    <br><br>

    <label>Last Name:</label>
    <input type="text" name="lname" placeholder="Enter Last Name" required>
    <br><br>

    <label>Email:</label>
    <input type="email" name="email" placeholder="Enter Email" required>
    <br><br>

    <label>Phone:</label>
    <input type="text" name="phone" placeholder="Enter Phone Number" required>
    <br><br>

    <label>Department:</label>
    <input type="text" name="department" placeholder="Enter Department">
    <br><br>

    <label>Designation:</label>
    <input type="text" name="designation" placeholder="Enter Designation">
    <br><br>

    <label>Salary:</label>
    <input type="number" name="salary" placeholder="Enter Salary" required>
    <br><br>

    <button type="submit">Save Employee</button>
</form>
		

</body>
</html>