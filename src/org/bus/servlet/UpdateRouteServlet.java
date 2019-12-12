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

@WebServlet(urlPatterns = "/UpdateRouteServlet")
public class UpdateRouteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        System.out.println("name" + name);
        String time = request.getParameter("time");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String via = request.getParameter("via");
        int count = Integer.parseInt(request.getParameter("count"));
        int price = Integer.parseInt(request.getParameter("price"));
        int seat = Integer.parseInt(request.getParameter("seat"));

//        将修改后的内容封装到一个实体类
        Route route = new Route(name, time, start, end, via, count, price, seat);
        IRouteInfoService routeInfoService = new RouteInfoServiceImpl();
        boolean result = routeInfoService.updateRouteByName(name, route);
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        if (result) {
//            修改成功
//            System.out.println("success");
            request.getRequestDispatcher("pages/route/list.jsp").forward(request, response);
        } else {
//            System.out.println("fail");
            response.getWriter().println("修改失败！");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
