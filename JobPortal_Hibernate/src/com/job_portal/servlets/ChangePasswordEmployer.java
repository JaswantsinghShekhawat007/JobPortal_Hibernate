package com.job_portal.servlets;

import java.io.IOException;
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
 * Servlet implementation class ChangePasswordEmployer
 */
@WebServlet("/ChangePasswordEmployer")
public class ChangePasswordEmployer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordEmployer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		try 
		{
			String userid=String.valueOf(session.getAttribute("userid"));
			String currpass=request.getParameter("currpass");
			String newpass=request.getParameter("cnfnewpswd");
			
			Session ses;
			Configuration cfg=new Configuration().configure(); 
			SessionFactory sf=cfg.addAnnotatedClass(UserLogin.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			Query q=ses.createQuery("from UserLogin where userid=:id and password=:psd");
			q.setParameter("id",userid);
			q.setParameter("psd",currpass);
			List lst=q.getResultList();
			if (lst.size()>0) 
			{
				
				q=ses.createQuery("update UserLogin set password=:psw where userid=:id");
				q.setParameter("psw",newpass);
				q.setParameter("id",userid);
				int i=q.executeUpdate();
				ses.getTransaction().commit();
				if(i>0)
				{
					response.sendRedirect("ChangePasswordEmployerStatus.jsp?status=pass");
				}
				
			}
			else 
			{
				response.sendRedirect("ChangePasswordEmployerStatus.jsp?status=fail");

			}
			
			
			
		}
		catch (Exception e) 
		{
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
	}

}
