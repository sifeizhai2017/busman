package org.bus.servlet;

import org.bus.dao.ITicketInfoDao;
import org.bus.entity.Route;
import org.bus.entity.Ticket;
import org.bus.entity.User;
import org.bus.service.IBusInfoService;
import org.bus.service.IRouteInfoService;
import org.bus.service.ITicketInfoService;
import org.bus.service.IUserInfoService;
import org.bus.service.impl.BusInfoServiceImpl;
import org.bus.service.impl.RouteInfoServiceImpl;
import org.bus.service.impl.TicketInfoServiceImpl;
import org.bus.service.impl.UserInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/BuyTicketServlet")
public class BuyTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        IUserInfoService userInfoService = new UserInfoServiceImpl();
        IBusInfoService busInfoService = new BusInfoServiceImpl();
        IRouteInfoService routeInfoService = new RouteInfoServiceImpl();
        ITicketInfoService ticketInfoService = new TicketInfoServiceImpl();

//        获取cookiez中保存的用户名
        Cookie[] cookies = request.getCookies();
        String uname = null;
        for (Cookie myCookie: cookies) {
            if (myCookie.getName().equals("uname")) {
                uname = myCookie.getValue();
            }
        }
        System.out.println("uname" + uname);

//        获取所有与路线有关的信息
        String name = request.getParameter("name");
        String time = request.getParameter("time");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String via = request.getParameter("via");
        int price = Integer.parseInt(request.getParameter("price"));
        int count = Integer.parseInt(request.getParameter("count"));
        int seat = Integer.parseInt(request.getParameter("seat"));
//        System.out.println(seat);

//        将已购买人数减1
        ++count;
        Route route = new Route(name, time, start, end, via, count, price, seat);

//        第一步：线路表中座位数-1
        boolean rResult = routeInfoService.updateRouteByName(name, route);

//        第二步：用户余额更新
        int currentBalance = userInfoService.queryUserByUname(uname).getUbalance();
        String upwd = userInfoService.queryUserByUname(uname).getUpwd();
        int nowBalance = currentBalance - price;
        System.out.println(nowBalance);
        User user = new User(uname, upwd, nowBalance);
        boolean uResult = userInfoService.updateUserByUname(uname, user);

//        第三步，将这张票的信息放到ticketinfo中
        Ticket ticket = new Ticket(uname, name);
        boolean tResult = ticketInfoService.addTicket(ticket);
        request.getRequestDispatcher("./main/buyinfo.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
