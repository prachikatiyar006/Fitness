package com.fitness.dao;

import com.fitness.util.DBConnection;
import java.sql.*;

public class ProgressDAO {

    public static ResultSet getProgressByUser(int userId) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement(
                "SELECT date, weight FROM progress WHERE user_id=? ORDER BY date");
        ps.setInt(1, userId);
        return ps.executeQuery();
    }
}
