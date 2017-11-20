<table border="0">
	<tr>
		<td><h3><font face="verdana, arial" color="darkblue">Login Your Account</font></h3></td>
	</tr>
</table>
<hr color="black" noshade>
<form name="FrmLogin" method="post" action="LoginProcess.asp">
<table border="0">
	<tr>
		<td class="SimpleText">Username:</td>
		<td><input type="text" name="TxtUsername"></td>
	</tr>
	<tr>
		<td class="SimpleText">Password:</td>
		<td><input type="password" name="TxtPassword"></td>
	</tr>
	<tr>
		<td colspan="2">
		<center>
		<input type="submit" name="Submit" value="Login" onclick="return CheckLogin()">
		&nbsp;&nbsp;
		<input type="reset" name="Reset" value="Reset Values">
		</center>
		</td>
	</tr>
</table>
</form>