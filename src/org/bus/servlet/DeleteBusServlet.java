package org.bus.servlet;

import org.bus.service.IBusInfoService;
import org.bus.service.impl.BusInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/DeleteBusServlet")
public class DeleteBusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("utf-8");

        String number = request.getParameter("number");
        IBusInfoService busInfoService = new BusInfoServiceImpl();
        boolean result = busInfoService.deleteBusByNumber(number);
        if (result) {
            response.sendRedirect("QueryAllBusesServlet");
        } else {
            response.getWriter().println("删除失败");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
