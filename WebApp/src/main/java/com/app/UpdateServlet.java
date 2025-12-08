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

        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            Employee emp = session.get(Employee.class, id);

            if (emp == null) {
                req.setAttribute("message", "Employee with id " + id + " not found.");
                // forward back to the same JSP so list still displays
                req.getRequestDispatcher("/update.jsp").forward(req, resp);
                return;
            }

            emp.setFname(fname);
            emp.setLname(lname);
            emp.setEmail(email);
            emp.setPhone(phone);
            emp.setDepartment(department);
            emp.setDesignation(designation);
            emp.setSalary(salary);

            // update/merge/saveOrUpdate are fine here; using merge as before
            session.merge(emp);

            tx.commit();

            req.setAttribute("message", "Employee Updated Successfully!");
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            req.setAttribute("message", "Error updating employee: " + e.getMessage());
        } finally {
            if (session != null) session.close();
        }

        // Forward back to the same JSP (which fetches the employees again)
        req.getRequestDispatcher("/update.jsp").forward(req, resp);
    }
}
