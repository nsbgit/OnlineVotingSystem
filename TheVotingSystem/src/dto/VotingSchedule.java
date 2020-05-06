package dto;

public class VotingSchedule {
	private int idVotingSchedule;
	private int fidAdminRegistrationInformation;
	private String electionDate;
	private String startTime;
	private String endTime;
	private String voteName;
	
	public int getIdVotingSchedule() {
		return idVotingSchedule;
	}
	public void setIdVotingSchedule(int idVotingSchedule) {
		this.idVotingSchedule = idVotingSchedule;
	}
	public int getFidAdminRegistrationInformation() {
		return fidAdminRegistrationInformation;
	}
	public void setFidAdminRegistrationInformation(
			int fidAdminRegistrationInformation) {
		this.fidAdminRegistrationInformation = fidAdminRegistrationInformation;
	}
	public String getElectionDate() {
		return electionDate;
	}
	public void setElectionDate(String electionDate) {
		this.electionDate = electionDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getVoteName() {
		return voteName;
	}
	public void setVoteName(String voteName) {
		this.voteName = voteName;
	}
}
