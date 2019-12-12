package org.bus.servlet;

import org.bus.service.IRouteInfoService;
import org.bus.service.impl.RouteInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteRouteServlet")
public class DeleteRouteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("utf-8");

        String name = request.getParameter("name");
        IRouteInfoService routeInfoService = new RouteInfoServiceImpl();
        boolean result = routeInfoService.deleteRouteByName(name);
        if (result) {
            response.sendRedirect("QueryAllRoutesServlet");
        } else {
            response.getWriter().println("删除失败");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
