<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgotten Your Password</title>
<link href="../css/mainWebPage.css" rel="stylesheet">
<link rel="stylesheet" href="../css/index.css" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/Validation.js"></script>
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
	<div id="content">
	<%-- Paste div clas body here --%>
		<div>
			<h1 align="center">Forgotten your password?</h1>
			<hr>
			<hr>
			<br>
			<br>
			<form action="<%= request.getContextPath() %>/SAdmin.do?linkId=8" method="post">
				<table class="box" align="center">
					<tr align="center">
						<th class="header" colspan="2">Forgotten your password?</th>
					</tr>
					
					<tr>
						<td>
							<label>User ID</label><em>*</em>
						</td>
						<td class="required">
							<input type="text" name="userID" id="userID" placeholder="Enter User ID" style="width: 100%">
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="Send password on registered e-mail ID" class="btn" onclick="return validation()">
							<input type="reset" value="Reset" class="btn">
						</td>
					</tr>
					
					<%
						if(session.getAttribute("isSendS") != null) {%>
							<br>
							<br>
							<tr>
								<td colspan="2" align="center">
									<font color="green"><b><%= session.getAttribute("isSendS") %></b></font>
									<% session.removeAttribute("isSendS"); %>
								</td>
							</tr>
					<% 	}
					%>
					
					<%
						if(session.getAttribute("isSendN") != null) {%>
							<br>
							<br>
							<tr>
								<td colspan="2" align="center">
									<font color="red"><b><%= session.getAttribute("isSendN") %></b></font>
									<% session.removeAttribute("isSendN"); %>
								</td>
							</tr>
					<% 	}
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
		<h1 align="center">Forgotten your password?</h1>
		<hr>
		<hr>
		<br>
		<br>
		<form action="<%= request.getContextPath() %>/SAdmin.do?linkId=8" method="post">
			<table class="box" align="center">
				<tr align="center">
					<th class="header" colspan="2">Forgotten your password?</th>
				</tr>
				
				<tr>
					<td>
						<label>User ID</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="userID" id="userID" placeholder="Enter User ID" style="width: 100%">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Send password on registered e-mail ID" class="btn" onclick="return validation()">
						<input type="reset" value="Reset" class="btn">
					</td>
				</tr>
				
				<%
					if(session.getAttribute("isSendS") != null) {%>
						<br>
						<br>
						<tr>
							<td colspan="2" align="center">
								<font color="green"><b><%= session.getAttribute("isSendS") %></b></font>
								<% session.removeAttribute("isSendS"); %>
							</td>
						</tr>
				<% 	}
				%>
				
				<%
					if(session.getAttribute("isSendN") != null) {%>
						<br>
						<br>
						<tr>
							<td colspan="2" align="center">
								<font color="red"><b><%= session.getAttribute("isSendN") %></b></font>
								<% session.removeAttribute("isSendN"); %>
							</td>
						</tr>
				<% 	}
				%>
			
			</table>
		</form>
	</div>
	 --%>
<%-- ****************************** my code *********************************************************** --%>
</body>
</html>