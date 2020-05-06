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

import dto.VoterRegistrationInformation;

public class LVoterRegistration {
	private int databaseUpdateChecker;
	private Connection connection;
	private PreparedStatement preparedStatement;
	private String sql;
	private ArrayList arrayList;
	private ResultSet resultSet;
	private boolean isOldPassword;
	public int insert(VoterRegistrationInformation voterRegistrationInformation) {
		try {
			connection = DatabaseConnectionOpen.createConnection();
			
			sql = "INSERT INTO voter_registration_information (fIdAdminRegInfo, firstName, lastName, fileName, dob, eMail, userId, password, address, po, postalCode, state, registrationDate, registrationDay, registrationTime, approved) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, "" + voterRegistrationInformation.getfIdAdminRegInfo());
			preparedStatement.setString(2, voterRegistrationInformation.getFirstName());
			preparedStatement.setString(3, voterRegistrationInformation.getLastName());
			preparedStatement.setString(4, voterRegistrationInformation.getFileName());
			preparedStatement.setString(5, voterRegistrationInformation.getDob());
			preparedStatement.setString(6, voterRegistrationInformation.geteMail());
			preparedStatement.setString(7, voterRegistrationInformation.getUserId());
			preparedStatement.setString(8, voterRegistrationInformation.getPassword());
			preparedStatement.setString(9, voterRegistrationInformation.getAddress());
			preparedStatement.setString(10, voterRegistrationInformation.getPo());
			preparedStatement.setString(11, voterRegistrationInformation.getPostalCode());
			preparedStatement.setString(12, voterRegistrationInformation.getState());
			preparedStatement.setString(13, voterRegistrationInformation.getRegistrationDate());
			preparedStatement.setString(14, voterRegistrationInformation.getRegistrationDay());
			preparedStatement.setString(15, voterRegistrationInformation.getRegistrationTime());
			preparedStatement.setString(16, "" + voterRegistrationInformation.getApproved());
			
			databaseUpdateChecker = preparedStatement.executeUpdate();
			
			if (databaseUpdateChecker != 0) {
				this.sendUserIdAndPassword(voterRegistrationInformation.getUserId(), voterRegistrationInformation.getPassword(), voterRegistrationInformation.geteMail(), (voterRegistrationInformation.getFirstName() + " " + voterRegistrationInformation.getLastName()));
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

}
