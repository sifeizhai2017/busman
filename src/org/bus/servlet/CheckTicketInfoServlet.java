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

@WebServlet(urlPatterns = "/CheckTicketInfoServlet")
public class CheckTicketInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        String name = request.getParameter("name");
        IRouteInfoService routeInfoService = new RouteInfoServiceImpl();
        Route route = routeInfoService.queryRouteByName(name);
        request.setAttribute("route", route);
        request.getRequestDispatcher("./main/ticketcheck.jsp").forward(request, response);
    }
}
