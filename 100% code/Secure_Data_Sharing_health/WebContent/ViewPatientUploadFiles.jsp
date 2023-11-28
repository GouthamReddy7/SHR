<%@page import="com.SecureHealth.Database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.time.LocalDateTime" %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<title>View PatientUpload file List</title>

<link rel="stylesheet" href="css/navbar.css">

<style>



h2{
	text-align: center; 
	color: darkviolet;
    font-family: cursive;
    font-weight: bolder;
    margin-top: 20px;

}


img {
	height: 50em;
	position: absolute;
	width: 100vw;
	filter: blur(5px);
	-webkit-filter: blur(5px);
}

.col-md-12 {

background-color: white;
margin-top: 50px;
border-radius: 20px;


}

.table-responsive{

color: black;
    font-family: cursive;
    font-weight: bold;

}

body{

	background-image: linear-gradient(to right, #0000FF, #F7941D, #8DC63F);

}




</style>
</head>
<body>
<%
String user = session.getAttribute("patientlogin").toString();
session.setAttribute("patientlogin", user);
String doc = session.getAttribute("doctorlogin").toString();

String keyword=request.getParameter("contact_name");
System.out.println(keyword);

int flag=0;
String ftime="";
String ttime="";

%>
<nav class="main-navigation">
       
       

    </nav>
<div class="container ">

		<div class="row">
			<div class="col-md-12">
			<div class="navbar-header animated fadeInUp">
            <a class="btn btn-danger mt-2" href="PatientHome.jsp">BACK</a>
        </div>
				<h2 ><span>Patient Uploaded Files</span></h2>
				<br>
				<div class="table-responsive">
				<%                           
                                 try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/securedatahealth","root","root");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from patientuploadfile where content like '%"+keyword+"%'");
        
        if(flag==0)
        {
    %>
					<table id="myTable" class="table table-bordred table-striped">
						<thead>
							<tr class="strikeout">
								<th>SrNo</th>
								<th>Filename</th>
								<th>Type</th>													
								<th>Size</th>
								<th>Action</th>
								<th>Status</th>							
								
							</tr>
						</thead>
						<tbody>
							<%
        }
        int ii=1;
        while(rs.next())
        {
        	
        	if(flag==0)
        	{
        	
            %>

							<tr>
								<td><%=ii%></td>
								<td><%=rs.getString("filename")%></td>
								<td><%=rs.getString("type")%></td>							
								<td><%=rs.getString("size")%></td>
								 <td>
								<a class="btn btn-primary btn-sm" href="PatientFileRequest.jsp?fname=<%=rs.getString("filename") %>&frequestby=<%=doc.toLowerCase()%>&fsize=<%=rs.getString("size") %>&fcontent=<%=rs.getString("content") %>  &fencrypt=<%=rs.getString("encrypt") %>">SendRequest</a>
								 </td>
							</tr>
		<%
            ii++;
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();  
            System.out.println(dtf.format(now));  
            PreparedStatement ps=con.prepareStatement("INSERT INTO keywordsearch(username,keyword,filename,searcheddatetime,status) VALUES('"+user+"','"+keyword+"','"+rs.getString("filename")+"','"+dtf.format(now)+"','active')"); 
            ps.executeUpdate();
        	}
        	else
        		
        	{
        		%>
       				<p> Sorry Enter Keyword is Blocked!!!!! from <%=ftime %> To <%=ttime %></p>
        		
        		
        		<%
        		
        	}
            
        }%>

						</tbody>

					</table>

					 <%
					 	}
   						 catch(Exception e){
       					 out.print(e.getMessage());%><br><%
   					 }

   					 %>  
				</div>
			</div>
		</div>
	</div>

</body>
</html>