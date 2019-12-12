package org.bus.service;

import org.bus.entity.Route;

import java.util.List;

public interface IRouteInfoService {
    public boolean addRoute(Route route);

    public Route queryRouteByName(String name);

    public boolean deleteRouteByName(String name);

    public List<Route> queryAllRoutes();

    public boolean updateRouteByName(String name, Route route);
}
