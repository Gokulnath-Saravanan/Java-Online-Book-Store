package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			System.out.println(name+" "+email+" "+phno+" "+password+" "+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if(check != null)
			{
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f = dao.userRegister(us);
				if(f) {
					//System.out.println("User Register Success..");
					session.setAttribute("succMsg","Registration Success.." );
					resp.sendRedirect("register.jsp");
				}
				else {
//					System.out.println("Something went wrong on server please try again..");
					session.setAttribute("failedMsg","Something went wrong on server please try again..");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
//				System.out.println("Please Check Terms & Conditions");
				session.setAttribute("failedMsg","Please Check Terms & Conditions");
				resp.sendRedirect("register.jsp");
			}

		}catch(Exception e){
			e.printStackTrace();
		}


	}

}
