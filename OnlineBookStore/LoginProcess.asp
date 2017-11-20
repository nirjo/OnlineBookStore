<%
Option Explicit

Dim StrUsername, StrPassword, StrLoginQuery, BlnIsValidUser, ObjCon, ObjRSLogin

IF Trim(Request.Form("TxtUsername")) = "" OR Trim(Request.Form("TxtPassword")) = "" Then
Response.Redirect("Default.asp")
END IF

StrUsername = Trim(Request.Form("TxtUsername"))
StrPassword = Trim(Request.Form("TxtPassword"))

Set ObjCon = Server.CreateObject("ADODB.Connection")
ObjCon.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("db/BookStore.mdb")

StrLoginQuery = "Select BuyerID, Username, Password From Buyers where Username='"&StrUsername&"'"
Set ObjRSLogin = ObjCon.Execute(StrLoginQuery)

While NOT ObjRSLogin.EOF

IF LCase(ObjRSLogin("Username")) = LCase(StrUsername) AND LCase(ObjRSLogin("Password")) = LCase(StrPassword) Then
BlnIsValidUser = True
Session("LoginBuyer") = CStr(ObjRSLogin("BuyerID"))
Session("LoginUser") = StrUsername
ELSE
BlnIsValidUser = False
END IF
ObjRSLogin.MoveNext

Wend

ObjCon.Close
Set ObjCon = NOTHING

IF BlnIsValidUser = True Then
Response.Redirect("LoginSuccess.asp")
ELSE
Response.Redirect("LoginFailure.asp")
END IF

%>