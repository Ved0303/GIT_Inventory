<jsp:include page="/header">
   <jsp:param name="title" value="ManPower List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.ManPower"%>
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
        <h2 class="text-center">List Of ManPowers</h2>
    <table id="example" class="table table-hover table-striped" style="width:100%">
 <thead>
  <tr>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Aadhar</th>
    <th>PAN</th>
    <th>Type</th>
    <th>Action</th>
  </tr>
     </thead>
  <tbody>
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
</tbody>
</table>
</div>

<jsp:include page="/footer"></jsp:include>
