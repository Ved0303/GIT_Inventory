<jsp:include page="/header">
   <jsp:param name="title" value="Create Update Organizations"/>
</jsp:include>

<%@ page
	import="java.util.*,com.kheti.Inventory.model.Organization"%>

<link rel="stylesheet" href="css/form.css"> 
<script src="js/form.js"></script>
 
<script>

<%

Organization organization = (Organization) request.getAttribute("organization");

%>

function validateForm(){

	var form=document.forms["myForm"];
	
	var isFormInfoNotValid = validateValue(form["orgName"] , "Organization Name") <0 ||
		validateValue(form["email"] , "Organization email") <0 ||
		validateValue(form["phone"] , "Organization phone") <0 ||
		validateValue(form["aadhar"] , "Organization aadhar") <0 ||
		validateValue(form["pan"] , "Organization PAN") <0 ||
		validateValue(form["orgType"] , "Organization Type") <0  ;
	
	if(isFormInfoNotValid){
		return false;
	}
	return true;	
}

</script>


	<form action="createOrganization" method="post" name="myForm" class="myForm" 
		onsubmit="return validateForm()">

		<h2>Organization Information</h2>
		<h3><font color="red">${errorMessage}</font></h3>		
		<hr><br>

		<input type="hidden" name="orgID" value="${organization.orgID}" /> 
		Organization Name <input type="text" name="orgName" value="${organization.orgName}" /><br> 
		Organization Email <input type="text" name="email" value="${organization.email}" /><br> 
		Organization Phone <input type="text" name="phone" value="${organization.phone}" /><br> 
		Organization Aadhar <input type="text" name="aadhar" value="${organization.aadhar}" /><br> 
		Organization PAN <input type="text" name="pan" value="${organization.pan}" /><br> 
		Organization Type <input type="radio" name="orgType" value="Customer" ${organization.orgType=="Customer" ? "checked" : ""}/> Customer 
						  <input type="radio" name="orgType" value="Supplier" ${organization.orgType=="Supplier" ? "checked" : ""}/> Supplier <br> 

		<input id="btn" type=submit value="Save Form" />

	</form>


<jsp:include page="/footer"></jsp:include>
