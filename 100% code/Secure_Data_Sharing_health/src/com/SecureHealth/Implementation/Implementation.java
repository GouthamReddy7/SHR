package com.SecureHealth.Implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.SecureHealth.Bean.RegisterBean;
import com.SecureHealth.Bean.UploadBean;
import com.SecureHealth.Database.DatabaseConnection;
import com.SecureHealth.Interface.Interface;

public class Implementation implements Interface {

	Connection con;
	@Override
	public int doctoreg(RegisterBean rb) {
		int result = 0;
		try{
			
			con = DatabaseConnection.createConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO doctorregister VALUES(?,?,?,?,?,?)");
			ps.setInt(1, rb.getId());
			ps.setString(2, rb.getName());
			ps.setString(3, rb.getEmail());
			ps.setString(4, rb.getPassword());
			ps.setString(5, rb.getConfirmpassword());
			ps.setString(6, rb.getCity());
			
			result=ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return result;
	}
	@Override
	public int doctorLogin(String email, String password) {
		int result = 0;
		con=DatabaseConnection.createConnection();


		try {

			PreparedStatement ps = con.prepareStatement("SELECT * FROM doctorregister WHERE email='"+email+"' and password='"+password+"'");
			ResultSet rs = ps.executeQuery();

			System.out.println("email"+email);
			System.out.println("Password"+password);
			while(rs.next()){
				String emailch = rs.getString("email");     
				String passwordch = rs.getString("password");


				if(email.equals(emailch)&&password.equals(passwordch)){
					result = 1;
				}

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return result;
	}
	@Override
	public int userreg(RegisterBean rb) {
		int result = 0;
		try{
			
			con = DatabaseConnection.createConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO patientregister VALUES(?,?,?,?,?,?,?)");
			ps.setInt(1, rb.getId());
			ps.setString(2, rb.getName());	
			ps.setString(3, rb.getUsername());
			ps.setString(4, rb.getPassword());
			ps.setString(5, rb.getConfirmpassword());
			ps.setString(6, rb.getEmail());
			ps.setString(7, rb.getCity());
			
			
			result=ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return result;
	}
	@Override
	public int patientLogin(String email, String password) {
		int result = 0;
		con=DatabaseConnection.createConnection();


		try {

			PreparedStatement ps = con.prepareStatement("SELECT * FROM patientregister WHERE email='"+email+"' and password='"+password+"'");
			ResultSet rs = ps.executeQuery();

			System.out.println("email"+email);
			System.out.println("Password"+password);
			while(rs.next()){
				String emailch = rs.getString("email");     
				String passwordch = rs.getString("password");


				if(email.equals(emailch)&&password.equals(passwordch)){
					result = 1;
				}

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return result;
	}
	@Override
	public int fileupload(UploadBean bean) {
		int ans = 0;
		con  = DatabaseConnection.createConnection();
		try{
			PreparedStatement ps = con.prepareStatement("INSERT INTO patientuploadfile VALUES (?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, bean.getUsername());
			ps.setString(2, bean.getTo());
			ps.setString(3, bean.getFilename());
			ps.setString(4, bean.getType());
			ps.setString(5, bean.getPath());
			ps.setString(6, bean.getContent());
			ps.setString(7, bean.getSize());
			ps.setString(8, bean.getKey());
			ps.setString(9, bean.getEncrypt());
			ps.setString(10, bean.getDecrypt());
			ans = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ans;
	}
	@Override
	public String getpublickey(String filename) {
		int i = 0;
		String publickey = null;
		try{
			con = DatabaseConnection.createConnection();
			PreparedStatement pt = con.prepareStatement("SELECT `key` FROM patientuploadfile where filename = '"+filename+"'");
			ResultSet rs = pt.executeQuery();
			
			while(rs.next()) {
				publickey = rs.getString(1);
				System.out.println("key is :" +publickey);
			}
			System.out.println("xc"+i);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return publickey;
	}
	
}
