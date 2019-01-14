<%-- 
    Document   : getbank
    Created on : Jan 7, 2019, 1:58:04 AM
    Author     : Vishal
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Wisdommani</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/styley.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>
    <!-- Left Panel -->
<%
            HttpSession sessions = request.getSession(true);
            String user=(String)sessions.getAttribute("username");
            String sess=(String)sessions.getAttribute("session");
            String refer_code=(String)sessions.getAttribute("refer_code");
            if(user==null&&sess==null)
            {
              response.sendRedirect("login");
            }
//start
String baseurl="";
            String username="";
            String bank_name="";
            String account_no="";
            String ifsc_code="";
            String branch="";
            String branch_code="";
            String bank_account_type="";
            try
              {
     Properties prop = new Properties();
     //name=prop.load(getClass().getResourceAsStream()); 
     String path=this.getClass().getClassLoader().getResource("").getPath();
     InputStream stream = new FileInputStream(path+"/property/URL.properties");
     prop.load(stream);
    baseurl=prop.getProperty("baseurl");
    System.out.println(baseurl);
    
    //start
     StringBuffer sb = new StringBuffer();
      
          String url_path=baseurl+"/rest/user/getbankdetails";
        System.out.println(url_path);
        
        String urlParameters  = "username="+user+"&session_id="+sess;
byte[] postData       = urlParameters.getBytes(StandardCharsets.UTF_8 );
int    postDataLength = postData.length;

URL    url            = new URL( url_path );
HttpURLConnection conn= (HttpURLConnection) url.openConnection();           
conn.setDoOutput( true );
conn.setInstanceFollowRedirects( false );
conn.setRequestMethod( "POST" );
conn.setRequestProperty( "Content-Type", "application/x-www-form-urlencoded"); 
conn.setRequestProperty( "charset", "utf-8");
conn.setRequestProperty( "Content-Length", Integer.toString( postDataLength ));
conn.setUseCaches( false );
try( DataOutputStream wr = new DataOutputStream( conn.getOutputStream())) {
   wr.write( postData );
}
        DataInputStream input = new DataInputStream( conn.getInputStream() ); 



for( int c = input.read(); c != -1; c = input.read() ) 
sb.append((char)c ); 
input.close(); 
               


 Object obj = new JSONParser().parse(sb.toString()); 
          
        // typecasting obj to JSONObject 
        JSONObject jo = (JSONObject) obj; 
          
        // getting firstName and lastName 
        String result = (String) jo.get("result"); 
        String message = (String) jo.get("message"); 
        System.out.println("--"+result);
        if(result.equals("true"))
        {
        username = (String) jo.get("username");
        bank_name=(String)jo.get("bank_name");
        account_no=(String)jo.get("account_no");
        ifsc_code=(String)jo.get("ifsc_code");
        branch=(String)jo.get("branch");
        branch_code=(String)jo.get("branch_code");
        bank_account_type=(String)jo.get("bank_account_type");
        
        
        if(bank_name==null&&account_no==null&&ifsc_code==null&&branch==null&&branch_code==null&&bank_account_type==null)
        {
          bank_name="";
          account_no="";
          ifsc_code="";
          branch="";
          branch_code="";
          bank_account_type="";
          
        }
        }
        else
        {

        }
   }catch(Exception e)
       {
           System.out.println(e);
       }     
     

