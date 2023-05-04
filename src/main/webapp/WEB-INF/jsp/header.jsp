<%@page import="com.kheti.Inventory.util.Constants"%>
<%@page import="com.kheti.Inventory.model.User"%>
<%@page errorPage="/login" %>  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <style>
          .headingHeader{
            text-align: center;
            text-shadow: 2px 2px 4px #d4ff00 ;
          }
        </style>
</head>

<body>
    <header>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand " href="#">LOGO</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/welcome">Home</a>
                        </li>
<%
	User user=(User)session.getAttribute("user");

	if(user.getRole()==Constants.ADMIN_ROLE || user.getRole()==Constants.EDIT_ROLE){
%>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="true">
                                Masters
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/createForm">Create Form</a></li>
                                <li><a class="dropdown-item" href="/createWearHouse">WearHouse</a></li>
                                <li><a class="dropdown-item" href="/createOrganization">Organization</a></li>
                                <li><a class="dropdown-item" href="/createCategory">Category</a></li>
                                <li><a class="dropdown-item" href="/createManPower">Man Power</a></li>

                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="true">
                                Reports
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/listForm">Form List</a></li>
                                <li><a class="dropdown-item" href="/listWearHouse">WearHouses</a></li>
                                <li><a class="dropdown-item" href="/listOrganization">Organizations</a></li>
                                <li><a class="dropdown-item" href="/listCategory">Category List</a></li>
                                <li><a class="dropdown-item" href="/listManPower">Man Powers</a></li>

                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="true">
                                Expenses
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/createExpense">New Expense</a></li>
                                <li><a class="dropdown-item" href="/listExpense">Expense List</a></li>
                        	</ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/inventories">Inventories</a>
                        </li>
<%
	}
%>                        
                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Log Out</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>

    </header>
	