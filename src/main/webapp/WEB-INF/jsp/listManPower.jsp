<jsp:include page="/header">
   <jsp:param name="title" value="ManPower List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.ManPower"%>

		<h2>List Of ManPowers</h2><br>


<table Border=1>
  <tr>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Aadhar</th>
    <th>PAN</th>
    <th>Type</th>
    <th>Action</th>
  </tr>
<%
List<ManPower> manPowerList= request.getAttribute("manPowerList") !=null ? (List<ManPower>)request.getAttribute("manPowerList") : new ArrayList();

for(ManPower manPower: manPowerList){
%>
  <tr>
    <td><%= manPower.getName()%></td>
    <td><%= manPower.getEmail()%></td>
    <td><%= manPower.getPhone()%></td>
    <td><%= manPower.getAadhar()%></td>
    <td><%= manPower.getPan()%></td>
    <td><%= manPower.getType()%></td>
    <td><a href="/createManPower?manPowerId=<%= manPower.getId() %>"> Edit </a></td>
  </tr>

<%
}
%>
</table>


<jsp:include page="/footer"></jsp:include>
