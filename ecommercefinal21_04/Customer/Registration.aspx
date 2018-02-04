<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs"   Inherits="ecomNew.Registration" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

       <link href="Style.css" rel="stylesheet" />
   <meta charset="utf-8"/>
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
<!--Less styles -->
   <!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
	<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->
	
<!-- Bootstrap style --> 
    <link id="callCss" rel="stylesheet" href="../themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="../themes/css/base.css" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	
	<link href="../themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link href="../themes/css/font-awesome.css" rel="stylesheet" type="text/css"/>
<!-- Google-code-prettify -->	
	<link href="../themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="../themes/images/ico/favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../themes/images/ico/apple-touch-icon-144-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../themes/images/ico/apple-touch-icon-114-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../themes/images/ico/apple-touch-icon-72-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" href="../themes/images/ico/apple-touch-icon-57-precomposed.png"/>
	<style type="text/css" id="enject"></style>
  </head>
<body>
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome!<strong> User</strong></div>
	<div class="span6">
	<div class="pull-right">
		<a href="product_summary.aspx"><span class="">Fr</span></a>
		<a href="product_summary.aspx"><span class="">Es</span></a>
		<span class="btn btn-mini">En</span>
		<a href="product_summary.aspx"><span>&pound;</span></a>
		<span class="btn btn-mini">$155.00</span>
		<a href="product_summary.aspx"><span class="">$</span></a>
		<%--<a href="product_summary.aspx"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ 3 ] Itemes in your cart </span> </a> --%>
	</div>
	</div>
</div>f
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.aspx"><img src="../themes/images/logo.png" alt="Bootsshop"/></a>
		<%--<form class="form-inline navbar-search" method="post" action="products.aspx" runat="server">
		<input id="srchFld" class="srchTxt" type="text" />
		  <select class="srchTxt">
			<option>All</option>
			<option>CLOTHES </option>
			<option>FOOD AND BEVERAGES </option>
			<option>HEALTH & BEAUTY </option>
			<option>SPORTS & LEISURE </option>
			<option>BOOKS & ENTERTAINMENTS </option>
		</select> 
		  <asp:Button type="submit" id="submitButton" runat="server" class="btn btn-primary" Text="Go"/>
    --%>
    <ul id="topMenu" class="nav pull-right">
	<%-- <li class=""><a href="special_offer.aspx">Specials Offer</a></li>
	 <li class=""><a href="normal.aspx">Delivery</a></li>
	 <li class=""><a href="contact.aspx">Contact</a></li>--%>
	 <li class="">
<%--	 <a href="Login.aspx" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>--%>
	<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3>Login Block</h3>
		  </div>
		  <div class="modal-body">
			<%--<form class="form-horizontal loginFrm" >
			  <div class="control-group">								
				<asp:TextBox id="inputEmail" runat="server"  placeholder="Email"></asp:TextBox>
			  </div>
			  <div class="control-group">
				<asp:TextBox id="inputPassword" runat="server"  placeholder="Password"></asp:TextBox>
			  </div>
			  <div class="control-group">
				<label class="checkbox">
				<asp:CheckBox runat="server" text="Remember me"/> 
				</label>
			  </div>
				</form>	
			--%><%--<asp:Button ID="signinbtn" type="submit" runat="server" class="btn btn-success" Text="Sign in"/>
			<asp:Button ID="closebtn" runat="server" class="btn" data-dismiss="modal" aria-hidden="true" Text="Close"/>--%>
		  </div>
	</div>
	</li>
    </ul>
  </div>
