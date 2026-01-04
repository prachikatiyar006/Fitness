package com.fitness.controller.admin;

import com.fitness.dao.WorkoutPlanDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class WorkoutApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int planId = Integer.parseInt(req.getParameter("planId"));
        String action = req.getParameter("action"); // APPROVED / REJECTED

        try {
            WorkoutPlanDAO.updateStatus(planId, action);
            res.sendRedirect(req.getContextPath()+"/jsp/admin/manageWorkouts.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
