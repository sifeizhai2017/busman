package org.bus.dao.impl;

import org.bus.dao.IUserInfoDao;
import org.bus.entity.User;
import org.bus.util.DBUtil;
import org.bus.util.DBUtilForBus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserInfoDaoImpl implements IUserInfoDao {

    private final String URL = "jdbc:mysql://localhost:3306/bus?useSSL=false&serverTimezone=UTC";
    private final String USERNAME = "root";
    private final String PASSWORD = "123456";

    @Override
    public boolean addUser(User user) {
        String sql = "insert into userinfo(uname, upwd, ubalance) values(?, ?, ?)";
        Object[] params = {user.getUname(), user.getUpwd(), 0};
        return DBUtil.executeUpdate(sql, params);
    }

    @Override
    public boolean isExist(String uname) {
        return queryUserByUname(uname) != null;
    }

    @Override
    public User queryUserByUname(String uname) {
        User user = null;
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            String sql = "select * from userinfo where uname = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, uname);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("uname");
                String pwd = rs.getString("upwd");
                int balance = rs.getInt("ubalance");
                user = new User(name, pwd, balance);
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<User> queryAllUsers() {
        List<User> users = new ArrayList<User>();
        User user = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "select * from userinfo";
            rs = DBUtil.executeQuery(sql, null);
            while (rs.next()) {
                String uname = rs.getString("uname");
                String upwd = rs.getString("upwd");
                int ubalance = rs.getInt("ubalance");
                System.out.println("dao!!" + ubalance);
                user = new User(uname, upwd, ubalance);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(rs, pstmt, DBUtil.connection);
        }
        return users;
    }

    @Override
    public boolean updateUserByUname(String uname, User user) {
        String sql = "update userinfo set upwd=?, ubalance=? where uname=?";
        Object[] params = {user.getUpwd(), user.getUbalance(), user.getUname()};
        return DBUtil.executeUpdate(sql, params);
    }

    @Override
    public boolean deleteUserByUname(String uname) {
        String sql = "delete from userinfo where uname = ?";
        Object[] params = {uname};
        return DBUtil.executeUpdate(sql, params);
    }
}
