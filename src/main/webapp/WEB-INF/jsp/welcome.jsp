<jsp:include page="/header">
   <jsp:param name="title" value="Welcome"/>
</jsp:include>
    Welcome ${user.name}!! <br><br>
    <a href="/createForm">New Form</a><br><br>
    <a href="/listForm">List Forms</a><br><br>

role: ${user.role}<br>
User Id: ${user.id}




<jsp:include page="/footer"></jsp:include>
