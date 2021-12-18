package com.dao;

import com.dao.bean.TestInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class TestInfoDao {
	public static Connection getConnection() {
		
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/assignment2", "root", "zxxhh");
		}catch (Exception e) {
			System.out.println(e);
		}	
		return con;
	}
	
	public static int save(TestInfo t, String s)
	{
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into covidinfo (IC, pname, phone, TestType,VaccinationInfo,symptoms,AttendCluster,ContactPositive) values (?,?,?,?,?,?,?,?)");
			pst.setString(1, t.getIC());
			pst.setString(2, t.getPname());
			pst.setString(3, t.getPhone());
			pst.setString(4, t.getTestType());
			pst.setString(5, t.getVaccinationInfo());
			pst.setString(6, s);
			pst.setString(7, t.getAttendCluster());
			pst.setString(8, t.getContactPositive());
			
			status = pst.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int update(TestInfo t, String s)
	{
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update covidinfo set pname=?,phone=?, TestType=?,\r\n"
					+ "	VaccinationInfo=?,symptoms=?,AttendCluster=?,ContactPositive=? where IC=?");
			pst.setString(1, t.getPname());
			pst.setString(2, t.getPhone());
			pst.setString(3, t.getTestType());
			pst.setString(4, t.getVaccinationInfo());
			pst.setString(5, s);
			pst.setString(6, t.getAttendCluster());
			pst.setString(7, t.getContactPositive());
			pst.setString(8, t.getIC());
			
			
			status = pst.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	

	
	public static TestInfo getInfoByIC(String IC)
	{
		TestInfo t = null;
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from covidinfo where IC=?");
			pst.setString(1, IC);
			ResultSet rs = pst.executeQuery();
			t = new TestInfo();
			while(rs.next()) {
				t.setIC(rs.getString("IC"));
				t.setPname(rs.getString("pname"));
				t.setPhone(rs.getString("phone"));
				t.setTestType(rs.getString("TestType"));
				t.setVaccinationInfo(rs.getString("VaccinationInfo"));
				t.setSymptoms(rs.getString("symptoms"));
				t.setAttendCluster(rs.getString("AttendCluster"));
				t.setContactPositive(rs.getString("ContactPositive"));
			}
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return t;
	}
	
}



