<jsp:include page="/header">
   <jsp:param name="title" value="Organization List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.Organization"%>
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
        <h2 class="text-center">List Of Organizations</h2>
    <table id="example" class="table table-hover table-striped" style="width:100%">
 <thead>
  <tr>
    <th>Organization Name</th>
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
List<Organization> organizationList= request.getAttribute("organizationList") !=null ? (List<Organization>)request.getAttribute("organizationList") : new ArrayList();

for(Organization organization: organizationList){

%>
  <tr>
    <td><%= organization.getOrgName()%></td>
    <td><%= organization.getEmail() %></td>
    <td><%= organization.getPhone() %></td>
    <td><%= organization.getAadhar() %></td>
    <td><%= organization.getPan() %></td>
    <td><%= organization.getOrgType() %></td>
    <td><a href="/createOrganization?organizationId=<%= organization.getOrgID() %>"> Edit </a></td>
  </tr>

<%
}
%>
</tbody>
</table>
</div>
-----
<jsp:include page="/footer"></jsp:include>
