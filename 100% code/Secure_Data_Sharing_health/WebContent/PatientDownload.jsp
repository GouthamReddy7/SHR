<%@page import="pcloud.PCloudAPI"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User | Downloads</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="css/style.css">

<style type="text/css">


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

	background: #007991;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #78ffd6, #007991);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #78ffd6, #007991); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

}



</style>

</head>
<body>
<%

String DataUser=session.getAttribute("patientlogin").toString();
session.setAttribute("patientlogin", DataUser);

%>


<div class="container">
	<div class="row">
		
        
        <div class="col-md-12">
        <div class="navbar-header animated fadeInUp">
            <a class="btn btn-danger mt-2" href="PatientHome.jsp">BACK</a>
        </div><br> <br> 
        <h4>Requested Files to Download <%=DataUser.toUpperCase()%></h4> <br> 
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <tr>
                 
                  	<th>Sr.No</th>
                    <th>File Name</th>
                    <th>Status</th>
                    <th>AcceptBy</th>
                    <th>Secret Key</th>
                    <th>Action</th>
                                                                 
                       </tr>
                   </thead>
                   					
	
    <tbody>
    
  <%                           
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/securedatahealth","root","root");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from filerequest where requestby='"+DataUser+"'");
    %>
        <%
        int i=0;
        if(i<1)
        {
        while(rs.next())
        {
         //if(!rs.getString("filekey").equals(""))
               {
    
               %>
    
    <tr>
    <td><%=i+1%></td>
   
    <td><%=rs.getString("filename") %></td>
    <td><%=rs.getString("status") %></td>
  
    <td><%=rs.getString("acceptby") %></td>
        <td><%=rs.getString("filekey") %></td>
    <td><a class="btn btn-primary btn-sm" href="Download?Filename=<%=rs.getString("filename")%>&&filekey=<%=rs.getString("filekey")%>">Download</a></td>
   </tr>
    <%
               
               }
               %>
 
            <%
            i++;
        }
        }%>
   
    </tbody>
        
</table>
<%
    
    
}
    catch(Exception e){
    	  e.printStackTrace();
    	}
    %>
               
            </div>
            
        </div>
	</div>
</div>
  














<!-- custom js file link  -->
<script src="js/script.js"></script>


    
<script type="text/javascript" src="Table/table.js"></script>
<script>
$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});

if(test=${param.success==0}){
	console.log("success");
	swal("Oops!", "Wait Util the Secret Key Update!", "error");
	
}
</script>
</body>
</body>
</html>