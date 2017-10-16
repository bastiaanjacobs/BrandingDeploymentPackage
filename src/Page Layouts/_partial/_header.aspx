<header>
    <div class="row">
        <div class="col-md-3">
            <a href="/">
                <img src="<asp:Literal runat='server' Text='<%$SPUrl:~sitecollection/Style Library/_mcwresources/img/logo.png%>'/>" alt="logo">
            </a>
        </div>
        <div class="col-md-6">
            {{navigation}}
        </div>
        <div class="col-md-3">
            <SharePoint:DelegateControl runat="server" ControlId="SmallSearchInputBox" />
        </div>
    </div>
    @@include('./_breadcrumb.aspx')
</header>