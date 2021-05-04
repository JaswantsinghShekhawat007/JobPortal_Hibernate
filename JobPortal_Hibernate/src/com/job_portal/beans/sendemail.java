package com.job_portal.beans;

import com.email.durgesh.Email;

public class sendemail 
{
	
	private String topic;
	private String subject;
	private String content;
	private String recipient;
	
	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public sendemail()
	{
	  
		try
		{
		Email email = new Email("emailAddressHere","emailPassword");
		email.setFrom("jaswantshekhawat007@gmail.com", getTopic() );
		email.setSubject(getSubject());
		email.setContent(getContent(), "text/html");
		email.addRecipient(getRecipient());
		email.send();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
