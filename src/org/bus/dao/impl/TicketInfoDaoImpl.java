package org.bus.dao.impl;

import org.bus.dao.ITicketInfoDao;
import org.bus.entity.Ticket;
import org.bus.util.DBUtilForTicket;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketInfoDaoImpl implements ITicketInfoDao {
    private final String URL = "jdbc:mysql://localhost:3306/bus?useSSL=false&serverTimezone=UTC";
    private final String USERNAME = "root";
    private final String PASSWORD = "123456";

    @Override
    public boolean addTicket(Ticket ticket) {
        String sql = "insert into ticketinfo(uname, uticket) values(?, ?)";
        Object[] params = {ticket.getUname(), ticket.getUticket()};
        return DBUtilForTicket.executeUpdate(sql, params);
    }

    @Override
    public boolean isExist(int uid) {
        return queryTicketByUid(uid) == null ? false : true;
    }

    @Override
    public Ticket queryTicketByUid(int id) {
        Ticket ticket = null;
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            String sql = "select * from ticketinfo where uid = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int uid = rs.getInt("uid");
                String uname = rs.getString("uname");
                String uticket = rs.getString("uticket");
                ticket = new Ticket(uid, uname, uticket);
            }
            return ticket;
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
    public List<Ticket> queryAllTickets() {
        List<Ticket> tickets = new ArrayList<Ticket>();
        Ticket ticket = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "select * from businfo";
            rs = DBUtilForTicket.executeQuery(sql, null);
            while (rs.next()) {
                int uid = rs.getInt("uid");
                String uname = rs.getString("uname");
                String uticket = rs.getString("uticket");
                int ubalance = rs.getInt("ubalance");
                ticket = new Ticket();
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtilForTicket.closeAll(rs, pstmt, DBUtilForTicket.connection);
        }
        return tickets;
    }

    @Override
    public boolean deleteTicketByUid(int uid) {
        String sql = "delete from ticketinfo where uid = ?";
        Object[] params = {uid};
        return DBUtilForTicket.executeUpdate(sql, params);
    }

    @Override
    public List<Ticket> queryTicketsByName(String name) {
        List<Ticket> tickets = new ArrayList<Ticket>();
        Ticket ticket = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "select * from ticketinfo where uname = ?";
            Object[] params = {name};
            rs = DBUtilForTicket.executeQuery(sql, params);
            while (rs.next()) {
                int uid = rs.getInt("id");
                System.out.println("uid------------" + uid);
                String uname = rs.getString("uname");
                System.out.println("uname------------" + uname);
                String uticket = rs.getString("uticket");
                ticket = new Ticket(uid, uname, uticket);
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtilForTicket.closeAll(rs, pstmt, DBUtilForTicket.connection);
        }
        return tickets;
    }
}
