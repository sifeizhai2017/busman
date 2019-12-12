package org.bus.dao.impl;

import org.bus.dao.IRouteInfoDao;
import org.bus.entity.Route;
import org.bus.util.DBUtilForRoute;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RouteInfoDaoImpl implements IRouteInfoDao {
    private final String URL = "jdbc:mysql://localhost:3306/bus?useSSL=false&serverTimezone=UTC";
    private final String USERNAME = "root";
    private final String PASSWORD = "123456";

    @Override
    public boolean addRoute(Route route) {
        String sql = "insert into routeinfo(name, time, start, end, via, count, price, seat) values(?, ?, ?, ?, ?, ?, ?, ?)";
        Object[] params = {route.getName(), route.getTime(), route.getStart(), route.getEnd(), route.getVia(), route.getCount(), route.getPrice(), route.getSeat()};
        return DBUtilForRoute.executeUpdate(sql, params);
    }

    @Override
    public boolean isExist(String name) {
        return queryRouteByName(name) == null ? false : true;
    }

    @Override
    public Route queryRouteByName(String rname) {
        Route route = null;
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            String sql = "select * from routeinfo where name = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, rname);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String time = rs.getString("time");
                String start = rs.getString("start");
                String end = rs.getString("end");
                String via = rs.getString("via");
                int count = rs.getInt("count");
                int price = rs.getInt("price");
                int seat = rs.getInt("seat");
                route = new Route(name, time, start, end, via, count, price, seat);
            }
            return route;
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
    public boolean deleteRouteByName(String name) {
        String sql = "delete from routeinfo where name = ?";
        Object[] params = {name};
        return DBUtilForRoute.executeUpdate(sql, params);
    }

    @Override
    public List<Route> queryAllRoutes() {
        List<Route> routes = new ArrayList<Route>();
        Route route = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "select * from routeinfo";
            rs = DBUtilForRoute.executeQuery(sql, null);
            while (rs.next()) {
                String name = rs.getString("name");
                String time = rs.getString("time");
                String start = rs.getString("start");
                String end = rs.getString("end");
                String via = rs.getString("via");
                int count = rs.getInt("count");
                int price = rs.getInt("price");
                int seat = rs.getInt("seat");
                route = new Route(name, time, start, end, via, count, price, seat);
                routes.add(route);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtilForRoute.closeAll(rs, pstmt, DBUtilForRoute.connection);
        }
        return routes;
    }

    @Override
    public boolean updateRouteByName(String name, Route route) {
        String sql = "update routeinfo set time=?, start=?, end=?, via=?, count=?, price=?, seat=? where name=?";
//        System.out.println("dao：" + name + "---" + route.getTime() + "---" + route.getStart() + "---" + route.getEnd() + "---" + route.getVia() + "---" + route.getCount() + "---" + route.getPrice());
        Object[] params = {route.getTime(), route.getStart(), route.getEnd(), route.getVia(), route.getCount(), route.getPrice(), route.getSeat(), route.getName()};

        return DBUtilForRoute.executeUpdate(sql, params);
    }
}
