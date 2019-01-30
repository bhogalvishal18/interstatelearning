<%-- 
    Document   : register
    Created on : Jan 6, 2019, 11:59:19 PM
    Author     : Vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="source/vendor/bootstrap/css/bootstrap.min.css">
    <link href="source/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="source/libs/css/style.css">
    <link rel="stylesheet" href="../source/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    
    /* When the pattern is matched */
input[type="text"]:valid {
    color: green;
}

input[type="text"]:valid ~ .valid::before {
    content: "\2713";
    color: green;
}

/* Unmatched */
input[type="text"]:invalid {
    color: red;
}
    </style>
	 <style>
       

@-webkit-keyframes swing
{
    15%
    {
        -webkit-transform: translateX(5px);
        transform: translateX(5px);
    }
    30%
    {
        -webkit-transform: translateX(-5px);
       transform: translateX(-5px);
    } 
    50%
    {
        -webkit-transform: translateX(3px);
        transform: translateX(3px);
    }
    65%
    {
        -webkit-transform: translateX(-3px);
        transform: translateX(-3px);
    }
    80%
    {
        -webkit-transform: translateX(2px);
        transform: translateX(2px);
    }
    100%
    {
        -webkit-transform: translateX(0);
        transform: translateX(0);
    }
}
@keyframes swing
{
    15%
    {
        -webkit-transform: translateX(5px);
        transform: translateX(5px);
    }
    30%
    {
        -webkit-transform: translateX(-5px);
        transform: translateX(-5px);
    }
    50%
    {
        -webkit-transform: translateX(3px);
        transform: translateX(3px);
    }
    65%
    {
        -webkit-transform: translateX(-3px);
        transform: translateX(-3px);
    }
    80%
    {
        -webkit-transform: translateX(2px);
        transform: translateX(2px);
    }
    100%
    {
        -webkit-transform: translateX(0);
        transform: translateX(0);
    }
}

.swing:hover
{
        -webkit-animation: swing 1s ease;
        animation: swing 1s ease;
        -webkit-animation-iteration-count: 1;
        animation-iteration-count: 1;
}


    </style>
    <script>
        
        function sendotp()
        {
            
           var x = document.getElementById("mobile_no").value;
           var addinput = document.getElementById('input');
           var d=document.getElementById("otp");
           
           if(d!=null)
           {
             document.getElementById("otp").remove();  
           }
           else
           {
           
           
  if(x.length==10)
  {
      
      var data = "mobile_no="+x;

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
     var myObj = JSON.parse(this.responseText);
     var res=myObj.result;
     if(res=="true")
     {
       
                 

var i = document.createElement("input"); //input element, text
i.setAttribute('type',"text");
i.setAttribute('class',"form-control form-control-lg");
i.setAttribute('name',"otp");
i.setAttribute('oninput',"validateotp()")
i.setAttribute('placeholder',"Enter OTP");
i.setAttribute('id',"otp");
addinput.appendChild(i);


         
     }else
     {
         document.getElementById("otp").remove();
         
   
     }
     // end
  }
});

xhr.open("POST", "http://localhost:8084/ChainManagement/rest/user/send_otp");
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
xhr.send(data);
      
      
      
  } 
           }  }
        
        function validateotp()
        {
           var otp = document.getElementById("otp").value; 
           var mobile = document.getElementById("mobile_no").value;
           var addinput = document.getElementById('input');
  if(otp.length=4)
  {
      
      var data = "mobile_no="+mobile+"&otp="+otp;

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === 4) {
    console.log(this.responseText);
     var myObj = JSON.parse(this.responseText);
     var res=myObj.result;
     if(res=="true")
     {
       
      document.getElementById("otp").remove();           

var i = document.createElement("p");
i.setAttribute('align',"center");
var font=document.createElement("font");
font.setAttribute('size','3');
font.setAttribute('color','green');//input element, text
var node=document.createTextNode("OTP validated ✓");
font.appendChild(node);
i.appendChild(font);
addinput.appendChild(i);
var register=document.getElementById("submit");
  register.disabled = false;
         
     }else
     {
       var register=document.getElementById("submit");
  register.disabled = true;  
   
     }
     // end
  }
});

xhr.open("POST", "http://localhost:8084/ChainManagement/rest/user/validate_otp");
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
xhr.send(data);
      
      
      
  }   }
        
        
    
    </script>
</head>

<body>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="/"><img class="logo-img" src="assets/img/art.png" width="65%" height="65%" alt="logo"></a><span class="splash-description">Please enter your user information.</span></div>
            <div class="card-body">
                <%
                    String message=(String)request.getAttribute("message");
                    if(message==null)
                    {
                        
                    }
                    else
                    {
                      %>
                       <p align="center" style="color:#cc0000" class="swing"><b><%=message%></b></p>
                      <%
                    }
                    %>
                <form name="reg" action="registervalidate"  method="POST">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="username" name="username" type="text" placeholder="Username" autocomplete="off" required="">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" name="password" type="password" placeholder="Password" required="">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="email" name="email" type="email" placeholder="Email" required="">
                    </div>
                    
                <div class="form-group">
                        <input class="form-control form-control-lg" id="account_type" name="account_type" type="hidden" value="user" required="">
                    </div>
                        <div class="form-group">
                        <input class="form-control form-control-lg" id="refer_code" name="refer_code" type="text"  maxlength="10" placeholder="Referral Code">
                    </div>
                    <div class="form-group valid">
                        <input class="form-control form-control-lg"  pattern="[0-9]{10}" id="mobile_no" name="mobile_no" type="text" oninput="sendotp()" maxlength="10" placeholder="Mobile Number" autofocus required />
                    </div>
                      <div class="form-group" id="input">
                                    </div>
            
                    <button type="submit" id="submit" class="btn btn-primary btn-lg btn-block" disabled>Register</button>
                </form>
            </div>
            <div class="card-footer bg-white p-0  ">
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="login" class="footer-ldenk">Login</a></div>
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="#" class="footer-link">Forgot Password</a>
                </div>
            </div>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="source/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="source/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>
 
</html>