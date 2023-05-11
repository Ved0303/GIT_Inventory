<jsp:include page="/header">
   <jsp:param name="title" value="Create Update ManPowers"/>
</jsp:include>

<%@ page
	import="java.util.*,com.kheti.Inventory.model.ManPower"%>
	
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


 <form action="createManPower" method="post" name="myForm" class="border m-3 border-primary bg-info-subtle fw-bold "
        onsubmit="return validateForm()">

        <h2 class="text-center border-bottom border-danger ">ManPower Information</h2>
        <h3>
            <font color="red">${errorMessage}</font>
        </h3>


        <input type="hidden" name="id" value="${manPower.id}" />
        <div class="m-3 col-lg-4 ">
            <label for="Name" class="form-label"> Name</label>
            <input type="text" class="form-control" id="Name" name="name" value="${manPower.name}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="Email" class="form-label"> Email</label>
            <input type="email" class="form-control" id="Email" name="email" value="${manPower.email}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="Phone" class="form-label"> Phone</label>
            <input type="tel" class="form-control" id="Phone" name="phone" value="${manPower.phone}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="Aadhar Number" class="form-label"> Aadhar Number</label>
            <input type="text" class="form-control" id="Aadhar Number" name="aadhar" value="${manPower.aadhar}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="Pan Number" class="form-label"> Pan Number</label>
            <input type="text" class="form-control" id="Pan Number" name="pan" value="${manPower.pan}" />
        </div>
        <div class="m-3 col-lg-4">
            <h6 class="fw-bold">Type</h6>
            <label class="radio-inline">
                <input type="radio" name="type" value="Employee" ${manPower.type=="Employee" ? "checked" : "" } />
                Employee
            </label>
            <label class="radio-inline">
                <input type="radio" name="type" value="Contractor" ${manPower.type=="Contractor" ? "checked" : "" } />
                Contractor
            </label>
            <label class="radio-inline">
                <input type="radio" name="type" value="Individual" ${manPower.type=="Individual" ? "checked" : "" } />
                Individual
            </label>
        </div>
        <input class="btn btn-primary m-3" type=submit value="Save Form" />
    </form>


<jsp:include page="/footer"></jsp:include>
