<%@page import="java.util.Iterator"%>
<%@page import="logic.LAdminRegistration"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%if(session.getAttribute("accId") != null) {%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
	<%
		if(session.getAttribute("accId") != null) {
	%>	Profile of <%= session.getAttribute("organisationName") %>
	<%	}
	%>
</title>
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
	
	
	<div id="leftSideBar"><%-- Content for  id "leftSideBar" Goes Here --%>
		<div id="menuBar">
			<div id='cssmenu'>
				<ul>
					<li class='has-sub'><a href='#'><span>Admin Section</span></a>
					<ul>
						<li><a href="../adminSection/adminHomePage.jsp"><span>Admin Home Page</span></a></li>
						<li><a href="../adminSection/changePassword.jsp"><span>Change Password</span></a></li>
						<li><a href="../adminSection/createVoteEvent.jsp"><span>Crete Vote Event</span></a></li>
						<li><a href="../adminSection/editProfile.jsp"><span>Edit Profile</span></a></li>
						<li><a href="../adminSection/viewProfile.jsp"><span>View Profile</span></a></li>
						<li><a><span>
								<form action="<%= request.getContextPath() %>/SAdmin.do?linkId=3" method="post">
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
	<div id="contentAdminHomePage">
	<%-- Paste div clas body here --%>
		<div>
			<hr>
			<hr>
			<%
				if(session.getAttribute("accId") != null) {
			%>	<h1 align="center" class="pageHeader">View profile of  <%= session.getAttribute("organisationName") %></h1>
			<%	}
			%>
			<hr>
			<hr>
			<br>
			<form action="#" method="post">
				<table align="center" class="box" bordercolor="#ddcef0">
					<%
						ArrayList arrayList = new LAdminRegistration().getRecordsByAccId((String)session.getAttribute("accId"));
						Iterator iterator = arrayList.iterator();
						String[] data;
						while(iterator.hasNext())  {
						data = (String[])iterator.next();
					%>	
						
						<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td colspan="1" align="left" rowspan="12">
								<img alt="<%=data[0] + data[1]%>" src="../upload/admin/<%= data[11]%>" style="padding-left: 46px; border-width: 1px; width: 115px; height: 185px;">
							</td>
						</tr>
						<tr>
							<td><label>First Name:</label></td>
							<td ><%=data[0] %></td>
						</tr>
						
						<tr>
							<td><label>Last Name:</label></td>
							<td><%=data[1] %></td>
							
						</tr>
						
						<tr>
							<td><label>Organisation Name:</label></td>
							<td><%=data[2] %></td>
						</tr>
						
						<tr>
							<td><label>E-mail:</label></td>
							<td><%=data[3] %></td>
						</tr>
						
						<tr>
							<td><label>User ID:</label></td>
							<td><%=data[4] %></td>
						</tr>
						
						<tr>
							<td><label>Password:</label></td>
							<td><%=data[5] %></td>
						</tr>
						
						<tr>
							<td><label>Organisation Address :</label></td>
							<td><%=data[6] %></td>
						</tr>
						
						<tr>
							<td><label>Agree:</label></td>
							<td><%=data[7] %></td>
						</tr>
						
						<tr>
							<td><label>Registration Date:</label></td>
							<td><%=data[8] %></td>
						</tr>
						
						<tr>
							<td><label>Registration Day:</label></td>
							<td><%=data[9] %></td>
						</tr>
						
						<tr>
							<td><label>Registration Time:</label></td>
							<td><%=data[10] %></td>
						</tr>
						
						<tr>
							<td colspan="3" align="center"><a href="../adminSection/editProfile.jsp"> Edit </a></td>
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
	<div class="recordsBody">
		<hr>
		<hr>
		<%
			if(session.getAttribute("accId") != null) {
		%>	<h1 align="center" class="pageHeader">View profile of  <%= session.getAttribute("organisationName") %></h1>
		<%	}
		%>
		<hr>
		<hr>
		<br>
		<br>
		<form action="#" method="post">
			<table align="center" class="box" bordercolor="#ddcef0">
				<%-- 
				<tr>
					<th class="header">First Name</th>
					<th class="header">Last Name</th>
					<th class="header">Organisation Name</th>
					<th class="header">E-mail</th>
					<th class="header">User ID</th>
					<th class="header">Password</th>
					<th class="header">Organisation Address</th>
					<th class="header">Agree</th>
					<th class="header">Registration Date</th>
					<th class="header">Registration Day</th>
					<th class="header">RegistrationTime</th>
					<th class="header">Option</th>
				</tr>
				--%>
				<%--
				<%
					ArrayList arrayList = new LAdminRegistration().getRecordsByAccId((String)session.getAttribute("accId"));
					Iterator iterator = arrayList.iterator();
					String[] data;
					while(iterator.hasNext())  {
					data = (String[])iterator.next();
				%>	<%--
					<tr>
						<td><%= data[0] %></td>
						<td><%= data[1] %></td>
						<td><%= data[2] %></td>
						<td><%= data[3] %></td>
						<td><%= data[4] %></td>
						<td><%= data[5] %></td>
						<td><%= data[6] %></td>
						<td><%= data[7] %></td>
						<td><%= data[8] %></td>
						<td><%= data[9] %></td>
						<td><%= data[10] %></td>
						<td><a href="../adminSection/editProfile.jsp"> Edit </a> | <a href="#" onclick="delete()">Delete</a> </td>
					</tr>
					 --%>
					<%--
					<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td colspan="1" align="left" rowspan="12">
							<img alt="<%=data[0] + data[1]%>" src="../upload/admin/<%= data[11]%>" style="padding-left: 46px; border-width: 1px; width: 115px; height: 185px;">
						</td>
					</tr>
					<tr>
						<td><label>First Name:</label></td>
						<td ><%=data[0] %></td>
					</tr>
					
					<tr>
						<td><label>Last Name:</label></td>
						<td><%=data[1] %></td>
						
					</tr>
					
					<tr>
						<td><label>Organisation Name:</label></td>
						<td><%=data[2] %></td>
					</tr>
					
					<tr>
						<td><label>E-mail:</label></td>
						<td><%=data[3] %></td>
					</tr>
					
					<tr>
						<td><label>User ID:</label></td>
						<td><%=data[4] %></td>
					</tr>
					
					<tr>
						<td><label>Password:</label></td>
						<td><%=data[5] %></td>
					</tr>
					
					<tr>
						<td><label>Organisation Address :</label></td>
						<td><%=data[6] %></td>
					</tr>
					
					<tr>
						<td><label>Agree:</label></td>
						<td><%=data[7] %></td>
					</tr>
					
					<tr>
						<td><label>Registration Date:</label></td>
						<td><%=data[8] %></td>
					</tr>
					
					<tr>
						<td><label>Registration Day:</label></td>
						<td><%=data[9] %></td>
					</tr>
					
					<tr>
						<td><label>Registration Time:</label></td>
						<td><%=data[10] %></td>
					</tr>
					
					<tr>
						<td colspan="3" align="center"><a href="../adminSection/editProfile.jsp"> Edit </a></td>
					</tr>
					
				<%	}
				%>
				
			</table>
		</form>
	</div>
	 --%>
	<%-- ****************************** my code *********************************************************** --%>
</body>
</html>
<%} else {
	session.setAttribute("redirect", "Please sign-in again");
	response.sendRedirect("../mainToAdminSection/adminSignIn.jsp");
}%>