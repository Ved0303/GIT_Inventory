<jsp:include page="/header">
   <jsp:param name="title" value="Create Update WearHouses"/>
</jsp:include>

<%@ page
	import="java.util.*,com.kheti.Inventory.model.WearHouse"%>

 
<script src="js/form.js"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
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


		<form action="createWearHouse" method="post" name="myForm" class="border m-3 border-primary bg-info-subtle fw-bold"
        onsubmit="return validateForm()">

        <h2 class=" border-bottom border-danger text-center ">WearHouse Information</h2>
        <h3>
            <font color="red">${errorMessage}</font>
        </h3>
        <input type="hidden" name="id" value="${wearHouse.id}" />
        <div class="m-3 col-lg-4">
            <label for="  WearHouse Name " class="form-label"> WearHouse Name  </label>
           <input type="text"  class="form-control" id=" WearHouse Name " name="wearHouseName" value="${wearHouse.wearHouseName}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="  WearHouse Address  " class="form-label">  WearHouse Address  </label>
            <input type="text"  class="form-control" id="  WearHouse Address " name="wearHouseAddress" value="${wearHouse.wearHouseAddress}" />
        </div>
        <div class="m-3 col-lg-4">
            <label for="  WearHouse Contact " class="form-label">  WearHouse Contact </label>
            <input type="text"  class="form-control" id="  WearHouse Contact" name="wearHouseContact" value="${wearHouse.wearHouseContact}" />
        </div>

        <input id="btn" class="btn btn-primary m-3" type=submit value="Save Form" />

    </form>

<jsp:include page="/footer"></jsp:include>
