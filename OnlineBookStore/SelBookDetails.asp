<%
Dim STechID, IntBookID, StrBookName, StrTechName, StrTechQuery, StrSelBookQuery, ObjRSTechName, ObjRSBook

IF Request.QueryString("STechID") = "" OR Request.QueryString("BookID") = "" Then
Response.Redirect("Default.asp")
ELSE
STechID = CInt(Request.QueryString("STechID"))
IntBookID = CInt(Request.QueryString("BookID"))
END IF

GetTechName(STechID)

Function GetTechName(TechID)
StrTechQuery = "Select TechName From Technology Where TechID=" & TechID
Set ObjRSTechName = ObjCon.Execute(StrTechQuery)
StrTechName = ObjRSTechName("TechName")
End Function

StrSelBookQuery = "Select BookID, TechID, BookName, ISBN, AuthorName, BookDetails, Press, BookPrice, ImagePath From Books Where BookID=" & IntBookID
Set ObjRSBook = ObjCon.Execute(StrSelBookQuery)
%>

<table border="0">
	<tr>
		<td class="SimpleText">You are in <b><%= StrTechName %></b> category.</td>
	</tr>
</table>
<hr color="black" noshade>
<table width="70%" border="0" cellspacing="0">
  <tr> 
    <td width="56%" class="SimpleText"><b><% StrBookName=ObjRSBook("BookName") %><%= StrBookName %></b></td>
    <td rowspan="5" width="44%"> 
      <div align="center"><img src="<%= ObjRSBook("ImagePath") %>" alt="<%= StrBookName %>"><br><br><a href="AddToCart.asp?STechID=<%= ObjRSBook("TechID") %>&BookID=<%= ObjRSBook("BookID") %>" class="NormalLink">Add To Cart</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="ViewCart.asp" class="NormalLink">View Cart</a></div>
    </td>
  </tr>
  <tr> 
    <td width="56%" class="SimpleText">Author: <%= ObjRSBook("AuthorName") %></td>
  </tr>
  <tr> 
    <td width="56%" class="SimpleText">ISBN: <%= ObjRSBook("ISBN") %></td>
  </tr>
  <tr> 
    <td width="56%" class="SimpleText">Press: <%= ObjRSBook("Press") %></td>
  </tr>
  <tr> 
    <td width="56%" class="SimpleText">Price: <%= ObjRSBook("BookPrice") %></td>
  </tr>
  <tr> 
    <td colspan="2" valign="top" class="paras"><%= ObjRSBook("BookDetails") %></td>
  </tr>
</table>
