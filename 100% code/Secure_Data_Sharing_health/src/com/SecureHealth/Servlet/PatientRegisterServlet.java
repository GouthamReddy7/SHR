package com.SecureHealth.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SecureHealth.Bean.RegisterBean;
import com.SecureHealth.Implementation.Implementation;
import com.SecureHealth.Interface.Interface;

/**
 * Servlet implementation class PatientRegisterServlet
 */
@WebServlet("/PatientRegisterServlet")
public class PatientRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		
		System.out.println(name+" "+username+" "+password+" "+confirmPassword+" "+email+" "+city);
		
	    if(password.equals(confirmPassword)){
	    	RegisterBean user = new RegisterBean();
	    	user.setName(name);
	    	user.setUsername(username);
	    	user.setPassword(password);
	    	user.setConfirmpassword(confirmPassword);
	    	user.setEmail(email);
	    	user.setCity(city);
	    	
	    	Interface inter = new Implementation();
	    	
	    	int t = inter.userreg(user);
	    	if(t!=0){
	    		response.sendRedirect("PatientRegister.jsp");
	    	}
	    	else{
	    		response.sendRedirect("error.jsp");
	    	}
	    	
	    	
	    }
		
	}

}
