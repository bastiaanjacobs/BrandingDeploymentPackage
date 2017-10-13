<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

<PublishingWebControls:EditModePanel runat="server">
    <!-- Styles for edit mode only-->
    <SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/../../Style Library/~language/Themable/Core Styles/editmode15.css %>"
    After="<% $SPUrl:~sitecollection/../../Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server" />
</PublishingWebControls:EditModePanel>

<SharePointWebControls:FieldValue id="PageStylesField" FieldName="HeaderStyleDefinitions" runat="server" />

<!--CS: Development - Start Custom CSS Snippet-->
<link rel="stylesheet" href="<asp:Literal runat='server' Text='<%$SPUrl:~sitecollection/Style Library/_mcwresources/css/style.min.css%>'/>" type="text/css">
<!--CE: Development - End Custom CSS Snippet-->

<!--CS: Development - Start Custom JS Snippet-->
<sharepointwebcontrols:scriptlink runat="server" name="SP.js" localizable="false" loadafterui=	"true" />
<sharepointwebcontrols:scriptlink runat="server" name="SP.Search.js" localizable="false" loadafterui="true" />

<script src="<asp:Literal runat='server' Text='<%$SPUrl:~sitecollection/Style Library/_mcwresources/js/vendor/jquery.min.js%>'/>" type="text/javascript"></script>
<script src="<asp:Literal runat='server' Text='<%$SPUrl:~sitecollection/Style Library/_mcwresources/js/vendor/moment.min.js%>'/>" type="text/javascript"></script>

<script src="<asp:Literal runat='server' Text='<%$SPUrl:~sitecollection/Style Library/_mcwresources/js/mcw.navigation.js%>'/>" type="text/javascript"></script>