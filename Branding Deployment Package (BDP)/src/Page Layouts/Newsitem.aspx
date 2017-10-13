<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> 
<%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@Register TagPrefix="PageFieldFieldValue" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register TagPrefix="Publishing" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register TagPrefix="OfficeWebControls" Namespace="Microsoft.Office.Server.WebControls.FieldTypes" Assembly="Microsoft.Office.Server.UserProfiles, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="Taxonomy" Namespace="Microsoft.SharePoint.Taxonomy" Assembly="Microsoft.SharePoint.Taxonomy, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="SPSWC" namespace="Microsoft.SharePoint.Portal.WebControls" assembly="Microsoft.SharePoint.Portal, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="WebControls" namespace="Microsoft.Office.Server.Search.WebControls" assembly="Microsoft.Office.Server.Search, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
    @@include('./_partial/_config.aspx') 
</asp:Content>

<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
	<div class="wrapper">
		@@include('./_partial/_header.aspx')
        <div class="container">
            <div class="row">
                <!-- Display Mode -->
                <Publishing:EditModePanel runat="server" PageDisplayMode="Display">
                    <div class="col-md-8">
                        <div class="article">
                            <div class="article--image">
                                <Publishing:RichImageField FieldName="PublishingPageImage" InputFieldLabel="Afbeelding" runat="server"></Publishing:RichImageField>
                            </div>
                            <div class="article--title">
                                <PageFieldFieldValue:TextField FieldName="Title" runat="server"></PageFieldFieldValue:TextField>
                            </div>
                            <div class="article-date">
                                    <SharePointWebControls:CalculatedField FieldName="FormattedPublicatieDatum" runat="server"></SharePointWebControls:CalculatedField>
                            </div>
                            <div class="article--category">
                                <Taxonomy:TaxonomyFieldControl FieldName="NieuwsCategorie" runat="server"></Taxonomy:TaxonomyFieldControl>
                            </div>
                            <div class="article--content">
                                <Publishing:RichHtmlField FieldName="PublishingPageContent" InputFieldLabel="Bericht" runat="server"></Publishing:RichHtmlField>
                            </div>
                            <div class="article-attachment">
                                <Publishing:RichHtmlField FieldName="Bijlage" runat="server"></Publishing:RichHtmlField>
                            </div>
                            <div class="article--category">
                                <span>Nieuwsonderwerp:</span>
                                <Taxonomy:TaxonomyFieldControl FieldName="Nieuwsonderwerp" runat="server"></Taxonomy:TaxonomyFieldControl>
                            </div>
                            <div class="article-author"> 
                                <span>Gepubliceerd door:</span>
                                <SharePointWebControls:UserField FieldName="GepubliceerdDoor" runat="server"></SharePointWebControls:UserField>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <WebPartPages:WebPartZone runat="server" Title="SideDisplay" ID="SideDisplay"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
                        <WebControls:ContentBySearchWebPart runat="server" AlwaysRenderOnServer="False" ResultType="" DataProviderJSON="{&quot;QueryGroupName&quot;:&quot;Default&quot;,&quot;QueryPropertiesTemplateUrl&quot;:&quot;sitesearch://webroot&quot;,&quot;IgnoreQueryPropertiesTemplateUrl&quot;:false,&quot;SourceID&quot;:null,&quot;SourceName&quot;:&quot;GerelateerdeNieuwsberichten&quot;,&quot;SourceLevel&quot;:&quot;SPSite&quot;,&quot;CollapseSpecification&quot;:&quot;&quot;,&quot;QueryTemplate&quot;:&quot;&quot;,&quot;FallbackSort&quot;:null,&quot;FallbackSortJson&quot;:&quot;null&quot;,&quot;RankRules&quot;:null,&quot;RankRulesJson&quot;:&quot;null&quot;,&quot;AsynchronousResultRetrieval&quot;:false,&quot;SendContentBeforeQuery&quot;:true,&quot;BatchClientQuery&quot;:true,&quot;FallbackLanguage&quot;:-1,&quot;FallbackRankingModelID&quot;:&quot;&quot;,&quot;EnableStemming&quot;:true,&quot;EnablePhonetic&quot;:false,&quot;EnableNicknames&quot;:false,&quot;EnableInterleaving&quot;:true,&quot;EnableQueryRules&quot;:true,&quot;EnableOrderingHitHighlightedProperty&quot;:false,&quot;HitHighlightedMultivaluePropertyLimit&quot;:-1,&quot;IgnoreContextualScope&quot;:false,&quot;ScopeResultsToCurrentSite&quot;:false,&quot;TrimDuplicates&quot;:true,&quot;Properties&quot;:{&quot;TryCache&quot;:true,&quot;Scope&quot;:&quot;{Site.URL}&quot;},&quot;PropertiesJson&quot;:&quot;{\&quot;TryCache\&quot;:true,\&quot;Scope\&quot;:\&quot;{Site.URL}\&quot;}&quot;,&quot;ClientType&quot;:&quot;&quot;,&quot;ClientFunction&quot;:&quot;&quot;,&quot;ClientFunctionDetails&quot;:&quot;&quot;,&quot;UpdateAjaxNavigate&quot;:true,&quot;SummaryLength&quot;:180,&quot;DesiredSnippetLength&quot;:90,&quot;PersonalizedQuery&quot;:false,&quot;FallbackRefinementFilters&quot;:null,&quot;IgnoreStaleServerQuery&quot;:false,&quot;RenderTemplateId&quot;:&quot;&quot;,&quot;AlternateErrorMessage&quot;:null,&quot;Title&quot;:&quot;&quot;}" BypassResultTypes="True" ResultsPerPage="5" SelectedPropertiesJson="null" HitHighlightedPropertiesJson="[&quot;Title&quot;,&quot;Path&quot;,&quot;Author&quot;,&quot;SectionNames&quot;,&quot;SiteDescription&quot;]" AvailableSortsJson="null" SearchCenterXGeoLocations="" XGeoTenantsInfo="" PreloadedItemTemplateIdsJson="null" QueryGroupName="Default" StatesJson="{}" ServerIncludeScriptsJson="null" Title="Gerelateerde nieuwsberichten" FrameType="None" SuppressWebPartChrome="False" Description="$Resources:Microsoft.Office.Server.Search,CBS_Description;" IsIncluded="True" ZoneID="" PartOrder="0" FrameState="Normal" AllowRemove="True" AllowZoneChange="True" AllowMinimize="True" AllowConnect="True" AllowEdit="True" AllowHide="True" IsVisible="True" DetailLink="" HelpLink="" HelpMode="Modeless" Dir="Default" PartImageSmall="" MissingAssembly="$Resources:core,ImportErrorMessage;" ImportErrorMessage="$Resources:core,ImportErrorMessage;" PartImageLarge="" IsIncludedFilter="" ExportControlledProperties="True" ConnectionID="00000000-0000-0000-0000-000000000000" ID="g_c591c4eb_9c8f_4ee1_9882_0ccecf95a49d" ChromeType="TitleOnly" ExportMode="All" __MarkupType="vsattributemarkup" __WebPartId="{c591c4eb-9c8f-4ee1-9882-0ccecf95a49d}" WebPart="true" Height="" Width="" GroupTemplateId="~sitecollection/_catalogs/masterpage/Display Templates/Content Web Parts/Group_Content.js" ItemTemplateId="~sitecollection/_catalogs/masterpage/Display Templates/Content Web Parts/_clusius/Item_GerelateerdeNieuwsBerichten.js" RenderTemplateId="~sitecollection/_catalogs/masterpage/Display Templates/Content Web Parts/_clusius/Control_Default.js"></WebControls:ContentBySearchWebPart>
                    </div>
                </Publishing:EditModePanel>
                <!-- Display Mode -->
            
                <!-- Edit Mode -->
                <Publishing:EditModePanel runat="server" PageDisplayMode="Edit"> 
                <div class="col-md-8">
                    <div class="article--edit">
                        <div class="article--title--edit">
                            <span class="required-field"></span>
                            <PageFieldFieldValue:TextField FieldName="Title" runat="server"></PageFieldFieldValue:TextField>
                        </div>
                        <div class="article--content--edit">
                            <span class="required-field"></span>
                            <Publishing:RichHtmlField FieldName="PublishingPageContent" InputFieldLabel="Bericht" runat="server"></Publishing:RichHtmlField>
                        </div>
                        <div class="article--image--edit">
                            <Publishing:RichImageField FieldName="PublishingPageImage" InputFieldLabel="Afbeelding" runat="server"></Publishing:RichImageField>
                        </div>
                        <div class="article--category--edit">
                            <span class="required-field"></span>
                            <Taxonomy:TaxonomyFieldControl FieldName="NieuwsCategorie" InputFieldLabel="Nieuwscategorie" runat="server"></Taxonomy:TaxonomyFieldControl>
                        </div>
                        <div class="article--category--edit">
                            <Taxonomy:TaxonomyFieldControl FieldName="Nieuwsonderwerp" runat="server"></Taxonomy:TaxonomyFieldControl>
                        </div>
                        <div class="article--author--edit">
                            <span class="required-field"></span>
                            <SharePointWebControls:UserField FieldName="GepubliceerdDoor" runat="server"></SharePointWebControls:UserField>
                        </div>
                        <div class="article--date--edit">
                            <span class="required-field"></span>
                            <PublishingWebControls:PublishingScheduleFieldControl FieldName="PublishingStartDate" InputFieldLabel="Publicatiedatum" runat="server"></PublishingWebControls:PublishingScheduleFieldControl>
                        </div>
                        <div class="article--attachment--edit">
                            <Publishing:RichHtmlField FieldName="Bijlage" runat="server"></Publishing:RichHtmlField>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <WebPartPages:WebPartZone runat="server" Title="SideDisplay2" ID="SideDisplay2"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
                </div>
            </Publishing:EditModePanel>
            <!-- Edit Mode -->
            </div>
        </div>
        @@include('./_partial/_footer.aspx')
	</div>
</asp:Content>