<%

Dim ObjCon, ObjRS

Set ObjCon = Server.CreateObject("ADODB.Connection")
ObjCon.Open "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("db/BookStore.mdb")
%>



<html>
<head>
<title>Online Book Store</title>
<link rel="stylesheet" type="text/css" href="styles/global.css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td colspan="2" height="14"> 
      <div align="center">
        <!-- #INCLUDE FILE="Header.asp" -->
      </div>
    </td>
  </tr>
  <tr> 
    <td colspan="2"> 
      <div align="right"><!-- #INCLUDE FILE="Options.asp" --></div>
    </td>
  </tr>
  <tr> 
    <td width="19%" valign="top"><!-- #INCLUDE FILE="Categories.asp" --></td>
    <td width="81%" valign="top"><!-- #INCLUDE FILE="AddItemProcess.asp" --></td>
  </tr>
  <tr> 
    <td colspan="2"><div align="center"><!-- #INCLUDE FILE="Footer.asp" --></div></td>
  </tr>
</table>
</body>
</html>
<%
	ObjCon.Close
	Set ObjCon = NOTHING
%>