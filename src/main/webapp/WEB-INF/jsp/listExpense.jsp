<%@page import="com.kheti.Inventory.util.DateUtil"%>
<jsp:include page="/header">
   <jsp:param name="title" value="Expense List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.*"%>
	

		<h2>List Of Expensses</h2><br>

<table Border=1>
  <tr>
    <th>Vender</th>
    <th>Taxable</th>
    <th>Status</th>
    <th>Type</th>
    <th>Total Amount</th>
    <th>Paid Amount</th>
    <th>Product Count</th>
    <th>Entered</th>
    <th>Updated</th>
    <th>Action</th> 
  </tr>
<%
List<Expense> expenseList = request.getAttribute("expenseList") !=null ? (List<Expense>)request.getAttribute("expenseList") : new ArrayList();

for(Expense expense: expenseList){

%>
  <tr>
    <td><%= expense.getVender().getOrgName() %></td>
    <td><%= expense.getTaxApplied() %></td>
    <td><%= expense.getFullPaid().equalsIgnoreCase("yes") ?"Paid" :"Pending" %></td>
    <td><%= expense.getTransactionType() %></td>
    <td><%= expense.getTotalAmount() %></td>
    <td><%= expense.getTotalPaid() %></td>
    <td><%= expense.getProductList().size() %></td>
    <td><%= DateUtil.getString(expense.getEnteredOn()) %></td>
    <td><%= DateUtil.getString(expense.getModifiedOn()) %></td>
    
    <td><a href="/createExpense?id=<%= expense.getId() %>"> Edit </a></td>
  </tr>

<%
}
%>
</table>

-----
<jsp:include page="/footer"></jsp:include>
