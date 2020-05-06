package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dto.AdminRegistrationInformation;

public class LAdminRegistration {
	private int databaseUpdateChecker;
	private Connection connection;
	private PreparedStatement preparedStatement;
	private String sql;
	private ArrayList arrayList;
	private ResultSet resultSet;
	private boolean isOldPassword;
	
	public int insert(AdminRegistrationInformation adminRegistrationInformation) {
		try {
			connection = DatabaseConnectionOpen.createConnection();
			
			sql = "INSERT INTO admin_registration_information (firstName, lastName, organisationName, eMail, userID, password, organisationAddress, agree, fileName, registrationDate, registrationDay, registrationTime) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, adminRegistrationInformation.getFirstName());
			preparedStatement.setString(2, adminRegistrationInformation.getLastName());
			preparedStatement.setString(3, adminRegistrationInformation.getOrganisationName());
			preparedStatement.setString(4, adminRegistrationInformation.geteMail());
			preparedStatement.setString(5, adminRegistrationInformation.getUserID());
			preparedStatement.setString(6, adminRegistrationInformation.getPassword());
			preparedStatement.setString(7, adminRegistrationInformation.getOrganisationAddress());
			preparedStatement.setString(8, adminRegistrationInformation.getAgree());
			preparedStatement.setString(9, adminRegistrationInformation.getFileName());
			preparedStatement.setString(10, adminRegistrationInformation.getRegistrationDate());
			preparedStatement.setString(11, adminRegistrationInformation.getRegistrationDay());
			preparedStatement.setString(12, adminRegistrationInformation.getRegistrationTime());
			
			databaseUpdateChecker = preparedStatement.executeUpdate();
			
			if (databaseUpdateChecker != 0) {
				this.sendUserIdAndPassword(adminRegistrationInformation.getUserID(),adminRegistrationInformation.getPassword(),adminRegistrationInformation.geteMail(),(adminRegistrationInformation.getFirstName() + " " + adminRegistrationInformation.getLastName()));
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
	
	public ArrayList getRecordsByAccId(String sessionId) {
		
		sql = "SELECT id, firstName, lastName, organisationName, eMail, userID, password, organisationAddress, agree, registrationDate, registrationDay, registrationTime, fileName FROM admin_registration_information";
		//arrayList2 = new DatabaseToArrayListConversion().convertToArrayList(sql);
		arrayList = new DatabaseToArrayListConversion().convertToArrayListBySession(sql, sessionId);
		
		
		return arrayList;
		
	}
	public boolean sendUserIdAndPassword(String userId,String password,String mailId,String personName){
		 try{
			String from = "ecoigov@gmail.com";
	        String to = mailId;
	        String subject = "Confirm Registration Info";
	        String username=userId;
	        String pass=password; 
	        String person=personName;
	        String message ="<html> <head>"+
	        "<title>Registration Email Info</title></head>"+
	        "<table border=\"0\" width=\"60%\" align=\"center\">"+
	        "<tr><td>Dear "+person+",</td></tr>"+
	        "<tr><td height=\"20px\" width=\"100%\"></td></tr>"+
	        "<tr><td>Thank you for registering on Online Voting Portal. We are delighted to inform you that your account has been created successfully. </td></tr>"+
	        "<tr><td width=\"100%\" height=\"10px\"></td></tr>"+
	        "<tr><td style=\"font-weight: bold\">Your account details are as follows:</td></tr>"+
	        "<tr><td width=\"100%\" height=\"10px\"></td></tr>"+
	        "<tr><td width=\"100%\" height=\"\">Login ID : "+ username +" </td></tr>"+
	        "<tr><td width=\"100%\" height=\"\">Password : "+pass +"</td></tr>"+
	        "<tr><td>It is recommended to please change the password at the time of first sign in. </td></tr>"+
	        "<tr><td align=\"center\" width=\"100%\" colspan=\"3\"><label style=\"font-size: smaller\">It is an auto generated e-mail please do not reply to this mail.</label> </td></tr>"+
	        "<tr><td width=\"100%\" height=\"30px\"></td></tr>"+
	         "<tr><td width=\"100%\" height=\"\"> </td></tr>"+
	        "<tr><td colspan=\"2\" align=\"center\" width=\"100%\"> <label class=\"email\">ecoigov@gmail.com</label> </td></tr>"+
	        "<tr><td align=\"center\" width=\"100%\" colspan=\"3\"><label style=\"font-size: smaller\">All rights reserved © 2014 Online Voting Portal</label> </td></tr>"+
	    	"</table></body>"+
	    	"</html>";
	    	String login = "ecoigov@gmail.com";
	        String Loginpass = "gov~!@#$%14";
	        Properties props = new Properties();
	        props.setProperty("mail.host", "smtp.gmail.com");
	        props.setProperty("mail.smtp.port", "587");
	        props.setProperty("mail.smtp.auth", "true");
	        props.setProperty("mail.smtp.starttls.enable", "true");
	        Authenticator auth = new SMTPAuthenticator(login,Loginpass);
	        Session mailsession = Session.getInstance(props, auth);
	        MimeMessage msg = new MimeMessage(mailsession);
	        msg.setContent(message,"text/html");
	        msg.setSubject(subject);
	        msg.setFrom(new InternetAddress(from));
	        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	        Transport.send(msg);
		 }
		 catch (Exception e) {
			 e.printStackTrace();
			 return false;
		}
		 return true;
	 }
	
	/************* FORGOT PASSWORD ****************************/
	
	public boolean sendForgotPassword(String userId,String password,String mailId,String personName){
		 try{
			String from = "ecoigov@gmail.com";
	        String to = mailId;
	        String subject = "Account information";
	        String username=userId;
	        String pass=password; 
	        String person=personName;
	        String message ="<html> <head>"+
	        "<title>Your account information</title></head>"+
	        "<table border=\"0\" width=\"60%\" align=\"center\">"+
	        "<tr><td>Dear "+person+",</td></tr>"+
	        "<tr><td height=\"20px\" width=\"100%\"></td></tr>"+
	        "<tr><td>Please use this information to sign in. </td></tr>"+
	        "<tr><td width=\"100%\" height=\"10px\"></td></tr>"+
	        "<tr><td style=\"font-weight: bold\">Your account details are as follows:</td></tr>"+
	        "<tr><td width=\"100%\" height=\"10px\"></td></tr>"+
	        "<tr><td width=\"100%\" height=\"\">Login ID : "+ username +" </td></tr>"+
	        "<tr><td width=\"100%\" height=\"\">Password : "+pass +"</td></tr>"+
	        "<tr><td align=\"center\" width=\"100%\" colspan=\"3\"><label style=\"font-size: smaller\">It is an auto generated e-mail please do not reply to this mail.</label> </td></tr>"+
	        "<tr><td width=\"100%\" height=\"30px\"></td></tr>"+
	         "<tr><td width=\"100%\" height=\"\"> </td></tr>"+
	        "<tr><td colspan=\"2\" align=\"center\" width=\"100%\"> <label class=\"email\">ecoigov@gmail.com</label> </td></tr>"+
	        "<tr><td align=\"center\" width=\"100%\" colspan=\"3\"><label style=\"font-size: smaller\">All rights reserved © 2014 Online Voting Portal</label> </td></tr>"+
	    	"</table></body>"+
	    	"</html>";
	    	String login = "ecoigov@gmail.com";
	        String Loginpass = "gov~!@#$%14";
	        Properties props = new Properties();
	        props.setProperty("mail.host", "smtp.gmail.com");
	        props.setProperty("mail.smtp.port", "587");
	        props.setProperty("mail.smtp.auth", "true");
	        props.setProperty("mail.smtp.starttls.enable", "true");
	        Authenticator auth = new SMTPAuthenticator(login,Loginpass);
	        Session mailsession = Session.getInstance(props, auth);
	        MimeMessage msg = new MimeMessage(mailsession);
	        msg.setContent(message,"text/html");
	        msg.setSubject(subject);
	        msg.setFrom(new InternetAddress(from));
	        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	        Transport.send(msg);
		 }
		 catch (Exception e) {
			 e.printStackTrace();
			 return false;
		}
		 return true;
	 }
	
	
	/************************************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int updateBySessionId( String sessionId, AdminRegistrationInformation adminRegistrationInformation) {
		
		try {
			connection = DatabaseConnectionOpen.createConnection();
			Integer.parseInt(sessionId);
			
			
			sql = "UPDATE admin_registration_information SET firstName = ?, lastName = ?, organisationName = ?,eMail = ?, organisationAddress = ? WHERE id = ?" ;
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, adminRegistrationInformation.getFirstName());
			preparedStatement.setString(2, adminRegistrationInformation.getLastName());
			preparedStatement.setString(3, adminRegistrationInformation.getOrganisationName());
			preparedStatement.setString(4, adminRegistrationInformation.geteMail());
			preparedStatement.setString(5, adminRegistrationInformation.getOrganisationAddress());
			preparedStatement.setString(6, sessionId);
			
			databaseUpdateChecker = preparedStatement.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
	
	public int changePassword(String sessionID, String oldPassword, String newPassword) {
		try {
			Integer.parseInt(sessionID);
			connection = DatabaseConnectionOpen.createConnection();
			
			sql = "SELECT password FROM admin_registration_information WHERE id = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, sessionID);
			//ArrayList alist = new DatabaseToArrayListConversion().convertToArrayListBySession("SELECT password FROM admin_registration_information WHERE id = 3", sessionID);
			
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				String temp = resultSet.getString(1);
				if (temp.equals(oldPassword)) {
					isOldPassword = true;
				} else {
					isOldPassword = false;
				}
				/*
					data = new String[countColumn];
					for (int i = 0; i < countColumn; i++) {
						data[i] = resultSet.getString(i+1);
					}
					arrayList.add(data);
					break;
				*/
			}
			if (isOldPassword) {
				sql = "UPDATE admin_registration_information SET password = ? WHERE id = ?";
				preparedStatement = null;
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, newPassword);
				preparedStatement.setString(2, sessionID);
				
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
	
	public static boolean checkUserIdAvailability(String userId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		boolean flag = false;
		//int columnCount = 0;
		try {
			connection = DatabaseConnectionOpen.createConnection();
			String sql = "SELECT id FROM admin_registration_information WHERE userID=?";
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
	
	public boolean forgotPassword(String userID) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		boolean isSend = false;
		int countColumn = 0;
		String[] data = null;
		try {
			connection = DatabaseConnectionOpen.createConnection();
			String sql = "SELECT eMail, password, firstName, lastName FROM admin_registration_information WHERE userID = ?";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, userID);
			
			resultSet = preparedStatement.executeQuery();
			countColumn = resultSet.getMetaData().getColumnCount();
			if (resultSet.next()) {
				
				data = new String[countColumn];
				
				for (int i = 0; i < countColumn; i++) {
					data[i] = resultSet.getString(i+1);
				}
				this.sendForgotPassword(userID, data[1], data[0], data[2] + " " + data[3]);
				isSend = true;
			} else {
				isSend = false;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
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
		
		return isSend;
		
	}

}
