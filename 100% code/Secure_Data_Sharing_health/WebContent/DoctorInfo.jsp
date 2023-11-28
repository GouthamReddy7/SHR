<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.SecureHealth.Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<title>Doctor Info</title>
<style>
html,
body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 1200px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
	margin-top:-250px;
	margin-left:-30px
}

th,
td {
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: #fff;
}

th {
	text-align: left;
}

thead {
	th {
		background-color: #55608f;
	}
}

tbody {
	tr {
		&:hover {
			background-color: rgba(255,255,255,0.3);
		}
	}
	td {
		position: relative;
		&:hover {
			&:before {
				content: "";
				position: absolute;
				left: 0;
				right: 0;
				top: -9999px;
				bottom: -9999px;
				background-color: rgba(255,255,255,0.2);
				z-index: -1;
			}
		}
	}
}
</style>
</head>
<body>
<div class="container">
	<table>
		<thead>
			<tr>
				<th>S.No</th>
				<th>DoctorName</th>
				<th>Qualification</th>
				<th>E-mail</th>
				<th>Specialization</th>
				<th>Description</th>
				<th>Action</th>
				
			</tr>
		</thead>
		 <%
						
							try {
								
								
								Connection con1 = null;

								con1 = DatabaseConnection.createConnection();
								PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM `doctorinfo`");

								ResultSet rs = ps1.executeQuery();
								
								String doctorname = "";
								
						%>
		<tbody>
		<%
							
							int ii = 1;
								while (rs.next())
								{
									
									doctorname = rs.getString("name");
							%>
			<tr>
				<td><%=ii%></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("qualification") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("specialization") %></td>
				<td><%=rs.getString("description") %></td>
				 <td>
								<a class="btn btn-success btn-sm" href="UploadPatientFile.jsp">Select</a>
								 </td>
			</tr>
			<%
							ii++;
								}
							%>
							
							<%
						con1.close();
					%><br>
					<%
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
		</tbody>
	</table>
</div>
</body>
</html>