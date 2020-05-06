<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/css.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/datetimepicker_css.js"></script>

</head>
<body>
	<form action="<%=request.getContextPath() %>/MyServlet.do" method="post">
		<table class="shadow" align="center" border="0">
		<tr>
			<th colspan="3">Registration Form</th>
		</tr>
			<tr class="even">
				<td width="10%"></td>
				<td width="30%"><label>Name</label><m>*</m></td>
				<td width="60%"><input type="text" name="a" class="txt"> </td>
			</tr>
			<tr class="odd">
				<td width="10%"></td>
				<td width="30%"><label>Roll</label><m>*</m></td>
				<td width="60%"><input type="text" name="a" class="txt"> </td>
			</tr>
			<tr class="even">
				<td width="10%"></td>
				<td width="30%"><label>Standard</label></td>
				<td width="60%"><input type="text" name="a" class="txt"> </td>
			</tr>
			<tr class="odd">
				<td width="10%"></td>
				<td width="30%"><label>Address</label></td>
				<td width="60%"><textarea rows="4" cols="20" class="txt"></textarea>
			</tr>
			<tr  class="even">
				<td width="10%"></td>
				<td width="30%"><label>Date of Birth</label></td>
				<td width="60%">
					<input type="text" name="a" id="dob" class="txt">
					<img style="cursor:pointer;"  onclick="javascript:NewCssCal('dob','ddMMyyyy')"   src="images/cal.gif"/>
					 </td>
			</tr>
			<tr class="odd">
				<td colspan="3" align="center"><input type="submit" value="Save" class="btn"> </td>
				
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
		</table>
		
	</form>
</body>
</html>