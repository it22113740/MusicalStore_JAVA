package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Staff;

public class StaffDao {
	private Connection con;
	private String query;
	private PreparedStatement  pst;
	private ResultSet rs;
	public StaffDao(Connection con) {
		this.con = con;
	}
	
	public List<Staff> getAllStaff(){
		List<Staff> staff = new ArrayList<Staff>();
		try {
			query = "select * from staff";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Staff row = new Staff();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setDepartment(rs.getString("department"));
				row.setContactNumber(rs.getString("contactNumber"));
				
				staff.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return staff;
	}

}
