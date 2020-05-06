<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Section - Sign In</title>
<link href="../css/mainWebPage.css" rel="stylesheet">
<link rel="stylesheet" href="../css/index.css" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/Validation.js"></script>
<%--
<script type="text/javascript">
	function validation() {
		if(document.getElementById('userID').value == "") {
			alert('Please enter user id.');
			document.getElementById('userID').focus();
			return false;
		}
		
		if(document.getElementById('password').value == "") {
			alert('Please enter password.');
			document.getElementById('password').focus();
			return false;
		}
	}
</script>
 --%>
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
		
		
		<div id="leftSideBar"><%-- Content for  id "leftSideBar" Goes Here --%></div>
		
		<%-- ************************************************************************* --%>
		<div id="content">
		<%-- Paste div clas body here --%>
			<div>
				<h1 align="center">Welcome to administrator section</h1>
				<h4 align="center">If you have a account sign in with your user id and password if not just <font color="red"><i><b>SIGN UP</b></i></font></h4>
				<hr>
				<hr>
				<div>
				<hr>
				<hr>
				<br>
				<br>
					
					<form action="<%= request.getContextPath() %>/SAdmin.do?linkId=2" method="post">
						<table align="center" class="box" width="500px">
							<tr>
								<th class="header" colspan="2">Organisation/Admin Sign In</th>
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
								<td>
									<label>Password</label><em>*</em>
								</td>
								<td class="required password">
									<input type="password" name="password" id="password" placeholder="Enter Password" style="width: 100%"><br><br>
								</td>
							</tr>
							
							<tr>
								<td></td>
								<td class="hyperLink">
									<a href="../adminSection/forgottenPassword.jsp">Forgotten your password?</a>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="Sign In" class="btn" onclick="return validation()">
									<input type="reset" value="Reset" class="btn"><br><br>
								</td>
							</tr>
							
							
							<tr>
								<td colspan="2" class="hyperLink" align="center">
									<a href="adminSignUp.jsp">Don't have an account. Create account here</a>
								</td>
							</tr>
							
							<%
								if(session.getAttribute("signInMsg") != null) {%>
									<br>
									<br>
									<tr>
										<td colspan="2" align="center">
											<font color="red"><b><%= session.getAttribute("signInMsg") %></b></font>
											<% session.removeAttribute("signInMsg"); %>
										</td>
									</tr>
							<% 	}
							%>
							
							<%
								if(session.getAttribute("redirect") != null) {%>
									<br>
									<br>
									<tr>
										<td colspan="2" align="center">
											<font color="green"><b><%= session.getAttribute("redirect") %></b></font>
											<% session.removeAttribute("redirect"); %>
										</td>
									</tr>
							<% 	}
							%>
							
							<%
								if(session.getAttribute("signOut") != null) {%>
									<br>
									<br>
									<tr>
										<td colspan="2" align="center">
											<font color="green"><b><%= session.getAttribute("signOut") %></b></font>
											<% session.removeAttribute("signOut"); %>
										</td>
									</tr>
							<% 	}
							%>
							
						</table>
					</form>
				</div>
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
		<h1 align="center">Welcome to administrator section</h1>
		<h4 align="center">If you have a account sign in with your user id and password if not just <font color="red"><i><b>SIGN UP</b></i></font></h4>
		<hr>
		<hr>
		<div>
			<div class="hyperLink">
				<p>
					<a href="../mainWebHomePage.jsp">Home</a>
					--> <a href="../mainToAdminSection/adminSignIn.jsp">Organisation Sign In</a>
				</p>
			</div>
		<hr>
		<hr>
		<br>
		<br>
			
			<form action="<%= request.getContextPath() %>/SAdmin.do?linkId=2" method="post">
				<table align="center" class="box" width="500px">
					<tr>
						<th class="header" colspan="2">Organisation/Admin Sign In</th>
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
						<td>
							<label>Password</label><em>*</em>
						</td>
						<td class="required password">
							<input type="password" name="password" id="password" placeholder="Enter Password" style="width: 100%"><br><br>
						</td>
					</tr>
					
					<tr>
						<td></td>
						<td class="hyperLink">
							<a href="../adminSection/forgottenPassword.jsp">Forgotten your password?</a>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="Sign In" class="btn" onclick="return validation()">
							<input type="reset" value="Reset" class="btn"><br><br>
						</td>
					</tr>
					
					
					<tr>
						<td colspan="2" class="hyperLink" align="center">
							<a href="adminSignUp.jsp">Don't have an account. Create account here</a>
						</td>
					</tr>
					
					<%
						if(session.getAttribute("signInMsg") != null) {%>
							<br>
							<br>
							<tr>
								<td colspan="2" align="center">
									<font color="green"><b><%= session.getAttribute("signInMsg") %></b></font>
									<% session.removeAttribute("signInMsg"); %>
								</td>
							</tr>
					<% 	}
					%>
					
					<%
						if(session.getAttribute("redirect") != null) {%>
							<br>
							<br>
							<tr>
								<td colspan="2" align="center">
									<font color="green"><b><%= session.getAttribute("redirect") %></b></font>
									<% session.removeAttribute("redirect"); %>
								</td>
							</tr>
					<% 	}
					%>
					
					<%
						if(session.getAttribute("signOut") != null) {%>
							<br>
							<br>
							<tr>
								<td colspan="2" align="center">
									<font color="green"><b><%= session.getAttribute("signOut") %></b></font>
									<% session.removeAttribute("signOut"); %>
								</td>
							</tr>
					<% 	}
					%>
					
				</table>
			</form>
		</div>
	</div>
	 --%>
	<%-- ****************************** my code *********************************************************** --%>
</body>
</html>