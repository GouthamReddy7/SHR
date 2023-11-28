<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String filename = request.getParameter("fname");
String filesize = request.getParameter("fsize");
String requestby = request.getParameter("frequestby");

String doctorlogin = session.getAttribute("doctorlogin").toString();

String user = "" ;
System.out.println("Data request"+filename+"-"+filesize+"-"+doctorlogin);



try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/securedatahealth","root","root");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from patientuploadfile where filename = '"+filename+"' and size = '"+filesize+"'");
	while(rs.next()) {
		user = rs.getString("username");
	}
}catch(Exception e) {
	
}
System.out.println("the $$$$$%:"+user);

int ans=0;
String filekey = "autoupdate";
String acceptby = "autoupdate";
try {
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/securedatahealth","root","root");
	PreparedStatement ps = con.prepareStatement("INSERT INTO filerequest(fileowner,filename,filesize,requestby,filekey,status,acceptby) VALUES(?,?,?,?,?,?,?)");
	
	ps.setString(1, user);
	ps.setString(2, filename);
	ps.setString(3, filesize);
	ps.setString(4, requestby);
	ps.setString(5, filekey);
	ps.setString(6, "Waiting");
	ps.setString(7, acceptby);

	ans = ps.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}
if(ans==1) {
	response.sendRedirect("DoctorFileNotification.jsp?success=1");
} else {
	response.sendRedirect("Error.jsp");
}
%>
</body>
</html>