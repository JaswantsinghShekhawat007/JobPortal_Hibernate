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

import com.job_portal.entities.UserLogin;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
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
		
		String uid,psw;
		
		try {
			
			uid=request.getParameter("uid");
			psw=request.getParameter("psw");
			
			Session ses;
			Configuration cfg=new Configuration().configure();
			SessionFactory sf=cfg.addAnnotatedClass(UserLogin.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			Query q=ses.createQuery("from UserLogin where userid=:id and password=:psd");
			q.setParameter("id",uid);
			q.setParameter("psd",psw);
			List lst=q.getResultList();
			
			if(lst.size()>0)
			{
				HttpSession session = request.getSession(true);
				UserLogin obj =(UserLogin) lst.get(0);
				session.setAttribute("userid", obj.getUserid());
				if(obj.getUsertype().equals("Employer"))
				{
					response.sendRedirect("Employer.jsp");
				}
				else if(obj.getUsertype().equals("Candidate"))
				{
					response.sendRedirect("Candidate.jsp");
				}
				
			}
			else
			{
				response.sendRedirect("Failure.jsp?status=wronglogin");
			}
			
		} 
		catch(Exception e) {
			out.println(e);
		}
		
	}

}
