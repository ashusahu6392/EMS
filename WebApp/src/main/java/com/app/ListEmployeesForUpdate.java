package com.app;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.app.entity.Employee;
import com.app.util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class ListEmployeesForUpdate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query<Employee> q = session.createQuery("from Employee", Employee.class);

        List<Employee> list = q.list();
        session.close();

        req.setAttribute("employees", list);

        req.getRequestDispatcher("update.jsp").forward(req, resp);
    }
}
