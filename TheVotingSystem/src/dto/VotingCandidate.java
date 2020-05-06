package dto;

public class VotingCandidate {
	private int idVotingCandidate;
	private int fidVotingSchedule;
	private String[] partyNameList;
	private String[] partyLeaderList;
	private int voteCount;
	
	
	public int getIdVotingCandidate() {
		return idVotingCandidate;
	}
	public void setIdVotingCandidate(int idVotingCandidate) {
		this.idVotingCandidate = idVotingCandidate;
	}
	public int getFidVotingSchedule() {
		return fidVotingSchedule;
	}
	public void setFidVotingSchedule(int fidVotingSchedule) {
		this.fidVotingSchedule = fidVotingSchedule;
	}
	public String[] getPartyNameList() {
		return partyNameList;
	}
	public void setPartyNameList(String[] partyNameList) {
		this.partyNameList = partyNameList;
	}
	public String[] getPartyLeaderList() {
		return partyLeaderList;
	}
	public void setPartyLeaderList(String[] partyLeaderList) {
		this.partyLeaderList = partyLeaderList;
	}
	public int getVoteCount() {
		return voteCount;
	}
	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}
}
