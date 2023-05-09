<%@page import="com.kheti.Inventory.util.DateUtil"%>
<%@page import="com.kheti.Inventory.util.Units"%>
<%@ page import="java.util.*"%>
<%@ page import="com.kheti.Inventory.model.*"%>
<jsp:include page="/header">
   <jsp:param name="title" value="Create Update Expense"/>
</jsp:include>


<link rel="stylesheet" href="css/form.css"> 
<script src="js/form.js"></script>
 
<script>

<%

Expense	expense = (Expense) request.getAttribute("expense");

int productInitialCount = expense.getProductList() != null ? expense.getProductList().size() : 0;
int paymentInitialCount = expense.getPaymentList() != null ? expense.getPaymentList().size() : 0;

String paymentTypes[]={"Cash","Online","Cheque"};

%>
var productRowIndex=<%=productInitialCount + 1%>;
var productRowIDIndex=<%=productInitialCount%>;
var paymentRowIndex=<%=paymentInitialCount + 1%>;
var paymentRowIDIndex=<%=paymentInitialCount%>;

function calcDefaults(){
	
}

function addProductRow() {
	  var table = document.getElementById("productTable");
	  var row = table.insertRow(productRowIndex);
	  var cell1 = row.insertCell(0);
	  var cell2 = row.insertCell(1);
	  var cell3 = row.insertCell(2);
	  var cell4 = row.insertCell(3);
	  var cell5 = row.insertCell(4);
	  var cell6 = row.insertCell(5);
	  var cell7 = row.insertCell(6);
	  var cell8 = row.insertCell(7);
	  var cell9 = row.insertCell(8);
	  var cell10 = row.insertCell(9);
	  var cell11 = row.insertCell(10);
		
	  cell1.innerHTML = createCategoryCell("category"+productRowIDIndex);
	  
	  cell2.innerHTML = "<input type=text name='productName"+productRowIDIndex+"'  id='productName"+productRowIDIndex+"'  size=14> ";
	  cell3.innerHTML = "<input type=text name='brandName"+productRowIDIndex+"'  id='brandName"+productRowIDIndex+"'  size=10> ";
	  cell4.innerHTML = createUnitTypeCell("unitType"+productRowIDIndex);
	  cell5.innerHTML = "<input type=number name='subUnitQuantity"+productRowIDIndex+"'  id='subUnitQuantity"+productRowIDIndex+"'   style='width: 50px'> ";
	  cell6.innerHTML = "<input type=text name='quantity"+productRowIDIndex+"'  id='quantity"+productRowIDIndex+"'  size=4 onchange='reloadProperties()' > ";
	  cell7.innerHTML = "<input type=text name='unitPrice"+productRowIDIndex+"'  id='unitPrice"+productRowIDIndex+"'  size=4 onchange='reloadProperties()' > ";
	  cell8.innerHTML = "<input type=text name='taxPercentage"+productRowIDIndex+"'  id='taxPercentage"+productRowIDIndex+"'  size=4 onchange='reloadProperties()' > ";
	  cell9.innerHTML = "<input type=date name='expiryDate"+productRowIDIndex+"'  id='expiryDate"+productRowIDIndex+"' > ";
	  cell10.innerHTML = "<div id='rowTotal"+productRowIDIndex+"'> </div>";
	  cell11.innerHTML = "<div class=delete  onclick='deleteProductRow(this)'>Delete</div>";

	  productRowIndex=productRowIndex+1;
	  productRowIDIndex=productRowIDIndex+1;
	  document.myForm.productCount.value=productRowIDIndex;
};

function deleteProductRow(r) {
	var i = r.parentNode.parentNode.rowIndex;
	document.getElementById("productTable").deleteRow(i);
	productRowIndex=productRowIndex-1;
};

function createCategoryCell(fieldName){	
	<%
	List<Category> categories= (List<Category>)request.getAttribute("categories");
	String optionList="";
	for (Category category : categories) {
		optionList += "<option value='"+category.getId()+"'> "+category.getCategoryName()+" </option>";
		
	}
	%>
	var str="<select name="+fieldName +" id="+fieldName +" >" + "<%=optionList %>" + "</select>";
	
	//alert(str);
	return str;
}

function createUnitTypeCell(fieldName){	
	<%
	optionList="";
	for (String unit : Units.unitTypes) {
		optionList += "<option value='"+unit+"'> "+unit+" </option>";		
	}
	for (String unit : Units.complexUnitTypes) {
		optionList += "<option value='"+unit+"'> "+unit+" </option>";		
	}	
	%>
	var str="<select name="+fieldName +" id="+fieldName +" >" + "<%=optionList %>" + "</select>";	

	//alert(str);
	return str;
}


