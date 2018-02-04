<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs"   Inherits="ecomNew.index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8">
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<!--Less styles -->
   <!-- Other Less css file //different leWss files has different color scheam
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
	<link href="../themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="../themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="../themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../themes/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css" id="enject"> #Changepassword
 {
     display:inline-block;
 }
	</style>
  </head>
<body>
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6"><strong><asp:Label runat="server" ID="userfname"></asp:Label></strong></div>
	<div class="span6">
	<div class="pull-right">
		<%--<a href="product_summary.aspx"><span class="">Fr</span></a>
		<a href="product_summary.aspx"><span class="">Es</span></a>
		<span class="btn btn-mini">En</span>
		<a href="product_summary.aspx"><span>&pound;</span></a>
		<span class="btn btn-mini">$155.00</span>
		<a href="product_summary.aspx"><span class="">$</span></a>
		--%><%--<a href="product_summary.aspx"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white" ></i> Itemes in your cart </span> </a> --%>
	<asp:HyperLink ID="cartitems" href="product_summary.aspx" runat="server" class="btn btn-mini btn-primary" ><i class="icon-shopping-cart icon-white"></i>cart</asp:HyperLink>
    </div>
	</div>
</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.aspx"><img src="../themes/images/logo.png" alt="Bootsshop"/></a>
		<form class="form-inline navbar-search" action="products.aspx" style="display:inline;">
		<input id="srchFld" class="srchTxt" type="text" />
		    <button style="display:inline;" type="submit" id="submitButton" class="btn btn-primary">
		  <select class="srchTxt" name="D1">
			<option>All</option>
			<option>CLOTHES </option>
			<option>FOOD AND BEVERAGES </option>
			<option>HEALTH & BEAUTY </option>
			<option>SPORTS & LEISURE </option>
			<option>BOOKS & ENTERTAINMENTS </option>
		</select>Go</button>
   </form>
    <ul id="topMenu" class="nav pull-right">
	 <%--<li class=""><a href="special_offer.aspx">Specials Offer</a></li>
	 <li class=""><a href="normal.aspx">Delivery</a></li>
	 <li class=""><a href="contact.aspx">Contact</a></li>--%>
	 <li class="">
         

            <%-- <a href="Login.aspx" id="#" >Login</a>--%>
           
            <asp:HyperLink ID="log" href="Login.aspx" runat="server" style="color:white;font-size:20px;">Login</asp:HyperLink>
            &nbsp;&nbsp;
            <asp:HyperLink ID="chngpwd" href="ChangePassword.aspx"  runat="server" style="color:white;font-size:20px;">Change Password</asp:HyperLink>
   
             <asp:HyperLink ID="logout" href="Login.aspx" runat="server" style="color:white;font-size:20px;">Logout</asp:HyperLink>
             
        
	 
	<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
		  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
               
			<h3>Login Block</h3>
		  </div>
		  <div class="modal-body">
			<%--<form class="form-horizontal loginFrm">
			  <div class="control-group">								
				<asp:TextBox id="inputEmail" placeholder="Email" runat="server"/>
			  </div>
			  <div class="control-group">
				<asp:TextBox runat="server" id="inputPassword" placeholder="Password"/>
			  </div>
			  <div class="control-group">
				<asp:Label runat="server" class="checkbox">
				<asp:CheckBox runat="server" Text="Remember me"/>
				</asp:Label>
			  </div>
			</form>		
			<asp:Button type="submit" class="btn btn-success" runat="server" Text="Sign in"></asp:Button>
			<asp:Button class="btn" data-dismiss="modal" aria-hidden="true" runat="server" Text="Close"></asp:Button>
		  </div>--%>
	</div>
	</li>
    </ul>
  </div>
</div>
</div>
</div>
<!-- Header End====================================================================== -->
<div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
		  <div class="item active">
		  <div class="container">
			<a href="Registration.aspx"><img style="width:100%" src="../themes/images/carousel/1.png" alt="special offers"/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="Registration.aspx"><img style="width:100%" src="../themes/images/carousel/2.png" alt=""/></a>
				<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="Registration.aspx"><img src="../themes/images/carousel/3.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
			
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="Registration.aspx"><img src="../themes/images/carousel/4.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		   
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="Registration.aspx"><img src="../themes/images/carousel/5.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			</div>
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="Registration.aspx"><img src="../themes/images/carousel/6.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	  </div> 
</div>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span3">
        <%-- <form  id="form2" runat="server">
        <div style="margin-left:100%;display:block;">
           <ul>
