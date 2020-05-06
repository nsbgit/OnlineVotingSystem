<%@page import="validation.CheckPassword"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Organisation Registration</title>
<link href="../css/mainWebPage.css" rel="stylesheet">
<link rel="stylesheet" href="../css/index.css" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/Validation.js"></script>
<script type="text/javascript" src="../js/datetimepicker_css.js"></script>
<script type="text/javascript" src="../js/imageColck.js"></script>
<%--
	<script type="text/javascript">
	function validation1() {
		if(document.getElementById('firstName').value == "") {
			alert('Please enter first name.');
			document.getElementById('firstName').focus();
			return false;
		}
		
		if(document.getElementById('lastName').value == "") {
			alert('Please enter last name.');
			document.getElementById('lastName').focus();
			return false;
		}
		if(document.getElementById('organisationName').value == "") {
			alert('Please enter organisation name.');
			document.getElementById('organisationName').focus();
			return false;
		}
		
		if(document.getElementById('eMail').value == "") {
			alert('Please enter e-mail address.');
			document.getElementById('eMail').focus();
			return false;
		}
		
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
		
		if(document.getElementById('organisationAddress').value == "") {
			alert('Please enter organisation address.');
			document.getElementById('organisationAddress').focus();
			return false;
		}
		
		if(document.getElementById('agree').checked == false){
			alert('Please agree the terms and condition to continue.');
			return false;
		}
		if(document.getElementById('agree').innerHTML == ""){
			alert('Please agree the terms and condition to continue.');
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
		
		
		<div id="leftSideBarAdminSignIn"><%-- Content for  id "leftSideBar" Goes Here --%></div>
		
		<%-- ************************************************************************* --%>
		<div id="contentAdminHomePage">
		<%-- Paste div clas body here --%>
			<div>
				<h1 align="center">Organisation Registration</h1>
				<hr>
				<hr>
				<br>
				<br>
				
										<div style="text-align: center; padding-bottom: 20px;" class="">
											<script type="text/javascript">
																			
												new imageclock.display()
											
											</script>
										</div>
				
				<form action="<%= request.getContextPath() %>/SAdminSignUp.do" method="post" enctype="multipart/form-data">
					<table align="center" class="box" width="500px">
							<tr>
								<th colspan="2" class="header" align="center">Organisation Registration</th>
							</tr>
							<tr>
								<td>
									<label>First Name</label><em>*</em>
								</td>
								<td class="required">
									<input type="text" name="firstName" id="firstName" placeholder="Enter First Name" style="width: 100%">
								</td>
							</tr>
							
							<%--
								<tr>
									<td>
										<label>First Name</label><em>*</em>
									</td>
									<td class="required">
										<input type="text" name="firstName" id="dob" placeholder="Enter First Name" readonly="readonly" style="width: 100%">
										<img alt="Cal" src="../images/cal.gif" style="cursor:pointer;"  onclick="javascript:NewCssCal('dob','ddMMyyyy')">
									</td>
								</tr>
							--%>
							<tr>
								<td>
									<label>Last Name</label><em>*</em>
								</td>
								<td class="required">
									<input type="text" name="lastName" id="lastName" placeholder="Enter Last Name" style="width: 100%">
								</td>
							</tr>
							
							<tr>
								<td>
									<label>Upload Photo</label><em>*</em>
								</td>
								<td>
									<input type="file" placeholder = "Upload Photo" name="image">
								</td>
							</tr>
							
							<tr>
								<td>
									<label>Organisation Name</label><em>*</em>
								</td>
								<td class="required">
									<input type="text" name="organisationName" id="organisationName" placeholder="Enter Organisation Name"  style="width: 100%">
								</td>
							</tr>
							
							<tr>
								<td>
									<label>E-mail</label><em>*</em>
								</td>
								<td class="required email">
									<input type="text" name="eMail" id="eMail" style="width: 100%" placeholder="Enter e-mail address">
								</td>
							</tr>
						
							<tr>
								<td>
									<label>User ID</label><em>*</em>
								</td>
								<td class="required">
									<input type="text" name="userID" id="userID" placeholder="Enter User ID" style="width: 100%">
									
									<div id="msgdd"></div>
									<input type="button" value="Check Availiblity" class="btn" onclick="checkAvailiblity( '<%= request.getContextPath() %>/SAdmin.do?linkId=5');">
								</td>
							</tr>
							<%-- 
									<tr>
										<td>
											<label>Password</label><em>*</em>
										</td>
										<td class="required password">
											<input type="password" name="password" id="pwd" style="width: 100%" placeholder="Enter your password">
										</td>
									</tr>
									
									<tr>
										<td>
											<label>Confirm Password</label><em>*</em>
										</td>
										<td class="required">
											<input type="password" name="conPwd" id="conPwd" style="width: 100%" placeholder="Re-enter your password">
										</td>
									</tr>
							--%>
							<tr>
								<td>
									<label>Organisation Address</label><em>*</em>
								</td>
								<td class="required">
									<textarea rows="4" cols="15" name="organisationAddress" id="organisationAddress" style="width: 100%" placeholder="Enter Organisation Address"></textarea>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" style="padding-left: 30px" class="required">
									<input type="checkbox" name="agree" id="agree" ><i>I agree all terms and condition.</i><br><br>
								</td>
							</tr>
							
							
							<tr>
								<td colspan="2" align="center">
									<div id="btnadd">
										<input type="submit" value="Sign Up" disabled="disabled" class="btn" onclick="return validation()">
									</div>
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
		<h1 align="center">Organisation Registration</h1>
		<hr>
		<hr>
		<br>
		<br>
		
								<div style="text-align: center; padding-bottom: 20px;" class="">
									<script type="text/javascript">
																	
										new imageclock.display()
									
									</script>
								</div>
		
		<form action="<%= request.getContextPath() %>/SAdminSignUp.do" method="post" enctype="multipart/form-data">
			<table align="center" class="box" width="500px">
					<tr>
						<th colspan="2" class="header" align="center">Organisation Registration</th>
					</tr>
					<tr>
						<td>
							<label>First Name</label><em>*</em>
						</td>
						<td class="required">
							<input type="text" name="firstName" id="firstName" placeholder="Enter First Name" style="width: 100%">
						</td>
					</tr>
					
					<%--
						<tr>
							<td>
								<label>First Name</label><em>*</em>
							</td>
							<td class="required">
								<input type="text" name="firstName" id="dob" placeholder="Enter First Name" readonly="readonly" style="width: 100%">
								<img alt="Cal" src="../images/cal.gif" style="cursor:pointer;"  onclick="javascript:NewCssCal('dob','ddMMyyyy')">
							</td>
						</tr>
					--%>
					<%--
					<tr>
						<td>
							<label>Last Name</label><em>*</em>
						</td>
						<td class="required">
							<input type="text" name="lastName" id="lastName" placeholder="Enter Last Name" style="width: 100%">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Upload Photo</label><em>*</em>
						</td>
						<td>
							<input type="file" placeholder = "Upload Photo" name="image">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Organisation Name</label><em>*</em>
						</td>
						<td class="required">
							<input type="text" name="organisationName" id="organisationName" placeholder="Enter Organisation Name"  style="width: 100%">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>E-mail</label><em>*</em>
						</td>
						<td class="required email">
							<input type="text" name="eMail" id="eMail" style="width: 100%" placeholder="Enter e-mail address">
						</td>
					</tr>
				
					<tr>
						<td>
							<label>User ID</label><em>*</em>
						</td>
						<td class="required">
							<input type="text" name="userID" id="userID" placeholder="Enter User ID" style="width: 100%">
							
							<div id="msgdd"></div>
							<input type="button" value="Check Availiblity" class="btn" onclick="checkAvailiblity( '<%= request.getContextPath() %>/SAdmin.do?linkId=5');">
						</td>
					</tr>
					<%-- 
							<tr>
								<td>
									<label>Password</label><em>*</em>
								</td>
								<td class="required password">
									<input type="password" name="password" id="pwd" style="width: 100%" placeholder="Enter your password">
								</td>
							</tr>
							
							<tr>
								<td>
									<label>Confirm Password</label><em>*</em>
								</td>
								<td class="required">
									<input type="password" name="conPwd" id="conPwd" style="width: 100%" placeholder="Re-enter your password">
								</td>
							</tr>
					--%>
					<%--
					<tr>
						<td>
							<label>Organisation Address</label><em>*</em>
						</td>
						<td class="required">
							<textarea rows="4" cols="15" name="organisationAddress" id="organisationAddress" style="width: 100%" placeholder="Enter Organisation Address"></textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="padding-left: 30px" class="required">
							<input type="checkbox" name="agree" id="agree" ><i>I agree all terms and condition.</i><br><br>
						</td>
					</tr>
					
					
					<tr>
						<td colspan="2" align="center">
							<div id="btnadd">
								<input type="submit" value="Sign Up" disabled="disabled" class="btn" onclick="return validation()">
							</div>
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
		</div>
		 --%>
		<%-- ****************************** my code *********************************************************** --%>
</body>
</html>