package com.SecureHealth.Database;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;


public class SendSimpleMail {
	  final String senderEmailID = "iotdata2022@gmail.com";
	  final String senderPassword = "vidbmozntiqrnjhv";
	  final String emailSMTPserver = "smtp.gmail.com";
	  final String emailServerPort = "465";
	  final String emailServerSSL = "465";
	  String receiverEmailID = null;
	  static String emailSubject = "OTP Verification";
	  static String emailBody = "Your OTP Password :   983454";
	  
	  public SendSimpleMail(String receiverEmailID, String emailSubject, String emailBody)
	  {
	  this.receiverEmailID=receiverEmailID;
	  this.emailSubject=emailSubject;
	  this.emailBody=emailBody;
	  
    String from = "noreply@gmail.com";

	  Properties props = new Properties();
	  props.put("mail.smtp.user",senderEmailID);
	  props.put("mail.smtp.host", emailSMTPserver);
	  props.put("mail.smtp.port", emailServerPort);
	  props.put("mail.smtp.starttls.enable","true");
	  props.put("mail.smtp.auth", "true");
	  props.put("mail.smtp.socketFactory.port",emailServerSSL);
	  props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	  props.put("mail.smtp.socketFactory.fallback", "false");
	  SecurityManager security = System.getSecurityManager();
	  try
	  {
	  Authenticator auth = new SMTPAuthenticator();
	  Session session = Session.getInstance(props, auth);
	  
	  MimeMessage msg = new MimeMessage(session);
	  
	  msg.setText(emailBody);
	  msg.setSubject(emailSubject);
	  msg.setFrom(new InternetAddress(from));
	  msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmailID));
	  
	  Transport.send(msg);
	  System.out.println("Message send Successfully:)");
	  }
	  catch (Exception mex)
	  {
	  mex.printStackTrace();
	  }
	  }
	  public class SMTPAuthenticator extends javax.mail.Authenticator
	  {
	  public PasswordAuthentication getPasswordAuthentication()
	  {
	  return new PasswordAuthentication(senderEmailID, senderPassword);
	  }
	  }
	

}
