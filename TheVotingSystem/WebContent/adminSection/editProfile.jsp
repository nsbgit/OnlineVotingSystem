<%@page import="java.util.Iterator"%>
<%@page import="logic.DatabaseToArrayListConversion"%>
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
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/Validation.js"></script>
<script type="text/javascript" src="../js/datetimepicker_css.js"></script>
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
					<a href='#'><span>About Us</span></a>
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
		<%
			if(session.getAttribute("accId") != null) {
		%>	<h1 align="center" class="pageHeader">Edit profile of  <%= session.getAttribute("organisationName") %></h1>
		<%	}
		%>
		<hr>
		<hr>
		
							
								<div style="text-align: center; padding-bottom: 20px;" class="">
									<script type="text/javascript">
																	
										new imageclock.display()
									
									</script>
								</div>
								
								
		<%
			String sql = "SELECT id, firstName, lastName, organisationName, eMail, organisationAddress FROM admin_registration_information";
			ArrayList arrayList = new DatabaseToArrayListConversion().convertToArrayListBySession(sql, (String)session.getAttribute("accId"));
			Iterator iterator = arrayList.iterator();
			String[] data;
			while(iterator.hasNext()) {
				data = (String[])iterator.next();
		%>
		
		<form action="<%= request.getContextPath() %>/SAdmin.do?linkId=4" method="post">
			<table class="box" align="center" width="500px">
				<tr>
					<th colspan="2" class="header" align="center">Profile update</th>
				</tr>
				
				<tr>
					<td>
						<label>First Name</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="firstName" id="firstName" placeholder="Enter First Name" style="width: 100%" value="<%=data[0] %>">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Last Name</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="lastName" id="lastName" placeholder="Enter Last Name" style="width: 100%" value="<%=data[1] %>">
					</td>
				</tr>
				
				
				<tr>
					<td>
						<label>Organisation Name</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="organisationName" id="organisationName" placeholder="Enter Organisation Name"  style="width: 100%" value="<%=data[2] %>">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>E-mail</label><em>*</em>
					</td>
					<td class="required email">
						<input type="text" name="eMail" id="eMail" style="width: 100%" placeholder="Enter e-mail address" value="<%=data[3] %>">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Organisation Address</label><em>*</em>
					</td>
					<td class="required">
						<textarea rows="4" cols="15" name="organisationAddress" id="organisationAddress" style="width: 100%" placeholder="Enter Organisation Address"><%=data[4] %></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Save" class="btn" onclick="return validation()">
						<input type="reset" value="Reset" class="btn"><br><br>
					</td>
				</tr>
					
					<%
						if(session.getAttribute("registrationMsg") != null) {
					%>	<tr>
							<td colspan="2" align="center">
								<font color="green"><b><%= session.getAttribute("registrationMsg") %></b></font>
								<% session.removeAttribute("registrationMsg"); %>
							</td>
						</tr>
					<%	}
					%>
				
				
			</table>
		</form>
		<%	}
		%>
		
	</div>
	
	</div>
	
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
		%>	<h1 align="center" class="pageHeader">View profile of  <%= session.getAttribute("organisationName") %></h1>
		<%	}
		%>
		<hr>
		<hr>
		<br>
		<br>
		
							
								<div style="text-align: center; padding-bottom: 20px;" class="">
									<script type="text/javascript">
																	
										new imageclock.display()
									
									</script>
								</div>
								
								
		<%
			String sql = "SELECT id, firstName, lastName, organisationName, eMail, organisationAddress FROM admin_registration_information";
			ArrayList arrayList = new DatabaseToArrayListConversion().convertToArrayListBySession(sql, (String)session.getAttribute("accId"));
			Iterator iterator = arrayList.iterator();
			String[] data;
			while(iterator.hasNext()) {
				data = (String[])iterator.next();
		%>
		
		<form action="<%= request.getContextPath() %>/SAdmin.do?linkId=4" method="post">
			<table class="box" align="center" width="500px">
				<tr>
					<th colspan="2" class="header" align="center">Profile update</th>
				</tr>
				
				<tr>
					<td>
						<label>First Name</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="firstName" id="firstName" placeholder="Enter First Name" style="width: 100%" value="<%=data[0] %>">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Last Name</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="lastName" id="lastName" placeholder="Enter Last Name" style="width: 100%" value="<%=data[1] %>">
					</td>
				</tr>
				<%--
				<tr>
					<td>
						<label>Upload Photo</label><em>*</em>
					</td>
					<td>
						<input type="file" placeholder = "Upload Photo">
					</td>
				</tr>
				 --%>
				<%--
				<tr>
					<td>
						<label>Organisation Name</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="organisationName" id="organisationName" placeholder="Enter Organisation Name"  style="width: 100%" value="<%=data[2] %>">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>E-mail</label><em>*</em>
					</td>
					<td class="required email">
						<input type="text" name="eMail" id="eMail" style="width: 100%" placeholder="Enter e-mail address" value="<%=data[3] %>">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Organisation Address</label><em>*</em>
					</td>
					<td class="required">
						<textarea rows="4" cols="15" name="organisationAddress" id="organisationAddress" style="width: 100%" placeholder="Enter Organisation Address"><%=data[4] %></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Save" class="btn" onclick="return validation()">
						<input type="reset" value="Reset" class="btn"><br><br>
					</td>
				</tr>
					
					<%
						if(session.getAttribute("registrationMsg") != null) {
					%>	<tr>
							<td colspan="2" align="center">
								<font color="green"><b><%= session.getAttribute("registrationMsg") %></b></font>
								<% session.removeAttribute("registrationMsg"); %>
							</td>
						</tr>
					<%	}
					%>
				
				
			</table>
		</form>
		<%	}
		%>
		
	</div>
	 --%>
	<%-- ****************************** my code *********************************************************** --%>
</body>
</html>
<% } else {
	session.setAttribute("redirect", "Please sign-in again");
	response.sendRedirect("../mainToAdminSection/adminSignIn.jsp");
}%>