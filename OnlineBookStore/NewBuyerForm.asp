<table border="0">
	<tr>
		<td><h3><font face="verdana, arial" color="darkblue">New User Registration Form</font></h3></td>
	</tr>
</table>
<hr color="black" noshade>
<form name="FrmRegister" method="post" action="CreateBuyer.asp">
  <table width="72%" border="0" cellspacing="0">
    <tr> 
      <td width="35%" class="SimpleText">Username:</td>
      <td width="65%"> 
        <input type="text" name="TxtUsername">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Password:</td>
      <td width="65%" class="SimpleText"> 
        <input type="password" name="TxtPassword">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Firstname:</td>
      <td width="65%"> 
        <input type="text" name="TxtFirstname">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Lastname:</td>
      <td width="65%"> 
        <input type="text" name="TxtLastname">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Country:</td>
      <td width="65%"> 
        <input type="text" name="TxtCountry">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">City:</td>
      <td width="65%"> 
        <input type="text" name="TxtCity">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText" height="120">Address:</td>
      <td width="65%" height="120"> 
        <textarea name="TxtAddress" rows="5" cols="20"></textarea>
        <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
        We send your selected products at this address.</font></td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Phone Number:</td>
      <td width="65%"> 
        <input type="text" name="TxtPhoneNumber">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Credit Card Number:</td>
      <td width="65%"> 
        <input type="text" name="TxtCreditCardNumber">
      </td>
    </tr>
    <tr> 
      <td width="35%" class="SimpleText">Credit Card Expire Date:</td>
      <td width="65%" class="SimpleText"> 
        <input type="text" name="TxtCreditCardExpireDate" maxlength="10"><br>Format (Month/Date/Year) example: 7/5/2004
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center"><br><br> 
          <input type="submit" name="Submit" value="Register Me" onclick="return CheckForm()">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" name="Reset" value="Reset All Fields">
        </div>
      </td>
    </tr>
  </table>
</form>