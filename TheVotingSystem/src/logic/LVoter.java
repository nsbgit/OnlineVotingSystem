package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.mail.Session;
import javax.servlet.http.HttpSession;
import javax.smartcardio.TerminalFactory;

import dto.AdminRegistrationInformation;
import dto.SignInInfo;
import dto.Vote;
import dto.VoterRegistrationInformation;
import dto.VoterSignInHistory;

public class LVoter {
	public static boolean checkUserIdAvailability(String userId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		boolean flag = false;
		
		
		try {
			connection = DatabaseConnectionOpen.createConnection();
			String sql = "SELECT idVoterRegistrationInformation FROM voter_registration_information WHERE userId=?";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, userId);
			
			resultSet = preparedStatement.executeQuery();
			//columnCount = resultSet.getMetaData().getColumnCount();
			if (resultSet.next()) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return flag;
		
	}

	private String sql;
	private ArrayList arrayList;
	private Iterator iterator;
	private String[] data;
	private SignInInfo signInInfo;
	private Connection connection;
	private PreparedStatement preparedStatement;
	private int databaseUpdateChecker;
	private ResultSet resultSet;
	private boolean isOldPassword;
	
	public SignInInfo getSignInInfo(VoterRegistrationInformation voterRegistrationInformation) {
		sql = "SELECT idVoterRegistrationInformation, userId, password FROM voter_registration_information";
		arrayList = new DatabaseToArrayListConversion().convertToArrayList(sql);
		iterator = arrayList.iterator();
		while (iterator.hasNext()) {
			data = (String[]) iterator.next();
			
			if (data[1].equals(voterRegistrationInformation.getUserId()) && data[2].equals(voterRegistrationInformation.getPassword())) {
				signInInfo = new SignInInfo();
				signInInfo.setId(data[0]);
				signInInfo.setFlagSignInInfo(true);
				break;
			}
		}
		return signInInfo;
	}

	public int insertSignInHistory(VoterSignInHistory voterSignInHistory) {
		
		try {
			connection = null;
			connection = DatabaseConnectionOpen.createConnection();
			
			sql = null;
			sql = "INSERT INTO voter_sign_in_history (fIdVoterRegistrationInformation, signInDate, signInDay, signInTime, signOutDate, signOutDay, signOutTime) VALUES (?, ?, ?, ?, ?, ?, ?)";
			
			preparedStatement = null;
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, "" + voterSignInHistory.getfIdVoterRegistrationInformation());
			preparedStatement.setString(2, voterSignInHistory.getSignInDate());
			preparedStatement.setString(3, voterSignInHistory.getSignInDay());
			preparedStatement.setString(4, voterSignInHistory.getSignInTime());
			preparedStatement.setString(5, voterSignInHistory.getSignOutDate());
			preparedStatement.setString(6, voterSignInHistory.getSignOutDay());
			preparedStatement.setString(7, voterSignInHistory.getSignOutTime());
			
			databaseUpdateChecker = 0;
			databaseUpdateChecker = preparedStatement.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return databaseUpdateChecker;
	}
	
	public int insertVote(Vote vote) {
		try {
			connection = null;
			connection = DatabaseConnectionOpen.createConnection();
			
			sql = null;
			sql = "INSERT INTO vote (fIdAdminRegInfo, fIdVoterInfo, fIdVotingSchedule, fIdVotingCandidate, currentDate, currentTime) VALUES (?, ?, ?, ?, ?, ?)";
			
			preparedStatement = null;
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, "" + vote.getfIdAdminRegInfo());
			preparedStatement.setString(2, "" + vote.getfIdVoterInfo());
			preparedStatement.setString(3, "" + vote.getfIdVotingSchedule());
			preparedStatement.setString(4, "" + vote.getfIdVotingCandidate());
			preparedStatement.setString(5, "" + vote.getCurrentDate());
			preparedStatement.setString(6, "" + vote.getCurrentTime());
			
			databaseUpdateChecker = 0;
			databaseUpdateChecker = preparedStatement.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return databaseUpdateChecker;
		
	}
	
