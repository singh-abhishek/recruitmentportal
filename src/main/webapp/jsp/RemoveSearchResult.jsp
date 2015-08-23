<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.PrintWriter"%>
<%@page import="java.io.*" %>
<%@page import= "java.util.Properties" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All</title>
<meta name="description" content="Creating a Employee table with Twitter Bootstrap. Learn with example of a Employee Table with Twitter Bootstrap.">  
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/ExcelConversion.js"></script>

</head>
<body>
<%
Properties prop = new Properties();
String configFilePath = application.getRealPath("/")+"config.properties";
InputStream input = new FileInputStream(configFilePath);
prop.load(input);
String dburl = prop.getProperty("database");
String user = prop.getProperty("dbuser");
String passwd = prop.getProperty("dbpassword");
String keyword=request.getParameter("removesearch");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(dburl,user,passwd);
PreparedStatement stat1 = con.prepareStatement("SELECT * FROM EMPLOYEE WHERE department REGEXP ? OR name REGEXP ? OR designation REGEXP ? OR experience REGEXP ?");
stat1.setString(1, keyword);
stat1.setString(2, keyword);
stat1.setString(3, keyword);
stat1.setString(4, keyword);
ResultSet result=stat1.executeQuery();        
%>

<nav class="navbar navbar-inverse navbar-fixed-top" >
<div class="container-fluid">
<div class="navbar-header">
       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">                    
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
       </button>
   <a class="navbar-brand " href="/recruitmentportal/main.html">IDeaS</a>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="/recruitmentportal/jsp/ViewAll.jsp">View</a></li>
        <li><a href="/recruitmentportal/jsp/NewEntryForm.jsp">New Entry</a></li>
        <li><a href="/recruitmentportal/jsp/UpdateEntries.jsp">Update Information</a></li>
        <li><a href="/recruitmentportal/ExcelUpload.html">Upload from Excel</a></li>
        <li><a href="/recruitmentportal/RemoveEntry.html">Remove Entry</a></li>
      </ul>
     
      </div>
    </div>
 </nav>
 
<div class="container" >

<h3>Search Results</h3>
<div class="row">
        <br><br><br>
<div class="pull-right">

                	<input type="button" class="btn btn-default btn-xs" onclick="tableToExcel('mytable')" value="Export to Excel">
         </div>
	<h3>Search Results</h3>
		

	<table class="table table-striped" id="mytable">
		 <thead>
		  <tr>
			<th>Department</th>		  
			<th>Name</th>
			<th>Designation</th>
			<th>Experience</th>
			<th>Comments</th>
			<th>Last Edited</th>		  
		  </tr>
		</thead>
		<tbody>
		<%
	while(result.next())
	{
		%>
		
		 <tr>
		 
		  <td><a href="/recruitmentportal/RemoveEntryController?id=<%=result.getInt("id") %>" ><%=result.getString("department") %></a></td>
		  <td><a href="/recruitmentportal/RemoveEntryController?id=<%=result.getInt("id") %>" ><%=result.getString("name") %></a></td>
		  <td><a href="/recruitmentportal/RemoveEntryController?id=<%=result.getInt("id") %>" ><%=result.getString("designation") %></a></td>
		  <td><a href="/recruitmentportal/RemoveEntryController?id=<%=result.getInt("id") %>" ><%=result.getString("experience") %></a></td>
		  <td><a href="/recruitmentportal/RemoveEntryController?id=<%=result.getInt("id") %>" ><%=result.getString("comments") %></a></td>
		  <td><a href="/recruitmentportal/RemoveEntryController?id=<%=result.getInt("id") %>" ><%=result.getString("lastmodified") %></a></td>
		 
		 </tr>
		
		<% 		
	}
		%>
		</tbody>
		</table>
		
		</div>
		
		</div>
		<%
		stat1.close();
		con.close();
		%>


</body>
<script>
$(document).ready(function(){
    $('#mytable').dataTable();
});
</script>
</html>