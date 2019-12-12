package org.bus.dao;

import org.bus.entity.Route;

import java.util.List;

public interface IRouteInfoDao {
    public boolean addRoute(Route route);

    public boolean isExist(String name);

    public Route queryRouteByName(String name);

    public boolean deleteRouteByName(String name);

    public List<Route> queryAllRoutes();

    public boolean updateRouteByName(String name, Route route);
}
