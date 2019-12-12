package org.bus.servlet;

import org.bus.entity.Bus;
import org.bus.service.IBusInfoService;
import org.bus.service.impl.BusInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/QueryAllBusesServlet")
public class QueryAllBusesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        IBusInfoService busInfoService = new BusInfoServiceImpl();
        List<Bus> buses = busInfoService.queryAllBuses();
//        System.out.println(buses);

        request.setAttribute("buses", buses);
//		因为request域中有数据，因此需要通过请求转发的方式跳转（重定向会丢失request域中的数据）
        request.getRequestDispatcher("pages/bus/list.jsp").forward(request, response);
//        System.out.println("没有跳转成功");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
