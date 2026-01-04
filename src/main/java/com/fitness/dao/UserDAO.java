package com.fitness.dao;

import com.fitness.util.DBConnection;
import java.sql.*;

public class UserDAO {

    public static ResultSet login(String email, String password) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
        ps.setString(1, email);
        ps.setString(2, password);
        return ps.executeQuery();
    }

    public static void addUser(String name, String email, String password, String role)
            throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement("INSERT INTO users VALUES(NULL,?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setString(4, role);
        ps.executeUpdate();
    }
}
