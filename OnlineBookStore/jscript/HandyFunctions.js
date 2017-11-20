function OpenEditPasswordWindow()
	{
	window.open("EditPassword.asp","DisplayTip","width=400, height=150, tollbar=no, location=no, menu=no, status=no");
	}

function CloseWindow()
	{
	window.close();
	}

function CheckItemQuantity()
	{
	var Quantity = document.FrmAddItem.TxtQuantity.value;
	if(Quantity == "")
		{
		alert("Quantity field is empty, please fill.");
		return false;
		}
	if(Quantity == 0)
		{
		alert("Enter valid quantity.");
		return false;
		}
	if(isNaN(Quantity) == true)
		{
		alert("Enter valid quantity.");
		return false;
		}
	if(CheckInvalidCharacters(Quantity) == false)
		{
		return false;
		}
	else
		{
		return true;
		}
	}


//*********** Check Invalid Characters In Quantity Field *********//
//****************************************************************//
////////////////////////////////////////////////////////////////////

function CheckInvalidCharacters(e)
	{
	var InvalidChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,.~`!@#$%^&*()_-+=/|\\{}[]\":<>?"
	var IntQuantity;
	var i;
	var j;
	var BlnRes;
	BlnRes = true;
	IntQuantity = e;
	for(i=0; i<InvalidChar.length; i++)
		{
		for(j=0;j<IntQuantity.length;j++)
			{
			if(IntQuantity.charAt(j) == InvalidChar.charAt(i))
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
		alert("Invalid characters in quantity field, please remove.");
		return false;
		}
	}

//***************** Finish Checking Invalid Characters ************//
//*****************************************************************//
/////////////////////////////////////////////////////////////////////