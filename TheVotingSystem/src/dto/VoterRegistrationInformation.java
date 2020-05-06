package dto;

public class VoterRegistrationInformation {
	private int idVoterRegistrationInformation;
	private int fIdAdminRegInfo;
	private String firstName;
	private String lastName;
	private String fileName;
	private String dob;
	private String eMail;
	private String userId;
	private String password;
	private String address;
	private String po;
	private String postalCode;
	private String state;
	private String registrationDate;
	private String registrationDay;
	private String registrationTime;
	private int approved;
	
	
	public int getIdVoterRegistrationInformation() {
		return idVoterRegistrationInformation;
	}
	public void setIdVoterRegistrationInformation(int idVoterRegistrationInformation) {
		this.idVoterRegistrationInformation = idVoterRegistrationInformation;
	}
	public int getfIdAdminRegInfo() {
		return fIdAdminRegInfo;
	}
	public void setfIdAdminRegInfo(int fIdAdminRegInfo) {
		this.fIdAdminRegInfo = fIdAdminRegInfo;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPo() {
		return po;
	}
	public void setPo(String po) {
		this.po = po;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getRegistrationDay() {
		return registrationDay;
	}
	public void setRegistrationDay(String registrationDay) {
		this.registrationDay = registrationDay;
	}
	public String getRegistrationTime() {
		return registrationTime;
	}
	public void setRegistrationTime(String registrationTime) {
		this.registrationTime = registrationTime;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getApproved() {
		return approved;
	}
	public void setApproved(int approved) {
		this.approved = approved;
	}
}
