package dto;

public class VoterSignInHistory {
	private int idVoterSignInHistory;
	private int fIdVoterRegistrationInformation;
	private String signInDate;
	private String signInDay;
	private String signInTime;
	private String signOutDate;
	private String signOutDay;
	private String signOutTime;
	
	
	public int getIdVoterSignInHistory() {
		return idVoterSignInHistory;
	}
	public void setIdVoterSignInHistory(int idVoterSignInHistory) {
		this.idVoterSignInHistory = idVoterSignInHistory;
	}
	public int getfIdVoterRegistrationInformation() {
		return fIdVoterRegistrationInformation;
	}
	public void setfIdVoterRegistrationInformation(
			int fIdVoterRegistrationInformation) {
		this.fIdVoterRegistrationInformation = fIdVoterRegistrationInformation;
	}
	public String getSignInDate() {
		return signInDate;
	}
	public void setSignInDate(String signInDate) {
		this.signInDate = signInDate;
	}
	public String getSignInDay() {
		return signInDay;
	}
	public void setSignInDay(String signInDay) {
		this.signInDay = signInDay;
	}
	public String getSignInTime() {
		return signInTime;
	}
	public void setSignInTime(String signInTime) {
		this.signInTime = signInTime;
	}
	public String getSignOutDate() {
		return signOutDate;
	}
	public void setSignOutDate(String signOutDate) {
		this.signOutDate = signOutDate;
	}
	public String getSignOutDay() {
		return signOutDay;
	}
	public void setSignOutDay(String signOutDay) {
		this.signOutDay = signOutDay;
	}
	public String getSignOutTime() {
		return signOutTime;
	}
	public void setSignOutTime(String signOutTime) {
		this.signOutTime = signOutTime;
	}
}
