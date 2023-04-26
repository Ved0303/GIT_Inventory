<jsp:include page="/header">
   <jsp:param name="title" value="Create Update Forms"/>
</jsp:include>

<%@ page
	import="java.util.Map,com.kheti.Inventory.model.Form,com.kheti.Inventory.model.Crop"%>

<link rel="stylesheet" href="css/form.css"> 
<script src="js/form.js"></script>
 
<script>

<%

Form form2 = (Form) request.getAttribute("form");

int cropInitialCount = form2.getCropList() != null ? form2.getCropList().size() : 0;
%>
var rowIndex=<%=cropInitialCount + 1%>;
var rowIDIndex=<%=cropInitialCount%>;

function calcDefaults(){
	calculateRemaining();
	calcAllValveNo();
	calcAssignedCropArea();
	
}

function addRow() {
	  var table = document.getElementById("myTable");
	  var row = table.insertRow(rowIndex);
	  var cell1 = row.insertCell(0);
	  var cell2 = row.insertCell(1);
	  var cell3 = row.insertCell(2);
	  var cell4 = row.insertCell(3);
	  var cell5 = row.insertCell(4);
	  var cell6 = row.insertCell(5);
	
	  cell1.innerHTML = "<input type=text name='cropName"+rowIDIndex+"'  id='cropName"+rowIDIndex+"' > ";
	  cell2.innerHTML = "<input type=text name='variety"+rowIDIndex+"'  id='variety"+rowIDIndex+"' > ";
	  cell3.innerHTML = "<input type=text name='valveNumbers"+rowIDIndex+"' id='valveNumbers"+rowIDIndex+"'  onchange='calcAllValveNo()'> ";
	  cell4.innerHTML = "<input type=checkbox checked value='true' name='isActive"+rowIDIndex+"'   id='isActive"+rowIDIndex+"'> ";
	  cell5.innerHTML = "<input type=text name='cropArea"+rowIDIndex+"'id='cropArea"+rowIDIndex+"' onchange='calcAssignedCropArea()'> ";
	  cell6.innerHTML = "<div class=delete  onclick='deleteRow(this)'>Delete</div>"

	  rowIndex=rowIndex+1;
	  rowIDIndex=rowIDIndex+1;
	  document.myForm.cropCount.value=rowIDIndex;
};

function deleteRow(r) {
	var i = r.parentNode.parentNode.rowIndex;
	document.getElementById("myTable").deleteRow(i);
	rowIndex=rowIndex-1;
};

function calculateRemaining(){
	var area=document.getElementById("area").value;
	var culti=document.getElementById("cultivationArea").value;
	document.getElementById("remainingArea").value=parseFloat((area-culti).toFixed(5));
}

function validateForm(){

	var form=document.forms["myForm"];
	
	var isFormInfoNotValid = validateValue(form["formName"] , "Form Name") <0 ||
		validateValue(form["areaType"] , "Area Type") <0 ||
		validateValue(form["address1"] , "Address") <0 ||
		validateValue(form["city"] , "city") <0 ||
		validateValue(form["state"] , "state") <0 ||
		validateDecimalNumber(form["area"] , "area") <0 ||
		validateDecimalNumber(form["cultivationArea"] , "cultivation Area") <0 ||
		validateDecimalNumber(form["valveCapacity"] , "valve Capacity") <0 ;
	
	if(isFormInfoNotValid){
		return false;
	}
	
	//Crop Validation
	var cropInitialIndex= document.myForm.cropInitialCount.value;

	for(let i=0; i<rowIDIndex ;i++){
		
		if( document.getElementById("cropName"+i) ==null)
			continue;
		
		var isCorpInfoNotValid =
			validateValue( document.getElementById("cropName"+i), "Crop Name" )<0 ||
			validateValue(document.getElementById("variety"+i), "Variety" )<0 ||
			validateValue(document.getElementById("valveNumbers"+i), "Valve Numbers" )<0 ||
			validateDecimalNumber(document.getElementById("cropArea"+i), "Crop Area" )<0 ;
		
			if(isCorpInfoNotValid){
				return false;
			}
	}	

	let inputCount = rowIDIndex;

	for (let i = 0; i < (inputCount - 1); i++) {
		for (let j = (i + 1); j < inputCount; j++) {

			if (document.getElementById("cropName" + i) == null ||
				document.getElementById("cropName" + j) == null) {
				continue;
			}

			var arr1 = document.getElementById("valveNumbers" + i).value.split(",");
			var arr2 = document.getElementById("valveNumbers" + j).value.split(",");
			if (isCommon(arr1, arr2)) {
				alert("valve Numbers are repeated");
				document.getElementById("valveNumbers" + i).focus();
				return false;
			}
		}
	}

	var highestValveValue = document.getElementById("valveCapacity").value;
	
	var totalCropAreaAssigned=parseFloat(0);

	for (let i = 0; i < inputCount ; i++) {
		if (document.getElementById("valveNumbers" + i) == null) {
				continue;
		}

		var arr1 = document.getElementById("valveNumbers" + i).value.split(",");
		if(!isInRange(arr1,1,highestValveValue)){
			document.getElementById("valveNumbers" + i).focus();
			return false;
		}
		
		totalCropAreaAssigned += parseFloat(document.getElementById("cropArea" + i).value);
	}
	
	var totalCultivationArea=parseFloat(document.getElementById("cultivationArea").value);
	
	if(totalCultivationArea < totalCropAreaAssigned){
		document.getElementById("cultivationArea").focus();
		alert("Cultivation Area is less than total Crop Area Assigned");
		return false;
	}

	
	return true;	
}

