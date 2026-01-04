package com.fitness.controller;

import com.fitness.dao.UserDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.ResultSet;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            ResultSet rs = UserDAO.login(email, password);
            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("userId", rs.getInt("user_id"));
                session.setAttribute("role", rs.getString("role"));
 System.out.print("Pring "+ rs.getString("role"));
                switch (rs.getString("role")) {
                    case "ADMIN":
                        res.sendRedirect(req.getContextPath()+"/jsp/admin/adminDashboard.jsp");
                        break;
                    case "TRAINER":
                        res.sendRedirect(req.getContextPath()+"/jsp/trainer/trainerDashboard.jsp");
                        break;
                    default:
                        res.sendRedirect(req.getContextPath()+"/jsp/user/userDashboard.jsp");
                }
            } else {
                res.sendRedirect(req.getContextPath()+"jsp/login.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
