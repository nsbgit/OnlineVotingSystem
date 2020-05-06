package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.DatabaseToArrayListConversion;
import logic.EncryptDecryptStringWithDES;
import logic.LAdminRegistration;
import logic.LAdminSignIn;
import logic.LVotingSchedule;
import logic.SystemDateAndTime;

import dto.AdminRegistrationInformation;
import dto.AdminSignInHistory;
import dto.SignInInfo;
import dto.VotingCandidate;
import dto.VotingSchedule;

/**
 * Servlet implementation class SAdmin
 */
public class SAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final int ADMIN_SIGN_UP = 1;
	private final int ADMIN_SIGN_IN = 2;
	private final int ADMIN_SIGN_OUT = 3;
	private final int ADMIN_EDIT_PROFILE = 4;
	private final int CHECK_USER_ID = 5;
	private final int CHANGE_PASSWORD = 6;
	private final int CREATE_VOTE_EVENT = 7;
	private final int FORGOT_PASSWORD = 8;
	
	private int linkId;
	private AdminRegistrationInformation adminRegistrationInformation;
	private HttpSession session;
	private AdminSignInHistory adminSignInHistory;
	private SignInInfo signInInfo;
	private int databaseUpdateChecker;
	private String sql;
	private ArrayList arrayList;
	private Iterator iterator;
	private String[] data;
	private boolean flagSignInfo;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.commonMethod(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.commonMethod(request, response);
	}
	
	private void commonMethod(HttpServletRequest request, HttpServletResponse response) {
		linkId = Integer.parseInt(request.getParameter("linkId"));
		response.setContentType("text/html");
		
		switch (linkId) {
		
		
			case ADMIN_SIGN_UP:
				
				
				break;
			case ADMIN_SIGN_IN:
				
				adminRegistrationInformation = new AdminRegistrationInformation();
				
				adminRegistrationInformation.setUserID(request.getParameter("userID"));
				adminRegistrationInformation.setPassword(request.getParameter("password"));
				
				EncryptDecryptStringWithDES obj = new EncryptDecryptStringWithDES();
				String encUserId = obj.encrypt(adminRegistrationInformation.getUserID());
				String encPassword = obj.encrypt(adminRegistrationInformation.getPassword());
				
				String decUserId = obj.decrypt(encUserId);
				String decPassword = obj.decrypt(encPassword);
				
				
				System.out.println("*************************");
				System.out.println();
				System.out.println("Original User Id : " + adminRegistrationInformation.getUserID());
				System.out.println("Encrypted User Id : " + encUserId);
				System.out.println("Original User Id : " + adminRegistrationInformation.getPassword());
				System.out.println("Encrypted User Id : " + encPassword);
				System.out.println();
				System.out.println();
				System.out.println();
				System.out.println("Encrypted User Id : " + encUserId);
				System.out.println("Decrypted User Id : " + decUserId);
				System.out.println("Encrypted User Id : " + encPassword);
				System.out.println("Decrypted User Id : " + decPassword);
				System.out.println();
				
				
				System.out.println();
				System.out.println();
				System.out.println();
				System.out.println();
				
				System.out.println("*************************");
				
				signInInfo = new LAdminSignIn().getSignInInfo(adminRegistrationInformation);
				if (signInInfo == null) {
					flagSignInfo = false;
				} else {
					flagSignInfo = signInInfo.isFlagSignInInfo();
				}
				
				if (flagSignInfo) {
					try {
						
						/********	CREATE SESSION	*********/
						session = request.getSession();
						session.setAttribute("accId", signInInfo.getId());
						sql = "SELECT id, firstName, lastName, organisationName FROM admin_registration_information";
						arrayList = new DatabaseToArrayListConversion().convertToArrayListBySession(sql, (String)session.getAttribute("accId"));
						iterator = arrayList.iterator();
						while(iterator.hasNext())  {
							data = (String[])iterator.next();
						}
						String tempName = data[0] + " " +  data[1];
						session.setAttribute("adminName", tempName);
						session.setAttribute("organisationName", data[2]);
						/*******************************************/
						
						adminSignInHistory = new AdminSignInHistory();
						
						adminSignInHistory.setfId((String)session.getAttribute("accId"));
						adminSignInHistory.setSignInDate(SystemDateAndTime.getDate());
						adminSignInHistory.setSignInDay(SystemDateAndTime.getDay());
						adminSignInHistory.setSignInTime(SystemDateAndTime.getTimeIn12HrsFormat());
						adminSignInHistory.setSignOutDate("    -    ");
						adminSignInHistory.setSignOutDay("    -    ");
						adminSignInHistory.setSignOutTime("    -    ");
						
						databaseUpdateChecker = 0;
						databaseUpdateChecker = new LAdminSignIn().insertSignInHistory(adminSignInHistory);
						
						if (databaseUpdateChecker != 0) {
							response.sendRedirect("adminSection/adminHomePage.jsp");
						} else {
							session = request.getSession();
							session.setAttribute("signInMsg", "Sign failed");
							try {
								response.sendRedirect("mainToAdminSection/adminSignIn.jsp");
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					session = request.getSession();
					session.setAttribute("signInMsg", "Worng user ID or password. Try again");
					try {
						response.sendRedirect("mainToAdminSection/adminSignIn.jsp");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
				break;
				
				
			case ADMIN_SIGN_OUT:
				/*
				adminSignInHistory.setfId((String)session.getAttribute("accId"));
				adminSignInHistory.setSignOutDate(SystemDateAndTime.getDate());
				adminSignInHistory.setSignOutDay(SystemDateAndTime.getDay());
				adminSignInHistory.setSignOutTime(SystemDateAndTime.getTimeIn12HrsFormat());
				*/
				session.invalidate();
				session = request.getSession();
				session.setAttribute("signOut", "Succefully signed out");
				try {
					response.sendRedirect("mainToAdminSection/adminSignIn.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
				
			case ADMIN_EDIT_PROFILE:
				
				adminRegistrationInformation = new AdminRegistrationInformation();

				adminRegistrationInformation.setFirstName(request.getParameter("firstName"));
				adminRegistrationInformation.setLastName(request.getParameter("lastName"));
				adminRegistrationInformation.setOrganisationName(request.getParameter("organisationName"));
				adminRegistrationInformation.seteMail(request.getParameter("eMail"));
				adminRegistrationInformation.setOrganisationAddress(request.getParameter("organisationAddress"));
				
				databaseUpdateChecker = 0;
				databaseUpdateChecker = new LAdminRegistration().updateBySessionId((String)session.getAttribute("accId"), adminRegistrationInformation);
				
				session = request.getSession();
				
				if (databaseUpdateChecker != 0) {
					session.setAttribute("registrationMsg", "Hurray!!! Your information is successfully submitted");
				} else {
					session.setAttribute("registrationMsg", "Wrong password!!");
				}
				
				try {
					response.sendRedirect("adminSection/viewProfile.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				break;
	
			case CHECK_USER_ID:
				String userId=request.getParameter("userID1");
				String msg = null;
				boolean isUserIdAvailable = false;
				isUserIdAvailable = LAdminRegistration.checkUserIdAvailability(userId);
				if (isUserIdAvailable) {
					//msg = "1";
					msg = "Already exist. Please try another one";
				} else {
					//msg = "0";
					msg = "AVAILABLE";
				}
				isUserIdAvailable = false;
				PrintWriter out;
				try {
					out = response.getWriter();
					//out.print(userId);
					out.print(msg);
					out.flush();
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				break;
				
			case CHANGE_PASSWORD:
				
				String oldPassword = request.getParameter("oldPassword");
				String newPassword = request.getParameter("password");
				
				//String enc = this.encrypt(oldPassword);
				
				databaseUpdateChecker = 0;
				databaseUpdateChecker = new LAdminRegistration().changePassword((String)session.getAttribute("accId"), oldPassword, newPassword);
				
				session = request.getSession();
				
				if (databaseUpdateChecker != 0) {
					session.setAttribute("changeMsg", "Hurray!!! Your password is successfully changed");
				} else {
					session.setAttribute("changeMsg", "Wrong password!!!! Try again");
				}
				
				try {
					response.sendRedirect("adminSection/changePassword.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				break;
				
			case CREATE_VOTE_EVENT:
				
				VotingSchedule votingSchedule = new VotingSchedule();
				String a = (String)session.getAttribute("accId");
				int b = Integer.parseInt(a);
				votingSchedule.setFidAdminRegistrationInformation(b);
				votingSchedule.setElectionDate(request.getParameter("electionDate"));
				
				
				//int startTimeHour = Integer.parseInt(request.getParameter("startTimeHour"));
				String startTime = request.getParameter("startTimeHour") + ":" + request.getParameter("startTimeMinute") + ":" + "00";
				/*
				if (request.getParameter("startTime").equals("AM")) {
					startTime = request.getParameter("startTimeHour") + ":" + request.getParameter("startTimeMinute") + ":" + "00";
				} else {
					startTimeHour = startTimeHour + 12;
					if (startTimeHour == 24) {
						startTime = "00" + ":" + request.getParameter("startTimeMinute") + ":" + "00";
					} else {
						startTime = "" + startTimeHour + ":" + request.getParameter("startTimeMinute") + ":" + "00";
					}
				}
				*/
				
				
				//String starTime = request.getParameter("startTimeHour") + " : " + request.getParameter("startTimeMinute") + "  " + request.getParameter("startTime");
				votingSchedule.setStartTime(startTime);
				
				
				//int endTimeHour = Integer.parseInt(request.getParameter("endTimeHour"));
				String endTime = request.getParameter("endTimeHour") + ":" + request.getParameter("endTimeMinute") + ":" + "00";
				/*
				if (request.getParameter("endTime").equals("AM")) {
					endTime = request.getParameter("endTimeHour") + ":" + request.getParameter("endTimeMinute") + ":" + "00";
				} else {
					endTimeHour = endTimeHour + 12;
					if (endTimeHour == 24) {
						endTime = "00" + ":" + request.getParameter("endTimeMinute") + ":" + "00";
					} else {
						endTime = "" + endTimeHour + ":" + request.getParameter("endTimeMinute") + ":" + "00";
					}
				}
				*/
				
				
				//String endTime = request.getParameter("endTimeHour") + " : " + request.getParameter("endTimeMinute") + "  " + request.getParameter("endTime");
				votingSchedule.setEndTime(endTime);
				votingSchedule.setVoteName(request.getParameter("voteName"));
				
				VotingCandidate votingCandidate = new VotingCandidate();
				
				votingCandidate.setPartyNameList(request.getParameterValues("partyName"));
				votingCandidate.setPartyLeaderList(request.getParameterValues("partLeader"));
				
				databaseUpdateChecker = 0;
				databaseUpdateChecker = new LVotingSchedule().insertVotingDetails(votingSchedule, votingCandidate);
				
				session = request.getSession();
				
				if (databaseUpdateChecker != 0) {
					try {
						response.sendRedirect("adminSection/createVoteEvent.jsp");
						session.setAttribute("voteMsgS", "Information successfully submitted");
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					try {
						response.sendRedirect("adminSection/createVoteEvent.jsp");
						session.setAttribute("voteMsgN", "Information successfully submitted");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
				break;
				
			case FORGOT_PASSWORD:
				String userID = request.getParameter("userID");
				
				boolean isUserId = new LAdminRegistration().forgotPassword(userID);
				session = request.getSession();
				if (isUserId) {
					try {
						response.sendRedirect("commonPages/forgottenPassword.jsp");
						session.setAttribute("isSendS", "Password has been sent to registered e-mail address");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else {
					try {
						response.sendRedirect("commonPages/forgottenPassword.jsp");
						session.setAttribute("isSendN", "Wrong user id. Please try again.");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				break;
				
			default:
				break;
		}
		
	}
}
