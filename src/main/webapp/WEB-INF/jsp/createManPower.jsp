<jsp:include page="/header">
   <jsp:param name="title" value="Create Update ManPowers"/>
</jsp:include>

<%@ page
	import="java.util.*,com.kheti.Inventory.model.ManPower"%>

<link rel="stylesheet" href="css/form.css"> 
<script src="js/form.js"></script>
<script>

<%

ManPower manPower = (ManPower) request.getAttribute("manPower");

%>

function validateForm(){

	var form=document.forms["myForm"];
	
	var isFormInfoNotValid = validateValue(form["name"] , "Name") <0 ||
	validateValue(form["email"] , "Email") <0 ||
	validateValue(form["phone"] , "Phone") <0 ||
	validateValue(form["aadhar"] , "Aadhar") <0 ||
	validateValue(form["pan"] , "PAN") <0 ||
	validateValue(form["type"] , "Type") <0  ;
	
	if(isFormInfoNotValid){
		return false;
	}
	return true;	
}

</script>


	<form action="createManPower" method="post" name="myForm" class="myForm" 
		onsubmit="return validateForm()">

		<h2>ManPower Information</h2>
		<h3><font color="red">${errorMessage}</font></h3>		
		<hr><br>

		<input type="hidden" name="id" value="${manPower.id}" /> 
		Name <input type="text" name="name" value="${manPower.name}" /><br> 
		Email <input type="text" name="email" value="${manPower.email}" /><br> 
		Phone <input type="text" name="phone" value="${manPower.phone}" /><br> 
		Aadhar <input type="text" name="aadhar" value="${manPower.aadhar}" /><br> 
		Pan <input type="text" name="pan" value="${manPower.pan}" /><br> 
		Type <input type="radio" name="type" value="Employee" ${manPower.type=="Employee" ? "checked" : ""}/> Employee 
			<input type="radio" name="type" value="Contractor" ${manPower.type=="Contractor" ? "checked" : ""}/> Contractor
			<input type="radio" name="type" value="Individual" ${manPower.type=="Individual" ? "checked" : ""}/> Individual <br> 
		

		<input id="btn" type=submit value="Save Form" />

	</form>


<jsp:include page="/footer"></jsp:include>
