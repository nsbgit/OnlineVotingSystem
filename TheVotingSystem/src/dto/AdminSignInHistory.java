package dto;

public class AdminSignInHistory {
	private String id;
	private String fId;
	private String signInDate;
	private String signInDay;
	private String signInTime;
	private String signOutDate;
	private String signOutDay;
	private String signOutTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public String getSignInDate() {
		return signInDate;
	}
	public void setSignInDate(String signInDate) {
		this.signInDate = signInDate;
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
	public String getSignOutTime() {
		return signOutTime;
	}
	public void setSignOutTime(String signOutTime) {
		this.signOutTime = signOutTime;
	}
	public String getSignInDay() {
		return signInDay;
	}
	public void setSignInDay(String signInDay) {
		this.signInDay = signInDay;
	}
	public String getSignOutDay() {
		return signOutDay;
	}
	public void setSignOutDay(String signOutDay) {
		this.signOutDay = signOutDay;
	}
	
}
