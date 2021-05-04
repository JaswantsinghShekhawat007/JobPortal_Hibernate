package com.job_portal.servlets;

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
 * Servlet implementation class Recovering
 */
@WebServlet("/Recovering")
public class Recovering extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recovering() {
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

			String token=request.getParameter("stk");
			
			Session ses;
			Configuration cfg=new Configuration().configure();
			SessionFactory sf=cfg.addAnnotatedClass(UserData.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			Query q=ses.createQuery("from UserData where sectoken=:tkn");
			q.setParameter("tkn", token);
			
			List lst=q.getResultList();
			
			if(lst.size() > 0) {
				UserData ud=(UserData) lst.get(0);
				
				String usid= ud.getUserid();
				
				HttpSession session = request.getSession(true);
				session.setAttribute("userid", ud.getUserid());	
				
				
				Session ses1;
				Configuration cfg1=new Configuration().configure();
				SessionFactory sf1=cfg1.addAnnotatedClass(UserLogin.class).buildSessionFactory();
				ses1=sf1.getCurrentSession();
				ses1.beginTransaction();
					
				Query q1=ses1.createQuery("from UserLogin where userid=:id");
				q1.setParameter("id", usid);
				List lst1=q.getResultList();
				
				if(lst.size() > 0) {
					UserLogin ul=(UserLogin) lst.get(0);
					
					String userid=ul.getUserid();
					String pass=ul.getPassword();
					
					out.println("Your Userid Is : " +userid);
					out.println("Your Password Is : " +pass);
					
				}
				else {
					out.println("Credentials Not Found");
				}
				
				
			}
			else {
				out.println("Wrong Credentials");
			}
			
			
		}
		catch(Exception e) {
			out.println(e);
		}
		
	}

}
