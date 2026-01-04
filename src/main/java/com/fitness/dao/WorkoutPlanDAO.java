package com.fitness.dao;

import com.fitness.util.DBConnection;
import java.sql.*;

public class WorkoutPlanDAO {

    // Fetch all pending plans (Admin)
    public static ResultSet getPendingPlans() throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement("SELECT * FROM workout_plans WHERE status='PENDING'");
        return ps.executeQuery();
    }

    // Approve or Reject plan
    public static void updateStatus(int planId, String status) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement(
                "UPDATE workout_plans SET status=? WHERE plan_id=?");
        ps.setString(1, status);
        ps.setInt(2, planId);
        ps.executeUpdate();
    }

    // User: view approved plans
    public static ResultSet getApprovedPlans() throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement(
                "SELECT * FROM workout_plans WHERE status='APPROVED'");
        return ps.executeQuery();
    }
}
