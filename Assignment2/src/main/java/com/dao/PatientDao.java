package com.dao;

import com.dao.bean.Patient;
import com.dao.bean.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PatientDao {
	public static Connection getConnection() {
		
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/assignment2", "root", "...iuryl0jason");
		}catch (Exception e) {
			System.out.println(e);
		}	
		return con;
	}
	
	public static int save(Patient p)
	{
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("insert into patient (IC, pname, gender, birthday, number, date) values (?,?,?,?,?,?)");
			pst.setString(1, p.getIC());
			pst.setString(2, p.getPname());
			pst.setString(3, p.getGender());
			pst.setString(4, p.getBirthday());
			pst.setString(5, p.getNumber());
			pst.setDate(6,new java.sql.Date(System.currentTimeMillis()) );
			
			status = pst.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int update(Patient p)
	{
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("update patient set IC=?, pname=?, gender=?, birthday=?, number=?, date=?, prescriptions=? where pid=?");
			pst.setString(1, p.getIC());
			pst.setString(2, p.getPname());
			pst.setString(3, p.getGender());
			pst.setString(4, p.getBirthday());
			pst.setString(5, p.getNumber());
			pst.setString(6, p.getDate());
			pst.setString(7, p.getPrescriptions());
			pst.setInt(8, p.getPid());
			
			status = pst.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static int delete(Patient p) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("delete from patient where pid=?");
			pst.setInt(1, p.getPid());
			
			status = pst.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return status;	
	}
	
	public static List<Patient> getAllPatients(){
		List<Patient> list = new ArrayList<Patient>();
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from patient");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Patient p = new Patient();
				p.setPid(rs.getInt("pid"));
				p.setIC(rs.getString("IC"));
				p.setPname(rs.getString("pname"));
				p.setGender(rs.getString("gender"));
				p.setBirthday(rs.getString("birthday"));
				p.setDate(rs.getString("date"));
				p.setPrescriptions(rs.getString("prescriptions"));
				p.setNumber(rs.getString("number"));
				
				list.add(p);
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static Patient getPatientByIC(String IC)
	{
		Patient p = null;
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from patient where IC=?");
			pst.setString(1, IC);
			ResultSet rs = pst.executeQuery();
			p = new Patient();
			while(rs.next()) {
				p.setPid(rs.getInt("pid"));
				p.setIC(rs.getString("IC"));
				p.setPname(rs.getString("pname"));
				p.setGender(rs.getString("gender"));
				p.setBirthday(rs.getString("birthday"));
				p.setDate(rs.getString("date"));
				p.setPrescriptions(rs.getString("prescriptions"));
				p.setNumber(rs.getString("number"));
			}
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
	
	public static Patient getPatientByPatientId(int pid)
	{
		Patient p = null;
		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select * from patient where pid=?");
			pst.setInt(1, pid);
			ResultSet rs = pst.executeQuery();
			p = new Patient();
			while(rs.next()) {
				p.setPid(rs.getInt("pid"));
				p.setIC(rs.getString("IC"));
				p.setPname(rs.getString("pname"));
				p.setGender(rs.getString("gender"));
				p.setBirthday(rs.getString("birthday"));
				p.setDate(rs.getString("date"));
				p.setPrescriptions(rs.getString("prescriptions"));
				p.setNumber(rs.getString("number"));
			}
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
}



