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
String content = request.getParameter("fcontent");

String encrypt = request.getParameter("fencrypt");
String patientlogin = session.getAttribute("patientlogin").toString();

String doctor = "" ;
System.out.println("Data request"+filename+"-"+filesize+"-"+patientlogin);
System.out.println("Encontent"+encrypt);


try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/securedatahealth","root","root");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from patientuploadfile where filename = '"+filename+"' and size = '"+filesize+"' and content = '"+content+"'");
	while(rs.next()) {
		doctor = rs.getString("username");
	}
}catch(Exception e) {
	
}
System.out.println(doctor);

int ans=0;
String filekey = "autoupdate";
String acceptby = "autoupdate";
try {
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/securedatahealth","root","root");
	PreparedStatement ps = con.prepareStatement("INSERT INTO filerequest(fileowner,filename,filesize,requestby,filekey,status,acceptby,content,encrypt) VALUES(?,?,?,?,?,?,?,?,?)");
	
	ps.setString(1, doctor);
	ps.setString(2, filename);
	ps.setString(3, filesize);
	ps.setString(4, requestby);
	ps.setString(5, filekey);
	ps.setString(6, "Waiting");
	ps.setString(7, acceptby);
	ps.setString(8, content);
	ps.setString(9, encrypt);
	ans = ps.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}
if(ans!=0) {
	response.sendRedirect("PatientHomeSearch.jsp?success=1");
} else {
	response.sendRedirect("Error.jsp");
}
%>
</body>
</html>