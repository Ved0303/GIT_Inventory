<jsp:include page="/header">
   <jsp:param name="title" value="Category List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.Category"%>


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
        <h2 class="text-center">List Of Category</h2>
    <table id="example" class="table table-hover table-striped" style="width:100%">
 <thead>
  <tr>
    <th>Category Name</th>
    <th>Equipment Type</th>
    <th>Inbound/Outbound</th>
    <th>Parent Category</th>
    <th>Action</th>
  </tr>
   </thead>
   <tbody>
<%
List<Category> categoryList= request.getAttribute("categoryList") !=null ? (List<Category>)request.getAttribute("categoryList") : new ArrayList();

for(Category category: categoryList){
%>
 
  <tr>
    <td><%= category.getCategoryName()%></td>
    <td><%= category.getEquipmentType()%></td>
    <td><%= category.getInboundOutbound()%></td>
    <td><%= category.getParentCategory()!=null ? category.getParentCategory().getCategoryName() :"" %></td>
    <td><a href="/createCategory?categoryId=<%= category.getId() %>"> Edit </a></td>
  </tr>

<%
}
%>
</tbody>
</table>
</div>

<jsp:include page="/footer"></jsp:include>
