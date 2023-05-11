<jsp:include page="/header">
   <jsp:param name="title" value="Create Update Organizations"/>
</jsp:include>

<%@ page
	import="java.util.*,com.kheti.Inventory.model.Organization"%>


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


	<form action="createOrganization" method="post" name="myForm"
        class="border m-3 border-primary bg-info-subtle fw-bold" onsubmit="return validateForm()">

        <h2 class=" border-bottom border-danger text-center ">Organization Information</h2>
        <h3>
            <font color="red">${errorMessage}</font>
        </h3>
        <input type="hidden" name="orgID" value="${organization.orgID}" />
        <div class="m-3 col-lg-4">
            <label for=" Organization Name " class="form-label"> Organization Name </label>
            <input type="text" class="form-control" id=" Organization Name" name="orgName"
                value="${organization.orgName}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="Organization Email" class="form-label">Organization Email</label>
            <input type="text" class="form-control" id="Organization Email" name="email"
                value="${organization.email}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="Organization Phone" class="form-label">Organization Phone</label>
            <input type="text" class="form-control" id="Organization Phone" name="phone"
                value="${organization.phone}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="Organization Aadhar" class="form-label">Organization Aadhar</label>
            <input type="text" class="form-control" id="Organization Aadhar" name="aadhar"
                value="${organization.aadhar}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="Organization PAN" class="form-label">Organization PAN</label>
            <input type="text" class="form-control" id="Organization PAN" name="pan" value="${organization.pan}" />
        </div>
        <div class="m-3 col-lg-4">
            <h6 class="fw-bold">Organization Type </h6>
            <label class="radio-inline">
                <input type="radio" name="orgType" value="Customer" ${organization.orgType=="Customer" ? "checked" : ""
                    } /> Customer</label>
            <label class="radio-inline">
                <input type="radio" name="orgType" value="Supplier" ${organization.orgType=="Supplier" ? "checked" : ""
                    } />
                Supplier</label>
        </div>

        <input id="btn" type=submit class="btn btn-primary m-3" value="Save Form" />

    </form>

<jsp:include page="/footer"></jsp:include>