function calcAllValveNo(){

	var arr = [];
	for (let i = 0; i < rowIDIndex; i++) {
		if (document.getElementById("cropName" + i) == null)
			continue;
		
		var arr1 = document.getElementById("valveNumbers" + i).value.split(",");
		if(arr1.length>0){
			arr=arr.concat(arr1.sort());
		}
	}

	document.getElementById("allValveNo").innerHTML=arr.sort();
}

function calcAssignedCropArea(){

	var total=parseFloat(0);

	for (let i = 0; i < rowIDIndex; i++) {
		if (document.getElementById("cropName" + i) == null)
			continue;
		
		if( ! validateNumber(document.getElementById("cropArea" + i).value )){
			continue;
		}
		
		var area = parseFloat(document.getElementById("cropArea" + i).value);
		total=total+area;
	}


	document.getElementById("assignedCropArea").innerHTML=total;

}


</script>


</head>
<body onload="calcDefaults()">



	<form action="createForm" method="post" name="myForm" class="myForm" 
		onsubmit="return validateForm()">

		<h2>Form Information</h2>
		<h3><font color="red">${errorMessage}</font></h3>
		
		<hr>

		<input type="hidden" name="formId" value="${form.formId}" /> Form
		Name <input type="text" name="formName" value="${form.formName}" />
		<br> Area <select name="areaType">
			<%
			Map<String, String> areaTypes = (Map<String, String>) request.getAttribute("areaTypes");
			for (String key : areaTypes.keySet()) {
			%>
			<option value="<%=key%>"
				<%=key.equalsIgnoreCase(form2.getAreaType()) ? "selected" : ""%>><%=areaTypes.get(key)%></option>
			<%
			}
			%>
		</select> <br> 
		Actual Form Area <input type="text" id="area" name="area"
			value="${form.area}" onChange="calculateRemaining()" /> <br>
		Cultivation Area <input type="text" id="cultivationArea"
			name="cultivationArea" value="${form.cultivationArea}"
			onChange="calculateRemaining()" /> <br> Remaining Area <input
			id="remainingArea" type="text" disabled="disabled" /> <br>
		Address 1 <input type="text" name="address1" value="${form.address1}" />
		Address 2 <input type="text" name="address2" value="${form.address2}" />
		<br> City <input type="text" name="city" value="${form.city}" />
		State <input type="text" name="state" value="${form.state}" /><br>

		Valve <input type="number" name="valveCapacity" id="valveCapacity"
			value="${form.valveCapacity}" />
		<hr>
		<p id="cropinftext">------------Crop Information -------</p>
		<hr>

		<p id="adding" onclick="addRow()">Add New Crop</p>
		<hr>

		<input type="hidden" name="cropCount" value=<%=cropInitialCount%> />
		<input type="hidden" name="cropInitialCount"
			value=<%=cropInitialCount%> />
		<table id="myTable" border=1>

			<tr>
				<td>Name</td>
				<td>Variety</td>
				<td>Valve No</td>
				<td>Active</td>
				<td>Crop Area</td>
				<td>Action</td>
			</tr>
			<%
			for (int i = 0; i < cropInitialCount; i++) {
				Crop crop = form2.getCropList().get(i);
			%>
			<tr>
				<td><input type=hidden name='cropId<%=i%>' id='cropId<%=i%>'
					value="<%=crop.getCropId()%>"> <input type=text
					name='cropName<%=i%>' id='cropName<%=i%>'
					value="<%=crop.getCropName()%>"></td>
				<td><input type=text name='variety<%=i%>' id='variety<%=i%>'
					value="<%=crop.getCropVariety()%>"></td>
				<td><input type=text name='valveNumbers<%=i%>'
					id='valveNumbers<%=i%>' value="<%=crop.getValveList()%>" onchange="calcAllValveNo()">
				</td>
				<td><input type=checkbox name='isActive<%=i%>'
					id='isActive<%=i%>' <%=crop.isActive() ? "checked" : ""%>
					value="true"></td>
				<td><input type=text name='cropArea<%=i%>'
					id='cropArea<%=i%>' value="<%=crop.getCropArea()%>"  onchange="calcAssignedCropArea()"></td>
				<td>
					<div onclick='Release(<%=crop.getCropId()%>)'>Release</div>
				</td>
			</tr>
			<%
			}
			%>
			
						<tr>
				<td><b>Total : </b></td>
				<td></td>
				<td id="allValveNo"></td>
				<td></td>
				<td id="assignedCropArea"></td>
				<td></td>
			</tr>
			
		</table>


		<input id="btn" type=submit value="Save Form" />

	</form>


<jsp:include page="/footer"></jsp:include>
