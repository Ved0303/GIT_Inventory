<jsp:include page="/header">
   <jsp:param name="title" value="Organization List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.Organization"%>

		<h2>List Of Organizations</h2><br>

<table Border=1>
  <tr>
    <th>Organization Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Aadhar</th>
    <th>PAN</th>
    <th>Type</th>
    <th>Action</th> 
  </tr>
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
</table>

---
<jsp:include page="/footer"></jsp:include>
