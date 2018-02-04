<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="entershipaddress.aspx.cs" Inherits="Customer.entershipaddress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">    
    <link href="Style.css" rel="stylesheet" />
   <meta charset="utf-8"/>
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
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
    <form id="form1" runat="server">
    <div>
    <%--<h4>Ship to address</h4>				


        <div class="control-group">
			<asp:Label class="control-label" runat="server" for="firstname">First Name<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="fname" runat="server" placeholder="First Name"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*First Name Required</asp:RequiredFieldValidator>

			</div>
		</div>

        <div class="control-group">
			<asp:Label class="control-label" runat="server" for="LastName">Last Name<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="lname" runat="server" placeholder="Last Name"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" ErrorMessage="Last Name Required"  CssClass="text-danger" Display="Dynamic">*Last Name Required</asp:RequiredFieldValidator>

			</div>
		</div>

		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="address">Address<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="address" runat="server" placeholder="Adress"/> <span>Street address, P.O. box, company name, c/o</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="address" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>

			</div>
		</div>
		
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="address2">Address (Line 2)<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="address2" runat="server" placeholder="Adress line 2"/> <span>Apartment, suite, unit, building, floor, etc.</span>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="address2" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>
			</div>
		</div>
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="city">City<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="city" runat="server" placeholder="city"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="city" ErrorMessage="City Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>
			</div>
		</div>
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="state">State<sup>*</sup></asp:Label>
			<div class="controls">
			  &nbsp;<asp:TextBox ID="state" placeholder="State" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="state" ErrorMessage="State Required"  CssClass="text-danger" Display="Dynamic">*State Required</asp:RequiredFieldValidator>
			</div>
            
		</div>		
		
		
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="country">Country<sup>*</sup></asp:Label>
			<div class="controls">
			&nbsp;<asp:TextBox ID="country" placeholder="Country" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="country" ErrorMessage="Country Required"  CssClass="text-danger" Display="Dynamic">*Country Required</asp:RequiredFieldValidator>
			</div>
            
		</div>	
		
		
		
		<div class="control-group">
			<asp:Label class="control-label" runat="server" for="mobile">Mobile Phone </asp:Label>
			<div class="controls">
			  <asp:TextBox  name="mobile" id="mobile" runat="server" placeholder="Mobile Phone"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="mobile" ErrorMessage="Phonenumber Required"  CssClass="text-danger" Display="Dynamic">*MobileNumber Required</asp:RequiredFieldValidator> 
			</div>
		</div>
        <div class="control-group">
			<asp:Label class="control-label" runat="server" for="postcode">Zip / Postal Code<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="postcode" runat="server" placeholder="Zip / Postal Code"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="postcode" ErrorMessage="Postalcode Required"  CssClass="text-danger" Display="Dynamic">*Postcode Required</asp:RequiredFieldValidator> 
			</div>
		</div>
		
	<p><sup>*</sup>Required field</p>--%>
        <asp:Label ID="Labelhead" runat="server"><h4>Your Addresses</h4></asp:Label>
        <br /><br />

         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"     CssClass="table table-striped table-hover"    BorderColor="White" BackColor="White" BorderStyle="None" BorderWidth="1px"  CellSpacing="2" Width="819px">
            <Columns>
               

                       <asp:TemplateField HeaderText="Select One" >
        <ItemTemplate >
          <input  name="MyRadioButton" type="radio"  
                    value='<%# Eval("Shiptoaddress_id") %>'  />
        </ItemTemplate>
      </asp:TemplateField>
                 
                    

           
                 <asp:BoundField DataField="Address1" HeaderText="Street Name" />
                  <asp:BoundField DataField="Address2" HeaderText="Apartment Number" />
              
                 <asp:BoundField DataField="City" HeaderText="City" />
                  
                     <asp:BoundField DataField="State" HeaderText="State" />
                 
                      

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

        <br />
         <asp:Label ID="shiplabel" runat="server"><h4>Willing to add a new shipping address?</h4></asp:Label>
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
              <asp:Label runat="server" ID="shipheading" Visible="false"><h4>Ship to address</h4></asp:Label>				


        <div class="control-group">
			<asp:Label ID="lblfname" Visible="false" class="control-label" runat="server" for="firstname">First Name<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="fname" Visible="false" runat="server" placeholder="First Name"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="shipaddress" Enabled="false" runat="server" ControlToValidate="fname" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*First Name Required</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="regexpfname" ValidationGroup="shipaddress" Enabled="false" runat="server" ControlToValidate="fname" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="First name must contain all alphabets" CssClass="text-danger">*First name must contain all alphabets</asp:RegularExpressionValidator>
			</div>
		</div>

        <div class="control-group">
			<asp:Label ID="lbllname" Visible="false" class="control-label" runat="server" for="LastName">Last Name<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="lname" Visible="false" runat="server" placeholder="Last Name"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="shipaddress" Enabled="false" runat="server" ControlToValidate="lname" ErrorMessage="Last Name Required"  CssClass="text-danger" Display="Dynamic">*Last Name Required</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="regexplname" ValidationGroup="shipaddress" Enabled="false" runat="server" ControlToValidate="lname" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="First name must contain all alphabets" CssClass="text-danger">*Last name must contain all alphabets</asp:RegularExpressionValidator>
	
			</div>
		</div>

		<%--<div class="control-group">
			<asp:Label ID="lbladdress" Visible="false" class="control-label" runat="server" for="address">Address<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="address" runat="server" Visible="false" placeholder="Adress"/> <asp:Label runat="server" id="span1" Visible="false">Street address, P.O. box, company name, c/o</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="address" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>

			</div>
		</div>
		
		<div class="control-group">
			<asp:Label ID="lbladdress2" Visible="false" class="control-label" runat="server" for="address2">Address (Line 2)<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="address2" Visible="false" runat="server" placeholder="Adress line 2"/> <asp:Label runat="server" ID="span2" Visible="false">Apartment, suite, unit, building, floor, etc.</asp:Label>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="address2" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>
			</div>
		</div>
		<div class="control-group">
			<asp:Label ID="lblcity" Visible="false" class="control-label" runat="server" for="city">City<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="city" Visible="false" runat="server" placeholder="city"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="city" ErrorMessage="City Required"  CssClass="text-danger" Display="Dynamic">*Address Required</asp:RequiredFieldValidator>
			</div>
		</div>
		<div class="control-group">
			<asp:Label ID="lblstate" Visible="false" class="control-label" runat="server" for="state">State<sup>*</sup></asp:Label>
			<div class="controls">
			  &nbsp;<asp:TextBox ID="state" Visible="false" placeholder="State" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="state" ErrorMessage="State Required"  CssClass="text-danger" Display="Dynamic">*State Required</asp:RequiredFieldValidator>
			</div>
            
		</div>		
		
		
		<div class="control-group">
			<asp:Label ID="lblcountry" Visible="false" class="control-label" runat="server" for="country">Country<sup>*</sup></asp:Label>
			<div class="controls">
			&nbsp;<asp:TextBox ID="country" Visible="false" placeholder="Country" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="country" ErrorMessage="Country Required"  CssClass="text-danger" Display="Dynamic">*Country Required</asp:RequiredFieldValidator>
			</div>
            
		</div>	
		
		
		
		<div class="control-group">
			<asp:Label ID="lblmobile" Visible="false" class="control-label" runat="server" for="mobile">Mobile Phone </asp:Label>
			<div class="controls">
			  <asp:TextBox  name="mobile" Visible="false" id="mobile" runat="server" placeholder="Mobile Phone"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="mobile" ErrorMessage="Phonenumber Required"  CssClass="text-danger" Display="Dynamic">*MobileNumber Required</asp:RequiredFieldValidator> 
			</div>
		</div>
        <div class="control-group">
			<asp:Label ID="lblpostcode" Visible="false" class="control-label" runat="server" for="postcode">Zip / Postal Code<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="postcode" Visible="false" runat="server" placeholder="Zip / Postal Code"/> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="postcode" ErrorMessage="Postalcode Required"  CssClass="text-danger" Display="Dynamic">*Postcode Required</asp:RequiredFieldValidator> 
			</div>
		</div>
		--%>

        <div class="control-group">
			<asp:Label class="control-label" ID="lblsaddress1" Visible="false" runat="server" for="saddress">Address<sup>*</sup></asp:Label>
			<div class="controls">
			  <asp:TextBox id="saddress" runat="server" Visible="false" placeholder="Adress"/> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidatoraddress"  Enabled="false" runat="server" ControlToValidate="saddress" ErrorMessage="Address Required"  CssClass="text-danger" Display="Dynamic" ValidationGroup="shipaddress">*Address Required</asp:RequiredFieldValidator>    
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
			<asp:Label ID="lblmobile" Visible="false" class="control-label" runat="server" for="mobile">Mobile Phone </asp:Label>
			<div class="controls">
			  <asp:TextBox  name="mobile" Visible="false" id="mobile" runat="server" placeholder="Mobile Phone"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="shipaddress" Enabled="false" runat="server" ControlToValidate="mobile" ErrorMessage="Phonenumber Required"  CssClass="text-danger" Display="Dynamic">*MobileNumber Required</asp:RequiredFieldValidator> 
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
	<p><sup>*</sup>Required field</p>  
		
	
	<div class="control-group">
			<div class="controls">
				<asp:TextBox type="hidden" runat="server" name="email_create" value="1"/>
				<asp:TextBox type="hidden" runat="server" name="is_new_customer" value="1"/>
				<asp:Button ID="Proceed" class="btn btn-large btn-success"  runat="server" Text="Proceed" OnClick="Proceed_Click" />
			  
			</div>
		</div>		
        
    </div>
    </form>
</body>
</html>