//end





            %>
  <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="home"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
                    </li>
                    <li class="menu-title">Features</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>Profile</a>
                        <ul class="sub-menu children dropdown-menu">                            
						<li><i class="fa fa-puzzle-piece"></i><a href="editprofile">Edit Profile</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="viewprofile">View Profile</a></li>
                            <!--<li><i class="fa fa-bars"></i><a href="ui-tabs.html">Tabs</a></li>

                            <li><i class="fa fa-id-card-o"></i><a href="ui-cards.html">Cards</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="ui-alerts.html">Alerts</a></li>
                            <li><i class="fa fa-spinner"></i><a href="ui-progressbar.html">Progress Bars</a></li>
                            <li><i class="fa fa-fire"></i><a href="ui-modals.html">Modals</a></li>
                            <li><i class="fa fa-book"></i><a href="ui-switches.html">Switches</a></li>
                            <li><i class="fa fa-th"></i><a href="ui-grids.html">Grids</a></li>
                            <li><i class="fa fa-file-word-o"></i><a href="ui-typgraphy.html">Typography</a></li>   -->
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Bank Details</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="addbank">Add Bank Details</a></li>
                            <li><i class="fa fa-table"></i><a href="viewbank">View Bank Details</a></li>
                        </ul>
                    </li>
                     <li class="menu-item-has-children dropdown">
                        <a href="comingsoon" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-book"></i>My Courses</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-pencil"></i><a href="comingsoon">Government Exam</a></li>
                            <li><i class="fa fa-book"></i><a href="comingsoon">LKG-12<sup>th</sup>Tutorial</a></li>
                            <li><i class="fa fa-book"></i><a href="comingsoon">Art</a></li>
                            <li><i class="fa fa-book"></i><a href="comingsoon">Skill Development</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children ">
                        <a href="#" class="dropdown-toggle" data-toggle="modal" data-target="#staticModal" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa  fa-share"></i>Referral Code</a>
                       
                    </li>
                   <!-- <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Forms</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.html">Basic Form</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">Advanced Form</a></li>
                        </ul>
                    </li>

                    <li class="menu-title">Icons</li><!-- /.menu-title -->

                 <!--   <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Icons</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="font-fontawesome.html">Font Awesome</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">Themefy Icons</a></li>
                        </ul>
                    </li>
                    <li>  -->
                        <!-- <a href="widgets.html"> <i class="menu-icon ti-email"></i>Widgets </a>  -->
                    </li>  
                  <!--  <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="charts-chartjs.html">Chart JS</a></li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="charts-flot.html">Flot Chart</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="charts-peity.html">Peity Chart</a></li>
                        </ul>
                    </li>  -->

                  <!--  <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Maps</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="maps-gmap.html">Google Maps</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="maps-vector.html">Vector Maps</a></li>
                        </ul>
                    </li>  -->
                 <!--   <li class="menu-title">Extras</li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>
                        </ul>
                    </li>   -->
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    
    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                        <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div>

                    <!--    <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">3</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have 3 Notification</p>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-check"></i>
                                    <p>Server #1 overloaded.</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-info"></i>
                                    <p>Server #2 overloaded.</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-warning"></i>
                                    <p>Server #3 overloaded.</p>
                                </a>
                            </div>
                        </div>   -->

                     <!--   <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-envelope"></i>
                                <span class="count bg-primary">4</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="message">
                                <p class="red">You have 4 Mails</p>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/1.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Jonathan Smith</span>
                                        <span class="time float-right">Just now</span>
                                        <p>Hello, this is an example msg</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/2.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Jack Sanders</span>
                                        <span class="time float-right">5 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/3.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Cheryl Wheeler</span>
                                        <span class="time float-right">10 minutes ago</span>
                                        <p>Hello, this is an example msg</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/4.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Rachel Santos</span>
                                        <span class="time float-right">15 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                    </div>
                                </a>
                            </div>
                        </div>  -->
                    </div>

                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="images/admin.png" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa-user"></i>My Profile</a>

                        <!--    <a class="nav-link" href="#"><i class="fa fa-bell-o"></i>Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa-cog"></i>Settings</a>  -->

                            <a class="nav-link" href="logout"><i class="fa fa-power-off"></i>Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </header><!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="home">Dashboard</a></li>
                                    <li><a href="#">Bank Details</a></li>
                                    <li class="active">View Bank Details</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
              <!-- modelstart -->
             <div class="animated">

            <div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticModalLabel">Referral Code</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>
                            <center><b><%=refer_code %></b></center>
                           </p>
                       </div>
                       <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
<!--                        <button type="button" class="btn btn-primary">Confirm</button>-->
                    </div>
                </div>
            </div>
        </div>



    </div><!-- .animated -->
    
    <!-- modelbox end -->
            <div class="animated fadeIn">


                <div class="row">

                  
                </div>

                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">Bank Details</div>
                        <div class="card-body card-block">
						 <div class="card-title">
                                            <h3 class="text-center">Pay Invoice</h3>
                                        </div>
                           
							    <div class="form-group text-center">
                                                <ul class="list-inline">
                                                    <li class="list-inline-item"><i class="text-muted fa fa-cc-visa fa-2x"></i></li>
                                                    <li class="list-inline-item"><i class="fa fa-cc-mastercard fa-2x"></i></li>
                                                    <li class="list-inline-item"><i class="fa fa-cc-amex fa-2x"></i></li>
                                                    <li class="list-inline-item"><i class="fa fa-cc-discover fa-2x"></i></li>
                                                </ul>
                                            </div>
											
											       <ul class="list-group list-group-flush">

                                    <li class="list-group-item">
                                        <a href="#"> <i class="fa fa-envelope"></i> Bank Name: <%=bank_name%></a>
                                    </li>
									 <li class="list-group-item">
                                                                             <a href="#"> <i class="fa fa-globe"></i> Account No: <%=account_no%></a>
                                    </li>
									 <li class="list-group-item">
                                                                             <a href="#"> <i class="fa fa-location-arrow"></i> IFSC code: <%=ifsc_code%></a>
                                    </li>
									 <li class="list-group-item">
                                                                             <a href="#"> <i class="fa fa-map-marker"></i> Branch:<%=branch%></a>
                                    </li>
									
									 <li class="list-group-item">
                                                                             <a href="#"> <i class="fa fa-asterisk"></i> Branch code: <%=branch_code%></a>
                                    </li>
									 <li class="list-group-item">
                                                                             <a href="#"> <i class="fa fa-mobile"></i> Account type: <%=bank_account_type%></a>
                                    </li>
                                </ul>
                                
                        </div>
                    </div>
                </div>

            </div>


        </div><!-- .animated -->
    </div><!-- .content -->

    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
             <!--   <div class="col-sm-6">
                    Copyright &copy; 2018 Ela Admin
                </div>  -->
                <div class="col-sm-6 text-right">
                    Designed by <a href="">Bhogal's</a>
                </div>
            </div>
        </div>
    </footer>

</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="assets/js/main.js"></script>


</body>
</html>
