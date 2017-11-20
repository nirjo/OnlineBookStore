<%

Dim StrTechName, StrBookName, StrISBN, StrPrice, IntQuantity, IntCounter, IntCount, IntShowCounter, IntItemID, BlnDuplicate, IntTotalItems, DblTotalPrice, DblFinalPrice

StrTechName = Trim(Request.Form("TechName"))
StrBookName = Trim(Request.Form("BookName"))
StrISBN = Trim(Request.Form("ISBN"))
StrPrice = Trim(Request.Form("Price"))
IntQuantity = Trim(Request.Form("TxtQuantity"))

IF Session("LoginBuyer") = "" OR Session("LoginUser") = "" Then
Response.Redirect("Default.asp")
END IF

BlnDuplicate = False

IntCount = CInt(Session("TotalItems"))

IF IntCount > 0 Then
	For IntCounter = 1 to IntCount
	IF Session("MyItems")("ISBN" & IntCounter) = StrISBN And Session("MyItems")("Purchase" & IntCounter) = "yes" Then
	BlnDuplicate = True
	Exit For
	END IF
	Next
END IF

IF BlnDuplicate = True Then
IntQuantity = IntQuantity + CInt(Session("MyItems")("Quantity" & IntCounter))
Session("MyItems")("Quantity" & IntCounter) = IntQuantity
ELSE
IntItemID = CInt(Session("TotalItems"))
IntItemID = IntItemID + 1
Session("MyItems").Add "BookName" & IntItemID, StrBookName
Session("MyItems").Add "ISBN" & IntItemID, StrISBN
Session("MyItems").Add "Price" & IntItemID, StrPrice
Session("MyItems").Add "Quantity" & IntItemID, IntQuantity
Session("MyItems").Add "Purchase" & IntItemID, "yes"
Session("TotalItems") = Session("TotalItems") + 1
END IF
%>

<table border="0">
	<tr>
		<td><h3><font face="verdana, arial" color="darkblue">Item Added In Your Cart!</font</h3></td>
	</tr>
</table>
<hr color="black" noshade>
<table border="0">
	<tr>
		<td class="SimpleText">You are in <b><%= StrTechName %></b> category.</td>
	</tr>
</table>
<table border="1" bordercolor="lightgrey" style="border-collapse:collapse">
	<tr>
		<td class="SimpleText"><b>Book Name</b></td>
		<td class="SimpleText"><b>ISBN</b></td>
		<td class="SimpleText"><b>Quantity</b></td>
		<td class="SimpleText"><b>Price</b></td>
		<td class="SimpleText"><b>Total Price</b></td>
		<td class="SimpleText"><b>Option</b></td>
	</tr>
	<%
		IntCount = CInt(Session("TotalItems"))
		For IntShowCounter = 1 to IntCount
		IF Session("MyItems")("Purchase" & IntShowCounter) = "yes" Then
		IntTotalItems = IntTotalItems + 1
		DblTotalPrice = CDbl(Session("MyItems")("Price" & IntShowCounter) * CInt(Session("MyItems")("Quantity" & IntShowCounter)))
		DblFinalPrice = DblFinalPrice + CDbl(DblTotalPrice)
	%>
	<tr>
		<td class="SimpleText"><%= Session("MyItems")("BookName" & IntShowCounter) %></td>
		<td class="SimpleText"><%= Session("MyItems")("ISBN" & IntShowCounter) %></td>
		<td class="SimpleText"><%= Session("MyItems")("Quantity" & IntShowCounter) %></td>
		<td class="SimpleText"><%= Session("MyItems")("Price" & IntShowCounter) %></td>
		<td class="SimpleText"><%= CDbl(DblTotalPrice) %></td>
		<td><a href="RemoveItem.asp?ISBN=<%= Session("MyItems")("ISBN" & IntShowCounter) %>" class="NormalLink">Remove Item</a></td>
	</tr>
	<%
		END IF
		Next
	%>
</table>
<hr color="black" noshade>
<table border="1" bordercolor="lightgrey" style="border-collapse:collapse">
	<tr>
		<td class="SimpleText">Total items in your cart: <b><%= IntTotalItems %></b></td>
	</tr>
	<tr>
		<td class="SimpleText">Total cost of all items: <b><%= CDbl(DblFinalPrice) %></b></td>
	</tr>
	<%
		IF IntTotalItems > 0 Then
	%>
	<tr>
		<td><a href="SubmitOrder.asp" class="NormalLink">Submit My Order</a></td>
	</tr>
	<%
		END IF
	%>
</table>