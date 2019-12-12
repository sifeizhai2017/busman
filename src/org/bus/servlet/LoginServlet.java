package org.bus.servlet;

import org.bus.service.IUserInfoService;
import org.bus.service.impl.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
//        System.out.println(uname);
//        System.out.println(upwd);

        Cookie cookie = new Cookie("uname", uname);
        response.addCookie(cookie);

        IUserInfoService userInfoService = new UserInfoServiceImpl();
//        获取管理员密码
        String adminPwd = userInfoService.queryUserByUname("admin").getUpwd();
//        获取普通用户密码
        String userPwd = userInfoService.queryUserByUname(uname).getUpwd();

        if (uname.equals("admin")) {
            if (upwd.equals(adminPwd)) {
//                System.out.println("我是管理员！");
                response.sendRedirect("index.jsp");
            } else {
//                System.out.println("傻逼，你是管理员你都能忘记密码");
                response.sendRedirect("login.jsp");
            }
        } else {
            if (upwd.equals(userPwd)) {
                response.sendRedirect("./main/index.jsp");
            } else {
//                System.out.println("尊敬的用户，你他娘的密码错了");
                response.sendRedirect("login.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
