function CheckForm()
	{
	var SendArgs = document.FrmRegister.TxtCreditCardExpireDate.value;

	if(document.FrmRegister.TxtUsername.value=="")
		{
		alert("Username field is empty, please fill.");
		return false;
		}

	if(document.FrmRegister.TxtPassword.value=="")
		{
		alert("Password field is empty, please fill.");
		return false;
		}

	if(document.FrmRegister.TxtFirstname.value=="")
		{
		alert("Firstname field is empty, please fill.");
		return false;
		}

	if(document.FrmRegister.TxtLastname.value=="")
		{
		alert("Lastname field is empty, please fill.");
		return false;
		}

	if(document.FrmRegister.TxtCountry.value=="")
		{
		alert("Country field is empty, please fill.");
		return false;
		}

	if(document.FrmRegister.TxtCity.value=="")
		{
		alert("City field is empty, please fill.");
		return false;
		}

	if(document.FrmRegister.TxtAddress.value=="")
		{
		alert("Address field is empty, please fill.");
		return false;
		}

	if(document.FrmRegister.TxtCreditCardNumber.value=="")
		{
		alert("Credit Card Number field is empty, please fill.");
		return false;
		}

	if(document.FrmRegister.TxtCreditCardExpireDate.value=="")
		{
		alert("Credit Card Expire Date field is empty, please fill.");
		return false;
		}
	if(CheckCreditCardExpireLength(SendArgs) == false)
		{
		return false;
		}
	if(CheckCreditCardExprireDate(SendArgs) == false)
		{
		return false;
		}
	if(CheckCreditCardMonthDateYear(SendArgs) == false)
		{
		return false;
		}
	else
		{
		return true;
		}
	}

function CheckEdit()
	{
	var SendArgs = document.FrmEdit.TxtCreditCardExpireDate.value;
	if(document.FrmEdit.TxtFirstname.value=="")
		{
		alert("Firstname field is empty, please fill.");
		return false;
		}

	if(document.FrmEdit.TxtLastname.value=="")
		{
		alert("Lastname field is empty, please fill.");
		return false;
		}

	if(document.FrmEdit.TxtCountry.value=="")
		{
		alert("Country field is empty, please fill.");
		return false;
		}

	if(document.FrmEdit.TxtCity.value=="")
		{
		alert("City field is empty, please fill.");
		return false;
		}

	if(document.FrmEdit.TxtAddress.value=="")
		{
		alert("Address field is empty, please fill.");
		return false;
		}

	if(document.FrmEdit.TxtCreditCardNumber.value=="")
		{
		alert("Credit Card Number field is empty, please fill.");
		return false;
		}

	if(document.FrmEdit.TxtCreditCardExpireDate.value=="")
		{
		alert("Credit Card Expire Date field is empty, please fill.");
		return false;
		}
	if(CheckCreditCardExpireLength(SendArgs) == false)
		{
		return false;
		}
	if(CheckCreditCardExprireDate(SendArgs) == false)
		{
		return false;
		}
	if(CheckCreditCardMonthDateYear(SendArgs) == false)
		{
		return false;
		}
	else
		{
		return true;
		}
	}

function EditPassword()
	{
	if(document.FrmEditPassword.TxtOldPassword.value=="")
		{
		alert("Please enter your old password.");
		return false;
		}
	if(document.FrmEditPassword.TxtNewPassword.value=="")
		{
		alert("Please enter your new password.");
		return false;
		}
	if(document.FrmEditPassword.TxtReTypeNewPassword.value=="")
		{
		alert("Please re-type your new password.");
		return false;
		}
	if(document.FrmEditPassword.TxtNewPassword.value != document.FrmEditPassword.TxtReTypeNewPassword.value)
		{
		alert("Your password doesn't match, please check new password field and re-type new password field.");
		return false;
		}
	else
		{
		return true;
		}
	}



/////////////////////////////////////////////////////////////////////

function CheckCreditCardExpireLength(e)
	{
		var CurrentLength;
		CurrentLength = e;
		if(CurrentLength.length <= 7)
			{
			alert("Invalid credit card expire date.");
			return false;
			}
		else
			{
			return true;
			}
	}

/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////

