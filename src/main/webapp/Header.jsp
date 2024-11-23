
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="logo" href="https://th.bing.com/th/id/R.581085cb73bc58162228449ab576da89?rik=gd%2fvdG6C5d%2bc3g&riu=http%3a%2f%2fwww.thecivilindia.com%2fimages%2fbanking%2fhdfc-bank.jpg&ehk=iK0qH%2bRte6Wk%2fIdztpsdNeqUlJ46XejShJoVoJ%2by5Mg%3d&risl=&pid=ImgRaw&r=0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.container-fluid{
background-color: #1E1C68;
color: white;

}        
        ul {
        justify-content:left;
            list-style-type: none;
            width:100%;
            margin: 0;
            padding: 10px;
            overflow: hidden;
            
        }

        li {
            float: right;
        }
        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            color:white;
            text-decoration:none;
            
            
        }
        .uname{
            margin-top: 14px;
            color: white;
            margin-right: 10px;
        }
    </style>

</head>
<body>
<div class="container-fluid bo">
        <nav class="navbar navbar-expand-lg navbar-light">
             <a class="navbar-brand d-flex align-items-left" href="#">
                <img src="https://th.bing.com/th/id/R.581085cb73bc58162228449ab576da89?rik=gd%2fvdG6C5d%2bc3g&riu=http%3a%2f%2fwww.thecivilindia.com%2fimages%2fbanking%2fhdfc-bank.jpg&ehk=iK0qH%2bRte6Wk%2fIdztpsdNeqUlJ46XejShJoVoJ%2by5Mg%3d&risl=&pid=ImgRaw&r=0" alt="HDFC Logo" class="mr-2" style="height: 50px; width: 60px;">
                <h2 class="m-2 text-white">HDFC</h2>
               </a>
            
            <div class="ml-auto ">
                <ul>
                   <% if(session.getAttribute("uname") != null) {%>
                       <li class="mt-2"><i class="fa fa-user-circle" aria-hidden="true" style="margin-right: 5px; padding-top:0px"></i><%=session.getAttribute("uname")%></li>
                       <li><a class="btn btn-outline-primary text-white mr-2" href="Login?logout=yes">Logout</a></li>
                       <li><a class="btn btn-outline-primary text-white mr-2"  href="UpdateDetals.jsp">Edit</a></li>
                       <li><a class="btn btn-outline-primary text-white mr-2" href="Home.jsp">Home</a></li>
                       
                       
                   <%}  else {%>
                       <li><a href="Signup.jsp" class="btn btn-outline-primary text-white">Signup</a></li>
                       <li><a href="login.jsp" class="btn btn-outline-primary mr-2 text-white">Login</a></li>
                       
                   <%}%>
                   
                </ul>
                 
            </div> 
        </nav>
</div>
</body>
</html>