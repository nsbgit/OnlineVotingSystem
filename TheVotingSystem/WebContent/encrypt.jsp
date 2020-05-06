<%@page import="logic.EncryptDecryptStringWithDES"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Encrypt</title>
</head>
<body>

	<form action="#" method="post">
		<table align="center">
			<tr>
				<th colspan="2" style="padding-bottom: 20px">Encrypt</th>
			</tr>
			
			<tr>
				<td>
					<label>Original String</label>
				</td>
				<td>
					<input type="text" name="encOrg" id="encOrg" placeholder="Enter original string">
				</td>
			</tr>
			
			<tr>
				<td>
					<label>Encrypted String</label>
				</td>
				<td>
					<input type="text" name="enc" id="enc" placeholder="Encrypted string" value="<%= new EncryptDecryptStringWithDES().encrypt(request.getParameter("encOrg"))%>">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>