<jsp:include page="/header">
   <jsp:param name="title" value="WearHouse List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.WearHouse"%>
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
    $('#example').DataTable();
});
</script>

		
<div class="container pt-2 mt-2 bg-warning-subtle ">
        <h2 class="text-center">List Of WearHouses</h2>
    <table id="example" class="table table-hover table-striped" style="width:100%">
        <thead>
  <tr>
    <th>WearHouse Name</th>
    <th>Location</th>
    <th>Contact</th>
    <th>Action</th>
  </tr>
  </thead>
  <tbody>
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
</tbody>
</table>
</div>

<jsp:include page="/footer"></jsp:include>
