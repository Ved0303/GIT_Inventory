<jsp:include page="/header">
   <jsp:param name="title" value="Create Update WearHouses"/>
</jsp:include>

<%@ page
	import="java.util.*,com.kheti.Inventory.model.WearHouse"%>

<link rel="stylesheet" href="css/form.css"> 
<script src="js/form.js"></script>
<script>

<%

WearHouse wearHouse = (WearHouse) request.getAttribute("wearHouse");

%>

function validateForm(){

	var form=document.forms["myForm"];
	
	var isFormInfoNotValid = validateValue(form["wearHouseName"] , "WearHouse Name") <0 ||
		validateValue(form["wearHouseAddress"] , "WearHouse Address") <0 ||
		validateValue(form["wearHouseContact"] , "WearHouse Contact") <0 ;
	
	if(isFormInfoNotValid){
		return false;
	}
	return true;	
}

</script>


	<form action="createWearHouse" method="post" name="myForm" class="myForm" 
		onsubmit="return validateForm()">

		<h2>WearHouse Information</h2>
		<h3><font color="red">${errorMessage}</font></h3>		
		<hr><br>

		<input type="hidden" name="id" value="${wearHouse.id}" /> 
		WearHouse Name <input type="text" name="wearHouseName" value="${wearHouse.wearHouseName}" /><br> 
		WearHouse Address <input type="text" name="wearHouseAddress" value="${wearHouse.wearHouseAddress}" /><br> 
		WearHouse Contact <input type="text" name="wearHouseContact" value="${wearHouse.wearHouseContact}" /><br> 

		<input id="btn" type=submit value="Save Form" />

	</form>


<jsp:include page="/footer"></jsp:include>