</div>
</div>
</div>
<!-- Header End====================================================================== -->
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span3">
		<div class="well well-small"><a id="myCart" href="product_summary.aspx"><img src="../themes/images/ico-cart.png" alt="cart">3 Items in your cart  <span class="badge badge-warning pull-right">$155.00</span></a></div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<li class="subMenu open"><a> ELECTRONICS [230]</a>
				<ul>
				<li><a class="active" href="products.aspx"><i class="icon-chevron-right"></i>Cameras (100) </a></li>
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Computers, Tablets & laptop (30)</a></li>
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Mobile Phone (80)</a></li>
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Sound & Vision (15)</a></li>
				</ul>
			</li>
			<li class="subMenu"><a> CLOTHES [840] </a>
			<ul style="display:none">
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Women's Clothing (45)</a></li>
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Women's Shoes (8)</a></li>												
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Women's Hand Bags (5)</a></li>	
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Men's Clothings  (45)</a></li>
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Men's Shoes (6)</a></li>												
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Kids Clothing (5)</a></li>												
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Kids Shoes (3)</a></li>												
			</ul>
			</li>
			<li class="subMenu"><a>FOOD AND BEVERAGES [1000]</a>
				<ul style="display:none">
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Angoves  (35)</a></li>
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Bouchard Aine & Fils (8)</a></li>												
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>French Rabbit (5)</a></li>	
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Louis Bernard  (45)</a></li>
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>BIB Wine (Bag in Box) (8)</a></li>												
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Other Liquors & Wine (5)</a></li>												
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Garden (3)</a></li>												
				<li><a href="products.aspx"><i class="icon-chevron-right"></i>Khao Shong (11)</a></li>												
			</ul>
			</li>
			<li><a href="products.aspx">HEALTH & BEAUTY [18]</a></li>
			<li><a href="products.aspx">SPORTS & LEISURE [58]</a></li>
			<li><a href="products.aspx">BOOKS & ENTERTAINMENTS [14]</a></li>
		</ul>
		<br/>
		  <div class="thumbnail">
			<img src="../themes/images/products/panasonic.jpg" alt="Bootshop panasonoc New camera"/>
			<div class="caption">
			  <h5>Panasonic</h5>
				<h4 style="text-align:center"><a class="btn" href="product_details.aspx"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
			</div>
		  </div><br/>
			<div class="thumbnail">
				<img src="../themes/images/products/kindle.png" title="Bootshop New Kindel" alt="Bootshop Kindel">
				<div class="caption">
				  <h5>Kindle</h5>
				    <h4 style="text-align:center"><a class="btn" href="product_details.aspx"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
				</div>
			  </div><br/>
			<div class="thumbnail">
				<img src="../themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
				<div class="caption">
				  <h5>Payment Methods</h5>
				</div>
			  </div>
	</div>
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.aspx">Home</a> <span class="divider">/</span></li>
		<li class="active">Registration</li>
    </ul>
	<h3> Registration</h3>	
	<div class="well">
	<!--
	<div class="alert alert-info fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	<div class="alert fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	 <div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply</strong> dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div> -->
	    <form id="form1" runat="server" >
		<h4>Your personal information</h4>
		
		<div class="control-group">
			<asp:Label runat="server" class="control-label" for="inputFname1">First name <sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="inputFname1" runat="server" placeholder="First Name" CausesValidation="True"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="inputFname1" ErrorMessage="Firstname Required"  CssClass="text-danger" Display="Dynamic">*Firstname Required</asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator runat="server" ControlToValidate="inputFname1" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="First name must contain all alphabets" CssClass="text-danger">*First name must contain all alphabets</asp:RegularExpressionValidator>
            
            </div>
		 </div>
		 <div class="control-group">
			<asp:Label class="control-label" runat="server" for="inputLnam">Last name <sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="inputLnam" runat="server"  placeholder="Last Name"/>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="inputLnam" ErrorMessage="Lastname Required"  CssClass="text-danger" Display="Dynamic">*Lastname Required</asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator runat="server" ControlToValidate="inputLnam" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Last name must contain all alphabets" CssClass="text-danger">*Last name must contain all alphabets</asp:RegularExpressionValidator>
            </div>
		 </div>
		<div class="control-group">
		<asp:Label class="control-label" runat="server" for="input_email">Email <sup>*</sup></asp:Label>
		<div class="controls">
		  <asp:TextBox id="input_email" runat="server" placeholder="Email"  OnTextChanged="input_email_TextChanged" AutoPostBack="true"/>
		    <asp:Label ID="Label1" runat="server" CssClass="text-danger"></asp:Label>

             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="input_email" ErrorMessage="Emailid Required"  CssClass="text-danger" Display="Dynamic">*Emailid Required</asp:RequiredFieldValidator>
		
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="input_email" ErrorMessage="RegularExpressionValidator"  CssClass="text-danger" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="all">Invalid format</asp:RegularExpressionValidator>
        </div>
	    
	  </div>	  
	<div class="control-group">
		<asp:Label class="control-label" runat="server" type="password" for="inputPassword1">Password <sup>*</sup></asp:Label>
		<div class="controls">
		  <asp:TextBox type="password" runat="server" id="inputPassword1" placeholder="Password"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="inputPassword1" Display="Dynamic" ErrorMessage="Password Required" CssClass="text-danger" >* Password required</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="inputPassword1" Display="Dynamic" ErrorMessage="RegularExpressionValidator"  CssClass="text-danger" SetFocusOnError="True" ValidationExpression="(^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$)" ValidationGroup="all"> * At least one lower case letter,
            At least one upper case letter,At least special character,At least one number,At most 10 characters length</asp:RegularExpressionValidator>
		</div>
	  </div>	  
		<div class="control-group">
			<div class="controls">
				
			</div>
		</div>		

	<%--<div class="alert alert-block alert-error fade in">
		<asp:Button runat="server" class="close" data-dismiss="alert" Text="×"></asp:Button>
		<strong>Lorem Ipsum is simply</strong> dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>--%>	

		<h4>Your address</h4>
		
		
		
		
		
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="address">Address<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="address" runat="server" placeholder="10 Street_name"/> <span>Street address, P.O. box, company name, c/o</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="address" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator runat="server" ControlToValidate="address" ValidationExpression="^[0-9]+((\s)+([A-Za-z]+)){1,2}" ErrorMessage="Street address must be of format 10 street_name" CssClass="text-danger">*Street address must be of format 10 street_name</asp:RegularExpressionValidator>
			
            
            </div>
		</div>
		
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="address2">Address (Line 2)<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="address2" runat="server" placeholder="Apartment_No Building"/> <span>Apartment, suite, unit, building, floor, etc.</span>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="address2" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator runat="server" ControlToValidate="address2" ValidationExpression="^[0-9]+((\s)+([A-Za-z]+)){1}" ErrorMessage="Apartment address must be of format Apartment_No Building" CssClass="text-danger">*Apartment address must be of format Apartment_No Building</asp:RegularExpressionValidator>
            </div>
		</div>
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="city">City<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:DropDownList ID="DropDownListcity" runat="server"  >
                   <asp:ListItem>Select--</asp:ListItem>
