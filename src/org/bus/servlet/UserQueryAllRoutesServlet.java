package org.bus.servlet;

import org.bus.entity.Route;
import org.bus.service.IRouteInfoService;
import org.bus.service.impl.RouteInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/UserQueryAllRoutesServlet")
public class UserQueryAllRoutesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        IRouteInfoService routeInfoService = new RouteInfoServiceImpl();
        List<Route> routes = routeInfoService.queryAllRoutes();
//        System.out.println(routes);

        request.setAttribute("routes", routes);
        request.getRequestDispatcher("./main/ticket.jsp").forward(request, response);
//        System.out.println("没有跳转成功");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
