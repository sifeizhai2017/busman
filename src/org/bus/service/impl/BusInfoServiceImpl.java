package org.bus.service.impl;

import org.bus.dao.IBusInfoDao;
import org.bus.dao.impl.BusInfoDaoImpl;
import org.bus.entity.Bus;
import org.bus.service.IBusInfoService;
import org.bus.util.DBUtilForBus;

import java.util.List;

public class BusInfoServiceImpl implements IBusInfoService {
    IBusInfoDao busInfoDao = new BusInfoDaoImpl();

    @Override
    public boolean addBus(Bus bus) {
        if (!busInfoDao.isExist(bus.getNumber())) {
            busInfoDao.addBus(bus);
            return true;
        } else {
            System.out.println("此人已经存在");
            return false;
        }
    }

    @Override
    public Bus queryBusByNumber(String no) {
        return busInfoDao.queryBusByNumber(no);
    }

    @Override
    public boolean deleteBusByNumber(String number) {
        if (busInfoDao.isExist(number)) {
            return busInfoDao.deleteBusByNumber(number);
        } else {
            return false;
        }
    }

    @Override
    public List<Bus> queryAllBuses() {
        return busInfoDao.queryAllBuses();
    }

    @Override
    public boolean updateBusByNumber(String number, Bus bus) {
        if (busInfoDao.isExist(number)) {
//            System.out.println("!!!!service");
            return busInfoDao.updateBusByNumber(number, bus);
        } else {
            return false;
        }
    }
}
