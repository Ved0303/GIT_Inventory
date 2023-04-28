<jsp:include page="/header">
   <jsp:param name="title" value="Create Update Category"/>
</jsp:include>

<%@ page
	import="java.util.*,com.kheti.Inventory.model.Category"%>

<link rel="stylesheet" href="css/form.css"> 
<script src="js/form.js"></script>
 
<script>

<%

Category category = (Category) request.getAttribute("category");

%>

function validateForm(){

	var form=document.forms["myForm"];
	
	var isFormInfoNotValid = validateValue(form["orgName"] , "Category Name") <0 ||
		validateValue(form["email"] , "Category email") <0 ||
		validateValue(form["phone"] , "Category phone") <0 ||
		validateValue(form["aadhar"] , "Category aadhar") <0 ||
		validateValue(form["pan"] , "Category PAN") <0 ||
		validateValue(form["orgType"] , "Category Type") <0  ;
	
	if(isFormInfoNotValid){
		return false;
	}
	return true;	
}

</script>


	<form action="createCategory" method="post" name="myForm" class="myForm" 
		onsubmit="return validateForm()">

		<h2>Category Information</h2>
		<h3><font color="red">${errorMessage}</font></h3>		
		<hr><br>

		<input type="hidden" name="id" value="${category.id}" /> 
		Equipment Type <input type="text" name="equipmentType" value="${category.equipmentType}" /><br> 
		<input type="radio" name="inboundOutbound" value="inbound" ${category.inboundOutbound=="inbound" ? "checked" : ""}/> Inbound 
						  <input type="radio" name="inboundOutbound" value="outbound" ${category.inboundOutbound=="outbound" ? "checked" : ""}/> Outbound <br> 

	Category Name <input type="text" name="categoryName" value="${category.categoryName}" /><br> 
		Parent Category <select name="parentCategoryId"><option value="-1">---</option>
			<%
			List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
			Category parentCategory=category.getParentCategory();
			int parentCategoryId=-1;
			if(parentCategory!=null){
				parentCategoryId=parentCategory.getId();
			}
			for (Category cat: categoryList) {
			%>
			<option value="<%=cat.getId()%>"
				<%=cat.getId() == parentCategoryId ? "selected" : ""%>><%=cat.getCategoryName()%></option>
			<%
			}
			%>
		</select> <br>
 

		<input id="btn" type=submit value="Save Category" />

	</form>


<jsp:include page="/footer"></jsp:include>
