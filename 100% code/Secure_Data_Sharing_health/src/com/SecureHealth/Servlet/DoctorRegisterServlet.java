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
 * Servlet implementation class DoctorRegisterServlet
 */
@WebServlet("/DoctorRegisterServlet")
public class DoctorRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorRegisterServlet() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String city = request.getParameter("city");
		
		System.out.println(name+" "+email+" "+password+" "+confirmPassword+" "+city);
		
		if(password.equals(confirmPassword)){
			RegisterBean doc = new RegisterBean();
			doc.setName(name);
			doc.setEmail(email);
			doc.setPassword(password);
			doc.setConfirmpassword(confirmPassword);
			doc.setCity(city);
			
			Interface inter = new Implementation();
			
			int t = inter.doctoreg(doc);
			if(t!=0){
				response.sendRedirect("DoctorLogin.jsp");
			}
			else{
				response.sendRedirect("error.jsp");
			}
			
			
		}
		
		
		
	}

}
