package dto;

public class Vote {
	private int idVote;
	private int fIdAdminRegInfo;
	private int fIdVoterInfo;
	private int fIdVotingSchedule;
	private int fIdVotingCandidate;
	private String currentDate;
	private String currentTime;
	public int getIdVote() {
		return idVote;
	}
	public void setIdVote(int idVote) {
		this.idVote = idVote;
	}
	public int getfIdAdminRegInfo() {
		return fIdAdminRegInfo;
	}
	public void setfIdAdminRegInfo(int fIdAdminRegInfo) {
		this.fIdAdminRegInfo = fIdAdminRegInfo;
	}
	public int getfIdVoterInfo() {
		return fIdVoterInfo;
	}
	public void setfIdVoterInfo(int fIdVoterInfo) {
		this.fIdVoterInfo = fIdVoterInfo;
	}
	public int getfIdVotingSchedule() {
		return fIdVotingSchedule;
	}
	public void setfIdVotingSchedule(int fIdVotingSchedule) {
		this.fIdVotingSchedule = fIdVotingSchedule;
	}
	public String getCurrentDate() {
		return currentDate;
	}
	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}
	public String getCurrentTime() {
		return currentTime;
	}
	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}
	public int getfIdVotingCandidate() {
		return fIdVotingCandidate;
	}
	public void setfIdVotingCandidate(int fIdVotingCandidate) {
		this.fIdVotingCandidate = fIdVotingCandidate;
	}
	
	
}
