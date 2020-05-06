<%@page import="java.util.Iterator"%>
<%@page import="logic.DatabaseToArrayListConversion"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter Registration</title>
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
						<a href='../aboutUs.jsp'><span>About Us</span></a>
					</li>
				</ul>
			</div>
		</div>
		
		
		<div id="leftSideBarVoterSignUp"><%-- Content for  id "leftSideBar" Goes Here --%></div>
		
		<%-- ************************************************************************* --%>
		<div id="contentVoterSignUp">
		<%-- Paste div clas body here --%>
			<div>
				<h1 align="center">Voter Registration</h1>
				<hr>
				<hr>
				<br>
				<br>
				
										<div style="text-align: center; padding-bottom: 20px;" class="">
											<script type="text/javascript">
																			
												new imageclock.display()
											
											</script>
										</div>
				
				<form action="<%= request.getContextPath() %>/SVoterSignUp.do" method="post" enctype="multipart/form-data">
					<table align="center" class="box" width="500px">
						<tr>
							<th colspan="2" class="header" align="center">Voter Registration</th>
						</tr>
						<tr>
							<td>
								<label>First Name</label><em>*</em>
							</td>
							<td class="required">
								<input type="text" name="firstName" id="firstName" placeholder="Enter First Name" style="width: 100%">
							</td>
						</tr>
						
						<tr>
							<td>
								<label>Last Name</label><em>*</em>
							</td>
							<td class="required">
								<input type="text" name="lastName" id="lastName" placeholder="Enter Last Name" style="width: 100%">
							</td>
						</tr>
						
						
						<%
							String sql = "SELECT id, organisationName, firstName, lastName FROM admin_registration_information";
							ArrayList alist = new DatabaseToArrayListConversion().convertToArrayList(sql);
							Iterator it = alist.iterator();
							String[] data;
							if(it.hasNext()) {
						%>		<tr>
									<td>
										<label>Under organisation</label><em>*</em>
									</td>
									<td class="required">
										<select style="width: 100%" name="org" id="org">
											<option value=""> --- Select ---</option>
							
								<%	while(it.hasNext()) {
										data = (String[])it.next();
								%>		<option value="<%= data[0] %>"><%= data[1] %>	---> Run by -	<%= data[2]%> <%=data[3] %></option>
								<%	}
								%>
									</select>
									
									</td>
								</tr>
						<%	}
						%>
						<tr>
							<td>
								<label>Upload Photo</label>
							</td>
							<td>
								<input type="file" placeholder = "Upload Photo" name="image">
							</td>
						</tr>
						
						<tr>
							<td>
								<label>Date of birth</label><em>*</em>
							</td>
							<td class="required">
								<input type="text" name="dob" id="dob" placeholder="Enter date of birth" readonly="readonly" style="width: 100%">
								<img alt="Cal" src="../images/cal.gif" style="cursor:pointer;"  onclick="javascript:NewCssCal('dob','ddMMyyyy')">
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
								<input type="button" value="Check Availiblity" class="btn" onclick="checkAvailiblity( '<%= request.getContextPath() %>/SVoter.do?linkId=1');">
							</td>
						</tr>
						
						<tr>
							<td>
								<label>Address</label><em>*</em>
							</td>
							<td class="required">
								<textarea rows="4" cols="15" name="address" id="address" style="width: 100%" placeholder="Enter Address"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label>P.O.</label><em>*</em>
							</td>
							<td class="required">
								<input type="text" name="po" id="po" placeholder="Enter post office name" style="width: 100%">
							</td>
						</tr>
						
						<tr>
							<td>
								<label>Postal Code</label><em>*</em>
							</td>
							<td>
								<input type="text" name="postalCode" id="postalCode" placeholder="Enter Postal Code">
							</td>
						
						</tr>
						
						<tr>
							<td>
								<label>State</label><em>*</em>
							</td>
							<td class="required">
								<select style="width: 100%" name="state" id="state">
									<option value="">-- Select --</option>
									<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadra and Nagar Haveli ">Dadra and Nagar Haveli </option>
									<option value="Daman and Diu">Daman and Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jammu and Kashmir">Jammu and Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka[">Karnataka[</option>
									<option value="Kerala">Kerala</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Puducherry">Puducherry</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>
								</select>
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
							if(session.getAttribute("registrationMsgS") != null) {
						%>	<tr>
								<td colspan="2" align="center">
									<font color="green"><b><%= session.getAttribute("registrationMsgS") %></b></font>
									<% session.removeAttribute("registrationMsgS"); %>
								</td>
							</tr>
						<%	}
						%>
						
						<%
							if(session.getAttribute("registrationMsgN") != null) {
						%>	<tr>
								<td colspan="2" align="center">
									<font color="red"><b><%= session.getAttribute("registrationMsgN") %></b></font>
									<% session.removeAttribute("registrationMsgN"); %>
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
		<h1 align="center">Voter Registration</h1>
		<hr>
		<hr>
		<br>
		<br>
		
								<div style="text-align: center; padding-bottom: 20px;" class="">
									<script type="text/javascript">
																	
										new imageclock.display()
									
									</script>
								</div>
		
		<form action="<%= request.getContextPath() %>/SVoterSignUp.do" method="post" enctype="multipart/form-data">
			<table align="center" class="box" width="500px">
				<tr>
					<th colspan="2" class="header" align="center">Voter Registration</th>
				</tr>
				<tr>
					<td>
						<label>First Name</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="firstName" id="firstName" placeholder="Enter First Name" style="width: 100%">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Last Name</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="lastName" id="lastName" placeholder="Enter Last Name" style="width: 100%">
					</td>
				</tr>
				
				
				<%
					String sql = "SELECT id, organisationName, firstName, lastName FROM admin_registration_information";
					ArrayList alist = new DatabaseToArrayListConversion().convertToArrayList(sql);
					Iterator it = alist.iterator();
					String[] data;
					if(it.hasNext()) {
				%>		<tr>
							<td>
								<label>Under organisation</label><em>*</em>
							</td>
							<td class="required">
								<select style="width: 100%" name="org" id="org">
									<option value=""> --- Select ---</option>
					
						<%	while(it.hasNext()) {
								data = (String[])it.next();
						%>		<option value="<%= data[0] %>"><%= data[1] %>	---> Run by -	<%= data[2]%> <%=data[3] %></option>
						<%	}
						%>
							</select>
							
							</td>
						</tr>
				<%	}
				%>
				<tr>
					<td>
						<label>Upload Photo</label>
					</td>
					<td>
						<input type="file" placeholder = "Upload Photo" name="image">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Date of birth</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="dob" id="dob" placeholder="Enter date of birth" readonly="readonly" style="width: 100%">
						<img alt="Cal" src="../images/cal.gif" style="cursor:pointer;"  onclick="javascript:NewCssCal('dob','ddMMyyyy')">
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
						<input type="button" value="Check Availiblity" class="btn" onclick="checkAvailiblity( '<%= request.getContextPath() %>/SVoter.do?linkId=1');">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Address</label><em>*</em>
					</td>
					<td class="required">
						<textarea rows="4" cols="15" name="address" id="address" style="width: 100%" placeholder="Enter Address"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label>P.O.</label><em>*</em>
					</td>
					<td class="required">
						<input type="text" name="po" id="po" placeholder="Enter post office name" style="width: 100%">
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Postal Code</label><em>*</em>
					</td>
					<td>
						<input type="text" name="postalCode" id="postalCode" placeholder="Enter Postal Code">
					</td>
				
				</tr>
				
				<tr>
					<td>
						<label>State</label><em>*</em>
					</td>
					<td class="required">
						<select style="width: 100%" name="state" id="state">
							<option value="">-- Select --</option>
							<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
							<option value="Andhra Pradesh">Andhra Pradesh</option>
							<option value="Arunachal Pradesh">Arunachal Pradesh</option>
							<option value="Assam">Assam</option>
							<option value="Bihar">Bihar</option>
							<option value="Chandigarh">Chandigarh</option>
							<option value="Chhattisgarh">Chhattisgarh</option>
							<option value="Dadra and Nagar Haveli ">Dadra and Nagar Haveli </option>
							<option value="Daman and Diu">Daman and Diu</option>
							<option value="Delhi">Delhi</option>
							<option value="Goa">Goa</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachal Pradesh">Himachal Pradesh</option>
							<option value="Jammu and Kashmir">Jammu and Kashmir</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Karnataka[">Karnataka[</option>
							<option value="Kerala">Kerala</option>
							<option value="Lakshadweep">Lakshadweep</option>
							<option value="Madhya Pradesh">Madhya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Meghalaya">Meghalaya</option>
							<option value="Mizoram">Mizoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Odisha">Odisha</option>
							<option value="Puducherry">Puducherry</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamil Nadu">Tamil Nadu</option>
							<option value="Tripura">Tripura</option>
							<option value="Uttar Pradesh">Uttar Pradesh</option>
							<option value="Uttarakhand">Uttarakhand</option>
							<option value="West Bengal">West Bengal</option>
						</select>
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
					if(session.getAttribute("registrationMsgS") != null) {
				%>	<tr>
						<td colspan="2" align="center">
							<font color="green"><b><%= session.getAttribute("registrationMsgS") %></b></font>
							<% session.removeAttribute("registrationMsgS"); %>
						</td>
					</tr>
				<%	}
				%>
				
				<%
					if(session.getAttribute("registrationMsgN") != null) {
				%>	<tr>
						<td colspan="2" align="center">
							<font color="red"><b><%= session.getAttribute("registrationMsgN") %></b></font>
							<% session.removeAttribute("registrationMsgN"); %>
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