<asp:ListItem>Abingdon</asp:ListItem>
                <asp:ListItem>Acton</asp:ListItem>
                <asp:ListItem>Akron</asp:ListItem>
                <asp:ListItem>Alachua County</asp:ListItem>
                <asp:ListItem>Alameda</asp:ListItem>
                   <asp:ListItem>Albany</asp:ListItem>
                <asp:ListItem>Albemarle County</asp:ListItem>
                <asp:ListItem>Alexandria</asp:ListItem>
                <asp:ListItem>Algonquin</asp:ListItem>
                    <asp:ListItem>Arlington</asp:ListItem>
                <asp:ListItem>Belfast</asp:ListItem>
                <asp:ListItem>Belmar</asp:ListItem>
                <asp:ListItem>Berea</asp:ListItem>

                  <asp:ListItem>Binghamton</asp:ListItem>
                <asp:ListItem>Blacksburg</asp:ListItem>
                <asp:ListItem>Boston</asp:ListItem>
                <asp:ListItem>Bothell</asp:ListItem>
                <asp:ListItem>Boulder</asp:ListItem>
                   <asp:ListItem>Bridgeport</asp:ListItem>
                <asp:ListItem>Brookfield</asp:ListItem>
                <asp:ListItem>Burlington</asp:ListItem>
                <asp:ListItem>Cambridge</asp:ListItem>
                    <asp:ListItem>Charlotte</asp:ListItem>
                <asp:ListItem>Chicago</asp:ListItem>
                <asp:ListItem>Cleveland</asp:ListItem>
                <asp:ListItem>College Park</asp:ListItem>

                     <asp:ListItem>College Station</asp:ListItem>
                <asp:ListItem>Columbia</asp:ListItem>
                <asp:ListItem>Dallas</asp:ListItem>
                <asp:ListItem>Dublin</asp:ListItem>
                <asp:ListItem>Durham</asp:ListItem>
                   <asp:ListItem>Edinburg</asp:ListItem>
                <asp:ListItem>Eugene</asp:ListItem>
                <asp:ListItem>Falls</asp:ListItem>
                <asp:ListItem>Frankfort</asp:ListItem>
                    <asp:ListItem>Franklin</asp:ListItem>
                <asp:ListItem>Gainesville</asp:ListItem>
                <asp:ListItem>Geneva</asp:ListItem>
                <asp:ListItem>Grapevine</asp:ListItem>

                  <asp:ListItem>Hamilton</asp:ListItem>
                <asp:ListItem>Hawaii County</asp:ListItem>
                <asp:ListItem>Helena</asp:ListItem>
                <asp:ListItem>Huntsville</asp:ListItem>
                <asp:ListItem>Irvine</asp:ListItem>
                   <asp:ListItem>Irving</asp:ListItem>
                <asp:ListItem>Kansas City</asp:ListItem>
                <asp:ListItem>Knoxville</asp:ListItem>
                <asp:ListItem>Las Vegas</asp:ListItem>
                    <asp:ListItem>Los Angeles County</asp:ListItem>
                <asp:ListItem>Miami</asp:ListItem>
                <asp:ListItem>New Haven</asp:ListItem>
                <asp:ListItem>Plano</asp:ListItem>

                     <asp:ListItem>Raleigh</asp:ListItem>
                    <asp:ListItem>Seattle</asp:ListItem>
                <asp:ListItem>Tempe</asp:ListItem>
                <asp:ListItem>Washington, DC</asp:ListItem>
                <asp:ListItem>Winchester</asp:ListItem>
            </asp:DropDownList> 
                  <asp:RequiredFieldValidator ID="ddlcity" InitialValue="Select--" runat="server" ControlToValidate="DropDownListcity" ErrorMessage="Security Question Required"  CssClass="text-danger" Display="Dynamic">*City Required</asp:RequiredFieldValidator> 

           <%-- <asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label> --%>   
			</div>
		</div>
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="state">State<sup>*</sup></asp:Label>
			<div class="controls">
			  &nbsp;<asp:DropDownList ID="DropDownListstate" runat="server" >
                   <asp:ListItem>Select--</asp:ListItem>
                <asp:ListItem>Alabama</asp:ListItem>
                <asp:ListItem>Alaska</asp:ListItem>
                <asp:ListItem>Arizona</asp:ListItem>
                <asp:ListItem>Arkansas</asp:ListItem>
                   <asp:ListItem>California</asp:ListItem>
                <asp:ListItem>Colorado</asp:ListItem>
                <asp:ListItem>Connecticut</asp:ListItem>
                <asp:ListItem>Delaware</asp:ListItem>
                  <asp:ListItem>Florida</asp:ListItem>
                <asp:ListItem>Georgia</asp:ListItem>
                <asp:ListItem>Hawaii</asp:ListItem>
                <asp:ListItem>Idaho</asp:ListItem>
                   <asp:ListItem>Illinois</asp:ListItem>
                <asp:ListItem>Indiana</asp:ListItem>
                <asp:ListItem>Iowa </asp:ListItem>
                <asp:ListItem>Kansas</asp:ListItem>

                  <asp:ListItem>Kentucky </asp:ListItem>
                <asp:ListItem>Louisiana</asp:ListItem>
                <asp:ListItem>Maine</asp:ListItem>
                <asp:ListItem>Maryland</asp:ListItem>
                   <asp:ListItem>Massachusetts</asp:ListItem>
                <asp:ListItem>Michigan</asp:ListItem>
                <asp:ListItem>Minnesota</asp:ListItem>
                <asp:ListItem>Mississippi</asp:ListItem>
                  <asp:ListItem>Missouri</asp:ListItem>
                <asp:ListItem>Montana</asp:ListItem>
                <asp:ListItem>Nebraska</asp:ListItem>
                <asp:ListItem>Nevada</asp:ListItem>
                   <asp:ListItem>New Hampshire</asp:ListItem>
                <asp:ListItem>New Jersey</asp:ListItem>
                <asp:ListItem>New Mexico</asp:ListItem>
                <asp:ListItem>New York</asp:ListItem>

                   <asp:ListItem>North Carolina </asp:ListItem>
                <asp:ListItem>North Dakota </asp:ListItem>
                <asp:ListItem>Ohio</asp:ListItem>
                <asp:ListItem>Oklahoma</asp:ListItem>
                   <asp:ListItem>Oregon</asp:ListItem>
                <asp:ListItem>Pennsylvania</asp:ListItem>
                <asp:ListItem>Rhode Island </asp:ListItem>
                <asp:ListItem>South Carolina </asp:ListItem>
                  <asp:ListItem>South Dakota</asp:ListItem>
                <asp:ListItem>Tennessee</asp:ListItem>
                <asp:ListItem>Texas </asp:ListItem>
                <asp:ListItem>Utah </asp:ListItem>
                   <asp:ListItem>Vermont </asp:ListItem>
                <asp:ListItem>Virginia </asp:ListItem>
                <asp:ListItem>Washington </asp:ListItem>
                <asp:ListItem>West Virginia</asp:ListItem>

                  <asp:ListItem>Wisconsin</asp:ListItem>
                <asp:ListItem>Wyoming</asp:ListItem>
                  
            </asp:DropDownList>
           <asp:RequiredFieldValidator ID="ddlstate" InitialValue="Select--" runat="server" ControlToValidate="DropDownListstate" ErrorMessage="State Required"  CssClass="text-danger" Display="Dynamic">*State Required</asp:RequiredFieldValidator> 
        
                <%--<asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label>--%>
			</div>
            
		</div>		
		
		
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="country">Country<sup>*</sup></asp:Label>
			<div class="controls">
			&nbsp;<asp:DropDownList ID="DropDownListcountry" runat="server">
                 <asp:ListItem>Select--</asp:ListItem>
                <asp:ListItem>United States</asp:ListItem>
               
            </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ddlcountry" InitialValue="Select--" runat="server" ControlToValidate="DropDownListcountry" ErrorMessage="Country Required"  CssClass="text-danger" Display="Dynamic">*Country Required</asp:RequiredFieldValidator> 

                <%--<asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label>--%>
			</div>
            
		</div>	
		
		
		
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="mobile">Mobile Phone </asp:Label>
			<div class="controls">
			  <asp:TextBox  name="mobile" id="mobile" runat="server" placeholder="Mobile Phone"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="mobile" ErrorMessage="Phonenumber Required"  CssClass="text-danger" Display="Dynamic">*MobileNumber Required</asp:RequiredFieldValidator> 
			<asp:RegularExpressionValidator runat="server" ControlToValidate="mobile" ValidationExpression="^\d{10}$" ErrorMessage="Pin Code must be a 5-digit number" CssClass="text-danger">*Mobile number must be a 10-digit number</asp:RegularExpressionValidator>
            </div>
		</div>
        <div class="control-group">
			<asp:Label class="control-label" runat="server" for="postcode">Zip / Postal Code<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="postcode" runat="server" placeholder="Zip / Postal Code"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="postcode" ErrorMessage="Postalcode Required"  CssClass="text-danger" Display="Dynamic">*Postcode Required</asp:RequiredFieldValidator> 
			<asp:RegularExpressionValidator runat="server" ControlToValidate="postcode" ValidationExpression="^\d{5}$" ErrorMessage="Pin Code must be a 5-digit number" CssClass="text-danger">*Pin Code must be a 5-digit number</asp:RegularExpressionValidator>
            </div>
          
             <br />
  <asp:Label ID="shiplabel" runat="server"><h4>Willing to add your shipping address?</h4></asp:Label>
            <div class="control-group">
                <div class="controls">
                     <asp:RadioButton ID="RadioButton1" GroupName="ship"  OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true"  runat="server" />
                    <asp:Label Text="YES" runat="server" ID="yestxt">
                    </asp:Label>
                </div>
               <div class="control-group">
           
            <asp:RadioButton ID="RadioButton2" GroupName="ship"  OnCheckedChanged="RadioButton1_CheckedChanged" runat="server" AutoPostBack="true" />
            
		<asp:Label Text="NO" runat="server" ID="notxt">
                    </asp:Label></div>
             </div>
		<div class="control-group">
			<asp:Label class="control-label" ID="lblsaddress1" Visible="false" runat="server" for="saddress">Address<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="saddress" runat="server" Visible="false" placeholder="Adress"/> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidatoraddress" Enabled="false" runat="server" ControlToValidate="saddress" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic" ValidationGroup="shipaddress">*Address Required</asp:RequiredFieldValidator>    
