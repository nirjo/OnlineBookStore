<%
Dim StrUserProfileQuery, ObjRSUser

StrUserProfileQuery = "Select Firstname, Lastname, Country, City, Address, PhoneNumber, CreditCardNumber, CreditCardExpire From Buyers Where BuyerID=" & CInt(Session("LoginBuyer"))
Set ObjRSUser = ObjCon.Execute(StrUserProfileQuery)
%>


<table border="0">
	<tr>
		<td>
      <h3><font face="verdana, arial" color="darkblue">Edit Profile</font></h3>
    </td>
	</tr>
</table>
<hr color="black" noshade>
<form name="FrmEdit" method="post" action="UpdateProfile.asp">
  <table width="72%" border="0" cellspacing="0">
    <tr> 
      <td width="35%" class="SimpleText">Username:</td>
      <td width="65%" class="SimpleText">&nbsp; <b><%= Session("LoginUser") %></b></td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Password:</td>
      <td width="65%" class="SimpleText">&nbsp; <a href="javascript:OpenEditPasswordWindow()" class="NormalLink">Change Password</a></td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Firstname:</td>
      <td width="65%"> 
        <input type="text" name="TxtFirstname" value="<%= ObjRSUser("Firstname") %>">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Lastname:</td>
      <td width="65%"> 
        <input type="text" name="TxtLastname" value="<%= ObjRSUser("Lastname") %>">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Country:</td>
      <td width="65%"> 
        <input type="text" name="TxtCountry" value="<%= ObjRSUser("Country") %>">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">City:</td>
      <td width="65%"> 
        <input type="text" name="TxtCity" value="<%= ObjRSUser("City") %>">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText" height="120">Address:</td>
      <td width="65%" height="120"> 
        <textarea name="TxtAddress" rows="5" cols="20"><%= ObjRSUser("Address") %></textarea>
        <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
        We send your selected products at this address.</font></td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Phone Number:</td>
      <td width="65%"> 
        <input type="text" name="TxtPhoneNumber" value="<%= ObjRSUser("PhoneNumber") %>">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Credit Card Number:</td>
      <td width="65%"> 
        <input type="text" name="TxtCreditCardNumber" value="<%= ObjRSUser("CreditCardNumber") %>">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Credit Card Expire Date:</td>
      <td width="65%"> 
        <input type="text" name="TxtCreditCardExpireDate" value="<%= ObjRSUser("CreditCardExpire") %>" maxlength="10">
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="submit" name="Submit" value="Save Settings" onclick="return CheckEdit()">
          <input type="reset" name="Reset" value="Cancel">
        </div>
      </td>
    </tr>
  </table>
</form>