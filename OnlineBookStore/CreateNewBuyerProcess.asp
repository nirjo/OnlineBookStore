<%

Dim StrUsername, StrPassword, StrFirstname, StrLastname, StrCountry, StrCity, StrAddress, StrPhoneNumber, StrCreditCardNumber, StrCreditCardExpire, StrBuyerQuery, StrNewBuyerQuery, BlnDuplicateBuyer, ObjRSBuyer

StrUsername = Trim(Replace(Request.Form("TxtUsername"), "'", "''"))
StrPassword = Trim(Replace(Request.Form("TxtPassword"), "'", "''"))
StrFirstname = Trim(Replace(Request.Form("TxtFirstname"), "'", "''"))
StrLastname = Trim(Replace(Request.Form("TxtLastname"), "'", "''"))
StrCountry = Trim(Replace(Request.Form("TxtCountry"), "'", "''"))
StrCity = Trim(Replace(Request.Form("TxtCity"), "'", "''"))
StrAddress = Trim(Replace(Request.Form("TxtAddress"), "'", "''"))
StrPhoneNumber = Trim(Replace(Request.Form("TxtPhoneNumber"), "'", "''"))
StrCreditCardNumber = Trim(Replace(Request.Form("TxtCreditCardNumber"), "'", "''"))
StrCreditCardExpire = Trim(Replace(Request.Form("TxtCreditCardExpireDate"), "'", "''"))

IF StrUsername = "" OR StrPassword = "" OR StrCreditCardNumber = "" OR StrCreditCardExpire = "" Then
Response.Redirect("Default.asp")
END IF

StrBuyerQuery = "Select Username From Buyers Where Username='"&StrUsername&"'"
Set ObjRSBuyer = ObjCon.Execute(StrBuyerQuery)

While Not ObjRSBuyer.EOF

IF LCase(ObjRSBuyer("Username")) = LCase(StrUsername) Then
BlnDuplicateBuyer = True
ELSE
BlnDuplicateBuyer = False
END IF

ObjRSBuyer.MoveNext
Wend

IF BlnDuplicateBuyer = False Then
call AddNewBuyer
ELSE
Response.Redirect("DuplicateError.asp")
END IF

Sub AddNewBuyer
StrNewBuyerQuery = "Insert into Buyers (Username, Password, Firstname, Lastname, Country, City, Address, PhoneNumber, CreditCardNumber, CreditCardExpire) Values ('"&StrUsername&"', '"&StrPassword&"', '"&StrFirstname&"', '"&StrLastname&"', '"&StrCountry&"', '"&StrCity&"', '"&StrAddress&"', '"&StrPhoneNumber&"', '"&StrCreditCardNumber&"', '"&StrCreditCardExpire&"')"
ObjCon.Execute(StrNewBuyerQuery)
End Sub

%>

<table border="0">
	<tr>
		<td><h3><font face="verdana, arial" color="darkblue">Congratulation</font></td>
	</tr>
</table>
<hr color="black" noshade>
<table border="0">
	<tr>
		<td class="SimpleText">Here is your account information:-</td>
	</tr>
	<tr>
		<td class="SimpleText">Your username: <b><%= StrUsername %></b></td>
	</tr>
	<tr>
		<td class="SimpleText">Your password: <b><%= StrPassword %></b></td>
	</tr>
</table>