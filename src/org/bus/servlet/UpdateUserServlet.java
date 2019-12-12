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

@WebServlet(urlPatterns = "/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");
        int ubalance = Integer.parseInt(request.getParameter("ubalance"));
        User user = new User(uname, upwd, ubalance);
        IUserInfoService userInfoService = new UserInfoServiceImpl();
        boolean result = userInfoService.updateUserByUname(uname, user);
        if (result) {
            request.getRequestDispatcher("pages/user/list.jsp").forward(request, response);
        } else {
            response.getWriter().println("修改失败！");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
