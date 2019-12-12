package org.bus.service.impl;

import org.bus.dao.IRouteInfoDao;
import org.bus.dao.impl.RouteInfoDaoImpl;
import org.bus.entity.Route;
import org.bus.service.IRouteInfoService;

import java.util.List;

public class RouteInfoServiceImpl implements IRouteInfoService {
    IRouteInfoDao routeInfoDao = new RouteInfoDaoImpl();

    @Override
    public boolean addRoute(Route route) {
        if (!routeInfoDao.isExist(route.getName())) {
            routeInfoDao.addRoute(route);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Route queryRouteByName(String name) {
        return routeInfoDao.queryRouteByName(name);
    }

    @Override
    public boolean deleteRouteByName(String name) {
        if (routeInfoDao.isExist(name)) {
            routeInfoDao.deleteRouteByName(name);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Route> queryAllRoutes() {
        return routeInfoDao.queryAllRoutes();
    }

    @Override
    public boolean updateRouteByName(String name, Route route) {
        if (routeInfoDao.isExist(name)) {
            return routeInfoDao.updateRouteByName(name, route);
        } else {
            return false;
        }
    }
}
