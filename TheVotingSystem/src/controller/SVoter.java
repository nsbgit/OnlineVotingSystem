package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import logic.LVoter;
import logic.LVotingSchedule;
import logic.SystemDateAndTime;

import dto.AdminRegistrationInformation;
import dto.AdminSignInHistory;
import dto.SignInInfo;
import dto.Vote;
import dto.VoterRegistrationInformation;
import dto.VoterSignInHistory;
import dto.VotingCandidate;
import dto.VotingSchedule;

/**
 * Servlet implementation class SVoter
 */
public class SVoter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final int CHECK_USER_ID = 1;
	private final int VOTER_SIGN_IN = 2;
	private final int VOTE = 3;
	private final int CHECK_SCH = 4;
	private final int CHECK_SCH_RESULT = 5;
	private final int EDIT_PROFILE = 6;
	private final int CHANGE_PASSWORD = 7;
	private final int SIGN_OUT = 8;
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
	private VoterRegistrationInformation voterRegistrationInformation;
	private VoterSignInHistory voterSignInHistory;
	private boolean isAvailable;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SVoter() {
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
			case CHECK_USER_ID:
				
				String userId=request.getParameter("userID1");
				String msg = null;
				boolean isUserIdAvailable = false;
				//isUserIdAvailable = LAdminRegistration.checkUserIdAvailability(userId);
				isUserIdAvailable = LVoter.checkUserIdAvailability(userId);
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
				
			case VOTER_SIGN_IN:
				
				voterRegistrationInformation = new VoterRegistrationInformation();
				voterRegistrationInformation.setUserId(request.getParameter("userID"));
				voterRegistrationInformation.setPassword(request.getParameter("password"));
				
				EncryptDecryptStringWithDES obj = new EncryptDecryptStringWithDES();
				String encUserId = obj.encrypt(voterRegistrationInformation.getUserId());
				String encPassword = obj.encrypt(voterRegistrationInformation.getPassword());
				
				String decUserId = obj.decrypt(encUserId);
				String decPassword = obj.decrypt(encPassword);
				
				
				System.out.println("*************************");
				System.out.println();
				System.out.println("Original User Id : " + voterRegistrationInformation.getUserId());
				System.out.println("Encrypted User Id : " + encUserId);
				System.out.println("Original User Id : " + voterRegistrationInformation.getUserId());
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
				
				signInInfo = new LVoter().getSignInInfo(voterRegistrationInformation);
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
						sql=null;
						sql = "SELECT idVoterRegistrationInformation, firstName, lastName FROM voter_registration_information";
						arrayList = null;
						arrayList = new DatabaseToArrayListConversion().convertToArrayListBySession(sql, (String)session.getAttribute("accId"));
						iterator = null;
						iterator = arrayList.iterator();
						data = null;
						while(iterator.hasNext())  {
							data = (String[])iterator.next();
						}
						String tempName = data[0] + " " +  data[1];
						session.setAttribute("voterName", tempName);
						/**********************************************/
						
						voterSignInHistory = new VoterSignInHistory();
						
						voterSignInHistory.setfIdVoterRegistrationInformation(Integer.parseInt((String)session.getAttribute("accId")));
						voterSignInHistory.setSignInDate(SystemDateAndTime.getDate());
						voterSignInHistory.setSignInDay(SystemDateAndTime.getDay());
						voterSignInHistory.setSignInTime(SystemDateAndTime.getTimeIn12HrsFormat());
						voterSignInHistory.setSignOutDate("    -    ");
						voterSignInHistory.setSignOutDay("    -    ");
						voterSignInHistory.setSignOutTime("    -    ");
						
						databaseUpdateChecker = 0;
						databaseUpdateChecker = new LVoter().insertSignInHistory(voterSignInHistory);
						
						if (databaseUpdateChecker != 0) {
							response.sendRedirect("voterSection/voterHomePage.jsp");
							//response.sendRedirect("voterSection/voterHomePage.jsp");
						} else {
							session = request.getSession();
							session.setAttribute("signInMsg", "Sign failed");
							try {
								response.sendRedirect("mainToVoterSection/voterSignIn.jsp");
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					} catch (NumberFormatException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				} else {
					session = request.getSession();
					session.setAttribute("signInMsg", "Worng user ID or password. Try again");
					try {
						response.sendRedirect("mainToVoterSection/voterSignIn.jsp");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
				break;
				
				
			case VOTE:
				
				Vote vote = new Vote();
				
				vote.setfIdAdminRegInfo(Integer.parseInt((String)session.getAttribute("fIdAdmin")));
				vote.setfIdVoterInfo(Integer.parseInt((String)session.getAttribute("accId")));
				vote.setfIdVotingSchedule(Integer.parseInt((String)session.getAttribute("fIdVotingSchedule")));
				vote.setfIdVotingCandidate(Integer.parseInt(request.getParameter("choose")));
				vote.setCurrentDate(new SimpleDateFormat("yyyy-MM-DD").format(new Date()));
				vote.setCurrentTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));
				
				databaseUpdateChecker = 0;
				databaseUpdateChecker = new LVoter().insertVote(vote);
				
				if (databaseUpdateChecker != 0) {
					try {
						response.sendRedirect("voterSection/giveVote.jsp");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else {

				}
				
				break;
				
				
			case CHECK_SCH:
				String schId = request.getParameter("schId");
				String voterId = session.getAttribute("accId").toString();
				session.setAttribute("fIdVotingSchedule", schId);
				String adminId = (String)session.getAttribute("fIdAdmin");
				arrayList = null;
				arrayList = new LVoter().schName(adminId, voterId, schId);
				
				String htmlFail = "<table width='100%'>"+
										"<tr>"+
											"<td style='color: red; font-size: large;'>"+
												"<p>YOUT VOTE IS ALREADY RECIEVED</p>"+
											"</td>"+
										"</tr>"+
									"</table>";
					
					
				String html = "<table><tr><th class='header'>S No.</th><th class='header'>Party Name</th><th class='header'>Party Leader</th><th class='header'>Select</th></tr>";
				iterator = null;
				iterator = arrayList.iterator();
				String[] data;
				int count = 0;
				isAvailable = false;
				while(iterator.hasNext()) {
					data = (String[])iterator.next();
					
					isAvailable = true;
					
					html+="<tr>"+
								"<td><label>"+ ++count +"</label></td>"+
								"<td>"+ data[1] +"</td>"+
								"<td>"+ data[2] +"</td>"+
								"<td>"+
									"<input type='radio' name='choose' id='choose" +count +"' value='"+ data[0] + "' >"+
								"</td>"+
								
							"</tr>";
				}
				html+="<tr><td colspan='4'><input type='hidden' name='count' value='"+ count + "'><input type='submit' onclick='return check()' value='Vote' class='btn'><input type='reset' value='Reset' class='btn'></td></tr></table>";
				/*
				html += "<tr>"+
							"<td align='center' colspan='4'>"+
							"<input type='hidden' name='count' value='"+ count + "'>" +
								"<input type='submit' onclick='return check()' value='Vote' class='btn'>"+
								"<input type='reset' value='Reset' class='btn'>"+
							"</td>"+
						"</tr></table>";
					*/	
			try {
				PrintWriter out1 = response.getWriter();
				//response.setContentType("text/html");
				if (isAvailable) {
					out1.print(html);
				} else {
					out1.print(htmlFail);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
				
				
				break;
				
			case CHECK_SCH_RESULT:
				
				String schResultId = request.getParameter("schId");
				ArrayList alistResult = new LVoter().calculateResult(schResultId);
				Iterator itResult = alistResult.iterator();
				String[] dataResult;
				int countResult = 0;
				String htmlr = "<table width='100%'><tr><th class='header'>S No.</th><th class='header'>Party Name</th><th class='header'>Party Leader</th><th class='header'>Total vote</th></tr>";
				while (itResult.hasNext()) {
					dataResult = (String[])itResult.next();
					
					htmlr += "<tr>"+
								"<td>" + ++countResult + "</td>"+
								"<td>" + dataResult[0] + "</td>"+
								"<td>" + dataResult[1] + "</td>"+
								"<td>" + dataResult[2] + "</td>"+
							"</tr>";
					
				}
				htmlr+="</tr></table>";
				
				try {
					PrintWriter out2 = response.getWriter();
					//response.setContentType("text/html");
					out2.print(htmlr);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				break;
				
			case EDIT_PROFILE:
				
				voterRegistrationInformation = new VoterRegistrationInformation();
				
				voterRegistrationInformation.setFirstName(request.getParameter("firstName"));
				voterRegistrationInformation.setLastName(request.getParameter("lastName"));
				voterRegistrationInformation.setDob(request.getParameter("dob"));
				voterRegistrationInformation.seteMail(request.getParameter("eMail"));
				voterRegistrationInformation.setAddress(request.getParameter("address"));
				voterRegistrationInformation.setPo(request.getParameter("po"));
				voterRegistrationInformation.setPostalCode(request.getParameter("postalCode"));
				voterRegistrationInformation.setState(request.getParameter("state"));
				
				databaseUpdateChecker = 0;
				String sessionVoterId= session.getAttribute("accId").toString();
				databaseUpdateChecker = new LVoter().updateInfo(sessionVoterId, voterRegistrationInformation);
				
				session = request.getSession();
				
				if (databaseUpdateChecker != 0) {
					session.setAttribute("registrationMsg", "Hurray!!! Your information is successfully submitted");
				} else {
					session.setAttribute("registrationMsg", "Wrong password!!");
				}
				
				try {
					response.sendRedirect("voterSection/viewProfile.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}

				
				break;
				
			case CHANGE_PASSWORD:
				
				String oldPassword = request.getParameter("oldPassword");
				String newPassword = request.getParameter("password");
				String sessionVoterId1 = session.getAttribute("accId").toString();
				
				databaseUpdateChecker = 0;
				databaseUpdateChecker = new LVoter().changePassword(sessionVoterId1, oldPassword, newPassword);
				
				session = request.getSession();
				
				if (databaseUpdateChecker != 0) {
					session.setAttribute("changeMsg", "Hurray!!! Your password is successfully changed");
				} else {
					session.setAttribute("changeMsg", "Wrong password!!!! Try again");
				}
				
				try {
					response.sendRedirect("voterSection/changePassword.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				break;
				
			case SIGN_OUT:
				session.invalidate();
				session = request.getSession();
				session.setAttribute("signOut", "Succefully signed out");
				try {
					response.sendRedirect("mainToVoterSection/voterSignIn.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
	
			default:
				
				break;
		}
	}
}
