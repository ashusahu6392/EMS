package com.app;

import java.io.IOException;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.entity.Employee;
import com.app.util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FirstServlet extends HttpServlet {
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		Employee employee = new Employee();
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String department = req.getParameter("department");
		String designation = req.getParameter("designation");
		double salary = Double.parseDouble(req.getParameter("salary"));
		
		employee.setFname(fname);
		employee.setLname(lname);
		employee.setEmail(email);
		employee.setPhone(phone);
		employee.setSalary(salary);
		employee.setDepartment(department);
		employee.setDesignation(designation);
		
		Transaction transaction = null;
		
		
		try(Session session = HibernateUtil.getSessionFactory().openSession() ){
			transaction = session.beginTransaction();
			session.persist(employee);
			transaction.commit();
			resp.sendRedirect("HomePage.jsp?msg=success");
		}catch(Exception e) {
			
			if(transaction != null) transaction.rollback();
		}
		
	}

}
