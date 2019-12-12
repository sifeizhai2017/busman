package org.bus.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.bus.entity.User;

//通用的数据操作方法
public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/bus?useSSL=false&serverTimezone=UTC";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";
    public static PreparedStatement pstmt = null;
    public static Connection connection = null;
    public static ResultSet rs = null;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    public static PreparedStatement createPerPreparedStatement(String sql, Object[] params) throws SQLException, ClassNotFoundException {
        pstmt = getConnection().prepareStatement(sql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
        }
        return pstmt;
    }

    public static void closeAll(ResultSet rs, Statement stmt, Connection connection) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //	通用的增删改
    public static boolean executeUpdate(String sql, Object[] params) {
        try {
            pstmt = createPerPreparedStatement(sql, params);
//            rs = pstmt.executeQuery();
            int count = pstmt.executeUpdate();
            if (count > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return false;
        } finally {
            closeAll(null, pstmt, connection);
        }
    }

//	通用的查：通用表示适用于任何的查询
//	返回值是一个集合（Student、List<Student>、null）
    public static ResultSet executeQuery(String sql, Object[] params) {
        List<User> users = new ArrayList<User>();
        User user = null;
        try {
            pstmt = createPerPreparedStatement(sql, params);
            rs = pstmt.executeQuery();
            return rs;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return null;
        }
    }
}
