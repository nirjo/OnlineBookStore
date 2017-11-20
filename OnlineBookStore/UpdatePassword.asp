<%

Option Explicit

Dim StrOldPassword, StrNewPassword, StrCheckPasswordQuery, StrUserPasswordQuery, BlnSuccess, ObjCon, ObjRSCheckPassword, ObjRSUserPassword

StrOldPassword = Trim(Request.Form("TxtOldPassword"))
StrNewPassword = Trim(Request.Form("TxtNewPassword"))

IF Session("LoginBuyer") = "" OR Session("LoginUser") = "" Then
Response.Redirect("Default.asp")
END IF

Set ObjCon = Server.CreateObject("ADODB.Connection")
ObjCon.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("db/BookStore.mdb")

StrCheckPasswordQuery = "Select Password From Buyers Where BuyerID=" & CInt(Session("LoginBuyer"))
Set ObjRSCheckPassword = ObjCon.Execute(StrCheckPasswordQuery)

IF LCase(ObjRSCheckPassword("Password")) = LCase(StrOldPassword) Then
BlnSuccess = True
ELSE
BlnSuccess = False
END IF

IF BlnSuccess = True Then
StrUserPasswordQuery = "Update Buyers SET Password='"&StrNewPassword&"' Where BuyerID=" & CInt(Session("LoginBuyer"))
Set ObjRSUserPassword = ObjCon.Execute(StrUserPasswordQuery)
END IF

ObjCon.Close
Set ObjCon = NOTHING
%>

<html>
	<head>
		<title>Online Book Store</title>
		<script language="javascript" src="jscript/HandyFunctions.js"></script>
		<link rel="stylesheet" type="text/css" href="styles/global.css">
	</head>
	<body>
		<table border="0" align="center">
			<%
				IF BlnSuccess = True Then
			%>
			<tr>
				<td align="center" class="SimpleText"><b>Your password updated successfully.</b></td>
			</tr>
			<tr>
				<td align="center"><br><br><a href="javascript:CloseWindow()" class="NormalLink">Close Window</a></td>
			</tr>
			<%
				ELSE
			%>
			<tr>
				<td align="center" class="SimpleText"><b>Upate Error: Your old password doesn't match.</b></td>
			</tr>
			<tr>
				<td align="center"><br><br><a href="javascript:history.back()" class="NormalLink">Click Here To Try Again</a></td>
			</tr>
			<%
				END IF
			%>
		</table>
	</body>
</html>