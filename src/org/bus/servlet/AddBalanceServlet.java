package org.bus.servlet;

import org.bus.entity.User;
import org.bus.service.IUserInfoService;
import org.bus.service.impl.UserInfoServiceImpl;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/AddBalanceServlet")
public class AddBalanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int amount = Integer.parseInt(request.getParameter("amount"));
        IUserInfoService userInfoService = new UserInfoServiceImpl();
//        获取cookiez中保存的用户名
        Cookie[] cookies = request.getCookies();
//        获取当前登录的用户名
        String uname = null;
        for (Cookie myCookie: cookies) {
            if (myCookie.getName().equals("uname")) {
                uname = myCookie.getValue();
            }
        }
        int ubalance = userInfoService.queryUserByUname(uname).getUbalance();
        String upwd = userInfoService.queryUserByUname(uname).getUpwd();
        int newBalance = ubalance + amount;
        User user = new User(uname, upwd, newBalance);
        userInfoService.updateUserByUname(uname, user);
        response.sendRedirect("./main/buyinfo.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
