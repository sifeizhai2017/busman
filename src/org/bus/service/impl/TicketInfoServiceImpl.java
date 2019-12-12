package org.bus.service.impl;

import org.bus.dao.ITicketInfoDao;
import org.bus.dao.impl.TicketInfoDaoImpl;
import org.bus.entity.Ticket;
import org.bus.service.ITicketInfoService;

import java.util.List;

public class TicketInfoServiceImpl implements ITicketInfoService {
    ITicketInfoDao ticketInfoDao = new TicketInfoDaoImpl();

    @Override
    public boolean addTicket(Ticket ticket) {
        ticketInfoDao.addTicket(ticket);
        return true;
    }

    @Override
    public Ticket queryTicketByUid(int uid) {
        return ticketInfoDao.queryTicketByUid(uid);
    }

    @Override
    public List<Ticket> queryAllTickets() {
        return ticketInfoDao.queryAllTickets();
    }

    @Override
    public boolean deleteTicketByUid(int uid) {
        if (ticketInfoDao.isExist(uid)) {
            ticketInfoDao.deleteTicketByUid(uid);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Ticket> queryTicketsByName(String name) {
        return ticketInfoDao.queryTicketsByName(name);
    }
}
