package org.bus.servlet;

import org.bus.dao.IUserInfoDao;
import org.bus.entity.User;
import org.bus.service.IUserInfoService;
import org.bus.service.impl.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        获取cookiez中保存的用户名
        Cookie[] cookies = request.getCookies();
//        Cookie cookie = null;
//        获取当前登录的用户名
        String uname = null;
        for (Cookie myCookie: cookies) {
            if (myCookie.getName().equals("uname")) {
                uname = myCookie.getValue();
            }
        }
//        String uname = (String) cookie.getValue();
        System.out.println("uname" + uname);

        IUserInfoService userInfoService = new UserInfoServiceImpl();
        int ubalance = userInfoService.queryUserByUname(uname).getUbalance();
        System.out.println("这里的ubalance" + ubalance);
        String upwd = request.getParameter("newpwd");
        User user = new User(uname, upwd, ubalance);
        userInfoService.updateUserByUname(uname, user);
        response.sendRedirect("./main/buyinfo.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
