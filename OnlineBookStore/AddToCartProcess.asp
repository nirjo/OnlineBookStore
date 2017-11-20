<%

Dim StrSelTech, StrSelBook, StrBookName, StrISBN, StrPrice, StrTechName, StrSelTechNameQuery, StrSelBookQuery, ObjRSTechName, ObjRSBook

StrSelTech = Trim(Request.QueryString("STechID"))
StrSelBook = Trim(Request.QueryString("BookID"))

IF StrSelTech = "" OR StrSelBook = "" Then
Response.Redirect("Default.asp")
END IF

IF Session("LoginBuyer") = "" OR Session("LoginUser") = "" Then
Response.Redirect("Login.asp")
END IF

GetTechName(CInt(StrSelTech))

Function GetTechName(TechID)
StrSelTechNameQuery = "Select TechName From Technology Where TechID=" & TechID
Set ObjRSTechName = ObjCon.Execute(StrSelTechNameQuery)
StrTechName = ObjRSTechName("TechName")
End Function



StrSelBookQuery = "Select BookName, ISBN, BookPrice, ImagePath From Books Where BookID=" & CInt(StrSelBook)
Set ObjRSBook = ObjCon.Execute(StrSelBookQuery)
%>

<table border="0">
	<tr>
		<td><h3><font face="verdana, arial" color="darkblue">Do you want to add this item in your cart ?</font></h3></td>
	</tr>
</table>
<table border="0">
	<tr>
		<td class="SimpleText">You are in <b><%= StrTechName %></b> category.</td>
	</tr>
</table>
<table border="2" bordercolor="lightgrey" style="border-collapse:collapse">
	<tr>
		<td class="SimpleText"><% StrBookName = ObjRSBook("BookName") %><b><%= StrBookName %></b></td>
		<td rowspan="5"><div align="center"><img src="<%= ObjRSBook("ImagePath") %>" alt="<%= StrBookName %>"></div></td>
	</tr>
	<tr>
		<td class="SimpleText">ISBN: <% StrISBN= ObjRSBook("ISBN") %><%= StrISBN %></td>
	</tr>
	<tr>
		<td class="SimpleText">Price: <% StrPrice=ObjRSBook("BookPrice") %><%= StrPrice %></td>
	</tr>
</table>
<form name="FrmAddItem" method="post" action="AddItem.asp">
<input type="hidden" name="TechName" value="<%= StrTechName %>">
<input type="hidden" name="BookName" value="<%= StrBookName %>">
<input type="hidden" name="ISBN" value="<%= StrISBN %>">
<input type="hidden" name="Price" value="<%= StrPrice %>">
<table border="0">
	<tr>
		<td class="SimpleText">Quantity: <input type="text" name="TxtQuantity" size="5">&nbsp;&nbsp;<input type="submit" name="submit" value="Add this item to my cart" onclick="return CheckItemQuantity()"></td>
	</tr>
</table>
</form>