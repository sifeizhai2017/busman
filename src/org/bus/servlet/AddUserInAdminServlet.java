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
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/AddUserInAdminServlet")
public class AddUserInAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
        int ubalance = Integer.parseInt(request.getParameter("ubalance"));
        User user = new User(uname, upwd, ubalance);

        IUserInfoService userInfoService = new UserInfoServiceImpl();
        boolean result = userInfoService.addUser(user);
        PrintWriter out = response.getWriter();
        out.println("增加完毕！");
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
