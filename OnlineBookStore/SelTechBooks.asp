<%
IF Request.QueryString("STechID") = "" Then
Response.Redirect("Default.asp")
ELSE
STechID = CInt(Request.QueryString("STechID"))
END IF
Dim StrBookName, STechID, StrTechName, StrQueryTech, StrQuerySelectedTech, ObjRSTechName, ObjRSList

GetTechName(STechID)

Function GetTechName(TechID)
StrQueryTech = "Select TechName From Technology Where TechID=" & TechID
Set ObjRSTechName = ObjCon.Execute(StrQueryTech)
StrTechName = ObjRSTechName("TechName")
End Function

StrQuerySelectedTech = "Select BookID, TechID, BookName, ISBN, AuthorName, Press, BookPrice, ImagePath From Books Where TechID=" & STechID
Set ObjRSList = ObjCon.Execute(StrQuerySelectedTech)
%>
<table border="0">
	<tr>
		<td class="SimpleText">You are in <b><%= StrTechName %></b> category.</td>
	</tr>
</table>
<%
While Not ObjRSList.EOF
%>
<table width="70%" border="2" cellspacing="0" style="border-collapse:collapse" bordercolor="#CCCCCC">
  <tr> 
    <td width="57%"><a href="ViewBookDetails.asp?STechID=<%= ObjRSList("TechID") %>&BookID=<%= ObjRSList("BookID") %>" class="NormalLink"><% StrBookName=ObjRSList("BookName") %><%= StrBookName %></a></td>
    <td width="43%" rowspan="5"> 
      <div align="center"><img src="<%= ObjRSList("ImagePath") %>" alt="<%= StrBookName %>"><br><br><a href="AddToCart.asp?STechID=<%= ObjRSList("TechID") %>&BookID=<%= ObjRSList("BookID") %>" class="NormalLink">Add To Cart</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="ViewCart.asp" class="NormalLink">View Cart</a></div>
    </td>
  </tr>
  <tr> 
    <td width="57%" class="SimpleText">Author: <%= ObjRSList("AuthorName") %></td>
  </tr>
  <tr> 
    <td width="57%" class="SimpleText">ISBN: <%= ObjRSList("ISBN") %></td>
  </tr>
  <tr> 
    <td width="57%" class="SimpleText">Press: <%= ObjRSList("Press") %></td>
  </tr>
  <tr> 
    <td width="57%" height="22" class="SimpleText">Price: <%= ObjRSList("BookPrice") %></td>
  </tr>
</table>
<hr color="black" noshade>
<%
ObjRSList.MoveNext
Wend
%>