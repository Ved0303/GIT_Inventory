<html>

<head>
<title>Krishi Web Application</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>

<body>
<div class="p-2 fw-bold ">
    <font color="red">${errorMessage}</font>
    <form method="post" action="/login" class="col-lg-6 m-auto p-4 bg-warning">
        <div class="form-floating  mb-4">    
        <input type="text" id="UserName" name="name" class="form-control" placeholder="UserName" />
        <label class="form-label" for="UserName">User Name</label>
        </div>
        <div class="form-floating mb-4">
       <input type="password" id="Password" name="password" class="form-control" placeholder="Password" /> 
       <label class="form-label" for="Password">Password</label>
       </div>
          <div class="row mb-4">
                <div class="col d-flex justify-content-center">
                  
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                        <label class="form-check-label" for="form2Example31"> Remember me </label>
                    </div>
                </div>

                <div class="col">
                  <a href="#!">Forgot password?</a>
                </div>
            </div>
        <input type="submit" class="btn btn-primary btn-block mb-4" />
        <div class="text-center">
                <p>Not a member? <a href="#!">Register</a></p>

            </div>
    </form>
    </div>
</body>

</html>