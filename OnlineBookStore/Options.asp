<table width="100%" border="0" cellspacing="0">
  <tr> 
    <td> 
      <div align="right">
	<%
		IF Session("LoginBuyer") = "" OR Session("LoginUser") = "" Then
	%>
	<a href="Login.asp" class="NormalLink">Login</a> | <a href="PrivacyPolicy.asp" class="NormalLink">Register</a>
	<%
		ELSE
	%>
	<a href="EditProfile.asp" class="NormalLink">Edit Your Profile</a> | <a href="LogOff.asp" class="NormalLink">Log Off</a>
	<%
		END IF
	%>
	</div>
    </td>
  </tr>
</table>