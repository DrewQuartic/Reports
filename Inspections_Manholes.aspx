<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inspections_Manholes.aspx.cs" Inherits="Inspections_Manholes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<style type="text/css">@import url(inspections.css);</style>
    <title>SHARQ Inspections</title>
   <script type="text/javascript">
    function showMedia(sourceId, targetId) {   
       if (typeof(sourceId)=='string') {
            sourceId=document.getElementById(sourceId);
            }   
       if (typeof(targetId)=='string') {
            targetId=document.getElementById(targetId);
            }   
       targetId.innerHTML=sourceId.innerHTML;   
       return false;
    }
   </script> 
</head>
<body>
   <form id="form1" runat="server">
   <<ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager12"></ajaxToolkit:ToolkitScriptManager>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="False"
                ForeColor="Black" Text="Manhole Inspections"
                Width="685px"></asp:Label>
    <asp:Panel ID="MainPanel" runat="server" CssClass="MainPanel">
        <div id="inputdiv"> 
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Enter an FSN:"></asp:Label>
        <asp:TextBox ID="FSN_TextBox" runat="server"></asp:TextBox>
       </div> 
       <div id="inspectiondiv">
        <asp:Panel ID="InspectionPanel" runat="server" ScrollBars="Both" Height = "350px">
        <asp:GridView ID="ManholeInspectionsGridView" runat="server" HeaderStyle-CssClass="HeaderStyle" AutoGenerateColumns="False" DataSourceID="ManholeInspectionsDataSource" AlternatingRowStyle-CssClass="AlternatingRowStyle" SelectedRowStyle-CssClass="SelectedRowStyle" DataKeyNames="MA_MHID">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:TemplateField HeaderText="Video"  SortExpression="MA_MHID">
                    <ItemTemplate>
                       <A HREF="#" onclick='return showMedia("Video_<%# Eval("MA_MHID") %>","mediaScreen")'><%# (Eval("ONLINE_PATH_TXT") == DBNull.Value || Eval("FILENAME") == DBNull.Value) ? "<img src='images/obs/NoVideo.jpg'/>" : "<img src='images/obs/Video.jpg'/>"%></A>
                       <div id='Video_<%# Eval("MA_MHID") %>' style='display: none'>  
                       <OBJECT id="VIDEO" width="440px" height="350" CLASSID="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"	type="application/x-oleobject">
	                        <PARAM NAME="URL" VALUE="<%# Eval("URL") %>">
	                        <PARAM NAME="SendPlayStateChangeEvents" VALUE="True">
	                        <PARAM NAME="AutoStart" VALUE="False">
	                        <PARAM name="uiMode" value="full">
	                        <PARAM name="PlayCount" value="9999">
                       </OBJECT>        
                       </div>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="MA_MHID" HeaderText="MA_MHID" SortExpression="MA_MHID" />
                <asp:BoundField DataField="MA_MANHOLE" HeaderText="MA_MANHOLE" SortExpression="MA_MANHOLE" />
                <asp:BoundField DataField="MA_LOCATION" HeaderText="MA_LOCATION" SortExpression="MA_LOCATION" />
                <asp:BoundField DataField="MA_ADR_STR" HeaderText="MA_ADR_STR" SortExpression="MA_ADR_STR" />
                <asp:BoundField DataField="MA_STRC_TY" HeaderText="MA_STRC_TY" SortExpression="MA_STRC_TY" />
                <asp:BoundField DataField="MA_SURF_CD" HeaderText="MA_SURF_CD" SortExpression="MA_SURF_CD" />
                <asp:BoundField DataField="MA_SURF_TY" HeaderText="MA_SURF_TY" SortExpression="MA_SURF_TY" />
                <asp:BoundField DataField="MA_COVR_CD" HeaderText="MA_COVR_CD" SortExpression="MA_COVR_CD" />
                <asp:BoundField DataField="MA_COVR_TY" HeaderText="MA_COVR_TY" SortExpression="MA_COVR_TY" />
                <asp:BoundField DataField="MA_LINR_CD" HeaderText="MA_LINR_CD" SortExpression="MA_LINR_CD" />
                <asp:BoundField DataField="MA_LINR_TY" HeaderText="MA_LINR_TY" SortExpression="MA_LINR_TY" />
                <asp:BoundField DataField="MA_DISH_CD" HeaderText="MA_DISH_CD" SortExpression="MA_DISH_CD" />
                <asp:BoundField DataField="MA_DISH_TY" HeaderText="MA_DISH_TY" SortExpression="MA_DISH_TY" />
                <asp:BoundField DataField="MA_ABVSURF" HeaderText="MA_ABVSURF" SortExpression="MA_ABVSURF" />
                <asp:BoundField DataField="MA_DEPTH" HeaderText="MA_DEPTH" SortExpression="MA_DEPTH" />
                <asp:BoundField DataField="MA_DIA" HeaderText="MA_DIA" SortExpression="MA_DIA" />
                <asp:BoundField DataField="MA_MATR_CD" HeaderText="MA_MATR_CD" SortExpression="MA_MATR_CD" />
                <asp:BoundField DataField="MA_MATR_TY" HeaderText="MA_MATR_TY" SortExpression="MA_MATR_TY" />
                <asp:BoundField DataField="MA_COMMENT" HeaderText="MA_COMMENT" SortExpression="MA_COMMENT" />
                <asp:BoundField DataField="FAC_SEQ_NUM" HeaderText="FAC_SEQ_NUM" SortExpression="FAC_SEQ_NUM" />
                <asp:BoundField DataField="LAST_UPDT_DT" HeaderText="LAST_UPDT_DT" SortExpression="LAST_UPDT_DT" />
                <asp:BoundField DataField="LAST_UPDT_ID" HeaderText="LAST_UPDT_ID" SortExpression="LAST_UPDT_ID" />
                <asp:BoundField DataField="SOURCE_MDB" HeaderText="SOURCE_MDB" SortExpression="SOURCE_MDB" />
                <asp:BoundField DataField="MA_ADR_BDG" HeaderText="MA_ADR_BDG" SortExpression="MA_ADR_BDG" />
                <asp:BoundField DataField="MH_MHINSP" HeaderText="MH_MHINSP" SortExpression="MH_MHINSP" />
                <asp:BoundField DataField="MH_MHID" HeaderText="MH_MHID" SortExpression="MH_MHID" />
                <asp:BoundField DataField="ONLINE_PATH_TXT" HeaderText="ONLINE_PATH_TXT" SortExpression="ONLINE_PATH_TXT" />
                <asp:BoundField DataField="FILENAME" HeaderText="FILENAME" SortExpression="FILENAME" />
            </Columns>
            <SelectedRowStyle CssClass="SelectedRowStyle" />
            <HeaderStyle CssClass="HeaderStyle" />
            <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        </asp:GridView>
        </asp:Panel>
       </div>  
       <div id='mediaScreen'>
           <asp:Image ID="Image1" runat="server" Height="350px" ImageUrl="~/images/mwwd_logo.jpg"
               Width="440px" /></div>
       <div id="detailsdiv"> 
        <ajaxToolkit:TabContainer ID="DetailsContainer" runat="server" ActiveTabIndex="0">
            <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                <ContentTemplate>
        <asp:Panel ID="ObservationPanel" runat="server" ScrollBars="Both" Height="130px">
        <asp:GridView ID="ManholeObservationsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ManholeObservationsDataSource" Height="57px" Width="400px">
            <Columns>
                 <asp:TemplateField HeaderText="Photo"  SortExpression="MA_MHID">
                   <ItemTemplate>
                       <A HREF="#" onclick='return showMedia("Still_<%# Eval("MA_MHID") %>_<%# Eval("KEYID") %>","mediaScreen")'><%# (Eval("ONLINE_STORAGE_PATH") == DBNull.Value || Eval("FILENAME") == DBNull.Value) ? "<img src='images/obs/NoPicture.jpg'/>" : "<img src='images/obs/Picture.jpg'/>"%></A>
                       <div id='Still_<%# Eval("MA_MHID") %>_<%# Eval("KEYID") %>' style='display: none'>  
                            <img src="<%#Eval("URL") %>" width="440px" height="350px" alt="Observation Image<%# Eval("MA_MHID") %>_<%# Eval("KEYID") %>"/>
                       </div>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="DISPLAY" HeaderText="DISPLAY" SortExpression="DISPLAY" />
                <asp:BoundField DataField="GBAMODUL" HeaderText="GBAMODUL" SortExpression="GBAMODUL" />
                <asp:BoundField DataField="FILENAME" HeaderText="FILENAME" SortExpression="FILENAME" />
                <asp:BoundField DataField="ONLINE_STORAGE_PATH" HeaderText="ONLINE_STORAGE_PATH" SortExpression="ONLINE_STORAGE_PATH" />
            </Columns>
        </asp:GridView>
        </asp:Panel>
                </ContentTemplate>
                <HeaderTemplate>
                    <strong>Observations</strong>
                </HeaderTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
       </div>
        </asp:Panel>
    <div>
        &nbsp;<br />
        <br />
        &nbsp;</div>
        <asp:ObjectDataSource ID="ManholeInspectionsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetManholeInspectionsByFacSeqNum" TypeName="Reports.APP_Data.PD08TableAdapters.ManholeInspectionsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="FSN_TextBox" Name="FAC_SEQ_NUM" PropertyName="Text"
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp; &nbsp;
        <asp:ObjectDataSource ID="ManholeObservationsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetManholeObservationsByMHInspectionID" TypeName="Reports.APP_Data.PD08TableAdapters.ManholeObservationsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ManholeInspectionsGridView" Name="MHINSPECTIONID"
                    PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
       &nbsp;
    </form>
</body>
</html>
