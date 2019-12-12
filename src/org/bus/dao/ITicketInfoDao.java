package org.bus.dao;

import org.bus.entity.Ticket;

import java.util.List;

public interface ITicketInfoDao {
    public boolean addTicket(Ticket ticket);

    public boolean isExist(int uid);

    public Ticket queryTicketByUid(int uid);

    public List<Ticket> queryAllTickets();

//    public boolean updateTicketByUid(int uid);

    public boolean deleteTicketByUid(int uid);

    public List<Ticket> queryTicketsByName(String name);
}
