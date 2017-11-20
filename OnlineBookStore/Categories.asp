<%
Dim StrQuery
StrQuery = "Select TechID, TechName From Technology"
Set ObjRS = ObjCon.Execute(StrQuery)
%>
<table width="18%" border="1" cellspacing="0" style="border-collapse:collapse" bordercolor="#000000">
  <tr> 
    <td> 
      <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Categories</font></b></div>
    </td>
  </tr>
	<%
		While Not ObjRS.EOF
	%>
  <tr> 
    <td height="25"><div align="center"><a href="Books.asp?STechID=<%= ObjRS("TechID")%>" class="NormalLink"><%= ObjRS("TechName") %></a></div></td>
  </tr>
	<%
		ObjRS.MoveNext
		Wend
	%>
</table>