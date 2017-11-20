<%
IF Session("LoginBuyer") = "" OR Session("LoginUser") = "" Then
Response.Redirect("Default.asp")
END IF
%>

<html>
	<head>
		<title>Online Book Store</title>
		<script language="javascript" src="jscript/FormValidation.js"></script>
		<script language="javascript" src="jscript/HandyFunctions.js"></script>
		<link rel="stylesheet" type="text/css" href="styles/global.css">
	</head>
	<body>
		<form name="FrmEditPassword" method="post" action="UpdatePassword.asp">
			<table border="0">
				<tr>
					<td class="SimpleText">Old Password:</td>
					<td><input type="password" name="TxtOldPassword"></td>
				</tr>
				<tr>
					<td class="SimpleText">New Password:</td>
					<td><input type="password" name="TxtNewPassword"></td>
				</tr>
				<tr>
					<td class="SimpleText">Re-type New Password:</td>
					<td><input type="password" name="TxtReTypeNewPassword"></td>
				</tr>
				<tr>
					<td colspan="2">
					<center>
					<input type="submit" name="submit" value="Save New Password" onclick="return EditPassword()">
					&nbsp;&nbsp;
					<input type="button" name="BtnCancel" value="Cancel" onclick="javascript:CloseWindow()">
					</center>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>