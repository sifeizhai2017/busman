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
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/AddRouteServlet")
public class AddRouteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        String name = request.getParameter("name");
        String time = request.getParameter("time");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String via = request.getParameter("via");
        int count = Integer.parseInt(request.getParameter("count"));
        int price = Integer.parseInt(request.getParameter("price"));
        int seat = Integer.parseInt(request.getParameter("seat"));
        Route route = new Route(name, time, start, end, via, count, price, seat);

        IRouteInfoService routeInfoService = new RouteInfoServiceImpl();
        boolean result = routeInfoService.addRoute(route);
        PrintWriter out = response.getWriter();
        out.println("增加完毕！");
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
