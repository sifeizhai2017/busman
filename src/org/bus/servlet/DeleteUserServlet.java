package org.bus.servlet;

import org.bus.service.IUserInfoService;
import org.bus.service.impl.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("utf-8");

        String uname = request.getParameter("uname");
        System.out.println(uname);
        IUserInfoService userInfoService = new UserInfoServiceImpl();
        boolean result = userInfoService.deleteUserByUname(uname);
        if (result) {
            response.sendRedirect("QueryAllUsersServlet");
        } else {
            response.getWriter().println("删除失败");
        }
    }
}
