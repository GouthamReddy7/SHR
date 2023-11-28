<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.SecureHealth.Database.DatabaseConnection"%>
<%@page import="com.SecureHealth.Database.SendSimpleMail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>

<%@page import="java.sql.*" %> 
<%@page import= "java.security.SecureRandom" %> 

<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.activation.DataSource"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.BodyPart"%>
<%@page import="com.SecureHealth.SHA512.*"%>
<%@page import="com.SecureHealth.Bean.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Doctor File Accept</title>
</head>
<body>
<%
String doctor=session.getAttribute("doctorlogin").toString();
session.setAttribute("doctorlogin", doctor);
String filename=request.getParameter("ffilename");


String requestby=request.getParameter("reqby");

System.out.println("requested by: "+requestby);
System.out.println("File Accept-"+filename+requestby);

String filekey="";
String status="";
String acceptby="";
System.out.println("requested by: "+filekey);

try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=(Connection)DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/securedatahealth","root","root");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from patientuploadfile where filename='"+filename+"' and username='"+doctor+"'");

   while(rs.next())
    {
        
  			filekey=rs.getString("key");
  }
    }
catch(Exception e){
  //  out.print(e.getMessage());
}

System.out.println(doctor);

String admin="admin";
int ans=0;
try
{   
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=(Connection)DriverManager.getConnection(
	        "jdbc:mysql://localhost:3306/securedatahealth","root","root");
	PreparedStatement ps=con.prepareStatement("update filerequest set filekey='"+filekey+"',acceptby='"+admin+"',status='Accept' where requestby='"+requestby+"' and filename='"+filename+"'");
	ans=ps.executeUpdate();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1=(Connection)DriverManager.getConnection(
		        "jdbc:mysql://localhost:3306/securedatahealth","root","root");
	Statement st = con1.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM patientregister");
	System.out.println("The data inside the resultset: "+rs);
	while(rs.next()){
		//Random r = new Random( System.currentTimeMillis() );
	     //int code= ((1 + //r.nextInt(2)) * 10000 + r.nextInt(10000));
	      //session.setAttribute("OTP",code);
	      
	      
	     
	                                                   SendSimpleMail mailSender;
	        mailSender = new SendSimpleMail(rs.getString("email"),"Secret key Verification" ,"The Secret key for Download or Access File :   "+filekey+"");
	                                            
	//while(rs.next()){
	//session.setAttribute("OTP",filekey);
	//SendMail mailSender;
    //mailSender = new SendMail(rs.getString("email"),"OTP Verification" ,"Your OTP Password :   "+filekey+"");
    System.out.println("The user Mail is: "+rs.getString("email"));
    System.out.println("Key sent successfully through mail");
	//}
	}
    }catch(Exception e){
    	e.printStackTrace();
    	}
	System.out.println("The value of ans is: "+ans);
	if(ans!=0)
	{
		
		
		response.sendRedirect("PatientRequestAcceptByAdmin.jsp?success=1");
		
                                            
		
	}

	else
	{
		response.sendRedirect("Error.jsp");
	}

}
catch(Exception e)
{
	e.printStackTrace();
}


%>

<%
ArrayList<Block> blockchain = new ArrayList<Block>();
String username = "" ;
String filename1 = "" ;
String type = "";
String path = "";
String content = "";
String size = "";
String requestby2=request.getParameter("reqby");
System.out.println("Requested by: "+requestby2);
System.out.println("Data For Blockchain Performence: "+username+"-"+filename1+"-"+type+"-"+path+"-"+content+"-"+size);

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/securedatahealth","root","root");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from patientuploadfile");
	while(rs.next()) {
		username = rs.getString("username");
		filename1 = rs.getString("filename");
		type = rs.getString("type");
		path = rs.getString("path");
		content = rs.getString("content");
		size = rs.getString("size");
	}
}catch(Exception e) {
	e.printStackTrace();
}
System.out.println(doctor);
String[] packetdata = new String[6];
packetdata[0] = username;
packetdata[1] = filename1;
packetdata[2] = type;
packetdata[3] = path;
packetdata[4] = content;
packetdata[5] = size;

NoobChain nc = new NoobChain();
blockchain = nc.doblockchain(packetdata);
int ans1 = 0;
try {
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/securedatahealth","root","root");
	PreparedStatement ps = con.prepareStatement("INSERT INTO blockchain(requestby,block1,block2,block3,block4,block5,block6) VALUES(?,?,?,?,?,?,?)");
	ps.setString(1, requestby2);
	ps.setString(2, blockchain.get(0).hash);
	ps.setString(3, blockchain.get(1).hash);
	ps.setString(4, blockchain.get(2).hash);
	ps.setString(5, blockchain.get(3).hash);
	ps.setString(6, blockchain.get(4).hash);
	ps.setString(7, blockchain.get(5).hash);
		ans1 = ps.executeUpdate();
		con.close();
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>