package org.bus.servlet;

import org.bus.entity.Bus;
import org.bus.service.IBusInfoService;
import org.bus.service.impl.BusInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.print.Printable;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/AddBusServlet")
public class AddBusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        String number = request.getParameter("number");
        String brand = request.getParameter("brand");
        String route = request.getParameter("route");
        String model = request.getParameter("model");
        System.out.println(number + "---" + model + "---" + route + "---" + brand);
        Bus bus = new Bus(number, brand, route, model);

        IBusInfoService busInfoService = new BusInfoServiceImpl();
        boolean result = busInfoService.addBus(bus);
        PrintWriter out = response.getWriter();
        out.println("增加完毕！");
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