<li></li>
               <li></li>


           </ul>
            
            

        </div>
             </form>>--%>
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

		<div class="span9" >		
		
		<h4>Latest Products </h4>
       
            <form id="form" runat="server">
               <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-hover" OnRowCreated="GridView1_RowCreated"   BorderColor="White" BackColor="White" BorderStyle="None" BorderWidth="1px"  CellSpacing="2" Width="819px">
            <Columns>
               

                        <asp:ButtonField ButtonType="Button"  runat="server"    CommandName="Select"   Text="Add to cart" />
                 
                    

           
                
                <asp:TemplateField HeaderText="Preview Image">
                    <ItemTemplate>
                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("filepath") %>'></asp:TextBox>--%>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("filepath") %>' />
                    
                    </ItemTemplate>
                   
                    <ControlStyle Height="100px" Width="100px" />
             </asp:TemplateField>
                 <asp:BoundField DataField="Product_sku" HeaderText="Product sku" />
                  <asp:TemplateField HeaderText="Product description">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Product_desc") %>'></asp:Label>
                    </ItemTemplate>
                       <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Product_desc") %>'></asp:Label>
                    </EditItemTemplate>
                       </asp:TemplateField>
                 
                 
                <%--<asp:BoundField DataField="Product_sku" HeaderText="Product_sku" SortExpression="Product_sku" />
                <asp:BoundField DataField="Product_desc" HeaderText="Product_desc" SortExpression="Product_desc" />--%>
   <asp:TemplateField HeaderText="Item Quantity">
       <ItemTemplate>
           <asp:Label ID="Label4" runat="server" Text='<%# Bind("Product_quantity") %>'></asp:Label>
       </ItemTemplate>             
       
        <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Product_quantity") %>'></asp:TextBox>
               
             </EditItemTemplate>

                    </asp:TemplateField>

                <asp:TemplateField HeaderText="Product price">
                     <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Product_price") %>'></asp:Label>
  <asp:Label ID="Labelpricw" runat="server" Text="$"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Product_price") %>'></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField> 

                      

                    

                      

            </Columns> 
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="Black" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
     </asp:GridView>
                       <%-- </ContentTemplate>
       </asp:UpdatePanel>--%>        
    </form>
      </div>
		</div>
     
	</div>	
	
</div>
     
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<h5>ACCOUNT</h5>
				<a href="login.aspx">YOUR ACCOUNT</a>
                <a href="UpdateRegistration.aspx"  >PERSONAL INFORMATION</a>
                   <a href="Addresses.aspx"  >YOUR ADDRESSES</a>
              <a href="ChangePassword.aspx" >CHANGE PASSWORD</a>
                <a href="Customer_orders.aspx">CHECK ORDER HISTORY</a>
				<%--<a href="login.aspx">ADDRESSES</a> 
				<a href="login.aspx">DISCOUNT</a--%>>  
				<%--<a href="login.aspx">ORDER HISTORY</a>--%>
			 </div>
			<div class="span3">
				<h5>INFORMATION</h5>
				<a href="contact.aspx">CONTACT</a>  
				<a href="Registration.aspx">REGISTRATION</a>  
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
	
	<script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>
	
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
		<a href="themes/css/#" name="amelia" title="Amelia"><img src="../themes/switch/images/clr/amelia.png" alt="bootstrap business templates"></a>
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
		<a href="themes/css/#" name="pattern10"><img src="./themes/switch/images/pattern/pattern10.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern11"><img src="themes/switch/images/pattern/pattern11.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern12"><img src="themes/switch/images/pattern/pattern12.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern13"><img src="themes/switch/images/pattern/pattern13.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern14"><img src="themes/switch/images/pattern/pattern14.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern15"><img src="themes/switch/images/pattern/pattern15.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern16"><img src="themes/switch/images/pattern/pattern16.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern17"><img src="themes/switch/images/pattern/pattern17.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern18"><img src="themes/switch/images/pattern/pattern18.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern19"><img src="themes/switch/images/pattern/pattern19.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern20"><img src="themes/switch/images/pattern/pattern20.png" alt="bootstrap business templates"></a>
		 
	</div>
	</div>
</div>
<span id="themesBtn"></span>
 <script>

 </script> 

</body>
</html>