<asp:RegularExpressionValidator ID="regexprsaddress" Enabled="false" runat="server" ControlToValidate="saddress" ValidationExpression="^[0-9]+((\s)+([A-Za-z]+)){1,2}" ValidationGroup="shipaddress" ErrorMessage="Street address must be of format 10 street_name" CssClass="text-danger">*Street address must be of format 10 street_name</asp:RegularExpressionValidator>
			</div>
		</div>
		
		<div class="control-group">
			<asp:Label class="control-label" ID="lblsaddress2" runat="server" for="saddress2" Visible="false">Address (Line 2)<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="saddress2" runat="server" Visible="false" placeholder="Adress line 2"/> 
<asp:RequiredFieldValidator ID="RequiredFieldValidatorsaddress2" Enabled="false" ValidationGroup="shipaddress" runat="server" ControlToValidate="saddress2" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidatorsaddress2" Enabled="false" runat="server" ControlToValidate="saddress2" ValidationExpression="^[0-9]+((\s)+([A-Za-z]+)){1,2}" ValidationGroup="shipaddress" ErrorMessage="Street address must be of format 10 street_name" CssClass="text-danger">*Street address must be of format 10 street_name</asp:RegularExpressionValidator>           
			</div>
		</div>
		<div class="control-group">
			<asp:Label class="control-label" ID="lblscity" Visible="false" runat="server" for="scity">City<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:DropDownList ID="scity" runat="server" Visible="false" >
                   <asp:ListItem>Select--</asp:ListItem>
