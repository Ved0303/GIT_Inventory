<%@page import="com.kheti.Inventory.util.DateUtil"%>
<jsp:include page="/header">
   <jsp:param name="title" value="Expense List"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@ page
	import="com.kheti.Inventory.model.*"%>
	
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
        <h2 class="text-center">List Of Expenses</h2>
<table id="example" class="table table-hover table-striped" style="width:100%">
 <thead>
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
  </thead>
  
  <tbody>
<%
List<Expense> expenseList = request.getAttribute("expenseList") !=null ? (List<Expense>)request.getAttribute("expenseList") : new ArrayList();

for(Expense expense: expenseList){

%>
  <tr>
    <td><%= expense.getVender().getOrgName() %></td>
    <td><%= expense.getTaxApplied() %></td>
    <td><%= expense.getFullPaid()!=null && expense.getFullPaid().equalsIgnoreCase("yes") ?"Paid" :"Pending" %></td>
    <td><%= expense.getTransactionType() %></td>
    <td align="right"><%= String.format("%.2f",expense.getTotalAmount()) %></td>
    <td align="right"><%= String.format("%.2f",expense.getTotalPaid()) %></td>
    <td align="right"><%= expense.getProductList().size() %></td>
    <td><%= DateUtil.getString(expense.getEnteredOn()) %></td>
    <td><%= DateUtil.getString(expense.getModifiedOn()) %></td>
    
    <td><a href="/createExpense?id=<%= expense.getId() %>"> Edit </a></td>
  </tr>

<%
}
%>
</tbody>
</table>
</div>

-----
<jsp:include page="/footer"></jsp:include>
