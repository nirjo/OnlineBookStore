<%

Dim StrISBN, IntCount, IntCounter, IntShowCounter, IntTotalItems, DblTotalPrice

IF Session("LoginBuyer") = "" OR Session("LoginUser") = "" Then
Response.Redirect("Default.asp")
END IF

StrISBN = Trim(Request.QueryString("ISBN"))

IF StrISBN = "" Then
Response.Redirect("Default.asp")
END IF

IntCount = CInt(Session("TotalItems"))

IntTotalItems = 0

For IntCounter = 1 to IntCount
	IF Session("MyItems")("ISBN" & IntCounter) = StrISBN And Session("MyItems")("Purchase" & IntCounter) = "yes" Then
	Session("MyItems")("Purchase" & IntCounter) = "no"
	Exit For
	END IF
Next

%>

<table border="0">
	<tr>
		<td><h3><font face="verdana, arial" color="darkblue">Item Removed in your cart!</font></h3></td>
	</tr>
</table>
<hr color="black" noshade>
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