/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import entity.Rooms;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import model.RoomModel;

/**
 *
 * @author KiD
 */
public class AccessChatRoomFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String plainRoomID = request.getParameter("roomID");
        int roomID = Integer.parseInt(plainRoomID);
        RoomModel roomModel = new RoomModel();
        Rooms room = roomModel.getRoomInfoByRoomID(roomID);
        request.setAttribute("room", room);
        
        Cookie[] cookies = ((HttpServletRequest)request).getCookies();
        int userID = 0;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equalsIgnoreCase("userID")) {
                userID = Integer.parseInt(cookie.getValue());
            }
        }
        if (roomModel.inUserIdInRoomId(userID, roomID)) {
            chain.doFilter(request, response);
        } else {
            //@Todo: send to error page
        }
        
    }

    @Override
    public void destroy() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
