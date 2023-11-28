package com.SecureHealth.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SecureHealth.Database.DatabaseConnection;

/**
 * Servlet implementation class DoctorInfoServlet
 */
@WebServlet("/DoctorInfoServlet")
public class DoctorInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorInfoServlet() {
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
		String qualification = request.getParameter("qualification");
		String email = request.getParameter("email");
		String specialization = request.getParameter("specialization");
		String description = request.getParameter("description");
		
		
		System.out.println(name+" "+qualification+" "+email+" "+specialization+" "+description);
		
		
		try{
			
			Connection con = DatabaseConnection.createConnection();
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO doctorinfo VALUES(?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, qualification);
			ps.setString(3, email);
			ps.setString(4, specialization);
			ps.setString(5, description);
			
			int result = ps.executeUpdate();
			
			if(result!=0){
				response.sendRedirect("DoctorData.jsp?success=1");
			}

		}catch(Exception e){
			
		}
	}

}
