package org.bus.servlet;

import org.bus.entity.Ticket;
import org.bus.service.ITicketInfoService;
import org.bus.service.IUserInfoService;
import org.bus.service.impl.TicketInfoServiceImpl;
import org.bus.service.impl.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/ShowAllTicketsServlet")
public class ShowAllTicketsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        获取cookiez中保存的用户名
        Cookie[] cookies = request.getCookies();
//        获取当前登录的用户名
        String uname = null;
        for (Cookie myCookie: cookies) {
            if (myCookie.getName().equals("uname")) {
                uname = myCookie.getValue();
            }
        }
        System.out.println("uname in showserv: " + uname);

        ITicketInfoService ticketInfoService = new TicketInfoServiceImpl();
        List<Ticket> tickets = ticketInfoService.queryTicketsByName(uname);
        request.setAttribute("tickets", tickets);
        request.getRequestDispatcher("./main/showtickets.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
