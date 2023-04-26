<jsp:include page="/header">
   <jsp:param name="title" value="Form List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="java.util.Map,com.kheti.Inventory.model.Form,com.kheti.Inventory.model.Crop"%>

<table Border=1>
  <tr>
    <th>Form Name</th>
    <th>Location</th>
    <th>Area</th>
    <th>Valves</th>
    <th>Action</th>
  </tr>
<%
List<Form> formList= request.getAttribute("formList") !=null ? (List<Form>)request.getAttribute("formList") : new ArrayList();

for(Form form: formList){
%>
  <tr>
    <td><%= form.getFormName()%></td>
    <td><%= form.getCity()%>, <%= form.getState()%></td>
    <td><%= form.getArea()%>  <%= form.getAreaType()%></td>
    <td><%= form.getValveCapacity()%></td>
    <td><a href="/createForm?formId=<%= form.getFormId() %>"> Edit </a></td>
  </tr>

<%
}
%>
</table>


<jsp:include page="/footer"></jsp:include>
