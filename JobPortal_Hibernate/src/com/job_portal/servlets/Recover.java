package com.job_portal.servlets;

import com.job_portal.beans.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.job_portal.entities.*;

/**
 * Servlet implementation class Recover
 */
@WebServlet("/Recover")
public class Recover extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recover() {
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
		
		try {
			String eml=request.getParameter("eml");
			
			Session ses;
			Configuration cfg=new Configuration().configure();
			SessionFactory sf=cfg.addAnnotatedClass(UserData.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			Query q =ses.createQuery("from UserData where email=:em");
			q.setParameter("em", eml);
			List lst=q.getResultList();
			
			if(lst.size() > 0) {
				
				UserData ud=(UserData) lst.get(0);
				
				String sectoken = ud.getSectoken();
				
				sendemail se=new sendemail();
				se.setTopic("Recovering Password");
				se.setSubject("Security Token To Recover Password");
				se.setContent("Security Token Is : " +sectoken);
				se.setRecipient(eml);
						
			}
			else {
				out.println("User Does Not Exist");
			}
			
			response.sendRedirect("Recovering.jsp");
			
		}
		catch(Exception e) {
			out.println(e);
		}
	}

}
