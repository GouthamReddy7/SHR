package com.SecureHealth.Interface;

import com.SecureHealth.Bean.RegisterBean;
import com.SecureHealth.Bean.UploadBean;

public interface Interface {

	public int doctoreg(RegisterBean rb);
	
	public int doctorLogin(String email, String password);
	
	public int userreg(RegisterBean rb);
	
	public int patientLogin(String email, String password);

	public int fileupload(UploadBean bean);

	public String getpublickey(String filename);
	
}
