<!DOCTYPE html>
<%@page import="com.kheti.Inventory.util.Constants"%>
<%@page import="com.kheti.Inventory.model.User"%>
<html lang="en">

<%
User user=(User)session.getAttribute("user");

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>-- ${title} --</title>

    <script>
<%
	if(user.getRole()==Constants.ADMIN_ROLE || user.getRole()==Constants.EDIT_ROLE){
%>
        var array = ["Home", "Forms", "Create Form" ,"Create WearHouse","List WearHouse",
        	"Create Org","List Org","Log Out!","AAAA"];
        var links = ["/welcome", "/listForm", "/createForm","/createWearHouse","/listWearHouse",
        	"/createOrganization","/listOrganization","/logout"];
        let childArray = [];
        let childLinks = [];
<%
	}else if(user.getRole()==Constants.USER_ROLE){
%>
		var array = ["Home", "Pay Details", "Log Out!" ];
		var links = ["/welcome", "/payDetails","/logout"];
		let childArray = [
			[],
		    ["link1", "link2", "link3", "link4"],
		    [],
		    [],
		    ["Phone", "Mobile", "Email", "Fax"]
		];
		let childLinks = [
			[],
		    ["link1.html", "link2.html", "link3.html", "link4.html"],
		    [],
		    [],
		    ["Phone.html", "Mobile.html", "Email.html", "Fax.html"]
		];

<%
	}
%>
        function addElement() {


            for (let i = 0; i < array.length; i++) {


                if (childArray.length > i && childArray[i] != null && childArray[i].length > 0) {
                    var newLi = document.createElement("li");
                    newLi.className = "mainList1";
                    newLi.innerHTML = '<a href="' + links[i] + '" class="mainList" > ' + array[i] + ' <i class="fa fa-caret-down"></i></button>'
                        + ' </a>';
                    document.getElementById("mainUl").appendChild(newLi)
                    var childUL = document.createElement("UL");
                    newLi.appendChild(childUL);


                    for (let j = 0; j < childArray[i].length; j++) {

                        var childLi = document.createElement("li");
                        var a = document.createElement("a");
                        a.href = childLinks[i][j];
                        a.className = "subList";
                        a.innerText = childArray[i][j];
                        childLi.appendChild(a);

                        // childLi.innerHTML = "<a href='" + childLinks[i][j] + "' class='subList' > " + childArray[i][j] + " </a>";
                        childLi.className = "mainList1";

                        childUL.appendChild(childLi);
                    }
                } else {
                    var newLi = document.createElement("li");
                    newLi.className = "mainList1";
                    newLi.innerHTML = '<a href="' + links[i] + '" class="mainList" > ' + array[i] + ' </a>';
                    document.getElementById("mainUl").appendChild(newLi)
                }
            }

        }


    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: rgb(0, 0, 0);
            width: 100%;
            height: 50px;
            margin: 5px auto;
            /* border-radius: 20px; */

        }

        .navbar ul {
            /* overflow: auto; */
            list-style-type: none;
        }

        .navbar ul li {
            width: 150px;
            float: left;
            font-size: 20px;
            text-align: center;

        }

        .navbar ul li a {
            text-decoration: none;
            color: white;
            line-height: 50px;
            display: block;
        }

        .navbar ul li a:hover {
            background-color: aqua;
            color: black;
        }

        .navbar ul li ul li {
            background-color: black;
            border: none;
            display: none;
        }
       i {
        margin: 2px;
            padding: 1px;
        }

        .navbar ul li:hover ul li {
            display: block;
        }
        #search {
            float: right;
            color: white;
            padding: 11px 4px;

        }

        nav input {
            border: 3px solid black;
            padding: 3px 4px;
            width: 55px;
            border-radius: 19px;          
        }
        #searchI{
            color: rgb(0, 0, 0);
           right: 27px;
            position: relative;
        }
        #search:hover input{
            width: 170px;
            transition: 1s;          
        }
    </style>

</head>

<BODY ONLOAD="addElement()">
    <nav class="navbar">
        <ul id="mainUl">

        </ul>
        <div id="search">
            <input type="search" ><i id="searchI" class="fa fa-search"></i>
        </div>

    </nav>
    


