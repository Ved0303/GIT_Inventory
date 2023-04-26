<jsp:include page="/header">
   <jsp:param name="title" value="WearHouse List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.WearHouse"%>

		<h2>List Of WearHouses</h2><br>


<table Border=1>
  <tr>
    <th>WearHouse Name</th>
    <th>Location</th>
    <th>Contact</th>
    <th>Action</th>
  </tr>
<%
List<WearHouse> wearHouseList= request.getAttribute("wearHouseList") !=null ? (List<WearHouse>)request.getAttribute("wearHouseList") : new ArrayList();

for(WearHouse wearHouse: wearHouseList){
%>
  <tr>
    <td><%= wearHouse.getWearHouseName()%></td>
    <td><%= wearHouse.getWearHouseAddress()%></td>
    <td><%= wearHouse.getWearHouseContact()%></td>
    <td><a href="/createWearHouse?wearHouseId=<%= wearHouse.getId() %>"> Edit </a></td>
  </tr>

<%
}
%>
</table>


<jsp:include page="/footer"></jsp:include>
