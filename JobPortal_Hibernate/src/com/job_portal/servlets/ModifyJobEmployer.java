package com.job_portal.servlets;

import java.io.IOException;
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
 * Servlet implementation class ModifyJobEmployer
 */
@WebServlet("/ModifyJobEmployer")
public class ModifyJobEmployer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyJobEmployer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		String skill=request.getParameter("skill");
		String location=request.getParameter("location");
		String pacperanum=request.getParameter("pacperanum");
		String jobid=request.getParameter("jobid");
		try 
		{
			Session ses;
			Configuration cfg=new Configuration().configure(); 
			SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
			
			Query q=ses.createQuery("update Job set skill=:skill,location=:location,pacperanum=:pacperanum where jobid=:id");
			q.setParameter("skill",skill);
			q.setParameter("location",location);
			q.setParameter("pacperanum",Integer.parseInt(pacperanum));
			q.setParameter("id",jobid);
			int i=q.executeUpdate();
			ses.getTransaction().commit();
			if(i>0)
			{
				response.sendRedirect("ModifyJobEmployerStatus.jsp?status=pass");
			}
			
		}
		catch (Exception e) 
		{
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
	}

}
