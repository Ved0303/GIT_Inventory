<jsp:include page="/header">
   <jsp:param name="title" value="Form List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="java.util.Map,com.kheti.Inventory.model.Form,com.kheti.Inventory.model.Crop"%>
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
        <h2 class="text-center">List Of Forms</h2>
    <table id="example" class="table table-hover table-striped" style="width:100%">
 <thead>
  <tr>
    <th>Form Name</th>
    <th>Location</th>
    <th>Area</th>
    <th>Valves</th>
    <th>Action</th>
  </tr>
   </thead>
  <tbody>
<%
List<Form> formList= request.getAttribute("formList") !=null ? (List<Form>)request.getAttribute("formList") : new ArrayList();

for(Form form: formList){
%>
  <tr>
    <td><%= form.getFormName()%></td>
    <td><%= form.getCity()%>, <%= form.getState()%></td>
    <td align="right"><%= String.format("%.2f",form.getArea())%>  <%= form.getAreaType()%></td>
    <td align="right"><%= form.getValveCapacity()%></td>
    <td><a href="/createForm?formId=<%= form.getFormId() %>"> Edit </a></td>
  </tr>

<%
}
%>
</tbody>
</table>
</div>

<jsp:include page="/footer"></jsp:include>
