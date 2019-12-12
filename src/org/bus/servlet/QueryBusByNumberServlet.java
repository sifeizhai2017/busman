package org.bus.servlet;

import org.bus.dao.impl.BusInfoDaoImpl;
import org.bus.entity.Bus;
import org.bus.service.IBusInfoService;
import org.bus.service.impl.BusInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/QueryBusByNumberServlet")
public class QueryBusByNumberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("enter!!!!");
        request.setCharacterEncoding("utf-8");
        String number = request.getParameter("number");
//        System.out.println(number);
        IBusInfoService busInfoService = new BusInfoServiceImpl();
        Bus bus = busInfoService.queryBusByNumber(number);
//        将此车的数据通过前台jsp显示
        request.setAttribute("bus", bus);
        request.getRequestDispatcher("pages/bus/edit.jsp").forward(request, response);
    }
}
