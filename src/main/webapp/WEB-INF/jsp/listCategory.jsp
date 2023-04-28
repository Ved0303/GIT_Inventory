<jsp:include page="/header">
   <jsp:param name="title" value="Category List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.Category"%>

		<h2>List Of Category</h2><br>


<table Border=1>
  <tr>
    <th>Category Name</th>
    <th>Equipment Type</th>
    <th>Inbound/Outbound</th>
    <th>Parent Category</th>
    <th>Action</th>
  </tr>
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
</table>


<jsp:include page="/footer"></jsp:include>