<asp:ListItem>Abingdon</asp:ListItem>
                <asp:ListItem>Acton</asp:ListItem>
                <asp:ListItem>Akron</asp:ListItem>
                <asp:ListItem>Alachua County</asp:ListItem>
                <asp:ListItem>Alameda</asp:ListItem>
                   <asp:ListItem>Albany</asp:ListItem>
                <asp:ListItem>Albemarle County</asp:ListItem>
                <asp:ListItem>Alexandria</asp:ListItem>
                <asp:ListItem>Algonquin</asp:ListItem>
                    <asp:ListItem>Arlington</asp:ListItem>
                <asp:ListItem>Belfast</asp:ListItem>
                <asp:ListItem>Belmar</asp:ListItem>
                <asp:ListItem>Berea</asp:ListItem>

                  <asp:ListItem>Binghamton</asp:ListItem>
                <asp:ListItem>Blacksburg</asp:ListItem>
                <asp:ListItem>Boston</asp:ListItem>
                <asp:ListItem>Bothell</asp:ListItem>
                <asp:ListItem>Boulder</asp:ListItem>
                   <asp:ListItem>Bridgeport</asp:ListItem>
                <asp:ListItem>Brookfield</asp:ListItem>
                <asp:ListItem>Burlington</asp:ListItem>
                <asp:ListItem>Cambridge</asp:ListItem>
                    <asp:ListItem>Charlotte</asp:ListItem>
                <asp:ListItem>Chicago</asp:ListItem>
                <asp:ListItem>Cleveland</asp:ListItem>
                <asp:ListItem>College Park</asp:ListItem>

                     <asp:ListItem>College Station</asp:ListItem>
                <asp:ListItem>Columbia</asp:ListItem>
                <asp:ListItem>Dallas</asp:ListItem>
                <asp:ListItem>Dublin</asp:ListItem>
                <asp:ListItem>Durham</asp:ListItem>
                   <asp:ListItem>Edinburg</asp:ListItem>
                <asp:ListItem>Eugene</asp:ListItem>
                <asp:ListItem>Falls</asp:ListItem>
                <asp:ListItem>Frankfort</asp:ListItem>
                    <asp:ListItem>Franklin</asp:ListItem>
                <asp:ListItem>Gainesville</asp:ListItem>
                <asp:ListItem>Geneva</asp:ListItem>
                <asp:ListItem>Grapevine</asp:ListItem>

                  <asp:ListItem>Hamilton</asp:ListItem>
                <asp:ListItem>Hawaii County</asp:ListItem>
                <asp:ListItem>Helena</asp:ListItem>
                <asp:ListItem>Huntsville</asp:ListItem>
                <asp:ListItem>Irvine</asp:ListItem>
                   <asp:ListItem>Irving</asp:ListItem>
                <asp:ListItem>Kansas City</asp:ListItem>
                <asp:ListItem>Knoxville</asp:ListItem>
                <asp:ListItem>Las Vegas</asp:ListItem>
                    <asp:ListItem>Los Angeles County</asp:ListItem>
                <asp:ListItem>Miami</asp:ListItem>
                <asp:ListItem>New Haven</asp:ListItem>
                <asp:ListItem>Plano</asp:ListItem>

                     <asp:ListItem>Raleigh</asp:ListItem>
                    <asp:ListItem>Seattle</asp:ListItem>
                <asp:ListItem>Tempe</asp:ListItem>
                <asp:ListItem>Washington, DC</asp:ListItem>
                <asp:ListItem>Winchester</asp:ListItem>
            </asp:DropDownList> 
                 
           <%-- <asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label> --%>   
			<asp:RequiredFieldValidator ID="RequiredFieldValidatorscity" Enabled="false" ValidationGroup="shipaddress" InitialValue="Select--" runat="server" ControlToValidate="scity" ErrorMessage="Security Question Required"  CssClass="text-danger" Display="Dynamic">*City Required</asp:RequiredFieldValidator>
            </div>
                
			</div>
		</div>
		<div class="control-group">
			<asp:Label class="control-label" ID="lblsstate" Visible="false" runat="server" for="sstate">State<sup>*</sup></asp:Label>
			<div class="controls">
			 <asp:DropDownList ID="sstate" runat="server" Visible="false">
                   <asp:ListItem>Select--</asp:ListItem>
                <asp:ListItem>Alabama</asp:ListItem>
                <asp:ListItem>Alaska</asp:ListItem>
                <asp:ListItem>Arizona</asp:ListItem>
                <asp:ListItem>Arkansas</asp:ListItem>
                   <asp:ListItem>California</asp:ListItem>
                <asp:ListItem>Colorado</asp:ListItem>
                <asp:ListItem>Connecticut</asp:ListItem>
                <asp:ListItem>Delaware</asp:ListItem>
                  <asp:ListItem>Florida</asp:ListItem>
                <asp:ListItem>Georgia</asp:ListItem>
                <asp:ListItem>Hawaii</asp:ListItem>
                <asp:ListItem>Idaho</asp:ListItem>
                   <asp:ListItem>Illinois</asp:ListItem>
                <asp:ListItem>Indiana</asp:ListItem>
                <asp:ListItem>Iowa </asp:ListItem>
                <asp:ListItem>Kansas</asp:ListItem>

                  <asp:ListItem>Kentucky </asp:ListItem>
                <asp:ListItem>Louisiana</asp:ListItem>
                <asp:ListItem>Maine</asp:ListItem>
                <asp:ListItem>Maryland</asp:ListItem>
                   <asp:ListItem>Massachusetts</asp:ListItem>
                <asp:ListItem>Michigan</asp:ListItem>
                <asp:ListItem>Minnesota</asp:ListItem>
                <asp:ListItem>Mississippi</asp:ListItem>
                  <asp:ListItem>Missouri</asp:ListItem>
                <asp:ListItem>Montana</asp:ListItem>
                <asp:ListItem>Nebraska</asp:ListItem>
                <asp:ListItem>Nevada</asp:ListItem>
                   <asp:ListItem>New Hampshire</asp:ListItem>
                <asp:ListItem>New Jersey</asp:ListItem>
                <asp:ListItem>New Mexico</asp:ListItem>
                <asp:ListItem>New York</asp:ListItem>

                   <asp:ListItem>North Carolina </asp:ListItem>
                <asp:ListItem>North Dakota </asp:ListItem>
                <asp:ListItem>Ohio</asp:ListItem>
                <asp:ListItem>Oklahoma</asp:ListItem>
                   <asp:ListItem>Oregon</asp:ListItem>
                <asp:ListItem>Pennsylvania</asp:ListItem>
                <asp:ListItem>Rhode Island </asp:ListItem>
                <asp:ListItem>South Carolina </asp:ListItem>
                  <asp:ListItem>South Dakota</asp:ListItem>
                <asp:ListItem>Tennessee</asp:ListItem>
                <asp:ListItem>Texas </asp:ListItem>
                <asp:ListItem>Utah </asp:ListItem>
                   <asp:ListItem>Vermont </asp:ListItem>
                <asp:ListItem>Virginia </asp:ListItem>
                <asp:ListItem>Washington </asp:ListItem>
                <asp:ListItem>West Virginia</asp:ListItem>

                  <asp:ListItem>Wisconsin</asp:ListItem>
                <asp:ListItem>Wyoming</asp:ListItem>
                  
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorstate" Enabled="false" ValidationGroup="shipaddress" InitialValue="Select--" runat="server" ControlToValidate="sstate" ErrorMessage="State Required"  CssClass="text-danger" Display="Dynamic">*State Required</asp:RequiredFieldValidator> 
			</div>
            
		</div>		
		
		
		<div class="control-group">
			<asp:Label class="control-label" ID="lblscountry" Visible="false" runat="server" for="scountry">Country<sup>*</sup></asp:Label>
			<div class="controls">
			<asp:DropDownList ID="scountry" Visible="false" runat="server">
                 <asp:ListItem>Select--</asp:ListItem>
                <asp:ListItem>United States</asp:ListItem>
               
            </asp:DropDownList>
             <asp:RequiredFieldValidator ID="RequiredFieldValidatorcountry" ValidationGroup="shipaddress" Enabled="false" InitialValue="Select--" runat="server" ControlToValidate="scountry" ErrorMessage="Country Required"  CssClass="text-danger" Display="Dynamic">*Country Required</asp:RequiredFieldValidator>   
			</div>
            
		</div>	
		
		
		
		
        <div class="control-group">
			<asp:Label class="control-label" ID="lblspostcode" Visible="false" runat="server" for="spostcode">Zip / Postal Code<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="spostcode" runat="server" Visible="false" placeholder="Zip / Postal Code"/> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorspost" Enabled="false" ValidationGroup="shipaddress" runat="server" ControlToValidate="spostcode" ErrorMessage="Postalcode Required"  CssClass="text-danger" Display="Dynamic">*Postcode Required</asp:RequiredFieldValidator>     
			<asp:RegularExpressionValidator ID="Regexppost" ValidationGroup="shipaddress" Enabled="false" runat="server" ControlToValidate="spostcode" ValidationExpression="^\d{5}$" ErrorMessage="Pin Code must be a 5-digit number" CssClass="text-danger">*Pin Code must be a 5-digit number</asp:RegularExpressionValidator>
            </div>
		</div>
            <h4>Please select the security questions</h4>	
            
           <br />
            <asp:DropDownList ID="DropDownList1" runat="server" >
                <asp:ListItem>Select--</asp:ListItem>
                <asp:ListItem>What is the name of your favourite instructor?</asp:ListItem>
                <asp:ListItem>What is your mother’s maiden name?</asp:ListItem>
                <asp:ListItem>What is your favourite color?</asp:ListItem>
                <asp:ListItem>What is your last pet's name?</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorddl1" InitialValue="Select--" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Security Question Required"  CssClass="text-danger" Display="Dynamic">*Security Question Required</asp:RequiredFieldValidator> 

            <%--<asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label>--%>
            <br />
            <asp:TextBox ID="answer1" runat="server"></asp:TextBox>
            <br />

            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>Select--</asp:ListItem>
                <asp:ListItem>In what city were you born?</asp:ListItem>
                <asp:ListItem>What is your favorite movie?</asp:ListItem>
                <asp:ListItem>Who is your favorite artist?</asp:ListItem>
                <asp:ListItem>Which month is your anniversary?</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="ddl2" InitialValue="Select--" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Security Question Required"  CssClass="text-danger" Display="Dynamic">*Security Question Required</asp:RequiredFieldValidator> 

            <%--<asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label>--%>
            <br />
            <asp:TextBox ID="answer2" runat="server"></asp:TextBox>
            <br />
            <br />
             <h4 >Would you like to give your card details? ***</h4>  
            <asp:RadioButton   runat="server" id="r1" GroupName="suggestions" value="Yes"   />
            <label style="display:inline;">Yes</label>
                 <asp:RadioButton runat="server"  GroupName="suggestions" id="r2" value="No"    />
            <label style="display:inline;">No</label>

            <%--<asp:RadioButtonList ID="radiobutton" runat="server" RepeatLayout="Flow" onchange="myfunction3()">
    <asp:ListItem Value="Yes">Yes</asp:ListItem>
    <asp:ListItem Value="No">No</asp:ListItem>