function addPaymentRow() {
	  var table = document.getElementById("paymentTable");
	  var row = table.insertRow(paymentRowIndex);
	  var cell1 = row.insertCell(0);
	  var cell2 = row.insertCell(1);
	  var cell3 = row.insertCell(2);
	  var cell4 = row.insertCell(3);
	  var cell5 = row.insertCell(4);
	  
	  cell1.innerHTML = createPaymentTypeCell("paymentType"+paymentRowIDIndex);
	  cell2.innerHTML = "<input type=text name='amount"+paymentRowIDIndex+"'  id='amount"+paymentRowIDIndex+"'  onchange='reloadProperties()' > ";
	  cell3.innerHTML = "<input type=text name='comment"+paymentRowIDIndex+"'  id='comment"+paymentRowIDIndex+"' > ";
	  cell4.innerHTML = " Today ";
	  cell5.innerHTML = "<div class=delete  onclick='deletePaymentRow(this)'>Delete</div>";

	  paymentRowIndex=paymentRowIndex+1;
	  paymentRowIDIndex=paymentRowIDIndex+1;
	  document.myForm.paymentCount.value=paymentRowIDIndex;
};

function deletePaymentRow(r) {
	var i = r.parentNode.parentNode.rowIndex;
	document.getElementById("paymentTable").deleteRow(i);
	paymentRowIndex=paymentRowIndex-1;
};

function createPaymentTypeCell(fieldName){	

	var str="<select name="+fieldName +" id="+fieldName +" >" +
			"<option value='Cheque'>Cheque</option>" +
			"<option value='Cash'>Cash</option>" +
			"<option value='Online'>Online</option>" +
	 		"</select>";
	
	//alert(str);
	return str;
}


function validateForm(){

	var form=document.forms["myForm"];
	
	var isFormInfoNotValid = validateValue(form["taxApplied"] , "Tax Applied") <0 ||
		validateValue(form["fullPaid"] , "Paid Status") <0 ||
		validateValue(form["transactionType"] , "Transaction Type") <0 ||
		validateValue(form["venderId"] , "Vender") <0  ;
	
	if(isFormInfoNotValid){
		return false;
	}
	
	//product Validation
	var productInitialIndex= document.myForm.productInitialCount.value;

	for(let i=0; i<productRowIDIndex ;i++){
		
		if( document.getElementById("productName"+i) ==null)
			continue;
		
		var isProductInfoNotValid =
			validateValue( document.getElementById("productName"+i), "Product Name" )<0 ||
			validateValue(document.getElementById("category"+i), "Category" )<0 ||
			validateValue(document.getElementById("brandName"+i), "Brand Name" )<0 ||
			validateValue(document.getElementById("unitType"+i), "Unit Type" )<0 ||
			validateDecimalNumber(document.getElementById("quantity"+i), "Quantity" )<0||
			validateDecimalNumber(document.getElementById("unitPrice"+i), "Unit Price" )<0 ;
	
		if(isProductInfoNotValid){
			return false;
		}

		//subUnitQuantity should be there in case of Complex Unit Type
		if( !validateComplexUnitType(document.getElementById("unitType"+i).value ,
				document.getElementById("subUnitQuantity"+i))){
			return false;
		}
		
		//Tax percentage is required if taxApplied = true

		if(form["taxApplied"].value=="true" && 
				validateDecimalNumber(document.getElementById("taxPercentage"+i), "Tax Percentage" )<0){
			return false;
		}
	}	

	//Payment Validation
	var paymentInitialIndex= document.myForm.paymentInitialCount.value;

	for(let i=0; i<paymentRowIDIndex ;i++){
		
		if( document.getElementById("amount"+i) ==null)
			continue;
		
		var isPaymentInfoNotValid =
			validateValue( document.getElementById("paymentType"+i), "Payment Type" )<0 ||
			validateDecimalNumber(document.getElementById("amount"+i), "Amount" )<0 ;
	
		if(isPaymentInfoNotValid){
			return false;
		}
	}
	
	return true;	
}


function validateComplexUnitType(unitType, subUnitQuantityField){	
<%
	for (String unit : Units.unitTypes) {
%>
	if(unitType=="<%=unit%>") return true;
<%
	}	
%>
	if(validateDecimalNumber(subUnitQuantityField,"Sub Unit Quantity" )>0){
		return true;
	}

	return false;
}



</script>


