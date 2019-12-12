package org.bus.dao.impl;

import org.bus.dao.IBusInfoDao;
import org.bus.entity.Bus;
import org.bus.util.DBUtil;
import org.bus.util.DBUtilForBus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BusInfoDaoImpl implements IBusInfoDao {
    private final String URL = "jdbc:mysql://localhost:3306/bus?useSSL=false&serverTimezone=UTC";
    private final String USERNAME = "root";
    private final String PASSWORD = "123456";

    @Override
    public boolean addBus(Bus bus) {
        String sql = "insert into businfo(number, brand, route, model) values(?, ?, ?, ?)";
        Object[] params = {bus.getNumber(), bus.getBrand(), bus.getRoute(), bus.getModel()};
        return DBUtilForBus.executeUpdate(sql, params);
    }

    @Override
    public boolean isExist(String no) {
        return queryBusByNumber(no) == null ? false : true;
    }

    @Override
    public Bus queryBusByNumber(String no) {
        Bus bus = null;
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            String sql = "select * from businfo where number = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String number = rs.getString("number");
                String brand = rs.getString("brand");
                String route = rs.getString("route");
                String model = rs.getString("model");
                bus = new Bus(number, brand, route, model);
            }
            return bus;
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
    public boolean deleteBusByNumber(String number) {
        String sql = "delete from businfo where number = ?";
        Object[] params = {number};
        return DBUtilForBus.executeUpdate(sql, params);
    }

    @Override
    public List<Bus> queryAllBuses() {
        List<Bus> buses = new ArrayList<Bus>();
        Bus bus = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "select * from businfo";
            rs = DBUtilForBus.executeQuery(sql, null);
            while (rs.next()) {
                String number = rs.getString("number");
                String brand = rs.getString("brand");
                String route = rs.getString("route");
                String model = rs.getString("model");
                bus = new Bus(number, brand, route, model);
                buses.add(bus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtilForBus.closeAll(rs, pstmt, DBUtilForBus.connection);
        }
        return buses;
    }

    @Override
    public boolean updateBusByNumber(String number, Bus bus) {
        String sql = "update businfo set brand=?, route=?, model=? where number=?";
//        System.out.println("dao:" + number + "-" + bus.getBrand() + '-' + bus.getModel() + '-' + bus.getRoute());
        Object[] params = {bus.getBrand(), bus.getRoute(), bus.getModel(), bus.getNumber()};
        return DBUtilForBus.executeUpdate(sql, params);
    }
}