</asp:RadioButtonList>--%>
             <%--<div runat="server" class="control-group" id="divtobhiden1" >
			<asp:Label class="control-label" ID="cardnum"   runat="server" for="CardNumber">Card Number </asp:Label>
			<div class="controls">
			  <asp:TextBox  name="cardnumber" id="CardNo"    runat="server" placeholder="123456789"/>
                <%--<ajax:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" PopupPosition="TopRight" TargetControlID="RequiredFieldValidator3"></ajax:ValidatorCalloutExtender>--%>
 <%--<asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label>--%>
                 <%--<asp:RegularExpressionValidator runat="server" ControlToValidate="CardNo" ValidationExpression="^\d{9}$" ErrorMessage="Card Number must be a 9-digit number" CssClass="text-danger">*Card Number must be a 9-digit number</asp:RegularExpressionValidator>
 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="CardNo" ErrorMessage="Postalcode Required"  CssClass="text-danger" Display="Dynamic">*Card Number Required</asp:RequiredFieldValidator>
               


			</div>
		</div>--%>
            <%--<asp:Label runat="server"></asp:Label>
<div class="control-group" runat="server" id="divtobhiden2" hidden="hidden">
			<asp:Label class="control-label"    ID="lblcrdcvv" runat="server" for="Cardcvv">Card CVV </asp:Label>
			<div class="controls">
			  <asp:TextBox  name="CVV" ID="Cardcvv"    runat="server" placeholder="Card CVV"/>
               <asp:RegularExpressionValidator runat="server" ControlToValidate="Cardcvv" ValidationExpression="^\d{3}$" ErrorMessage="Card cvv must be a 3-digit number" CssClass="text-danger">*Card Number must be a 3-digit number</asp:RegularExpressionValidator>
 
			<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="Cardcvv" ErrorMessage="Postalcode Required"  CssClass="text-danger" Display="Dynamic">*Card CVV Required</asp:RequiredFieldValidator>
                --%>

            <%--<asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label> --%>
            <%--</div>
     
		</div>
            <div class="control-group" runat="server" id="divtobhiden3" hidden="hidden" >
			<asp:Label class="control-label" ID="CardExp"    runat="server" for="CardExpiry">Card Expiry </asp:Label>
			<div class="controls">--%>
                
			<%--<asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label> --%>
			 <%-- <asp:TextBox   name="CardExpiry" id="CardExpiry" runat="server"    />--%>
              <%--<asp:Calendar ID="Calendar1" runat="server" Visible="true"   BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="68px"  Width="128px" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>

                <asp:TextBox ID="TextBoxSD"    runat="server" Width="128px" ReadOnly="True"></asp:TextBox>--%>

               <%-- <asp:CompareValidator ID="cvIsActiveDateInFuture" runat="server" 
    ControlToValidate="CardExpiry" 
    ErrorMessage="Expiry date must be a future date."  
     ClientValidationFunction="myfunction()"
                 
    ></asp:CompareValidator>--%>


               <%-- <asp:RegularExpressionValidator runat="server" ControlToValidate="CardExpiry" ValidationExpression="^\d{4}[\-\/\s]?((((0[13578])|(1[02]))[\-\/\s]?(([0-2][0-9])|(3[01])))|(((0[469])|(11))[\-\/\s]?(([0-2][0-9])|(30)))|(02[\-\/\s]?[0-2][0-9]))$" ErrorMessage="Enter a valid date" CssClass="text-danger">*Enter a valid date</asp:RegularExpressionValidator>
           <asp:Label runat="server" ID="datewarn"></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="CardExpiry" ErrorMessage="Postalcode Required"  CssClass="text-danger" Display="Dynamic">*Card Expiry Date Required</asp:RequiredFieldValidator> --%>
