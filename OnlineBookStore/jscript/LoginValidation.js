function CheckLogin()
	{
	if(document.FrmLogin.TxtUsername.value=="")
		{
		alert("Username field is empty, please fill.");
		return false;
		}

	if(document.FrmLogin.TxtPassword.value=="")
		{
		alert("Password field is empty, please fill.");
		return false;
		}
	else
		{
		return true;
		}
	}