<%

Dim StrFirstname, StrLastname, StrCountry, StrCity, StrAddress, StrPhoneNumber, StrCreditCardNumber, StrCreditCardExpire, StrUserProfileQuery, ObjRSUser

StrFirstname = Trim(Replace(Request.Form("TxtFirstname"), "'", "''"))
StrLastname = Trim(Replace(Request.Form("TxtLastname"), "'", "''"))
StrCountry = Trim(Replace(Request.Form("TxtCountry"), "'", "''"))
StrCity = Trim(Replace(Request.Form("TxtCity"), "'", "''"))
StrAddress = Trim(Replace(Request.Form("TxtAddress"), "'", "''"))
StrPhoneNumber = Trim(Replace(Request.Form("TxtPhoneNumber"), "'", "''"))
StrCreditCardNumber = Trim(Replace(Request.Form("TxtCreditCardNumber"), "'", "''"))
StrCreditCardExpire = Trim(Replace(Request.Form("TxtCreditCardExpireDate"), "'", "''"))

StrUserProfileQuery = "Update Buyers SET Firstname='"&StrFirstname&"', Lastname='"&StrLastname&"', Country='"&StrCountry&"', City='"&StrCity&"', Address='"&StrAddress&"', PhoneNumber='"&StrPhoneNumber&"', CreditCardNumber='"&StrCreditCardNumber&"', CreditCardExpire='"&StrCreditCardExpire&"' Where BuyerID=" & CInt(Session("LoginBuyer"))
Set ObjRSUser = ObjCon.Execute(StrUserProfileQuery)

%>

<table border="0">
	<tr>
		<td><h3><font face="verdana, arial" color="darkblue">Profile Updated!</font></h3></td>
	</tr>
</table>
<hr color="black" noshade>
<table border="0">
	<tr>
		<td class="SimpleText"><b><%= Session("LoginUser") %></b>, your profile updated.</td>
	</tr>
</table>