<%--<asp:CustomValidator runat="server" ControlToValidate="CardExpiry" ClientValidationFunction="Checkdate(sender, args)" >*It must be a future date</asp:CustomValidator>
			<%--<asp:Label runat="server" CssClass="text-danger" Display="Dynamic">   *Required </asp:Label> --%>
            
           <%--</div>
		</div>--%>


		</div>
		
	<p><sup>*</sup>Required field	</p>
	
	<div class="control-group">
			<div class="controls">
				<asp:TextBox type="hidden" runat="server" name="email_create" value="1"/>
				<asp:TextBox type="hidden" runat="server" name="is_new_customer" value="1"/>
				<asp:Button ID="registerbtn"  class="btn btn-large btn-success"  runat="server" Text="Register" OnClick="registerbtn_Click1" ValidationGroup="shipaddress" />
			</div>
		</div>		
	    </form>
</div>

</div>
</div>
</div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<%--<div class="span3">
				<h5>ACCOUNT</h5>
				<a href="login.aspx">YOUR ACCOUNT</a>
				<a href="login.aspx">PERSONAL INFORMATION</a> 
				<a href="login.aspx">ADDRESSES</a> 
				<a href="login.aspx">DISCOUNT</a>  
				<a href="login.aspx">ORDER HISTORY</a>
			 </div>--%>
			<div class="span3">
				<h5>INFORMATION</h5>
				<a href="contact.aspx">CONTACT</a>  
				<a href="register.aspx">REGISTRATION</a>  
				<%--<a href="legal_notice.aspx">LEGAL NOTICE</a>  
				<a href="tac.aspx">TERMS AND CONDITIONS</a> 
				<a href="faq.aspx">FAQ</a>--%>
			 </div>
			<div class="span3">
				<h5>OUR OFFERS</h5>
				<a href="products.aspx">NEW PRODUCTS</a> 
				<%--<a href="#">TOP SELLERS</a>  
				<a href="special_offer.aspx">SPECIAL OFFERS</a>  
				<a href="#">MANUFACTURERS</a> 
				<a href="#">SUPPLIERS</a> --%>
			 </div>
			<div id="socialMedia" class="span3 pull-right">
				<h5>SOCIAL MEDIA </h5>
				<a href="#"><img width="60" height="60" src="../themes/images/facebook.png" title="facebook" alt="facebook"/></a>
				<a href="#"><img width="60" height="60" src="../themes/images/twitter.png" title="twitter" alt="twitter"/></a>
				<a href="#"><img width="60" height="60" src="../themes/images/youtube.png" title="youtube" alt="youtube"/></a>
			 </div> 
		 </div>
		<p class="pull-right">&copy; Bootshop</p>
	</div><!-- Container End -->
	</div>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="../themes/js/jquery.js" type="text/javascript"></script>
	<script src="../themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../themes/js/google-code-prettify/prettify.js"></script>
	
	<script src="../themes/js/bootshop.js"></script>
    <script src="../themes/js/jquery.lightbox-0.5.js"></script>
	
	<!-- Themes switcher section ============================================================================================= -->
