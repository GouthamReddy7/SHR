<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.SecureHealth.Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>PatientFile Notification</title>
<style>
html,
body {
	height: 100%;
}

body {
	margin: 0;
	background: #1D4350;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #A43931, #1D4350);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #A43931, #1D4350); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: fixed;
	top: 25%;
	left: 50%;
	transform: translate(-50%, -50%);
	content: "Scroll vertically >"
}

table {
	width: 1200px;
	border-collapse: collapse;
	/*overflow-x: scroll;*/
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
	margin-top:20px;
	margin-left:-30px;
	display: block;
	
}

th,
td {
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: #fff;
	 min-width: 200px;
	
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
		 overflow-y: scroll;
   		 overflow-x: hidden;
   		 height: 200px;
   		 
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
thead,
tbody {
  display: block;
}
</style>
</head>
<body>
<div class="container" >

<div class="navbar-header animated fadeInUp">
            <a class="btn btn-danger mt-2" href="PatientHome.jsp" style="margin-left: -28px;">BACK</a>
        </div>
          <c:if test="${param.success==1}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>Success!</strong>File Request Sent Successfully <a
				href="Home.jsp"></a>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</c:if> 
	<table>
		<thead>
			<tr>
				<th>S.No</th>
				<th>From</th>
				<th>Filename</th>
				<th>Size</th>
				<th>Action</th>
				<th>Status</th>
				
				
			</tr>
		</thead>
		 <%
		 String user = session.getAttribute("patientlogin").toString();
		 session.setAttribute("patientlogin", user);
		 
		 String doc = session.getAttribute("doctorlogin").toString(); 
		   
						
							try {
								
								
								Connection con1 = null;

								con1 = DatabaseConnection.createConnection();
								PreparedStatement ps1 = con1.prepareStatement("select * from patientuploadfile where username='"+doc+"'");

								ResultSet rs = ps1.executeQuery();
								
					
								
						%>
		<tbody>
		<%
							
							int ii = 1;
								while (rs.next())
								{
							
									 
							%>
			<tr>
				<td><%=ii%></td>
				<td><%=rs.getString("username") %></td>
				<td><%=rs.getString("filename") %></td>
				<td><%=rs.getString("size") %></td>
				
				 <td>
								<a class="btn btn-primary btn-sm" href="PatientFileRequest.jsp?fname=<%=rs.getString("filename") %>&frequestby=<%=user.toLowerCase()%>&fsize=<%=rs.getString("size") %>">SendRequest</a>
								 </td>
				 <td>
								<a class="btn btn-primary btn-sm" href="UploadPatientFile.jsp">Reply</a>
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
<script type="text/javascript">
$("table").on("scroll", function () {
    $("table > *").width($("table").width() + $("table").scrollLeft());
});
</script>
</body>
</html>