<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor | Register</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" href="css1/style.css">
</head>
<body style=" min-height: 100vh; background:linear-gradient(to bottom, #000428, #004683);">
<br><br><br>
<div class="wrapper">
    <form action="DoctorRegisterServlet" method="post">
        <div class="h5 font-weight-bold text-center mb-3">Registration</div>
        <div class="form-group d-flex align-items-center">
            <div class="icon"><span class="far fa-user"></span></div> <input autocomplete="off" type="text" name="name"  class="form-control" placeholder="Name" required>
        </div><br>
        <div class="form-group d-flex align-items-center">
            <div class="icon"><span class="far fa-envelope"></span></div> <input autocomplete="off" type="email" name="email" class="form-control" placeholder="Email" required>
        </div><br>  
        <div class="form-group d-flex align-items-center">
            <div class="icon"><span class="fas fa-key"></span></div> <input autocomplete="off" type="password" name="password" class="form-control" placeholder="Password" required>
            <div class="icon btn"><span class="fas fa-eye-slash"></span></div>
        </div><br>
        <div class="form-group d-flex align-items-center">
            <div class="icon"><span class="fas fa-key"></span></div> <input autocomplete="off" type="password" name="confirmPassword" class="form-control" placeholder="ConfirmPassword" required>
            <div class="icon btn"><span class="fas fa-eye-slash"></span></div>
        </div><br>
         <div class="form-group d-flex align-items-center">
            <div class="icon"><span class="fas fa-map-marker-alt"></span></div> <input autocomplete="off" type="text" name="city" class="form-control" placeholder="City" required>
        </div><br>
       <!--  <div class="mb-2"> <label class="option">Remember me <input type="checkbox" checked> <span class="checkmark"></span> </label> </div> -->
        <button class="btn btn-primary mb-3" type="submit">Signup</button>
        <!--  <div class="terms mb-2"> By clicking "Signup", you acknowledge that you have read the <a href="#">Privacy Policy</a> and agree to the <a href="#">Terms of Service</a>. </div>
        <div class="connect border-bottom mt-4 mb-4"></div>
        <ul class="p-0 social-links">-->
            <!--<li><a href="#"><span class="fab fa-facebook-f"></span></a></li>
            <li><a href="#"><span class="fab fa-google"></span></a></li>
            <li><a href="#"><span class="fab fa-github"></span></a></li>
        </ul>-->
    </form>
</div>
</body>  

</html>