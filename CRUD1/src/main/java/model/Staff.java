package model;

public class Staff {
	private int id;
	private String name;
	private String department;
	private String contactNumber;
	
	
	public Staff() {
	}

	public Staff(int id, String name, String department, String contactNumber) {
		this.id = id;
		this.name = name;
		this.department = department;
		this.contactNumber = contactNumber;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	@Override
	public String toString() {
		return "Staff [id=" + id + ", name=" + name + ", department=" + department + ", contactNumber=" + contactNumber
				+ "]";
	}
	
	

}
