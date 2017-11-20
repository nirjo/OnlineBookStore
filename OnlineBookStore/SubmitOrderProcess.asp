<%

Dim IntBuyerID, StrDate, StrCart, StrTotalPrice, IntShipped, IntCount, IntShowCounter, DblTotalPrice, DblFinalPrice, StrCartQuery, ObjRSCart

IF Session("LoginBuyer") = "" OR Session("LoginUser") = "" Then
Response.Redirect("Default.asp")
END IF

IntBuyerID = CInt(Session("LoginBuyer"))
StrDate = Date()


StrCart = "<cart>"
IntCount = CInt(Session("TotalItems"))
		For IntShowCounter = 1 to IntCount
		IF Session("MyItems")("Purchase" & IntShowCounter) = "yes" Then
		DblTotalPrice = CDbl(Session("MyItems")("Price" & IntShowCounter) * CInt(Session("MyItems")("Quantity" & IntShowCounter)))
		DblFinalPrice = DblFinalPrice + CDbl(DblTotalPrice)
		StrCart = StrCart & "<item>"
		StrCart = StrCart & "<buyerid>" & CStr(Session("LoginBuyer")) &"</buyerid>"
		StrCart = StrCart & "<bookname>" & Session("MyItems")("BookName" & IntShowCounter) & "</bookname>"
		StrCart = StrCart & "<isbn>" & Session("MyItems")("ISBN" & IntShowCounter) & "</isbn>"
		StrCart = StrCart & "<quantity>" & Session("MyItems")("Quantity" & IntShowCounter) & "</quantity>"
		StrCart = StrCart & "<totalprice>" & DblTotalPrice & "</totalprice>"
		StrCart = StrCart & "</item>"
		Session("MyItems")("Purchase" & IntShowCounter) = "no"
		END IF
		Next
StrCart = StrCart & "</cart>"

StrTotalPrice = CStr(DblFinalPrice)
IntShipped = 0

StrCartQuery = "Insert into Orders (BuyerID, OrderDate, CartItems, TotalPrice, Shipped) Values ('"&IntBuyerID&"', '"&StrDate&"', '"&StrCart&"', '"&StrTotalPrice&"', '"&IntShipped&"')"
Set ObjRSCart = ObjCon.Execute(StrCartQuery)

%>

<table border="0">
	<tr>
		<td><h3><font face="verdana, arial" color="darkblue">ORDER SUBMITTED!</font</h3></td>
	</tr>
</table>
<hr color="black" noshade>
<table border="0">
	<tr>
		<td class="SimpleText">You order has been submitted.</td>
	</tr>
</table>
<hr color="black" noshade>