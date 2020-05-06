package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.tomcat.util.buf.UDecoder;

import dto.VotingCandidate;
import dto.VotingSchedule;

public class LVotingSchedule {
	private Connection connection;
	private String sql;
	private PreparedStatement preparedStatement;
	private int databaseUpdateChecker;
	private ResultSet resultSet;
	private boolean isFidGot;
	private int databaseUpdateChecker1;
	SimpleDateFormat userDateFormat = new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat convertedDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date date = null;
	public int insertVotingDetails(VotingSchedule votingSchedule, VotingCandidate votingCandidate) {
		try {
			connection = DatabaseConnectionOpen.createConnection();
			
			
			/*******************	INSERT VOITNG SCHEDULE		**********************************/
			sql = "INSERT INTO voting_schedule ( fidAdminRegistrationInformation, electionDate, startTime, endTime, voteName) VALUES (?, ?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, "" + votingSchedule.getFidAdminRegistrationInformation());
			date = userDateFormat.parse(votingSchedule.getElectionDate());
			String datu = convertedDateFormat.format(date);
			System.out.println(datu);
			preparedStatement.setString(2, convertedDateFormat.format(date));
			preparedStatement.setString(3, votingSchedule.getStartTime());
			preparedStatement.setString(4, votingSchedule.getEndTime());
			preparedStatement.setString(5, votingSchedule.getVoteName());
			
			databaseUpdateChecker = 0;
			databaseUpdateChecker = preparedStatement.executeUpdate();
			
			/*******************************************************************************************/
			
			
			
			
			/*********************************	FETCH FID FROM THE VOTING SCHEDULE TABLE ******************/
			
			if (databaseUpdateChecker != 0) {
				preparedStatement = null;
				sql = "SELECT MAX(idVotingSchedule) FROM voting_schedule";
				preparedStatement = connection.prepareStatement(sql); 
				resultSet = preparedStatement.executeQuery();
				if (resultSet.next()) {
					int temp = resultSet.getInt(1);
					votingCandidate.setFidVotingSchedule(temp);
					isFidGot = true;
				}
			}
			
			
			/************************************************************************************************/
			
			/***************************	INSERT INTO VOTING CANDIDATE	**************************************/
			
			if (isFidGot) {
				preparedStatement = null;
				databaseUpdateChecker1 = 0;
				sql ="INSERT INTO voting_candidate (fidVotingSchedule, partyName, partyLeader, voteCount) VALUES (?, ?, ?, ?)";
				
				preparedStatement = connection.prepareStatement(sql);
				
				if (votingCandidate.getPartyNameList().length == votingCandidate.getPartyLeaderList().length) {
					for (int i = 0; i < votingCandidate.getPartyNameList().length; i++) {
						preparedStatement.setString(1, "" + votingCandidate.getFidVotingSchedule());
						preparedStatement.setString(2, votingCandidate.getPartyNameList()[i]);
						preparedStatement.setString(3, votingCandidate.getPartyLeaderList()[i]);
						preparedStatement.setString(4, "0");
						
						databaseUpdateChecker1 = databaseUpdateChecker1 + preparedStatement.executeUpdate();
					}
				}
			}
			
			
			/*********************************************************************************************************/
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return databaseUpdateChecker1;
		
	}

}
