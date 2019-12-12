package org.bus.service;

import org.bus.entity.Ticket;

import java.util.List;

public interface ITicketInfoService {
    public boolean addTicket(Ticket ticket);

    public Ticket queryTicketByUid(int uid);

    public List<Ticket> queryAllTickets();

    public boolean deleteTicketByUid(int uid);

    public List<Ticket> queryTicketsByName(String name);
}
