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

@WebServlet(urlPatterns = "/UpdateBusServlet")
public class UpdateBusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String number = request.getParameter("number");
        System.out.println(number);
        String brand = request.getParameter("brand");
        String route = request.getParameter("route");
        String model = request.getParameter("model");
//        System.out.println(number + "---" + model + "---" + route + "---" + brand);

//        将修改后的内容封装到一个实体类
        Bus bus = new Bus(number, brand, route, model);

        IBusInfoService busInfoService = new BusInfoServiceImpl();
        boolean result = busInfoService.updateBusByNumber(number, bus);
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        if (result) {
//            修改成功
//            System.out.println("success");
//            response.sendRedirect("page/bus/list.jsp");
            request.getRequestDispatcher("QueryAllBusesServlet").forward(request, response);
        } else {
//            System.out.println("fail");
            response.getWriter().println("修改失败！");
        }
    }
}
