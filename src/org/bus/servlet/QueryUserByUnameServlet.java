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

@WebServlet(urlPatterns = "/QueryUserByUnameServlet")
public class QueryUserByUnameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String uname = request.getParameter("uname");
        IUserInfoService userInfoService = new UserInfoServiceImpl();
        User user = userInfoService.queryUserByUname(uname);
        request.setAttribute("user", user);
        request.getRequestDispatcher("pages/user/edit.jsp").forward(request, response);
    }
}
