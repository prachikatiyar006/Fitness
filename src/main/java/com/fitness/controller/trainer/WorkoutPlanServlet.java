package com.fitness.controller.trainer;

import com.fitness.util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class WorkoutPlanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int trainerId = (int) req.getSession().getAttribute("userId");
        String title = req.getParameter("title");
        String desc = req.getParameter("description");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO workout_plans VALUES(NULL,?,?,?,'PENDING')");
            ps.setInt(1, trainerId);
            ps.setString(2, title);
            ps.setString(3, desc);
            ps.executeUpdate();

            res.sendRedirect(req.getContextPath()+"/jsp/trainer/trainerDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
