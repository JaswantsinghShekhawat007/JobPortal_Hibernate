package com.job_portal.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import com.job_portal.entities.*;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String uid,psw,utp,nm,eml,phn;
		
		// Creating Alphanumeric Security Token...
	    String upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    String lowerAlphabet = "abcdefghijklmnopqrstuvwxyz";
	    String numbers = "0123456789";

	    String alphaNumeric = upperAlphabet + lowerAlphabet + numbers;

	    StringBuilder sb = new StringBuilder();

	    Random random = new Random();

	    int length = 10;

	    for(int i = 0; i < length; i++) {

	      int index = random.nextInt(alphaNumeric.length());

	      char randomChar = alphaNumeric.charAt(index);

	      sb.append(randomChar);
	    }

	    // Final Security Token Generated
	    String sectoken = sb.toString();
		
		
		try {
			
			uid=request.getParameter("uid");
			nm=request.getParameter("nm");
			eml=request.getParameter("eml");
			phn=request.getParameter("phn");
			psw=request.getParameter("psw");
			utp=request.getParameter("utp");
			
			
			
			Session ses;
			Configuration cfg=new Configuration().configure();
			SessionFactory sf=cfg.addAnnotatedClass(UserLogin.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			UserLogin obj= new UserLogin();
			obj.setUserid(uid);
			obj.setPassword(psw);
			obj.setUsertype(utp);
			
			ses.save(obj);
			ses.getTransaction().commit();
			
			Session ses1;
			Configuration cfg1=new Configuration().configure();
			SessionFactory sf1=cfg1.addAnnotatedClass(UserData.class).buildSessionFactory();
			ses1=sf1.getCurrentSession();
			ses1.beginTransaction();
				
			
			UserData obj1= new UserData();
			obj1.setUserid(uid);
			obj1.setName(nm);
			obj1.setEmail(eml);
			obj1.setPhno(phn);
			obj1.setSectoken(sectoken);
			
			
			ses1.save(obj1);
			ses1.getTransaction().commit();
			
			response.sendRedirect("LogIn.jsp");
			
		}
		catch(Exception e) {
			out.println(e);
		}
		
	}

}
