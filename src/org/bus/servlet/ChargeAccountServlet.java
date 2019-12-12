package org.bus.servlet;

import org.bus.service.IUserInfoService;
import org.bus.service.impl.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/ChargeAccountServlet")
public class ChargeAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
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
//        System.out.println("uname" + uname);
        int ubalance = userInfoService.queryUserByUname(uname).getUbalance();
        request.setAttribute("ubalance", ubalance);
//        System.out.println("sev" + ubalance);
        request.getRequestDispatcher("main/charge.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