<div id="secectionBox">
<link rel="stylesheet" href="../themes/switch/themeswitch.css" type="text/css" media="screen" />
<script src="../themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
	<div id="themeContainer">
	<div id="hideme" class="themeTitle">Style Selector</div>
	<div class="themeName">Oregional Skin</div>
	<div class="images style">
	<a href="themes/css/#" name="bootshop"><img src="../themes/switch/images/clr/bootshop.png" alt="bootstrap business templates" class="active"></a>
	<a href="themes/css/#" name="businessltd"><img src="../themes/switch/images/clr/businessltd.png" alt="bootstrap business templates" class="active"></a>
	</div>
	<div class="themeName">Bootswatch Skins (11)</div>
	<div class="images style">
		<a href="themes/css/#" name="amelia" title="Amelia"><img src=../"themes/switch/images/clr/amelia.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spruce" title="Spruce"><img src="../themes/switch/images/clr/spruce.png" alt="bootstrap business templates" ></a>
		<a href="themes/css/#" name="superhero" title="Superhero"><img src="../themes/switch/images/clr/superhero.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cyborg"><img src="../themes/switch/images/clr/cyborg.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cerulean"><img src="../themes/switch/images/clr/cerulean.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="journal"><img src="../themes/switch/images/clr/journal.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="readable"><img src="../themes/switch/images/clr/readable.png" alt="bootstrap business templates"></a>	
		<a href="themes/css/#" name="simplex"><img src="../themes/switch/images/clr/simplex.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="slate"><img src="../themes/switch/images/clr/slate.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spacelab"><img src="../themes/switch/images/clr/spacelab.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="united"><img src="../themes/switch/images/clr/united.png" alt="bootstrap business templates"></a>
		<p style="margin:0;line-height:normal;margin-left:-10px;display:none;"><small>These are just examples and you can build your own color scheme in the backend.</small></p>
	</div>
	<div class="themeName">Background Patterns </div>
	<div class="images patterns">
		<a href="themes/css/#" name="pattern1"><img src="../themes/switch/images/pattern/pattern1.png" alt="bootstrap business templates" class="active"></a>
		<a href="themes/css/#" name="pattern2"><img src="../themes/switch/images/pattern/pattern2.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern3"><img src="../themes/switch/images/pattern/pattern3.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern4"><img src="../themes/switch/images/pattern/pattern4.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern5"><img src="../themes/switch/images/pattern/pattern5.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern6"><img src="../themes/switch/images/pattern/pattern6.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern7"><img src="../themes/switch/images/pattern/pattern7.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern8"><img src="../themes/switch/images/pattern/pattern8.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern9"><img src="../themes/switch/images/pattern/pattern9.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern10"><img src="../themes/switch/images/pattern/pattern10.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern11"><img src="../themes/switch/images/pattern/pattern11.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern12"><img src="../themes/switch/images/pattern/pattern12.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern13"><img src="../themes/switch/images/pattern/pattern13.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern14"><img src="../themes/switch/images/pattern/pattern14.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern15"><img src="../themes/switch/images/pattern/pattern15.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern16"><img src="../themes/switch/images/pattern/pattern16.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern17"><img src="../themes/switch/images/pattern/pattern17.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern18"><img src="../themes/switch/images/pattern/pattern18.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern19"><img src="../themes/switch/images/pattern/pattern19.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern20"><img src="../themes/switch/images/pattern/pattern20.png" alt="bootstrap business templates"></a>
		 
	</div>
	</div>
</div>
<span id="themesBtn"></span>

    <script>
        function myfunction()
        {

            var fromdate = Convert.ToDateTime(CardExpiry.Text);
            var todate1 = Convert.ToDateTime(DateTime.Now);
            if (fromdate <= todate1)
            {
                document.getElementById("datewarn").innerHTML = "Enter a valid date!";
                alert("Enter a valid date!");
            }
            else
            {
                //MessageBox.Show("From Date Must be Less Than To Date");
            }
        }


        

        function myfunction3() {
            
            if (document.getElementById("r1").checked) {
                //document.getElementById("cardnum").style.visibility="visible" ;
                //document.getElementById("CardNo").style.visibility = "visible";
                //document.getElementById("lblcrdcvv").style.visibility = "visible";
                //document.getElementById("Cardcvv").hidden = false;
                //document.getElementById("CardExp").hidden = false;
                //document.getElementById("TextBoxSD").hidden = false;
                //document.getElementById("Calendar1").hidden = false;
               
               <%-- document.getElementById("divtobhiden1").hidden = false;
                document.getElementById("divtobhiden2").hidden = false;
                document.getElementById("divtobhiden3").hidden = false;

                document.getElementById("<%=RequiredFieldValidator12.ClientID%>").enabled = true;


                

                document.getElementById("<%=RequiredFieldValidator14.ClientID%>").enabled = true;
               

                document.getElementById("<%=RequiredFieldValidator13.ClientID%>").enabled = true;
               
                --%>
            }
            else if (document.getElementById("r2").checked) {
               <%-- document.getElementById("<%=cardnum.ClientID%>").style.visibility = "hidden" ;
                document.getElementById("<%=CardNo.ClientID%>").style.visibility = "hidden";
                document.getElementById("<%=lblcrdcvv.ClientID%>").style.visibility = "hidden";--%>
                //document.getElementById("Cardcvv").hidden = true;
                //document.getElementById("CardExp").hidden = true;
                //document.getElementById("TextBoxSD").hidden = true;
                //document.getElementById("Calendar1").hidden = true;

                //document.getElementById("divtobhiden1").hidden = true;
                //document.getElementById("divtobhiden2").hidden = true;
                //document.getElementById("divtobhiden3").hidden = true;
                <%--ValidatorEnable(document.getElementById("<%=RequiredFieldValidator12.ClientID %>"), false);
                ValidatorEnable(document.getElementById("<%=RequiredFieldValidator13.ClientID %>"), false);
                ValidatorEnable(document.getElementById("<%=RequiredFieldValidator14.ClientID %>"), false);--%>
               <%-- document.getElementById("<%=RequiredFieldValidator12.ClientID%>").style.visibility = "hidden";

                document.getElementById("<%=RequiredFieldValidator12.ClientID%>").enabled = false;
                
         
                document.getElementById("<%=RequiredFieldValidator14.ClientID%>").style.visibility = "hidden";

                document.getElementById("<%=RequiredFieldValidator14.ClientID%>").enabled = false;
                document.getElementById("<%=RequiredFieldValidator13.ClientID%>").style.visibility = "hidden";

                document.getElementById("<%=RequiredFieldValidator13.ClientID%>").enabled = false;
         --%>
          }

        }
        </script>
    
    
</body>
</html>