</head>
<body onload="calcDefaults()">



	<form action="createExpense" method="post" name="myForm" class="myForm" 
		onsubmit="return validateForm()">

		<h2>Expense Information</h2>
		<h3><font color="red">${errorMessage}</font></h3>
		
		<hr>

		<input type="hidden" name="id" value="${expense.id}" /> 

		<br> Vender <select name="venderId">
<%
	int orgId=expense.getVender()!=null ? expense.getVender().getOrgID() : 0;
	List<Organization> organizations = (List<Organization>)request.getAttribute("organizations");
	for (Organization organization : organizations) {
%>
		<option value="<%=organization.getOrgID()%>"
			<%=organization.getOrgID()==orgId ? "selected" : ""%> ><%=organization.getOrgName()%></option>
<%
	}
%>
		</select> <br>

		Taxable ? <input type="radio" name="taxApplied" value="yes" ${expense.taxApplied=="yes" ? "checked" : ""}  onchange='reloadProperties()'  /> Yes
		 <input type="radio" name="taxApplied" value="no" ${expense.taxApplied=="no" ? "checked" : ""}  onchange='reloadProperties()'  /> No <br>
		 
		 <input type="radio" name="fullPaid" value="yes" ${expense.fullPaid=="yes" ? "checked" : ""} /> Full
		 <input type="radio" name="fullPaid" value="no" ${expense.fullPaid=="no" ? "checked" : ""} /> Partial Payment  <br>

		 <input type="radio" name="transactionType" value="purchase" ${expense.transactionType=="purchase" ? "checked" : ""} /> Purchase
		 <input type="radio" name="transactionType" value="sell" ${expense.transactionType=="sell" ? "checked" : ""} /> Sell  <br>
		 

		<hr>
		<p id="cropinftext">------------Product Information -------</p>
		<hr>

		<p id="adding" onclick="addProductRow()">Add New Product</p>
		<hr>

		<input type="hidden" name="productCount" value=<%=productInitialCount%> />
		<input type="hidden" name="productInitialCount"
			value=<%=productInitialCount%> />
		<table id="productTable" border=1>

			<tr>
				<td>Category</td>
				<td>Name</td>
				<td>Brand</td>
				<td>Unit</td>
				<td>Scale</td>
				<td>Quantity</td>
				<td>Unit Price</td>
				<td>Tax %</td>
				<td>Expiry Date</td>
				<td>Total</td>
				<td>Action</td>
			</tr>
			<%
			for (int i = 0; i < productInitialCount; i++) {
				ProductItem product = expense.getProductList().get(i);
			%>
			<tr>
				<td><input type=hidden name='productId<%=i%>' id='productId<%=i%>'
					value="<%=product.getId()%>"> 
				
				<select name="category<%=i%>">
<%
	int catId=product.getCategory().getId();
	for (Category category : categories) {
%>
		<option value="<%=category.getId()%>"
			<%=category.getId()==catId ? "selected" : ""%> ><%=category.getCategoryName() %></option>
<%
	}
%>
		</select>	
					

				</td>
				<td><input type=text name='productName<%=i%>' id='productName<%=i%>'
					value="<%=product.getProductName()%>" size=14></td>
				<td><input type=text name='brandName<%=i%>' id='brandName<%=i%>'
					value="<%=product.getBrandName()%>" size=10></td>
				<td>
				<select name="unitType<%=i%>">
<%
	String unitTypeSelected=product.getUnitType();
	for (String unit : Units.unitTypes) {
%>	<option value="<%=unit%>" <%=unit.equals(unitTypeSelected) ? "selected" : ""%> ><%=unit %></option>
<%	}
	
	for (String unit : Units.complexUnitTypes) {
%>	<option value="<%=unit%>" <%=unit.equals(unitTypeSelected) ? "selected" : ""%> ><%=unit %></option>
<%	}
%>
		</select>	
				</td>
				<td><input type=number name='subUnitQuantity<%=i%>'
					id='subUnitQuantity<%=i%>' value="<%=product.getSubUnitQuantity()%>" style='width: 50px'></td>
				<td><input type=text name='quantity<%=i%>'
					id='quantity<%=i%>' value="<%=product.getQuantity()%>" size=4  onchange='reloadProperties()' ></td>
				<td><input type=text name='unitPrice<%=i%>'
					id='unitPrice<%=i%>' value="<%=product.getUnitPrice()%>" size=4  onchange='reloadProperties()' ></td>
				<td><input type=text name='taxPercentage<%=i%>'
					id='taxPercentage<%=i%>' value="<%=product.getTaxPercentage()%>" size=4  onchange='reloadProperties()' ></td>
				<td><input type=date name='expiryDate<%=i%>'
					id='expiryDate<%=i%>' value="<%=DateUtil.getString(product.getExpiryDate()) %>" ></td>

				<td><div id='rowTotal<%=i%>'></div></td>
				<td></td>
			</tr>
			<%
			}
			%>
			
			<tr>
				<td colspan="5"><b>Total </b></td>
				<td><div id="totalQuantity"></div></td>
				<td><div id="totalPrice"></div></td>
				<td><div id="totalTax"></div></td>
				<td >Total Amount</td>
				<td><div id="totalAmount"><%= String.format("%.3f", expense.getTotalAmount()) %></div></td>				
			</tr>
			
		</table>
		

		<hr>
		<p id="cropinftext">------------Payment Information -------</p>
		<hr>

		<p id="adding" onclick="addPaymentRow()">Add New Payment</p>
		<hr>

		<input type="hidden" name="paymentCount" value=<%=paymentInitialCount%> />
		<input type="hidden" name="paymentInitialCount"
			value=<%=paymentInitialCount%> />
		<table id="paymentTable" border=1>

			<tr>
				<td>Pay Type</td>
				<td>Amount</td>
				<td>Comment</td>
				<td>Date</td>
				<td>Action</td>
			</tr>
			<%
			for (int i = 0; i < paymentInitialCount; i++) {
				Payment payment = expense.getPaymentList().get(i);
			%>
			<tr>
					 
				<td><input type=hidden name='paymentId<%=i%>' id='paymentId<%=i%>'
					value="<%=payment.getId() %>">
					
				<select name="paymentType<%=i%>">
<%
	String paymentType=payment.getPaymentType();
	for (String payType : paymentTypes) {
%>
		<option value="<%=payType%>"
			<%=payType.equalsIgnoreCase(paymentType) ? "selected" : ""%> ><%=payType %></option>
<%
	}
%>
				</select>	
				</td>
				<td><input type=text name='amount<%=i%>' id='amount<%=i%>'
					value="<%=payment.getAmout()%>"  onchange='reloadProperties()' >
				</td>				
				<td><input type=text name='comment<%=i%>' id='comment<%=i%>'
					value="<%=payment.getComment()%>"></td>
				<td><%=DateUtil.getString(payment.getEnteredOn())%></td>
				<td></td>
</tr>
<%
			}
