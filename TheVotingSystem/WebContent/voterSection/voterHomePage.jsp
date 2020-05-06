<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="logic.LVoter"%>
<%@page import="java.util.ArrayList"%>
<%if(session.getAttribute("accId") != null) {%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Voter</title>
<link href="../css/mainWebPage.css" rel="stylesheet">
<link rel="stylesheet" href="../css/index.css" type="text/css" />
</head>
<body>
	<div id="container">
		<header id="page_header">
			<img src="../logo/download.jpg" alt="logo" width='232' height='100' class="logo" />
			<h1 class="head_text">WELCOME TO ONLINE VOTING</h1>
		</header>
	</div>
	
	
	<div id="container">
		<div id="header"></div>
		<div id="menuBar">
			<div id='cssmenu'>
				<ul>
					<li class='active'>
						<a href='../mainWebHomePage.jsp'><span>Home</span></a>
					</li>
					<li>
						<a href='#'><span>Gallery</span></a>
					</li>
					<li class='has-sub'>
						<a href='#'><span>Registration</span></a>
						<ul>
							<li>
								<a href='../mainToAdminSection/adminSignUp.jsp'><span>Organisation Registration</span></a>
							</li>
							<li class='last'>
								<a href='../mainToVoterSection/voterSignUp.jsp'><span>Voter Registration</span></a>
							</li>
						</ul>
					</li>
					<li class='has-sub'>
						<a href='#'><span>Log in</span></a>
						<ul>
							<li>
								<a href='../mainToAdminSection/adminSignIn.jsp'><span>Admin Login</span></a>
							</li>
							<li class='last'>
								<a href='../mainToVoterSection/voterSignIn.jsp'><span>Voter Login</span></a>
							</li>
						</ul>
					</li>
					<li>
						<a href='../contactUs.jsp'><span>Contact Us</span></a>
					</li>
					<li class='last'>
						<a href='../aboutUs.jsp'><span>About Us</span></a>
					</li>
				</ul>
			</div>
		</div>
		
		
		<div id="leftSideBarVoterHome">
			<div id="menuBar">
				<div id='cssmenu'>
					<ul>
						<li class='has-sub'><a href='#'><span>Voter Section</span></a>
						<ul>
							<li><a href="../voterSection/voterHomePage.jsp"><span>Voter Home Page</span></a></li>
							<li><a href="../voterSection/editProfile.jsp"><span>Edit Profile</span></a></li>
							<li><a href="../voterSection/giveVote.jsp"><span>Give Vote</span></a></li>
							<li><a href="../voterSection/result.jsp"><span>Result</span></a></li>
							<li><a href="../voterSection/viewProfile.jsp"><span>View Profile</span></a></li>
							<li><a href="../voterSection/changePassword.jsp"><span>Change Password</span></a></li>
							<li>
								<a><span>
									<form action="<%= request.getContextPath() %>/SVoter.do?linkId=8" method="post">
										<input type="submit" class="btn" value="Sign Out" onclick="">
									</form>
								</span></a>
							</li>
						</ul>
					</ul>
				</div>
			</div>
		</div>
		
		<%-- ************************************************************************* --%>
		<div id="contentVoterHomePage">
		<%-- Paste div clas body here --%>
			<div>
				<hr>
				<hr>
				
				<%
					if(session.getAttribute("accId") != null) {
				%>		<h1 align="center" class="pageHeader">Profile of <%= session.getAttribute("voterName") %></h1>
				<%	}
				%>
				<hr>
				<hr>
				<br>
				<br>
				
				<form action="#" method="post">
					<table align="center" class="box" bordercolor="#ddcef0">
						
						<%
							String voterId = session.getAttribute("accId").toString();
							ArrayList alist = new LVoter().getRecordsBySessionVoterId(voterId);
							Iterator it = alist.iterator();
							String[] data;
							while(it.hasNext()) {
								data = (String[])it.next();
						%>		<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td colspan="1" align="left" rowspan="12">
										<img alt="<%=data[0]%> <%=data[1]%>" src="../upload/voter/<%= data[3]%>" style="padding-left: 46px; border-width: 1px; width: 115px; height: 185px;">
									</td>
								</tr>
								
								<tr>
									<td><label>First Name :</label></td>
									<td class="viewPro"><%= data[0] %></td>
								</tr>
								
								<tr>
									<td><label>Last Name :</label></td>
									<td class="viewPro"><%= data[1] %></td>
								</tr>
								
								<tr>
									<td><label>Date of Birth :</label></td>
									<td class="viewPro"><%= data[3] %></td>
								</tr>
								
								<tr>
									<td><label>E-mail :</label></td>
									<td class="viewPro"><%= data[4] %></td>
								</tr>
								
								<tr>
									<td><label>Address :</label></td>
									<td class="viewPro"><%= data[5] %></td>
								</tr>
								
								<tr>
									<td><label>P.O :</label></td>
									<td class="viewPro"><%= data[6] %></td>
								</tr>
								
								<tr>
									<td><label>Postal Code :</label></td>
									<td class="viewPro"><%= data[7] %></td>
								</tr>
								
								<tr>
									<td><label>State</label></td>
									<td class="viewPro"><%= data[8] %></td>
								</tr>
								
								<tr>
									<td><label>User Id :</label></td>
									<td class="viewPro"><%= data[9] %></td>
								</tr>
								
								<tr>
									<td><label>Registration Date :</label></td>
									<td class="viewPro"><%= data[10] %></td>
								</tr>
								
								<tr>
									<td><label>Registration Day</label></td>
									<td class="viewPro"><%= data[11] %></td>
								</tr>
								
								<tr>
									<td><label>Registration Time</label></td>
									<td class="viewPro"><%= data[12] %></td>
								</tr>
								
						<%	}
						%>
						
						
					</table>
				</form>
				</div>
		</div>
		<%-- ************************************************************************* --%>
		
	</div>
	
	<div id="footer">
		<p align="center">
			Online Voting Portal<br />
			all copyrights are reserved&copy;
		</p>
	</div>
	




























<%-- ****************************** my code *********************************************************** --%>
	<%--
	<div class="body">
		<hr>
		<hr>
		<%
			if(session.getAttribute("accId") != null) {
		%>		<h1 align="center">Welcome to <%= session.getAttribute("voterName") %></h1>
		<%	}
		%>
		<hr>
		<hr>
		<br>
		<br>
		
		<form action="<%= request.getContextPath() %>/SAdmin.do?linkId=3" method="post">
			<table align="center" class="box">
				<tr>
					<br>
					<br>
					<th class="header" colspan="2">Voter functions</th>
				</tr>
				
				<tr>
					<td class="hyperLink">
						<a href="../voterSection/viewProfile.jsp">View Profile</a>
					</td>
				</tr>
				
				<tr>
					<td class="hyperLink">
						<a href="../voterSection/giveVote.jsp">Vote</a>
					</td>
				</tr>
				
				<tr>
					<td class="hyperLink">
						<a href="../voterSection/result.jsp">Result</a>
					</td>
				</tr>
				
				<tr>
					<td class="hyperLink">
						<a href="../voterSection/changePassword.jsp">Change Password</a>
					</td>
				</tr>
				
			</table>
		
		</form>
		
	</div>
	 --%>
	<%-- ****************************** my code *********************************************************** --%>
</body>
</html>
<% } else {
	session.setAttribute("redirect", "Please sign-in again");
	response.sendRedirect("../mainToVoterSection/voterSignIn.jsp");
}%>