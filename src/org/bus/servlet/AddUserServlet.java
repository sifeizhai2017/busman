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

@WebServlet(urlPatterns = "/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
//        System.out.println(uname + " " + upwd);
        User user = new User(uname, upwd, 0);

        IUserInfoService userInfoService = new UserInfoServiceImpl();
        boolean result = userInfoService.addUser(user);
        if (result) {
            response.sendRedirect("login.jsp");
//            System.out.println("noadderror");
//            request.setAttribute("error", "noaddError");
        } else {
            response.sendRedirect("return.jsp");
//            System.out.println("adderror");
//            request.setAttribute("error", "addError");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
