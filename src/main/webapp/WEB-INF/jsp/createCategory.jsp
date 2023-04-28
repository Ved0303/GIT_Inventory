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
	
	var isFormInfoNotValid = validateValue(form["equipmentType"] , "Equipment Type") <0 ||
		validateValue(form["inboundOutbound"] , "Inbound Or Outbound") <0 ||
		validateValue(form["categoryName"] , "Category Name") <0  ;
	
	if(isFormInfoNotValid){
		return false;
	}
	return true;	
}

</script>

<form class="border m-3 border-primary bg-info-subtle fw-bold" action="createCategory" method="post" name="myForm"  
		onsubmit="return validateForm()">
            <h1 class="headingHeader border-bottom border-danger ">Category Master</h1>
            <h3 class="headingHeader border-bottom border-danger "><font color="red">${errorMessage}</font></h3>
	        <input type="hidden" name="id" value="${category.id}" />

			<div class="m-3 col-4">
              <label for="equipmentType" class="form-label">Equipment Type</label>
              <input type="text" class="form-control" id="equipmentType" name="equipmentType"  value="${category.equipmentType}"  aria-describedby="Equipment Type">
              <div  class="form-text">Enter Equipment Type</div>
            </div>

			<div class="m-3 col-4">
              <label for="inboundOutbound" class="form-label">Inbound/Outbound</label>
				<input type="radio" name="inboundOutbound" value="inbound" ${category.inboundOutbound=="inbound" ? "checked" : ""}/> Inbound 
				<input type="radio" name="inboundOutbound" value="outbound" ${category.inboundOutbound=="outbound" ? "checked" : ""}/> Outbound
				<div  class="form-text">Select Inbound or Outbound</div>
            </div>

			<div class="m-3 col-4">
              <label for="categoryName" class="form-label">Category Name</label>
              <input type="text" class="form-control" id="categoryName" name="categoryName"  value="${category.categoryName}"  
              aria-describedby="Category Name ">
              <div  class="form-text">Enter category Name</div>
            </div>

			<div class="m-3 col-4">
              <label for="parentCategory" class="form-label">Parent Category</label>
              <select id="parentCategory" name="parentCategoryId" aria-describedby="Parent Category">
              	<option value="-1">---</option>
			<%
			List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
			Category parentCategory=category.getParentCategory();
			int parentCategoryId=-1;
			if(parentCategory!=null){
				parentCategoryId=parentCategory.getId();
			}
			for (Category cat: categoryList) {
			%>
				<option value="<%=cat.getId()%>" <%=cat.getId() == parentCategoryId ? "selected" : ""%>><%=cat.getCategoryName()%></option>
			<%
			}
			%>
			  </select> 
              <div  class="form-text">Select Parent Category</div>
            </div>
            		 
            		 
            		 <br>
 

            <button type="submit" class="btn btn-primary m-3">Save Category</button>
          </form>


<jsp:include page="/footer"></jsp:include>
