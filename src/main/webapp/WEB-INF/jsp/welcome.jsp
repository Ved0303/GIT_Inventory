<jsp:include page="/header">
   <jsp:param name="title" value="Welcome"/>
</jsp:include>

<div class="col-7 m-auto mt-2 p-3 bg-warning">
<div class="  m-auto shadow-lg rounded-pill text-center bg-primary bg-gradient ">
 <p class="h1 text-light p-1">   Welcome ${user.name}!! </p>
  </div> 
    <div class="m-3">
            <div class="col-6 m-auto">
                <a class="col-12 btn btn-outline-dark mb-2" href="/createForm">New Form</a>
            </div>
            <div class="col-6 m-auto">
                <a class="col-12 btn btn-outline-dark mb-2" href="/listForm">List Forms</a>
            </div>
        </div>

role: ${user.role}
User Id: ${user.id}
</div>



<jsp:include page="/footer"></jsp:include>
