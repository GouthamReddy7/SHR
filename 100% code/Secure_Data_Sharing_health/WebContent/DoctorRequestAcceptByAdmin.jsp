<%@page import="com.SecureHealth.Database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Admin Accept Doctor Request</title>

<style>



h2{
	text-align: center; 
	color: linear-gradient(to right, #90AFC5, #336B87, #2A3132,#763626);
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

	/*background-image: linear-gradient(to right, #90AFC5, #336B87, #2A3132,#763626);*/
	background: #1f4037;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #99f2c8, #1f4037);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #99f2c8, #1f4037); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	

}




</style>
</head>
<body>
<%
String user=session.getAttribute("patientlogin").toString();
//session.setAttribute("doctors", doctors);
System.out.println("The user name is: "+user);
%>

<nav class="main-navigation">
       
       

    </nav>
    <c:if test="${param.success==1}">
					
				</c:if>
<div class="container ">

		<div class="row">
			<div class="col-md-12">
			<div class="navbar-header animated fadeInUp">
            <a class="btn btn-danger mt-2" href="AdminHome.jsp">BACK</a>
        </div>
				<h2 ><span>Authenticate file</span></h2>
				<br>
				<div class="table-responsive">
					<table id="myTable" class="table table-bordred table-striped">
						<thead>
							<tr class="strikeout">
								<th>Sr.No</th>
								<th>File Name</th>
								<th>File Size</th>
								<th>Request By</th>
								<th>Accept By</th>
								<th>Status</th>
								<th>Action</th>
							
								
								
							</tr>
						</thead>

						<%
						
						
							try {
								Connection con1 = null;

								con1 = DatabaseConnection.createConnection();
								PreparedStatement ps1 = con1.prepareStatement("select * from filerequest where fileowner='"+user+"' and status='Waiting'");

								ResultSet rs = ps1.executeQuery();
								
								
						%>




						<tbody>
							<%
							
							int ii = 1;
								while (rs.next()) {
									
							%>

							<tr>
								<td><%=ii%></td>
								<td><%=rs.getString("filename")%></td>
								<td><%=rs.getString("filesize")%></td>
								<td><%=rs.getString("requestby")%></td>
								<td><%=rs.getString("acceptby")%></td>
								<td><%=rs.getString("status")%></td>
								<td><a href="AdminDoctorFileAccept.jsp?ffilename=<%=rs.getString("filename")%>&reqby=<%=rs.getString("requestby") %>" class="btn btn-success btn-sm">Accept</a></td>
								
							</tr>

							<%
							ii++;
								}
							%>

						</tbody>

					</table>

					<%
						con1.close();
					%><br>
					<%
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</div>
			</div>
		</div>
	</div>
<script>



		if(test=${param.success==1}){
			console.log("success");
			swal("Accepted!", "Request Has Been Accepted!", "success");
			
		}


	
	

	</script>
</body>
</html>