<%@page import="com.SecureHealth.Database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Admin Hash Data</title>

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
<nav class="main-navigation">
       
       

    </nav>
<div class="container ">

		<div class="row">
			<div class="col-md-12">
			<div class="navbar-header animated fadeInUp">
            <a class="btn btn-danger mt-2" href="AdminHome.jsp">BACK</a>
        </div>
				<h2 ><span>Hash data</span></h2>
				<br>
				<div class="table-responsive">
					<table id="myTable" class="table table-bordred table-striped">
						<thead>
							<tr class="strikeout">
								<th>SrNo</th>
							    <th>Requested</th>
								<th>Block1</th>
             					<th>Block2</th>
             					<th>Block3</th>
              					<th>Block4</th>
                   				<th>Block5</th>
                   			 	<th>Block6</th>
							
								
								
							</tr>
						</thead>

						<%
						
						
							try {
								Connection con1 = null;

								con1 = DatabaseConnection.createConnection();
								PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM `blockchain`");

								ResultSet rs = ps1.executeQuery();
								
								
						%>




						<tbody>
							<%
							
							int ii = 1;
								while (rs.next()) {
							%>

							<tr>
								<td><%=ii%></td>
								<td><%=rs.getString("requestby") %></td>
    							<td><%=rs.getString("block1") %></td>
    							<td><%=rs.getString("block2") %></td>
    							<td><%=rs.getString("block3") %></td>
    							<td><%=rs.getString("block4") %></td>
    							<td><%=rs.getString("block5") %></td>
    							<td><%=rs.getString("block6") %></td>
								
								
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

</body>
</html>