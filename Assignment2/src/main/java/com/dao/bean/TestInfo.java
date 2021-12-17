package com.dao.bean;

import java.sql.Date;

public class TestInfo {
	
	
	public String IC, pname, phone, TestType,
	VaccinationInfo,symptoms,AttendCluster,ContactPositive;

	public String getIC() {
		return IC;
	}

	public void setIC(String iC) {
		IC = iC;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTestType() {
		return TestType;
	}

	public void setTestType(String testType) {
		this.TestType = testType;
	}

	public String getVaccinationInfo() {
		return VaccinationInfo;
	}

	public void setVaccinationInfo(String vaccinationInfo) {
		this.VaccinationInfo = vaccinationInfo;
	}

	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public String getContactPositive() {
		return ContactPositive;
	}

	public void setContactPositive(String contactPositive) {
		this.ContactPositive = contactPositive;
	}

	public String getAttendCluster() {
		return AttendCluster;
	}

	public void setAttendCluster(String attendCluster) {
		AttendCluster = attendCluster;
	}
		
}