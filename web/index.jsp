<%
    HttpSession session1 = request.getSession();
    String aux = (String) session1.getAttribute("tipoLogin");
    if (aux == null || aux.isEmpty()) {
        session1.invalidate();
    } else {
        if (aux.equals("Admin")) {
            RequestDispatcher rd = request.getRequestDispatcher("/Controlador?action=indexAdmin");
            rd.forward(request, response);
        } else {
            if (aux.equals("fuente")) {
                RequestDispatcher rd = request.getRequestDispatcher("/Controlador?action=indexFuente");
                rd.forward(request, response);
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Docencia Servicio</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-touch-fullscreen" content="yes">
        <meta name="description" content="Avalon Frontend Theme">
        <meta name="author" content="The Red Team">

        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,700' rel='stylesheet' type='text/css'>

        <link href="inicio/assets/fonts/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
        <link href="inicio/assets/css/styles.css" type="text/css" rel="stylesheet">
        <link href="inicio/assets/css/micss.css" type="text/css" rel="stylesheet">

        <!-- <link href="inicio/assets/inicio/assets/plugins/smartmenus/css/sm-core-css.css" type="text/css" rel="stylesheet"> -->
        <link href="inicio/assets/plugins/smartmenus/addons/bootstrap/jquery.smartmenus.bootstrap.css" type="text/css" rel="stylesheet">
        <link href="inicio/assets/plugins/codeprettifier/prettify.css" type="text/css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
        <!--[if lt IE 9]>
                <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
                <script type="text/javascript" src="inicio/assets/plugins/charts-flot/excanvas.min.js"></script>
        <![endif]-->
        <!-- The following CSS are included as plugins and can be removed if unused-->

        <link href="inicio/assets/plugins/revolution-slider/css/settings.css" type="text/css" rel="stylesheet">
        <link href="inicio/assets/demo/revolution-slider/extralayers.css" type="text/css" rel="stylesheet">

    </head>


    <body style="background-image: url('inicio/assets/img/imagenEnfermeria.jpg'); background-size:cover">

        <div id="wrapper">

            <header id="headernav" class="navbar-alizarin">
                <div class="container">
                    <div class="row">

                        <!-- Static navbar -->
                        <div role="navigation"> <!-- class="navbar navbar-default"  -->
                            <!--<div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-header">
                                    <span class="sr-only">Toggle navigation</span>
                                    <i class="fa fa-bars"></i>
                                </button>
                                <a class="navbar-brand" href="index.html">Avalon</a>
                            </div>-->
                            <nav class="navbar-collapse navbar-collapse-header collapse">
                                <!-- Right nav -->
                                <div class="navbar-right yamm">
                                    <ul class="nav navbar-nav smart-menu dd-menu">
                                        <!--<li><a href="#" id="inicio">Inicio<span class="subline">Bienvenido</span></a></li>
                                        <li class="dropdown yamm-fw hidden-sm">
                                            
                                            <ul class="dropdown-menu mega-menu">
                                                <li class="container">
                                                    <div class="row">
                                                        <div class="col-sm-2 yamm-col">
                                                            <h5 class="category">Entertainment</h5>
                                                            <ul class="list-unstyled">
                                                                <li><a href="#">Arts</a></li>
                                                                <li><a href="#">Books</a></li>
                                                                <li><a href="#">Games</a></li>
                                                                <li><a href="#">Movies</a></li>
                                                                <li><a href="#">Music</a></li>
                                                                <li><a href="#">Theater</a></li>
                                                                <li><a href="#">TV</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-2 yamm-col">
                                                            <h5 class="category">Fashion</h5>
                                                            <ul class="list-unstyled">
                                                                <li><a href="#">News &amp; Trends</a></li>
                                                                <li><a href="#">Beauty</a></li>
                                                                <li><a href="#">Shows</a></li>
                                                                <li><a href="#">Street Style</a></li>
                                                                <li><a href="#">Celebrity Style</a></li>
                                                                <li><a href="#">Designers</a></li>
                                                                <li><a href="#">Models</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-2 yamm-col">
                                                            <h5 class="category">Travel</h5>
                                                            <ul class="list-unstyled">
                                                                <li><a href="#">Airline</a></li>
                                                                <li><a href="#">Lodging</a></li>
                                                                <li><a href="#">Rail</a></li>
                                                                <li><a href="#">Car Rental</a></li>
                                                                <li><a href="#">Cruises</a></li>
                                                                <li><a href="#">Luggage Accessories</a></li>
                                                                <li><a href="#">Maps</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-2 yamm-col">
                                                            <h5 class="category">Electronics</h5>
                                                            <ul class="list-unstyled">
                                                                <li><a href="#">Computers</a></li>
                                                                <li><a href="#">Tablets</a></li>
                                                                <li><a href="#">Notebooks</a></li>
                                                                <li><a href="#">Cell Phones</a></li>
                                                                <li><a href="#">Cameras</a></li>
                                                                <li><a href="#">Audio &amp; Video</a></li>
                                                                <li><a href="#">Accessories</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-4 yamm-col">

                                                            <div class="carousel carousel-text slide carousel-default mt10 mb20" id="c-slide">
                                                                <ol class="carousel-indicators">
                                                                    <li data-target="#c-slide" data-slide-to="0" class="active"></li>
                                                                    <li data-target="#c-slide" data-slide-to="1" class=""></li>
                                                                    <li data-target="#c-slide" data-slide-to="2" class=""></li>
                                                                </ol>
                                                                <div class="carousel-inner" style="height: 144px;">
                                                                    <div class="item active">
                                                                        <img src="inicio/assets/demo/stockphoto/music_11_carousel.jpg" alt="" class="img-responsive" />
                                                                    </div>
                                                                    <div class="item">
                                                                        <img src="inicio/assets/demo/stockphoto/communication_12_carousel.jpg" alt="" class="img-responsive" />
                                                                    </div>
                                                                    <div class="item">
                                                                        <img src="inicio/assets/demo/stockphoto/music_10_carousel.jpg" alt="" class="img-responsive" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <h6 class="category">Inventore</h6>
                                                            <p class="small">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>

                                                        </div>
                                                    </div>						                    
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                Features 
                                                <span class="caret"></span>
                                                <span class="subline">Theme Options</span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="ui-typography.html">Base UI <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="ui-typography.html">Typography</a></li>
                                                        <li><a href="ui-buttons.html">Buttons</a></li>
                                                        <li><a href="ui-tables.html">Tables</a></li>
                                                        <li><a href="ui-forms.html">Forms</a></li>
                                                        <li><a href="ui-boxes.html">Boxes</a></li>
                                                        <li><a href="ui-panels.html">Panels</a></li>
                                                        <li><a href="ui-icons.html">Font Icons</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="layout-grids.html">Grid Scaffolding</a></li>
                                                <li><a href="ui-modals.html">BS Components <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="ui-modals.html">Modal Box</a></li>
                                                        <li><a href="ui-progress.html">Progress Bars</a></li>
                                                        <li><a href="ui-paginations.html">Pagers &amp; Paginations</a></li>
                                                        <li><a href="ui-breadcrumbs.html">Breadcrumbs</a></li>
                                                        <li><a href="ui-labelsbadges.html">Labels &amp; Badges</a></li>
                                                        <li><a href="ui-alerts.html">Alerts &amp; Notifactions</a></li>
                                                        <li><a href="ui-tabs.html">Tabs &amp; Accordions</a></li>
                                                        <li><a href="ui-carousel.html">Carousel</a></li>
                                                        <li><a href="ui-wells.html">Wells</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="ui-tiles.html">Custom Components <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="ui-tiles.html">Tiles</a></li>
                                                        <li><a href="custom-skylo.html">Skylo</a></li>
                                                        <li><a href="custom-bootbox.html">Bootbox</a></li>
                                                        <li><a href="custom-datepaginator.html">Date Paginator</a></li>
                                                        <li><a href="custom-pines.html">Pines Notification</a></li>
                                                        <li><a href="custom-notific8.html">Notific8 Notification</a></li>
                                                        <li><a href="custom-pulsate.html">Pulsate</a></li>
                                                        <li><a href="custom-knob.html">Knob</a></li>
                                                        <li><a href="custom-jqueryui.html">jQueryUI Widgets</a></li>
                                                        <li><a href="custom-ionrange.html">Ion Rabge Slider</a></li>
                                                        <li><a href="custom-tour.html">Tour</a></li>
                                                        <li><a href="custom-nestable.html">Nestbale</a></li>
                                                        <li><a href="custom-jstree.html">Tree View</a></li>
                                                        <li><a href="custom-weather.html">Weather</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="form-components.html">Advanced Forms <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="form-components.html">Form Components</a></li>
                                                        <li><a href="form-pickers.html">Pickers</a></li>
                                                        <li><a href="form-wizard.html">Form Wizard</a></li>
                                                        <li><a href="form-validation.html">Form Validation</a></li>
                                                        <li><a href="form-masks.html">Form Masks</a></li>
                                                        <li><a href="form-fileupload">Multi File Uploader</a></li>
                                                        <li><a href="from-dropzone.html">Dropzone Uploader</a></li>
                                                        <li><a href="form-ckeditor.html">CKEditor</a></li>
                                                        <li><a href="form-summernote.html">Summernote</a></li>
                                                        <li><a href="form-markdown.html">Markdown Editor</a></li>
                                                        <li><a href="form-xeditable.html">Inline Editor</a></li>
                                                        <li><a href="form-imagecrop.html">Image Cropping</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="tables-responsive.html">Advanced Tables <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="tables-responsive.html">Responsive Tables</a></li>
                                                        <li><a href="tables-editable.html">Editable Tables</a></li>
                                                        <li><a href="tables-data.html">Data Tables</a></li>
                                                        <li><a href="tables-advanceddatatable.html">Advanced Data Tables</a></li>
                                                        <li><a href="tables-fixedheader.html">Fixed Header</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="ui-advancedpanels.html">Advanced Panels</a></li>
                                                <li>
                                                    <a href="charts-flot.html">Analytics <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="charts-flot.html">Flot</a></li>
                                                        <li><a href="charts-sparklines.html">Sparklines</a></li>
                                                        <li><a href="charts-morris.html">Morris.js</a></li>
                                                        <li><a href="charts-chart.html">Chart.js</a></li>
                                                        <li><a href="charts-easypiechart.html">Easy Pie Chart</a></li>
                                                        <li><a href="charts-gantt.html">Gantt Chart</a></li>
                                                        <li><a href="charts-nvd3.html">nvd3 Charts</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="maps-google.html">Maps <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="maps-google.html">Google Maps</a></li>
                                                        <li><a href="maps-vector.html">Vector Maps</a></li>
                                                        <li><a href="maps-mapael.html">Mapael</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Unlimited Level Menu <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="javascript:;">Menu Item 1</a></li>
                                                        <li>
                                                            <a href="javascript:;">Menu Item 2 <span class="caret"></span></a>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="javascript:;">Menu Item 2.1</a></li>
                                                                <li>
                                                                    <a href="javascript:;">Menu Item 2.2 <span class="caret"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="javascript:;">Menu Item 2.2.1</a></li>
                                                                        <li>
                                                                            <a href="javascript:;">Menu Item 2.2.2 <span class="caret"></span></a>
                                                                            <ul class="dropdown-menu">
                                                                                <li><a href="javascript:;">And deeper yet!</a></li>
                                                                            </ul>
                                                                        </li>
                                                                    </ul>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                Pages
                                                <span class="caret"></span>
                                                <span class="subline">Random Pages</span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="pages-pricingtable.html">Pricing Table</a></li>
                                                <li><a href="pages-faq.html">FAQ</a></li>
                                                <li><a href="pages-search.html">Search Results</a></li>
                                                <!-- <li><a href="#">Clients</a></li>
                                                <li><a href="#">Careers</a></li>
                                                <li><a href="pages-aboutus.html">About Us</a></li> 
                                                <li><a href="pages-contactus.html">Contact Us</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="pages-aboutus.html">
                                                About Us
                                                <span class="subline">Company</span>
                                            </a>
                                        </li>-->
                                        <li>
                                            <a href="#" id="ingresar">
                                                <b>Ingresar</b>
                                                <span class="subline">Inicia sesi&oacute;n</span>
                                            </a>
                                            <!--<ul class="dropdown-menu">
                                                    <li><a href="portfolio-blocks.html">Portfolio Blocks</a></li>
                                                    <li><a href="portfolio-item1.html">Portfolio Item Option 1</a></li>
                                                    <li><a href="portfolio-item2.html">Portfolio Item Option 2</a></li>
                                            </ul> -->
                                        </li>

                                    </ul>
                                </div>
                            </nav><!--/.nav-collapse -->
                        </div>

                    </div>
                </div>

            </header>
            <div class="container" id="login-form">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h2>Formulario de ingreso</h2></div>
                            <div class="panel-body">

                                <form action="Login" class="form-horizontal" id="validate-form" method="POST">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                                <input type="text" name='parametroA' class="form-control" placeholder="Email Username" data-parsley-minlength="6" placeholder="At least 6 characters" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-key"></i>
                                                </span>
                                                <input type="password" name='parametroB' class="form-control" id="exampleInputPassword1" placeholder="Password">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="clearfix">
                                            <button class="btn btn-primary pull-right" type="submit">Login</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content block, child page inject content -->
        </div>
        <footer class="footer-inverse">
            <div class="container">
                <div class="row footer-bottom">

                    <div class="col-xs-6 mb20">
                        <p>Universidad de Cartagena � 2015.</p>
                    </div>
                </div>
            </div>
        </footer>




        <!-- Load site level scripts -->

        <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
        <script src="inicio/assets/js/jquery-1.10.2.min.js"></script> 							<!-- Load jQuery -->

        <script src="inicio/assets/js/bootstrap.min.js"></script> 								<!-- Load Bootstrap -->

        <script src="inicio/assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script> 	<!-- Slimscroll for custom scrolls -->
        <script src="inicio/assets/plugins/sparklines/jquery.sparklines.min.js"></script>  		<!-- Sparkline -->

        <script src="inicio/assets/plugins/smartmenus/jquery.smartmenus.js"></script> 			<!-- Smartmenus -->
        <script src="inicio/assets/plugins/smartmenus/addons/bootstrap/jquery.smartmenus.bootstrap.js"></script>

        <script src="inicio/assets/demo/demo.js"></script> 
        <script src="inicio/assets/js/application.js"></script> 

        <!-- End loading site level scripts -->

        <script src="inicio/assets/plugins/codeprettifier/prettify.js"></script> 				<!-- Code Prettifier  -->
        <script src="inicio/assets/plugins/bootstrap-switch/bootstrap-switch.js"></script> 		<!-- Swith/Toggle Button -->
        <script src="inicio/assets/plugins/bootstrap-tabdrop/js/bootstrap-tabdrop.js"></script>  <!-- Bootstrap Tabdrop -->



        <script src="inicio/assets/plugins/bootbox/bootbox.js"></script> 										<!-- Bootbox -->

        <script src="inicio/assets/plugins/revolution-slider/js/jquery.themepunch.tools.min.js"></script>  		<!-- Slider Revolution -->
        <script src="inicio/assets/plugins/revolution-slider/js/jquery.themepunch.revolution.min.js"></script>

        <script src="inicio/assets/demo/demo-index.js"></script> 												<!-- Initialize Demo JS for this page -->
        <script src="inicio/assets/js/mijs.js"></script> 												<!-- Initialize Demo JS for this page -->

    </body>
</html>