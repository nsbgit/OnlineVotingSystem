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
	%>	Change password ----  <%= session.getAttribute("voterName") %>
	<%	}
	%>
</title>
<link href="../css/mainWebPage.css" rel="stylesheet">
<link rel="stylesheet" href="../css/index.css" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/Validation.js"></script>
<script type="text/javascript" src="../js/imageColck.js"></script>
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
		
		
		<div id="leftSideBar">
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
		<div id="content">
		<%-- Paste div clas body here --%>
				<div>
					<h1 align="center">Change password ---- <%= session.getAttribute("voterName") %></h1>
					<hr>
					<hr>
					<br>
					<br>
					
											<div style="text-align: center; padding-bottom: 20px;" class="">
												<script type="text/javascript">
																				
													new imageclock.display()
												
												</script>
											</div>
					<form action="<%= request.getContextPath() %>/SVoter.do?linkId=7" method="post">
						<table align="center" class="box" width="500px">
							<tr>
								<th colspan="2" class="header" align="center">Change Password</th>
							</tr>
							
							<tr>
								<td>
									<label>Old Password</label><em>*</em>
								</td>
								<td class="required password" style="padding-right: 6px;">
									<input type="password" name="oldPassword" id="oldPassword" placeholder="Enter old password" style="width: 100%">
								</td>
							</tr>
							
							<tr>
								<td>
									<label>New Password</label><em>*</em>
								</td>
								<td class="required password" style="padding-right: 6px;">
									<input type="password" name="password" id="pwd" placeholder="Re-enter new password" style="width: 100%">
								</td>
							</tr>
							
							<tr>
								<td>
									<label>Confirm Password</label><em>*</em>
								</td>
								<td class="required" style="padding-right: 6px;">
									<input type="password" name="conPwd" id="conPwd" style="width: 100%" placeholder="Re-enter your password">
								</td>
							</tr>
							
							<tr>
								<td colspan="2" align="center" style="padding-top: 17px;">
									<input type="submit" value="Change Password" class="btn" onclick="return validation()">
									<input type="reset" value="Reset" class="btn"><br><br>
								</td>
							</tr>
							
							<%
								if(session.getAttribute("changeMsg") != null) {
							%>	<tr>
									<td colspan="2" align="center">
										<font color="green"><b><%= session.getAttribute("changeMsg") %></b></font>
										<% session.removeAttribute("changeMsg"); %>
									</td>
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
		<h1 align="center">Change password ---- <%= session.getAttribute("voterName") %></h1>
		<hr>
		<hr>
		<br>
		<br>
		
								<div style="text-align: center; padding-bottom: 20px;" class="">
									<script type="text/javascript">
																	
										new imageclock.display()
									
									</script>
								</div>
		<form action="<%= request.getContextPath() %>/SVoter.do?linkId=7" method="post">
			<table align="center" class="box" width="500px">
				<tr>
					<th colspan="2" class="header" align="center">Change Password</th>
				</tr>
				
				<tr>
					<td>
						<label>Old Password</label><em>*</em>
					</td>
					<td class="required password" style="padding-right: 6px;">
						<input type="password" name="oldPassword" id="oldPassword" placeholder="Enter old password" style="width: 100%">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>New Password</label><em>*</em>
					</td>
					<td class="required password" style="padding-right: 6px;">
						<input type="password" name="password" id="pwd" placeholder="Re-enter new password" style="width: 100%">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Confirm Password</label><em>*</em>
					</td>
					<td class="required" style="padding-right: 6px;">
						<input type="password" name="conPwd" id="conPwd" style="width: 100%" placeholder="Re-enter your password">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center" style="padding-top: 17px;">
						<input type="submit" value="Change Password" class="btn" onclick="return validation()">
						<input type="reset" value="Reset" class="btn"><br><br>
					</td>
				</tr>
				
				<%
					if(session.getAttribute("changeMsg") != null) {
				%>	<tr>
						<td colspan="2" align="center">
							<font color="green"><b><%= session.getAttribute("changeMsg") %></b></font>
							<% session.removeAttribute("changeMsg"); %>
						</td>
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
<% } else {
	session.setAttribute("redirect", "Please sign-in again");
	response.sendRedirect("../mainToVoterSection/voterSignIn.jsp");
}%>