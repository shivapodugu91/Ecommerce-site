<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product_summary.aspx.cs" Inherits="ecomNew.product_summary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8">
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
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
	<link href="../themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="../themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="../themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../themes/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css" id="enject"></style>
  </head>
<body>
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome!<strong><asp:Label runat="server" ID="userfname"></asp:Label></strong></div>
	<div class="span6">
	<div class="pull-right">
		<a href="product_summary.aspx"><span class="">Fr</span></a>
		<a href="product_summary.aspx"><span class="">Es</span></a>
		<span class="btn btn-mini">En</span>
		<a href="product_summary.aspx"><span>&pound;</span></a>
		<span class="btn btn-mini">$155.00</span>
		<a href="product_summary.aspx"><span class="">$</span></a>
		<a href="product_summary.aspx"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> Itemes in your cart </span> </a> 
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
		<form class="form-inline navbar-search" method="post" action="products.aspx" style="display:inline;">
		<input id="srchFld" class="srchTxt" type="text" />
		  <select class="srchTxt">
			<option>All</option>
			<option>CLOTHES </option>
			<option>FOOD AND BEVERAGES </option>
			<option>HEALTH & BEAUTY </option>
			<option>SPORTS & LEISURE </option>
			<option>BOOKS & ENTERTAINMENTS </option>
		</select> 
		 <button type="submit" style="display:inline;" id="submitButton" class="btn btn-primary">Go</button>
  </form>
    <ul id="topMenu" class="nav pull-right">
	 <%--<li class=""><a href="special_offer.aspx">Specials Offer</a></li>
	 <li class=""><a href="normal.aspx">Delivery</a></li>
	 <li class=""><a href="contact.aspx">Contact</a></li>
	 <li class="">
	 <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>--%>
	

            <%-- <a href="Login.aspx" id="#" >Login</a>--%>
           
            <asp:HyperLink ID="log" href="Login.aspx" runat="server" style="color:white;font-size:20px;">Login</asp:HyperLink>
            &nbsp;&nbsp;
            <asp:HyperLink ID="chngpwd" href="ChangePassword.aspx" runat="server" style="color:white;font-size:20px;">Change Password</asp:HyperLink>
      &nbsp;&nbsp;
             <asp:HyperLink ID="logout" href="Login.aspx" runat="server" style="color:white;font-size:20px;">Logout</asp:HyperLink>
             
      
        
        <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
			<h3>Login Block</h3>
		  </div>
		  <div class="modal-body">
			<%--<form class="form-horizontal loginFrm">
			  <div class="control-group">								
				<asp:TextBox id="inputEmail" runat="server" placeholder="Email"/>
			  </div>
			  <div class="control-group">
				<asp:TextBox id="inputPassword" placeholder="Password" runat="server"/>
			  </div>
			  <div class="control-group">
				<asp:Label runat="server" class="checkbox">
				<asp:CheckBox runat="server" Text="Remember me"/> 
				</asp:Label>
			  </div>
			</form>	--%>	
			<%--<asp:Button type="submit" class="btn btn-success" runat="server" Text="Sign in"></asp:Button>
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
		<li class="active"> SHOPPING CART</li>
    </ul>
	<h3>  SHOPPING CART <a href="index.aspx" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Continue Shopping </a></h3>	
	<hr class="soft"/>
	<table class="table table-bordered">
		<%--<tr><th> I AM ALREADY REGISTERED  </th></tr>
		 <tr>--%> 
		 <%--<td>
			<form class="form-horizontal">
				<div class="control-group">
				  <asp:Label class="control-label" for="inputUsername" runat="server">Username</asp:Label>
				  <div class="controls">
					<asp:TextBox type="text" id="inputUsername" runat="server" placeholder="Username"/>
				  </div>
				</div>
				<div class="control-group">
				  <asp:Label class="control-label" for="inputPassword1" runat="server">Password</asp:Label>
				  <div class="controls">
					<asp:TextBox type="password" id="inputPassword1" runat="server" placeholder="Password"/>
				  </div>
				</div>
				<div class="control-group">
				  <div class="controls">
					<asp:Button type="submit" class="btn" runat="server" Text="Sign in"></asp:Button> OR <a href="register.aspx" class="btn">Register Now!</a>
				  </div>
				</div>
				<div class="control-group">
					<div class="controls">
					  <a href="forgetpass.aspx" style="text-decoration:underline">Forgot password ?</a>
					</div>
				</div>
			</form>--%>
		  </td>
		  </tr>
	</table>		
			
	<%--<table class="table table-bordered">
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Description</th>
                  <th>Quantity/Update</th>
				  <th>Price</th>
                  <th>Discount</th>
                  <th>Tax</th>
                  <th>Total</th>
				</tr>
              </thead>
              <tbody>
                <tr>
                  <td> <img width="60" src="../themes/images/products/4.jpg" alt=""/></td>
                  <td>MASSA AST<br/>Color : black, Material : metal</td>
				  <td>
					<div class="input-append"><asp:TextBox class="span1" runat="server" style="max-width:34px" placeholder="1" id="appendedInputButtons" size="16" /><button class="btn" type="button"><i class="icon-minus"></i></button><button class="btn" type="button"><i class="icon-plus"></i></button><button class="btn btn-danger" type="button"><i class="icon-remove icon-white"></i></button>				</div>
				  </td>
                  <td>$120.00</td>
                  <td>$25.00</td>
                  <td>$15.00</td>
                  <td>$110.00</td>
                </tr>
				<tr>
                  <td> <img width="60" src="themes/images/products/8.jpg" alt=""/></td>
                  <td>MASSA AST<br/>Color : black, Material : metal</td>
				  <td>
					<div class="input-append"><asp:TextBox class="span1" runat="server" style="max-width:34px" placeholder="1"  size="16" /><button class="btn" type="button"><i class="icon-minus"></i></button><button class="btn" type="button"><i class="icon-plus"></i></button><button class="btn btn-danger" type="button"><i class="icon-remove icon-white"></i></button>				</div>
				  </td>
                  <td>$7.00</td>
                  <td>--</td>
                  <td>$1.00</td>
                  <td>$8.00</td>
                </tr>
				<tr>
                  <td> <img width="60" src="themes/images/products/3.jpg" alt=""/></td>
                  <td>MASSA AST<br/>Color : black, Material : metal</td>
				  <td>
					<div class="input-append"><asp:TextBox class="span1" style="max-width:34px" runat="server" placeholder="1"  size="16" /><button class="btn" type="button"><i class="icon-minus"></i></button><button class="btn" type="button"><i class="icon-plus"></i></button><button class="btn btn-danger" type="button"><i class="icon-remove icon-white"></i></button>				</div>
				  </td>
                  <td>$120.00</td>
                  <td>$25.00</td>
                  <td>$15.00</td>
                  <td>$110.00</td>
                </tr>
				
                <tr>
                  <td colspan="6" style="text-align:right">Total Price:	</td>
                  <td> $228.00</td>
                </tr>
				 <tr>
                  <td colspan="6" style="text-align:right">Total Discount:	</td>
                  <td> $50.00</td>
                </tr>
                 <tr>
                  <td colspan="6" style="text-align:right">Total Tax:	</td>
                  <td> $31.00</td>
                </tr>
				 <tr>
                  <td colspan="6" style="text-align:right"><strong>TOTAL ($228 - $50 + $31) =</strong></td>
                  <td class="label label-important" style="display:block"> <strong> $155.00 </strong></td>
                </tr>
				</tbody>
            </table>--%>
        <h4>Cart Items </h4>
            <form id="form" runat="server">
            <asp:GridView ID="GridView1" runat="server"  CssClass="table table-striped table-hover" OnRowDataBound="GridView1_RowDataBound1"  OnRowCreated="GridView1_RowCreated" OnRowDeleting="GridView1_RowDeleting"  OnRowUpdating="GridView1_RowUpdating" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing"     BorderColor="White" BackColor="White" BorderStyle="None" BorderWidth="1px"  CellSpacing="2" Width="819px">
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:Button class="btn btn-primary" ID="updateLinkButton1" runat="server"  CommandName="Update" Text="Update"></asp:Button>
                       
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button class="btn btn-primary" ID="editLinkButton2" runat="server" CausesValidation="False"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  CommandName="Edit" Text="Edit"></asp:Button>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="CartItems_id">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("CartItems_id") %>'></asp:Label>
                    </ItemTemplate>
                      <EditItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("CartItems_id") %>'></asp:Label>
                    </EditItemTemplate>
                       </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Image">
                <%--    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("filepath") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("filepath") %>' />
                    </ItemTemplate>
                    <ControlStyle Height="100px" Width="100px" />
                </asp:TemplateField>
               <%-- <asp:TemplateField HeaderText="Product_sku">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Product_sku") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Product_sku") %>'></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField>--%>
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
   <asp:TemplateField HeaderText="Edit the item Quantity">
       <ItemTemplate>
           <asp:Label ID="Label4" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
           <br /><br />
                         <asp:Label runat="server" Font-Underline="true" ID="lblprodquantity" Text="Max quantity is: "></asp:Label> 
            <asp:Label runat="server" ID="quantity" Text='<%# Bind("Product_quantity") %>'></asp:Label>
       </ItemTemplate>             
       
        <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="<div>Quantity Not Entered !</div>" ForeColor="Red" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
   <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="<div>Please enter an appropriate value! </div>" ForeColor="Red" MinimumValue="1" MaximumValue='<%# Bind("Product_quantity") %>' SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
         <br /><br />
            <asp:Label runat="server" ID="lblprodquantity" Font-Underline="true" Text="Max quantity is: "></asp:Label> 
            <asp:Label runat="server" ID="quantity" Text='<%# Bind("Product_quantity") %>'></asp:Label>  
             </EditItemTemplate>

                    </asp:TemplateField>

                <asp:TemplateField HeaderText="Product price">
                     <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Product_price") %>'></asp:Label>
                          <asp:Label ID="Labelpricw" runat="server" Text="$"></asp:Label>
  
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Product_price") %>'></asp:Label>
                         <asp:Label ID="Labelpricw" runat="server" Text="$"></asp:Label>
                    </EditItemTemplate>
                    </asp:TemplateField> 

          <%-- <asp:BoundField DataField="Product_price" HeaderText="Product_price" SortExpression="Product_price" />
               <asp:TemplateField HeaderText="Expected price">
                     <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" ></asp:Label>
                    </ItemTemplate>
                    
                     </asp:TemplateField>--%>
 <asp:TemplateField ShowHeader="False">

                    <ItemTemplate>
                        <asp:Button class="btn btn-primary" ID="DelButton2" runat="server" CausesValidation="False" CommandName="Delete" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  OnClientClick="return confirm('Do you surely want to delete this item  !!')" Text="Delete"></asp:Button>
                    </ItemTemplate>
                     
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
                
        <asp:Label style="float:right;font-weight:800;"  ID="Labelprice" runat="server" Text=""></asp:Label>
		
		<asp:Label style="float:right;text-decoration:underline;font-weight:800" ID="Label1"  runat="server" Text="Total Price is:&nbsp; "></asp:Label>
    </form>
		<br />
        <br />
		
           <%-- <table class="table table-bordered">
			<tbody>
				 <tr>
                  <td> 
				<form class="form-horizontal">
				<div class="control-group">
				<asp:Label class="control-label" runat="server"><strong> VOUCHERS CODE: </strong> </asp:Label>
				<div class="controls">
				<asp:TextBox class="input-medium" runat="server" placeholder="CODE"/>
				<asp:Button type="submit" class="btn" runat="server" Text="ADD">  </asp:Button>
				</div>
				</div>
				</form>
				</td>
                </tr>
				
			</tbody>
			</table>--%>
			
			<%--<table class="table table-bordered">
			 <tr><th>ESTIMATE YOUR SHIPPING </th></tr>
			 <tr> 
			 <td>
				<form class="form-horizontal">
				  <div class="control-group">
					<asp:Label class="control-label" runat="server" for="inputCountry">Country </asp:Label>
					<div class="controls">
					  <asp:TextBox id="inputCountry" placeholder="Country" runat="server"/>
					</div>
				  </div>
				  <div class="control-group">
					<asp:Label class="control-label" runat="server" for="inputPost">Post Code/ Zipcode </asp:Label>
					<div class="controls">
					  <asp:TextBox id="inputPost" runat="server" placeholder="Postcode"/>
					</div>
				  </div>
				  <div class="control-group">
					<div class="controls">
					  <asp:Button type="submit" runat="server" class="btn" Text="ESTIMATE"> </asp:Button>
					</div>
				  </div>
				</form>				  
			  </td>
			  </tr>
            </table>--%>		
	<a href="index.aspx" class="btn btn-large"><i class="icon-arrow-left"></i> Continue Shopping </a>
        <div><a href="CustomerAddress.aspx?userid=<%= Session["userid"].ToString()%>" " class="btn btn-large"><i class="icon-arrow-left"></i> Proceed to checkout </a></div>
	<%--<a href="login.aspx" class="btn btn-large pull-right">Next <i class="icon-arrow-right"></i></a>--%>
	
</div>
</div></div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<h5>ACCOUNT</h5>
				<%--<a href="login.aspx">YOUR ACCOUNT</a>--%>
				<a href="UpdateRegistration.aspx?userid=<%= Session["userid"].ToString()%>" >PERSONAL INFORMATION</a> 
				<a href="Addresses.aspx?userid=<%= Session["userid"].ToString()%>" >ADDRESSES</a> 
			 <a href="ChangePassword.aspx?userid=<%= Session["userid"].ToString()%>" >CHANGE PASSWORD</a> 
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
			<%--	<a href="#">NEW PRODUCTS</a> 
				<a href="#">TOP SELLERS</a> --%> 
				<a href="products.aspx">NEW PRODUCTS</a>   
			<%--	<a href="#">MANUFACTURERS</a> 
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
      </form>
</body>
</html>