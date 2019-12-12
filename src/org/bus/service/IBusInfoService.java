package org.bus.service;

import org.bus.entity.Bus;

import java.util.List;

public interface IBusInfoService {
    public boolean addBus(Bus bus);

    public Bus queryBusByNumber(String no);

    public boolean deleteBusByNumber(String number);

    public List<Bus> queryAllBuses();

    public boolean updateBusByNumber(String number, Bus bus);
}
