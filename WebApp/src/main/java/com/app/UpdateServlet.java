package com.app;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.entity.Employee;
import com.app.util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("emp_id"));

        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String department = req.getParameter("department");
        String designation = req.getParameter("designation");
        double salary = Double.parseDouble(req.getParameter("salary"));

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        Employee emp = session.get(Employee.class, id);

        emp.setFname(fname);
        emp.setLname(lname);
        emp.setEmail(email);
        emp.setPhone(phone);
        emp.setDepartment(department);
        emp.setDesignation(designation);
        emp.setSalary(salary);

        session.merge(emp);
        tx.commit();
        session.close();

        req.setAttribute("message", "Employee Updated Successfully!");

        // Reload list page
        req.getRequestDispatcher("ListEmployeesForUpdate").forward(req, resp);
    }
}
