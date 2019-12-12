package org.bus.servlet;

import org.bus.entity.User;
import org.bus.service.IUserInfoService;
import org.bus.service.impl.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/QueryAllUsersServlet")
public class QueryAllUsersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        IUserInfoService userInfoService = new UserInfoServiceImpl();
        List<User> users = userInfoService.queryAllUsers();

        request.setAttribute("users", users);
        request.getRequestDispatcher("pages/user/list.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
