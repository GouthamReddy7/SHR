package com.SecureHealth.Database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	
	static Connection con;
	public static Connection createConnection() {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/securedatahealth","root", "root");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
	}
	

}
