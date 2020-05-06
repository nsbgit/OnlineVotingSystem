package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import dto.AdminRegistrationInformation;
import dto.AdminSignInHistory;
import dto.SignInInfo;

public class LAdminSignIn {
	private String sql;
	private ArrayList arrayList;
	private Iterator iterator;
	private String[] data;
	private SignInInfo signInInfo;
	private Connection connection;
	private PreparedStatement preparedStatement;
	private int databaseUpdateChecker;
	public SignInInfo getSignInInfo(AdminRegistrationInformation adminRegistrationInformation) {
		sql = "SELECT id, userID, password FROM admin_registration_information";
		arrayList = new DatabaseToArrayListConversion().convertToArrayList(sql);
		iterator = arrayList.iterator();
		while (iterator.hasNext()) {
			data = (String[]) iterator.next();
			
			if (data[1].equals(adminRegistrationInformation.getUserID()) && data[2].equals(adminRegistrationInformation.getPassword())) {
				signInInfo = new SignInInfo();
				signInInfo.setId(data[0]);
				signInInfo.setFlagSignInInfo(true);
				break;
			}
		}
		return signInInfo;
	}
	
	public int insertSignInHistory(AdminSignInHistory adminSignInHistory) {
		
		try {
			connection = DatabaseConnectionOpen.createConnection();
			
			sql = "INSERT INTO admin_sign_in_history (fId, signInDate, signInDay, signInTime, signOutDate, signOutDay, signOutTime) VALUES (?,?,?,?,?,?,?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, adminSignInHistory.getfId());
			preparedStatement.setString(2, adminSignInHistory.getSignInDate());
			preparedStatement.setString(3, adminSignInHistory.getSignInDay());
			preparedStatement.setString(4, adminSignInHistory.getSignInTime());
			preparedStatement.setString(5, adminSignInHistory.getSignOutDate());
			preparedStatement.setString(6, adminSignInHistory.getSignOutDay());
			preparedStatement.setString(7, adminSignInHistory.getSignOutTime());
			
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

}