	public ArrayList result() {
		
		sql = null;
		sql = "";
		
		return null;
			
	}
	
	
	public ArrayList fetchSch(String adminId) {
		
		sql = null;
		sql = "SELECT vs.idVotingSchedule, vs.voteName, vs.electionDate FROM voting_schedule vs WHERE     vs.electionDate = curdate() AND curtime() BETWEEN vs.startTime AND vs.endTime and vs.fidAdminRegistrationInformation = " + adminId;
		//sql = "SELECT vs.idVotingSchedule, vs.voteName, vs.electionDate FROM voting_schedule vs WHERE vs.electionDate = curdate() AND curtime() BETWEEN vs.startTime AND vs.endTime";
		
		arrayList = null;
		arrayList = new DatabaseToArrayListConversion().convertToArrayList(sql);
		
		
		return arrayList;
		
	}
	
	
	public ArrayList schName(String adminId, String voterId, String schId) {
		String sql = "SELECT vc.idVotingCandidate, vc.partyName, vc.partyLeader, vs.idVotingSchedule FROM voting_schedule vs, voting_candidate vc WHERE vs.idVotingSchedule = vc.fidVotingSchedule AND vs.electionDate = curdate() AND curtime() BETWEEN vs.startTime AND vs.endTime AND vs.fidAdminRegistrationInformation = " + adminId +" AND vc.fidVotingSchedule = " + schId + " AND vs.idVotingSchedule NOT IN (SELECT fIdVotingSchedule FROM vote WHERE currentDate = curdate() AND fIdVoterInfo =" + voterId + ")";
		//String sql = "SELECT vc.idVotingCandidate, vc.partyName, vc.partyLeader, vs.idVotingSchedule FROM voting_schedule vs, voting_candidate vc WHERE vs.idVotingSchedule = vc.fidVotingSchedule AND vs.electionDate = curdate() AND curtime() BETWEEN vs.startTime AND vs.endTime AND vs.fidAdminRegistrationInformation = " + adminId +" and vs.idVotingSchedule not in(select fIdVotingSchedule FROM vote where currentDate=curdate() and fIdVoterInfo=" + voterId + ")";
		//String sql = "SELECT vc.idVotingCandidate, vc.partyName, vc.partyLeader, vs.idVotingSchedule FROM voting_schedule vs, voting_candidate vc WHERE vs.idVotingSchedule = vc.fidVotingSchedule AND vs.electionDate = curdate() AND curtime() BETWEEN vs.startTime AND vs.endTime AND vs.fidAdminRegistrationInformation = " + adminId +" and vc.fidVotingSchedule = " + schId;
		//String sql = "SELECT vc.idVotingCandidate, vc.partyName, vc.partyLeader FROM voting_schedule vs, voting_candidate vc WHERE vs.idVotingSchedule = vc.fidVotingSchedule AND vs.electionDate = curdate() AND curtime() BETWEEN vs.startTime AND vs.endTime";
		ArrayList ar = new DatabaseToArrayListConversion().convertToArrayList(sql);
		
		
		return ar;
		
	}

	public ArrayList calculateResult(String schResultId) {
		String sql = "SELECT tab1.partyName, tab1.partyLeader, ifnull(tab2.`count(fIdVotingCandidate)`,0) FROM (SELECT vc.partyName, vc.partyLeader, vc.idVotingCandidate FROM voting_schedule vs INNER JOIN voting_candidate vc ON vs.idVotingSchedule = vc.fidVotingSchedule WHERE vs.idVotingSchedule = " + schResultId + ") AS tab1 LEFT OUTER JOIN (SELECT fIdVotingCandidate, count(fIdVotingCandidate) FROM vote WHERE fIdVotingSchedule = " + schResultId + " GROUP BY fIdVotingCandidate) AS tab2 ON tab1.idVotingCandidate = tab2.fIdVotingCandidate order by tab2.`count(fIdVotingCandidate)` desc";
		
		ArrayList arResult = new DatabaseToArrayListConversion().convertToArrayList(sql);
		return arResult;
	}
	
