package com.fitness.controller.user;

import com.fitness.util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ProgressServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int userId = (int) req.getSession().getAttribute("userId");
        float weight = Float.parseFloat(req.getParameter("weight"));
        String measurements = req.getParameter("measurements");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO progress VALUES(NULL,?,?,?,CURDATE())");
            ps.setInt(1, userId);
            ps.setFloat(2, weight);
            ps.setString(3, measurements);
            ps.executeUpdate();

            res.sendRedirect(req.getContextPath()+"/jsp/user/progressChart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
