package org.bus.dao;

import org.bus.entity.Bus;

import java.util.List;

public interface IBusInfoDao {
    //    增加配车
    public boolean addBus(Bus bus);

    //    判断配车是否已经存在
    public boolean isExist(String number);

    //    根据自编号查询配车
    public Bus queryBusByNumber(String number);

    //    删除配车
    public boolean deleteBusByNumber(String number);

    //    查询所有配车
    public List<Bus> queryAllBuses();

    //    根据自编号修改配车
    public boolean updateBusByNumber(String number, Bus bus);
}