	public ArrayList getRecordsBySessionVoterId(String sessionVorterId) {
		sql = null;
		/*
		sql = "SELECT firstName,"+ // 0
			       "lastName,"+ // 2
			       "fileName,"+ // 3
			       "dob,"+ // 4
			       "eMail,"+ // 5
			       "address,"+ // 6
			       "po,"+ // 7
			       "postalCode,"+ // 8
			       "state,"+ // 9
			       "userId,"+ // 10
			       "registrationDate,"+ // 11
			       "registrationDay,"+ // 12
			       "registrationTime"+ // 13
			  "FROM voter_registration_information "+
			 "WHERE idVoterRegistrationInformation = 1" + sessionVorterId;
		*/
		sql = "SELECT firstName, lastName, fileName, dob, eMail, address, po, postalCode, state, userId, registrationDate, registrationDay, registrationTime FROM voter_registration_information WHERE idVoterRegistrationInformation = " + sessionVorterId;
		arrayList = null;
		arrayList = new DatabaseToArrayListConversion().convertToArrayList(sql);
		
		return arrayList;
		
	}
	
	public ArrayList getEditRecords(String sessionVoterId) {
		sql = null;
		sql = "SELECT firstName, lastName, dob, eMail, address, po, postalCode, state FROM voter_registration_information WHERE idVoterRegistrationInformation = " + sessionVoterId;
		
		ArrayList ar = new DatabaseToArrayListConversion().convertToArrayList(sql);
		
		return ar;
		
	}

	public int updateInfo(String sessionVoterId, VoterRegistrationInformation voterRegistrationInformation) {
		
		try {
			connection = null;
			connection = DatabaseConnectionOpen.createConnection();
			
			sql = null;
			sql = "update voter_registration_information SET firstName = ?, lastName = ?, dob = ?, eMail = ?, address = ?, po = ?, postalCode = ?, state = ? WHERE idVoterRegistrationInformation = ?";
			
			preparedStatement = null;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, voterRegistrationInformation.getFirstName());
			preparedStatement.setString(2, voterRegistrationInformation.getLastName());
			preparedStatement.setString(3, voterRegistrationInformation.getDob());
			preparedStatement.setString(4, voterRegistrationInformation.geteMail());
			preparedStatement.setString(5, voterRegistrationInformation.getAddress());
			preparedStatement.setString(6, voterRegistrationInformation.getPo());
			preparedStatement.setString(7, voterRegistrationInformation.getPostalCode());
			preparedStatement.setString(8, voterRegistrationInformation.getState());
			preparedStatement.setString(9, sessionVoterId);
			
			databaseUpdateChecker = 0;
			databaseUpdateChecker = preparedStatement.executeUpdate();			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return databaseUpdateChecker;
	}

	public int changePassword(String sessionVoterId, String oldPassword, String newPassword) {
		try {
			connection = null;
			connection = DatabaseConnectionOpen.createConnection();
			
			sql = "SELECT password FROM voter_registration_information WHERE idVoterRegistrationInformation = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, sessionVoterId);
			
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				String temp = resultSet.getString(1);
				if (temp.equals(oldPassword)) {
					isOldPassword = true;
				} else {
					isOldPassword = false;
				}
			}
			
			if (isOldPassword) {
				sql = null;
				sql ="UPDATE voter_registration_information SET password = ? WHERE idVoterRegistrationInformation = ?";
				
				preparedStatement = null;
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, newPassword);
				preparedStatement.setString(2, sessionVoterId);
				
				databaseUpdateChecker = 0;
				databaseUpdateChecker = preparedStatement.executeUpdate();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				preparedStatement.close();
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return databaseUpdateChecker;
	}
	
	
}