function CheckCreditCardExprireDate(e)
	{
	var InvalidChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,.~`!@#$%^&*()_-+=|\\{}[]\":<>?"
	var CCDateValue;
	var i;
	var j;
	var BlnRes;
	BlnRes = true;
	CCDateValue = e;
	for(i=0; i<InvalidChar.length; i++)
		{
		for(j=0;j<CCDateValue.length;j++)
			{
			if(CCDateValue.charAt(j) == InvalidChar.charAt(i))
				{
				BlnRes = false;
				}
			}
		}
	if(BlnRes == true)
		{
		return true;
		}
	else
		{
		alert("Invalid characters in credit card expire date, please remove.");
		return false;
		}
	}

/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////

function CheckCreditCardMonthDateYear(e)
	{
	var Today;
	var CurrentMonth;
	var CurrentDate;
	var CurrentYear;
	var MonthValue;
	var FindMonthValue;
	var FinalMonthValue;
	var DateValue;
	var FindDateValue;
	var FinalDateValue;
	var YearValue;
	var FindYearValue;
	var FinalYearValue;
	var BlnResMonth;
	var BlnResDate;
	var BlnResYear;
	var ErrorMessage;
	Today = new Date();
	CurrentMonth = Today.getMonth() + 1;
	CurrentDate = Today.getDate();
	CurrentYear = Today.getYear();
	BlnResMonth = true;
	BlnResDate = true;
	BlnResYear = true;
	MonthValue = e;
	DateValue = e;
	YearValue = e;


//******************* Verifying Month ***********************//

	FindMonthValue = MonthValue.substring(0, 2);
	FinalMonthValue = FindMonthValue;
	if(FinalMonthValue.charAt(1) == "/")
		{
		FinalMonthValue = FinalMonthValue.charAt(0);
		}
	if(FinalMonthValue < CurrentMonth)
		{
		ErrorMessage = "Your credit card is expired.";
		BlnResMonth = false;
		}
	if(FinalMonthValue > 12 || FinalMonthValue == 0)
		{
		ErrorMessage = "Invalid credit card expire date.";
		BlnResMonth = false;
		}
	if(isNaN(FinalMonthValue) == false)
		{
		ErrorMessage = "Invalid credit card expire date.";
		BlnResMonth = false;
		}

//******************* Finish Verifying Month ****************//

//***********************************************************//
//***********************************************************//
//***********************************************************//

//******************* Verifying Date ************************//

	if(DateValue.length == 10)
		{
		FindDateValue = DateValue.substring(3);
		}
	if(DateValue.length == 9)
		{
		FindDateValue = DateValue.substring(2);
		}
	if(DateValue.length == 8)
		{
		FindDateValue = DateValue.substring(1);
		}
	if(FindDateValue.length > 2)
		{
		FinalDateValue = FindDateValue.substring(0, 2)
		if(FinalDateValue.charAt(1) == "/")
			{
			FinalDateValue = FinalDateValue.charAt(0);
			}
		if(FinalDateValue.charAt(0) == "/")
			{
			FinalDateValue = FinalDateValue.charAt(1);
			}
		}
	if(FinalDateValue < CurrentDate)
		{
		ErrorMessage = "Your credit card is expired.";
		BlnResDate = false;
		}
	if(FinalDateValue > 31 || FinalDateValue == 0)
		{
		ErrorMessage = "Invalid credit card expire date.";
		BlnResDate = false;
		}
	if(isNaN(FinalDateValue) == false)
		{
		ErrorMessage = "Invalid credit card expire date.";
		BlnResDate = false;
		}

//********************** Finish Verifying Date *****************//

//***********************************************************//
//***********************************************************//
//***********************************************************//

//********************** Verifying Year ************************//

	if(YearValue.length == 10)
		{
		FindYearValue = YearValue.substring(6);
		}
	if(YearValue.length == 9)
		{
		FindYearValue = YearValue.substring(5);
		}
	if(YearValue.length == 8)
		{
		FindYearValue = YearValue.substring(4);
		}
	if(YearValue.length == 7)
		{
		FindYearValue = YearValue.substring(3);
		}
	FinalYearValue = FindYearValue;
	if(FinalYearValue.charAt(0) == "/")
		{
		FinalYearValue = FinalYearValue.substring(1);
		}
	if(FinalYearValue.charAt(1) == "/")
		{
		FinalYearValue = FinalYearValue.substring(2);
		}
	if(FinalYearValue.charAt(2) == "/")
		{
		FinalYearValue = FinalYearValue.substring(3);
		}
	if(FinalYearValue < CurrentYear)
		{
		ErrorMessage = "Your credit card is expired.";
		BlnResYear = false;
		}
	if(FinalYearValue == 0000 || FinalYearValue == 000 || FinalYearValue == 00 || FinalYearValue == 0)
		{
		ErrorMessage = "Invalid credit card expire date.";
		BlnResYear = false;
		}
	if(isNaN(FinalYearValue))
		{
		ErrorMessage = "Invalid credit card expire date.";
		BlnResYear = false;
		}

	if(FinalMonthValue != 0 && FinalMonthValue <= 12)
		{
		if(FinalDateValue != 0 && FinalDateValue <= 31)
			{
			if(BlnResYear == true && FinalYearValue > CurrentYear)
				{
				return true;
				}
			else if(BlnResYear == true && FinalYearValue == CurrentYear)
				{
					if(FinalMonthValue < CurrentMonth)
						{
						ErrorMessage = "Your credit card is expired.";
						alert(ErrorMessage);
						return false;
						}
					if(FinalMonthValue == CurrentMonth && FinalDateValue <= CurrentDate)
						{
						ErrorMessage = "Your credit card is expired.";
						alert(ErrorMessage);
						return false;
						}
				}
			else
				{
				ErrorMessage = "Your credit card is expired.";
				alert(ErrorMessage);
				return false;
				}
			}
		else
			{
			ErrorMessage = "Your credit card is expired.";
			alert(ErrorMessage);
			return false;
			}
		}
	else
		{
		ErrorMessage = "Your credit card is expired.";
		alert(ErrorMessage);
		return false;
		}

//********************** Finish Verifying Year *****************//

//***********************************************************//
//***********************************************************//
//***********************************************************//
	}

/////////////////////////////////////////////////////////////////////