%>

			<tr>
				<td>Total Paid</td>
				<td><div id="totalPaid"><%= String.format("%.3f", expense.getTotalPaid()) %></div></td>
			</tr>
</table>		


		<input id="btn" type=submit value="Save Form" />

	</form>

<script type="text/javascript">

function reloadProperties(){

//	alert('aya');
	let totalQuantity=0;
	let totalUnitPrice=0;
	let totalTax=0;
	let totalAmount=0;



	for(let i=0; i<productRowIDIndex ;i++){
		
		if( document.getElementById("productName"+i) ==null)
			continue;
		
		let quantity=parseFloat(document.getElementById("quantity"+i).value) ;
		totalQuantity = totalQuantity+quantity;
		
		let unitPrice=parseFloat(document.getElementById("unitPrice"+i).value);
		totalUnitPrice = totalUnitPrice + (quantity*unitPrice);
	
		let tax=0;

		if(document.myForm.taxApplied.value=="yes" ){
			let taxPercentage=parseFloat(document.getElementById("taxPercentage"+i).value);
			tax= parseFloat(totalUnitPrice * taxPercentage/ 100 );			
		}
		totalTax = totalTax + tax;
		totalAmount = totalAmount + totalUnitPrice + tax;
		
		document.getElementById("rowTotal"+i).innerText= (totalUnitPrice + tax);
	}	
	document.getElementById("totalQuantity").innerText= totalQuantity;
	document.getElementById("totalPrice").innerText= totalUnitPrice;
	document.getElementById("totalTax").innerText= totalTax;
	document.getElementById("totalAmount").innerText= totalAmount;
	
	

	//Payment Validation
	let totalPaid=0;

	for(let i=0; i<paymentRowIDIndex ;i++){
		
		if( document.getElementById("amount"+i) ==null)
			continue;
		
		let amount=parseFloat(document.getElementById("amount"+i).value ) ;
		totalPaid = totalPaid + amount;
		//alert(totalPaid);
	}
	document.getElementById("totalPaid").innerText= totalPaid;
	

	
};

</script>

<jsp:include page="/footer"></jsp:include>
