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

public class DeleteServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String empIdStr = req.getParameter("emp_id");
		
		if(empIdStr == null || empIdStr.trim().isEmpty()) {
			resp.sendRedirect("delete.jsp?msg=error");
			return;
		}
		
		int empId = Integer.parseInt(empIdStr);
		
		Transaction tx = null;
		
		try(Session session = HibernateUtil.getSessionFactory().openSession()) {
			tx = session.beginTransaction();
			Employee emp = session.get(Employee.class, empId);
			
			if(emp != null) {
				session.remove(emp);
				
				tx.commit();
				resp.sendRedirect("delete.jsp?msg=Deleted Successfully");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			if(tx != null) {
				tx.rollback();
			}
			resp.sendRedirect("delete.jsp?msg=error");
		}
	}

}
