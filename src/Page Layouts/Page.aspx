<%@ Page language="C#" Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@Register TagPrefix="SearchWC" Namespace="Microsoft.Office.Server.Search.WebControls" Assembly="Microsoft.Office.Server.Search, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register tagprefix="SPSWC" namespace="Microsoft.SharePoint.Portal.WebControls" assembly="Microsoft.SharePoint.Portal, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
    @@include('./_partial/_config.aspx') 
</asp:Content>

<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
	<div class="wrapper">
		@@include('./_partial/_header.aspx')
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <WebPartPages:WebPartZone runat="server" Title="Main Web Part Zone 1" ID="MainWebPartZone1"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
                </div>
                <div class="col-md-4">
                    <WebPartPages:WebPartZone runat="server" Title="Main Web Part Zone 2" ID="MainWebPartZone2"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
                </div>
                <div class="col-md-4">
                    <WebPartPages:WebPartZone runat="server" Title="Main Web Part Zone 3" ID="MainWebPartZone3"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
                </div>
            </div>
        </div>
        @@include('./_partial/_footer.aspx')
	</div>
</asp:Content>