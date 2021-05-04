package com.job_portal.beans;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.job_portal.entities.*;

public class JobId_generator {
	
	public static String generateJobID() {
		 String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz"; 
	      StringBuilder sb = new StringBuilder(6); 
	      
	      for(int i = 0; i< 6 ; i++) {
	    	  int index 
              = (int)(AlphaNumericString.length() 
                      * Math.random()); 

          // add Character one by one in end of sb 
          sb.append(AlphaNumericString 
                        .charAt(index)); 
	      }
	      
	      try
	      {
	    	    Session ses;
				Configuration cfg=new Configuration().configure(); 
				SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
				ses=sf.getCurrentSession();
				ses.beginTransaction();
				
				Query q=ses.createQuery("from Job where jobid=:id");
				q.setParameter("id",sb.toString());
				List lst=q.getResultList();
				
				if(lst.size()>0)
				{
					generateJobID();
					
				}
				
	      }
	    	  
	      catch(Exception e)
		  {
		      	System.out.println(e.getMessage());
		  }
		          
		  return sb.toString();
	}
}
