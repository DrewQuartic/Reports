<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inspections_Mains.aspx.cs" Inherits="Inspections_Mains" %>

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
   <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager12"></ajaxToolkit:ToolkitScriptManager>
       <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="False"
           ForeColor="Black" Text="Main Inspections" Width="685px"></asp:Label>
    <asp:Panel ID="MainPanel" runat="server" CssClass="MainPanel">
        <div id="inputdiv"> &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Enter an FSN:"></asp:Label>
        <asp:TextBox ID="FSN_TextBox" runat="server"></asp:TextBox>
       </div> 
       <div id="inspectiondiv">
        <asp:Panel ID="InspectionPanel" runat="server" ScrollBars="Both" Height = "350px">
        <asp:GridView ID="PipeInspectionsGridView" runat="server" HeaderStyle-CssClass="HeaderStyle" AutoGenerateColumns="False" DataKeyNames="INSPECTION_SEQ_NUM,FAC_SEQ_NUM" DataSourceID="PipeInspectionsDataSource" AlternatingRowStyle-CssClass="AlternatingRowStyle" SelectedRowStyle-CssClass="SelectedRowStyle">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:TemplateField HeaderText="Video"  SortExpression="INSPECTION_SEQ_NUM">
                    <ItemTemplate>
                       <a href="#" onclick='return showMedia("Video_<%# Eval("INSPECTION_SEQ_NUM") %>","mediaScreen")'><%# (Eval("ONLINE_STORAGE_PATH_TXT") == DBNull.Value || Eval("ONLINE_STORAGE_FILE_NM") == DBNull.Value) ? "<img src='images/obs/NoVideo.jpg'/>" : "<img src='images/obs/Video.jpg'/>"%></a>
                       <div id='Video_<%# Eval("INSPECTION_SEQ_NUM") %>' style='display: none'>  
                       <object id="VIDEO" width="440px" height="350" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"	type="application/x-oleobject">
	                        <param name="URL" value="<%# Eval("URL") %>">
	                        <param name="SendPlayStateChangeEvents" value="True">
	                        <param name="AutoStart" value="False">
	                        <param name="uiMode" value="full">
	                        <param name="PlayCount" value="9999">
                       </object>        
                       </div>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FAC_SEQ_NUM" HeaderText="FAC_SEQ_NUM" ReadOnly="True"
                    SortExpression="FAC_SEQ_NUM" />
                <asp:BoundField DataField="INSPECTION_SEQ_NUM" HeaderText="INSPECTION_SEQ_NUM" ReadOnly="True"
                    SortExpression="INSPECTION_SEQ_NUM" />
                <asp:BoundField DataField="VIDEO_TAKEN_DT" HeaderText="VIDEO_TAKEN_DT" ReadOnly="True"
                    SortExpression="VIDEO_TAKEN_DT" />
                <asp:BoundField DataField="PIPE_SEGMENT_COMMENT_TXT" HeaderText="PIPE_SEGMENT_COMMENT_TXT"
                    ReadOnly="True" SortExpression="PIPE_SEGMENT_COMMENT_TXT" />
                <asp:BoundField DataField="VIDEO_MEDIA_SEQ_NUM" HeaderText="VIDEO_MEDIA_SEQ_NUM"
                    ReadOnly="True" SortExpression="VIDEO_MEDIA_SEQ_NUM" />
                <asp:BoundField DataField="PRECIPITATION_QTY" HeaderText="PRECIPITATION_QTY" ReadOnly="True"
                    SortExpression="PRECIPITATION_QTY" />
                <asp:BoundField DataField="VIDEO_DIRECTION_TXT" HeaderText="VIDEO_DIRECTION_TXT"
                    ReadOnly="True" SortExpression="VIDEO_DIRECTION_TXT" />
                <asp:BoundField DataField="ONLINE_STORAGE_FILE_NM" HeaderText="ONLINE_STORAGE_FILE_NM"
                    ReadOnly="True" SortExpression="ONLINE_STORAGE_FILE_NM" />
                <asp:BoundField DataField="ONLINE_STORAGE_PATH_TXT" HeaderText="ONLINE_STORAGE_PATH_TXT"
                    ReadOnly="True" SortExpression="ONLINE_STORAGE_PATH_TXT" />
            </Columns>
        </asp:GridView>
        </asp:Panel>
       </div>  
       <div id='mediaScreen'>
           <asp:Image ID="Image1" runat="server" Height="350px" ImageUrl="~/images/mwwd_logo.jpg" Width="440px" />
       </div>
       <div id="detailsdiv"> 
       
        <ajaxToolkit:TabContainer ID="DetailsContainer" runat="server" ActiveTabIndex="0" Visible="true" >
            <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                <ContentTemplate>
        <asp:Panel ID="ObservationPanel" runat="server" ScrollBars="Both" Height="130px">
        <asp:GridView ID="PipeObservationsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PipeObservationsDataSource" Height="57px" Width="400px">
            <Columns>
                 <asp:TemplateField HeaderText="Photo"  SortExpression="OBSERVATION_SEQ_NUM">
                   <ItemTemplate>
                       <a href="#" onclick='return showMedia("Still_<%# Eval("INSPECTION_SEQ_NUM") %>_<%# Eval("OBSERVATION_SEQ_NUM") %>","mediaScreen")'><%# (Eval("ONLINE_STORAGE_PATH") == DBNull.Value || Eval("ONLINE_STORAGE_FILE_NM") == DBNull.Value) ? "<img src='images/obs/NoPicture.jpg'/>" : "<img src='images/obs/Picture.jpg'/>"%></a>
                       <div id='Still_<%# Eval("INSPECTION_SEQ_NUM") %>_<%# Eval("OBSERVATION_SEQ_NUM") %>' style='display: none'>  
                            <img src="<%#Eval("URL") %>" width="440px" height="350px" alt="Observation Image<%# Eval("INSPECTION_SEQ_NUM") %>_<%# Eval("OBSERVATION_SEQ_NUM") %>"/>
                       </div>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="OBSERVATION_SEQ_NUM" HeaderText="OBSERVATION_SEQ_NUM"
                    ReadOnly="True" SortExpression="OBSERVATION_SEQ_NUM" />
                <asp:BoundField DataField="OBSERVATION_DESC" HeaderText="OBSERVATION_DESC" ReadOnly="True"
                    SortExpression="OBSERVATION_DESC" />
                <asp:BoundField DataField="FOOTAGE_QTY" HeaderText="FOOTAGE_QTY" ReadOnly="True"
                    SortExpression="FOOTAGE_QTY" />
                <asp:BoundField DataField="LAST_ATTR_UPDT_ID" HeaderText="LAST_ATTR_UPDT_ID" ReadOnly="True"
                    SortExpression="LAST_ATTR_UPDT_ID" />
                <asp:BoundField DataField="LAST_ATTR_UPDT_DT" HeaderText="LAST_ATTR_UPDT_DT" ReadOnly="True"
                    SortExpression="LAST_ATTR_UPDT_DT" />
                <asp:BoundField DataField="INSPECTION_SEQ_NUM" HeaderText="INSPECTION_SEQ_NUM" ReadOnly="True"
                    SortExpression="INSPECTION_SEQ_NUM" />
                <asp:BoundField DataField="FAC_SEQ_NUM" HeaderText="FAC_SEQ_NUM" ReadOnly="True"
                    SortExpression="FAC_SEQ_NUM" />
                <asp:BoundField DataField="OBSERVATION_COMMENT" HeaderText="OBSERVATION_COMMENT"
                    ReadOnly="True" SortExpression="OBSERVATION_COMMENT" />
                <asp:BoundField DataField="OBSERVATION_CD" HeaderText="OBSERVATION_CD" ReadOnly="True"
                    SortExpression="OBSERVATION_CD" />
            </Columns>
        </asp:GridView>
        </asp:Panel>
                </ContentTemplate>
                <HeaderTemplate>
                    <strong>Observations</strong>
                </HeaderTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                <ContentTemplate>
                    &nbsp;<asp:Panel ID="MaintenancePanel" runat="server" Height="130px" ScrollBars="Both">
                        <asp:GridView ID="PipeMaintenanceGridView" runat="server" AutoGenerateColumns="False"
                            DataSourceID="PipeMaintenanceObjectDataSource">
                            <Columns>
                                <asp:BoundField DataField="FAC_SEQ_NUM" HeaderText="FAC_SEQ_NUM" SortExpression="FAC_SEQ_NUM" />
                                <asp:BoundField DataField="FAC_TYP_CD" HeaderText="FAC_TYP_CD" SortExpression="FAC_TYP_CD" />
                                <asp:BoundField DataField="MAIN_STATUS" HeaderText="MAIN_STATUS" SortExpression="MAIN_STATUS" />
                                <asp:BoundField DataField="WORK_TYPE" HeaderText="WORK_TYPE" SortExpression="WORK_TYPE" />
                                <asp:BoundField DataField="PM_TYP_DESC" HeaderText="PM_TYP_DESC" SortExpression="PM_TYP_DESC" />
                                <asp:BoundField DataField="LAST_PM_DT" HeaderText="LAST_PM_DT" SortExpression="LAST_PM_DT" />
                                <asp:BoundField DataField="NEXT_PM_DT" HeaderText="NEXT_PM_DT" SortExpression="NEXT_PM_DT" />
                                <asp:BoundField DataField="PM_FREQ_NUM" HeaderText="PM_FREQ_NUM" SortExpression="PM_FREQ_NUM" />
                                <asp:BoundField DataField="LGTH_QTY" HeaderText="LGTH_QTY" SortExpression="LGTH_QTY" />
                                <asp:BoundField DataField="SPECIALCOM" HeaderText="SPECIALCOM" SortExpression="SPECIALCOM" />
                                <asp:BoundField DataField="BASIN_ID" HeaderText="BASIN_ID" SortExpression="BASIN_ID" />
                                <asp:BoundField DataField="RI_REF" HeaderText="RI_REF" SortExpression="RI_REF" />
                                <asp:BoundField DataField="CANYON_MAIN" HeaderText="CANYON_MAIN" SortExpression="CANYON_MAIN" />
                                <asp:BoundField DataField="FORCED_MAIN" HeaderText="FORCED_MAIN" SortExpression="FORCED_MAIN" />
                                <asp:BoundField DataField="GT_15_IND" HeaderText="GT_15_IND" SortExpression="GT_15_IND" />
                                <asp:BoundField DataField="PRIVATE_MAIN" HeaderText="PRIVATE_MAIN" SortExpression="PRIVATE_MAIN" />
                                <asp:BoundField DataField="FUNCTIONAL" HeaderText="FUNCTIONAL" SortExpression="FUNCTIONAL" />
                                <asp:BoundField DataField="OTHER_REASON" HeaderText="OTHER_REASON" SortExpression="OTHER_REASON" />
                                <asp:BoundField DataField="SRVC_RQST_DT" HeaderText="SRVC_RQST_DT" SortExpression="SRVC_RQST_DT" />
                                <asp:BoundField DataField="DATEVISITED" HeaderText="DATEVISITED" SortExpression="DATEVISITED" />
                                <asp:BoundField DataField="CLEAR" HeaderText="CLEAR" SortExpression="CLEAR" />
                                <asp:BoundField DataField="CONDROOTS" HeaderText="CONDROOTS" SortExpression="CONDROOTS" />
                                <asp:BoundField DataField="CONDGREASE" HeaderText="CONDGREASE" SortExpression="CONDGREASE" />
                                <asp:BoundField DataField="CONDSLUDGE" HeaderText="CONDSLUDGE" SortExpression="CONDSLUDGE" />
                                <asp:BoundField DataField="COMMENTS" HeaderText="COMMENTS" SortExpression="COMMENTS" />
                                <asp:BoundField DataField="EXPORT_DT" HeaderText="EXPORT_DT" SortExpression="EXPORT_DT" />
                                <asp:BoundField DataField="LAST_ATTR_UPDT_ID" HeaderText="LAST_ATTR_UPDT_ID" SortExpression="LAST_ATTR_UPDT_ID" />
                                <asp:BoundField DataField="LAST_ATTR_UPDT_DT" HeaderText="LAST_ATTR_UPDT_DT" SortExpression="LAST_ATTR_UPDT_DT" />
                                <asp:BoundField DataField="SOURCE_FILE_NAME" HeaderText="SOURCE_FILE_NAME" SortExpression="SOURCE_FILE_NAME" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </ContentTemplate>
                <HeaderTemplate>
                    Maintenance and Cleaning
                </HeaderTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                <ContentTemplate>
                    &nbsp;<asp:Panel ID="SpillsPanel" runat="server" Height="130px" ScrollBars="Both">
                        <asp:GridView ID="PipeSpillsGridView" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="IDX" DataSourceID="PipeSpillsObjectDataSource">
                            <Columns>
                                <asp:BoundField DataField="IDX" HeaderText="IDX" ReadOnly="True" SortExpression="IDX" />
                                <asp:BoundField DataField="VERSION" HeaderText="VERSION" SortExpression="VERSION" />
                                <asp:BoundField DataField="REVISION_NUM" HeaderText="REVISION_NUM" SortExpression="REVISION_NUM" />
                                <asp:BoundField DataField="REVISED_ITEM_NUMBERS" HeaderText="REVISED_ITEM_NUMBERS"
                                    SortExpression="REVISED_ITEM_NUMBERS" />
                                <asp:BoundField DataField="SRVC_AREA_DESC" HeaderText="SRVC_AREA_DESC" SortExpression="SRVC_AREA_DESC" />
                                <asp:BoundField DataField="THOMAS_BROTHERS_CD" HeaderText="THOMAS_BROTHERS_CD" SortExpression="THOMAS_BROTHERS_CD" />
                                <asp:BoundField DataField="FLD_BK_PG_NUM" HeaderText="FLD_BK_PG_NUM" SortExpression="FLD_BK_PG_NUM" />
                                <asp:BoundField DataField="RESPUNIT" HeaderText="RESPUNIT" SortExpression="RESPUNIT" />
                                <asp:BoundField DataField="RESP_UNIT_NAME" HeaderText="RESP_UNIT_NAME" SortExpression="RESP_UNIT_NAME" />
                                <asp:BoundField DataField="SRVC_RQST_NUM" HeaderText="SRVC_RQST_NUM" SortExpression="SRVC_RQST_NUM" />
                                <asp:BoundField DataField="REPORTED_TO_1" HeaderText="REPORTED_TO_1" SortExpression="REPORTED_TO_1" />
                                <asp:BoundField DataField="REPORTED_TO_2" HeaderText="REPORTED_TO_2" SortExpression="REPORTED_TO_2" />
                                <asp:BoundField DataField="DATE_REPORTED" HeaderText="DATE_REPORTED" SortExpression="DATE_REPORTED" />
                                <asp:BoundField DataField="TIME_REPORTED" HeaderText="TIME_REPORTED" SortExpression="TIME_REPORTED" />
                                <asp:BoundField DataField="REPORTED_BY" HeaderText="REPORTED_BY" SortExpression="REPORTED_BY" />
                                <asp:BoundField DataField="PHONE" HeaderText="PHONE" SortExpression="PHONE" />
                                <asp:BoundField DataField="RESPONSIBLE_SWR_AGENCY_TXT" HeaderText="RESPONSIBLE_SWR_AGENCY_TXT"
                                    SortExpression="RESPONSIBLE_SWR_AGENCY_TXT" />
                                <asp:BoundField DataField="NONCITY_ENTITY_IND" HeaderText="NONCITY_ENTITY_IND" SortExpression="NONCITY_ENTITY_IND" />
                                <asp:BoundField DataField="NONCITY_ENTITY" HeaderText="NONCITY_ENTITY" SortExpression="NONCITY_ENTITY" />
                                <asp:BoundField DataField="NONCITY_ENTITY_INFO" HeaderText="NONCITY_ENTITY_INFO"
                                    SortExpression="NONCITY_ENTITY_INFO" />
                                <asp:BoundField DataField="REPORTING_SEWER_AGENCY" HeaderText="REPORTING_SEWER_AGENCY"
                                    SortExpression="REPORTING_SEWER_AGENCY" />
                                <asp:BoundField DataField="OVERFLOW_START_CONFIRM_DT_TM" HeaderText="OVERFLOW_START_CONFIRM_DT_TM"
                                    SortExpression="OVERFLOW_START_CONFIRM_DT_TM" />
                                <asp:BoundField DataField="OVERFLOW_START_TIME" HeaderText="OVERFLOW_START_TIME"
                                    SortExpression="OVERFLOW_START_TIME" />
                                <asp:BoundField DataField="DATE_NOTIFIED" HeaderText="DATE_NOTIFIED" SortExpression="DATE_NOTIFIED" />
                                <asp:BoundField DataField="TIME_NOTIFIED" HeaderText="TIME_NOTIFIED" SortExpression="TIME_NOTIFIED" />
                                <asp:BoundField DataField="SWR_CREW_ARRIVAL_DT_TM" HeaderText="SWR_CREW_ARRIVAL_DT_TM"
                                    SortExpression="SWR_CREW_ARRIVAL_DT_TM" />
                                <asp:BoundField DataField="SWR_CREW_ARRV_TM" HeaderText="SWR_CREW_ARRV_TM" SortExpression="SWR_CREW_ARRV_TM" />
                                <asp:BoundField DataField="LATE_CODE" HeaderText="LATE_CODE" SortExpression="LATE_CODE" />
                                <asp:BoundField DataField="OVERFLOW_STATUS" HeaderText="OVERFLOW_STATUS" SortExpression="OVERFLOW_STATUS" />
                                <asp:BoundField DataField="OVERFLOW_STOP_DT_TM" HeaderText="OVERFLOW_STOP_DT_TM"
                                    SortExpression="OVERFLOW_STOP_DT_TM" />
                                <asp:BoundField DataField="OVERFLOW_STOP_TM" HeaderText="OVERFLOW_STOP_TM" SortExpression="OVERFLOW_STOP_TM" />
                                <asp:BoundField DataField="PIPE_FAC_SEQ_NUM" HeaderText="PIPE_FAC_SEQ_NUM" SortExpression="PIPE_FAC_SEQ_NUM" />
                                <asp:BoundField DataField="OVERFLOW_MANHOLE_FAC_SEQ_NUM" HeaderText="OVERFLOW_MANHOLE_FAC_SEQ_NUM"
                                    SortExpression="OVERFLOW_MANHOLE_FAC_SEQ_NUM" />
                                <asp:BoundField DataField="CANYON_MAIN_IND" HeaderText="CANYON_MAIN_IND" SortExpression="CANYON_MAIN_IND" />
                                <asp:BoundField DataField="CANYON_MAIN_TXT" HeaderText="CANYON_MAIN_TXT" SortExpression="CANYON_MAIN_TXT" />
                                <asp:BoundField DataField="EASEMENT_MAIN_IND" HeaderText="EASEMENT_MAIN_IND" SortExpression="EASEMENT_MAIN_IND" />
                                <asp:BoundField DataField="TRUNKSWR_IND" HeaderText="TRUNKSWR_IND" SortExpression="TRUNKSWR_IND" />
                                <asp:BoundField DataField="TRUNKSWR_NAME" HeaderText="TRUNKSWR_NAME" SortExpression="TRUNKSWR_NAME" />
                                <asp:BoundField DataField="OVERFLOW_DURATION_QTY" HeaderText="OVERFLOW_DURATION_QTY"
                                    SortExpression="OVERFLOW_DURATION_QTY" />
                                <asp:BoundField DataField="OVERFLOW_GPM_RATE_QTY" HeaderText="OVERFLOW_GPM_RATE_QTY"
                                    SortExpression="OVERFLOW_GPM_RATE_QTY" />
                                <asp:BoundField DataField="TOTAL_GALLON_OVERFLOW_QTY" HeaderText="TOTAL_GALLON_OVERFLOW_QTY"
                                    SortExpression="TOTAL_GALLON_OVERFLOW_QTY" />
                                <asp:BoundField DataField="OVERFLOW_GALLON_RECOVER_QTY" HeaderText="OVERFLOW_GALLON_RECOVER_QTY"
                                    SortExpression="OVERFLOW_GALLON_RECOVER_QTY" />
                                <asp:BoundField DataField="VOLUME_RELEASED" HeaderText="VOLUME_RELEASED" SortExpression="VOLUME_RELEASED" />
                                <asp:BoundField DataField="THIRD_PARTY_EST_IND" HeaderText="THIRD_PARTY_EST_IND"
                                    SortExpression="THIRD_PARTY_EST_IND" />
                                <asp:BoundField DataField="STREET_OR_LOCATION" HeaderText="STREET_OR_LOCATION" SortExpression="STREET_OR_LOCATION" />
                                <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                                <asp:BoundField DataField="ZIPCODE" HeaderText="ZIPCODE" SortExpression="ZIPCODE" />
                                <asp:BoundField DataField="COUNTY" HeaderText="COUNTY" SortExpression="COUNTY" />
                                <asp:BoundField DataField="SSO_STRUCTURE_ID" HeaderText="SSO_STRUCTURE_ID" SortExpression="SSO_STRUCTURE_ID" />
                                <asp:BoundField DataField="NEARBY_SSO_12MO" HeaderText="NEARBY_SSO_12MO" SortExpression="NEARBY_SSO_12MO" />
                                <asp:BoundField DataField="DATE_SSO_12MO" HeaderText="DATE_SSO_12MO" SortExpression="DATE_SSO_12MO" />
                                <asp:BoundField DataField="PRIM_OVERFLOW_CAUSE_CD" HeaderText="PRIM_OVERFLOW_CAUSE_CD"
                                    SortExpression="PRIM_OVERFLOW_CAUSE_CD" />
                                <asp:BoundField DataField="PRIM_CAUSE_OTHER" HeaderText="PRIM_CAUSE_OTHER" SortExpression="PRIM_CAUSE_OTHER" />
                                <asp:BoundField DataField="SCNDRY_OVERFLOW_CAUSE_CD" HeaderText="SCNDRY_OVERFLOW_CAUSE_CD"
                                    SortExpression="SCNDRY_OVERFLOW_CAUSE_CD" />
                                <asp:BoundField DataField="SCNDRY_CAUSE_OTHER" HeaderText="SCNDRY_CAUSE_OTHER" SortExpression="SCNDRY_CAUSE_OTHER" />
                                <asp:BoundField DataField="SWR_PUMP_STA_INVOLVED_IND" HeaderText="SWR_PUMP_STA_INVOLVED_IND"
                                    SortExpression="SWR_PUMP_STA_INVOLVED_IND" />
                                <asp:BoundField DataField="SWR_PUMP_STA_FAC_SEQ_NUM" HeaderText="SWR_PUMP_STA_FAC_SEQ_NUM"
                                    SortExpression="SWR_PUMP_STA_FAC_SEQ_NUM" />
                                <asp:BoundField DataField="WEATHER_COND_CD" HeaderText="WEATHER_COND_CD" SortExpression="WEATHER_COND_CD" />
                                <asp:BoundField DataField="MJR_OVERFLOW_PRIOR_TO_NOTF_IND" HeaderText="MJR_OVERFLOW_PRIOR_TO_NOTF_IND"
                                    SortExpression="MJR_OVERFLOW_PRIOR_TO_NOTF_IND" />
                                <asp:BoundField DataField="OVERFLOW_CAUSE_TXT" HeaderText="OVERFLOW_CAUSE_TXT" SortExpression="OVERFLOW_CAUSE_TXT" />
                                <asp:BoundField DataField="ACTION_TAKEN_PLANNED_TXT" HeaderText="ACTION_TAKEN_PLANNED_TXT"
                                    SortExpression="ACTION_TAKEN_PLANNED_TXT" />
                                <asp:BoundField DataField="STORM_DRAIN_REACHED_IND" HeaderText="STORM_DRAIN_REACHED_IND"
                                    SortExpression="STORM_DRAIN_REACHED_IND" />
                                <asp:BoundField DataField="SURFACE_WTR_REACHED_IND" HeaderText="SURFACE_WTR_REACHED_IND"
                                    SortExpression="SURFACE_WTR_REACHED_IND" />
                                <asp:BoundField DataField="PRIM_SURFACE_WTR_REACH_CD" HeaderText="PRIM_SURFACE_WTR_REACH_CD"
                                    SortExpression="PRIM_SURFACE_WTR_REACH_CD" />
                                <asp:BoundField DataField="SCNDRY_SURFACE_WTR_REACH_CD" HeaderText="SCNDRY_SURFACE_WTR_REACH_CD"
                                    SortExpression="SCNDRY_SURFACE_WTR_REACH_CD" />
                                <asp:BoundField DataField="SEWAGE_FINAL_DESTN_TXT" HeaderText="SEWAGE_FINAL_DESTN_TXT"
                                    SortExpression="SEWAGE_FINAL_DESTN_TXT" />
                                <asp:BoundField DataField="PUBLIC_WTR_REACH_IND" HeaderText="PUBLIC_WTR_REACH_IND"
                                    SortExpression="PUBLIC_WTR_REACH_IND" />
                                <asp:BoundField DataField="PUBLIC_WTR_REACH_CD" HeaderText="PUBLIC_WTR_REACH_CD"
                                    SortExpression="PUBLIC_WTR_REACH_CD" />
                                <asp:BoundField DataField="PUBLIC_WATER_OTHER" HeaderText="PUBLIC_WATER_OTHER" SortExpression="PUBLIC_WATER_OTHER" />
                                <asp:BoundField DataField="PUBLIC_HEALTH_EXPOSURE_IND" HeaderText="PUBLIC_HEALTH_EXPOSURE_IND"
                                    SortExpression="PUBLIC_HEALTH_EXPOSURE_IND" />
                                <asp:BoundField DataField="PUBLIC_HEALTH_EXPOSURE_TXT" HeaderText="PUBLIC_HEALTH_EXPOSURE_TXT"
                                    SortExpression="PUBLIC_HEALTH_EXPOSURE_TXT" />
                                <asp:BoundField DataField="LOCAL_HS_NOTIFIED" HeaderText="LOCAL_HS_NOTIFIED" SortExpression="LOCAL_HS_NOTIFIED" />
                                <asp:BoundField DataField="OES_CONFIRM_NUM" HeaderText="OES_CONFIRM_NUM" SortExpression="OES_CONFIRM_NUM" />
                                <asp:BoundField DataField="CITY_CLAIMS_NOTIFIED" HeaderText="CITY_CLAIMS_NOTIFIED"
                                    SortExpression="CITY_CLAIMS_NOTIFIED" />
                                <asp:BoundField DataField="TRAFFIC_IMPACTED_IND" HeaderText="TRAFFIC_IMPACTED_IND"
                                    SortExpression="TRAFFIC_IMPACTED_IND" />
                                <asp:BoundField DataField="RWQCB_NOTIFIED" HeaderText="RWQCB_NOTIFIED" SortExpression="RWQCB_NOTIFIED" />
                                <asp:BoundField DataField="COUNTY_HEALTH_NOTIFIED" HeaderText="COUNTY_HEALTH_NOTIFIED"
                                    SortExpression="COUNTY_HEALTH_NOTIFIED" />
                                <asp:BoundField DataField="LIFEGUARD_NOTIFIED" HeaderText="LIFEGUARD_NOTIFIED" SortExpression="LIFEGUARD_NOTIFIED" />
                                <asp:BoundField DataField="MAYORPS_NOTIFIED" HeaderText="MAYORPS_NOTIFIED" SortExpression="MAYORPS_NOTIFIED" />
                                <asp:BoundField DataField="COUNCIL_DISTRICT_NUM_NOTIFIED" HeaderText="COUNCIL_DISTRICT_NUM_NOTIFIED"
                                    SortExpression="COUNCIL_DISTRICT_NUM_NOTIFIED" />
                                <asp:BoundField DataField="COUNCIL_DISTRICT_NUM" HeaderText="COUNCIL_DISTRICT_NUM"
                                    SortExpression="COUNCIL_DISTRICT_NUM" />
                                <asp:BoundField DataField="MWWD_DIRECTOR_NOTIFIED" HeaderText="MWWD_DIRECTOR_NOTIFIED"
                                    SortExpression="MWWD_DIRECTOR_NOTIFIED" />
                                <asp:BoundField DataField="STORMWATER_POLL_NOTIFIED" HeaderText="STORMWATER_POLL_NOTIFIED"
                                    SortExpression="STORMWATER_POLL_NOTIFIED" />
                                <asp:BoundField DataField="OTHER_NOTIFIED" HeaderText="OTHER_NOTIFIED" SortExpression="OTHER_NOTIFIED" />
                                <asp:BoundField DataField="OTHER_NOTIFIED_TXT" HeaderText="OTHER_NOTIFIED_TXT" SortExpression="OTHER_NOTIFIED_TXT" />
                                <asp:BoundField DataField="GEN_MGR_NOTIFIED" HeaderText="GEN_MGR_NOTIFIED" SortExpression="GEN_MGR_NOTIFIED" />
                                <asp:BoundField DataField="DEP_CITY_MGR_NOTIFIED" HeaderText="DEP_CITY_MGR_NOTIFIED"
                                    SortExpression="DEP_CITY_MGR_NOTIFIED" />
                                <asp:BoundField DataField="SIGN_POSTED_IND" HeaderText="SIGN_POSTED_IND" SortExpression="SIGN_POSTED_IND" />
                                <asp:BoundField DataField="SIGN_POSTED_LOCN_TXT" HeaderText="SIGN_POSTED_LOCN_TXT"
                                    SortExpression="SIGN_POSTED_LOCN_TXT" />
                                <asp:BoundField DataField="BEACH_CLOSURE_IND" HeaderText="BEACH_CLOSURE_IND" SortExpression="BEACH_CLOSURE_IND" />
                                <asp:BoundField DataField="BEACH_LOCATION" HeaderText="BEACH_LOCATION" SortExpression="BEACH_LOCATION" />
                                <asp:BoundField DataField="SIGN_POSTED_DURATION_QTY" HeaderText="SIGN_POSTED_DURATION_QTY"
                                    SortExpression="SIGN_POSTED_DURATION_QTY" />
                                <asp:BoundField DataField="SIGN_POSTED_QTY" HeaderText="SIGN_POSTED_QTY" SortExpression="SIGN_POSTED_QTY" />
                                <asp:BoundField DataField="REMARK_TXT" HeaderText="REMARK_TXT" SortExpression="REMARK_TXT" />
                                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                                <asp:BoundField DataField="TITLE" HeaderText="TITLE" SortExpression="TITLE" />
                                <asp:BoundField DataField="DATE_DT" HeaderText="DATE_DT" SortExpression="DATE_DT" />
                                <asp:BoundField DataField="ADMIN_DATE_MODIFIED" HeaderText="ADMIN_DATE_MODIFIED"
                                    SortExpression="ADMIN_DATE_MODIFIED" />
                                <asp:BoundField DataField="ADMIN_USER_MOD" HeaderText="ADMIN_USER_MOD" SortExpression="ADMIN_USER_MOD" />
                                <asp:BoundField DataField="CLEANOUT" HeaderText="CLEANOUT" SortExpression="CLEANOUT" />
                                <asp:BoundField DataField="MH_MAPID" HeaderText="MH_MAPID" SortExpression="MH_MAPID" />
                                <asp:BoundField DataField="FEWD_FINDINGS_CD" HeaderText="FEWD_FINDINGS_CD" SortExpression="FEWD_FINDINGS_CD" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </ContentTemplate>
                <HeaderTemplate>
                    Spills
                </HeaderTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TidesTabPanel" runat="server" HeaderText="TabPanel4">
                <HeaderTemplate>
                    TIDES
                </HeaderTemplate>
                <ContentTemplate>
                       
                 <asp:Panel ID="TidesPanel" runat="server" Width="379px">
                   <label class="TidesTableTitle">Lining: </label><br />
                    <asp.label ID="TidesPromptLabel" text="Select an Inspection above to see a comparison with TIDES"></asp.label> 
                    <asp:FormView ID="LiningFormView" runat="server" DataSourceID="MainObjectDataSource">
                                    <ItemTemplate> 
                                         <asp:Label ID="LINING_TYP_CDLabel" runat="server" Text='<%# Bind("LINING_TYP_CD") %>'></asp:Label>
                                   </ItemTemplate>
                    </asp:FormView>                                   
                    <asp:FormView ID="TidesFormView" runat="server" DataSourceID="PipeSegmentObjectDataSource" OnDataBound="TidesFormView_DataBound">
                                    <ItemTemplate>
                                     <table class="TIDESTableStyle">
                                        <tr><td></td><td class="TidesTableTitle">Inspections</td><td class="TidesTableTitle">TIDES</td></tr> 
                                        <tr>
                                            <td class="TidesTableTitle">Diameter:</td> 
                                            <td><asp:Label ID="INSD_DIAM_SIZE_NUMLabel" runat="server" Text='<%# Bind("INSD_DIAM_SIZE_NUM") %>'></asp:Label></td> 
                                            <td><asp:Label ID="FNCTNL_INSD_DIAM_SIZE_NUMLabel" runat="server" Text='<%# Bind("FNCTNL_INSD_DIAM_SIZE_NUM") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TidesTableTitle">Length:</td> 
                                            <td><asp:Label ID="P_LGTH_QTYLabel" runat="server" Text='<%# Bind("P_LGTH_QTY") %>'></asp:Label></td>
                                            <td><asp:Label ID="M_LGTH_QTYLabel" runat="server" Text='<%# Bind("M_LGTH_QTY") %>'></asp:Label></td>
                                        </tr>
                                       <tr>
                                            <td class="TidesTableTitle">Material:</td> 
                                            <td><asp:Label ID="P_MATL_CDLabel" runat="server" Text='<%# Bind("P_MATL_CD") %>'></asp:Label></td>
                                            <td><asp:Label ID="M_MATL_CDLabel" runat="server" Text='<%# Bind("M_MATL_CD") %>'></asp:Label></td>
                                       </tr> 
                                     </table>
                                  </ItemTemplate>
                              
                       </asp:FormView>
                   </asp:Panel>
                    <br />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
       </div>
    </asp:Panel>
    <div>
        &nbsp;<br />
        <br />
        &nbsp;</div>
        <asp:ObjectDataSource ID="PipeInspectionsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetPipeInspectionsByFacSeqNum" TypeName="Reports.APP_Data.PD08TableAdapters.PipeInspectionsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="FSN_TextBox" Name="FAC_SEQ_NUM" PropertyName="Text"
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp; &nbsp;
        <asp:ObjectDataSource ID="PipeObservationsDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetPipeObservationsByInspectionSeqNum" TypeName="Reports.APP_Data.PD08TableAdapters.PipeObservationsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="PipeInspectionsGridView" Name="INSPECTION_SEQ_NUM"
                    PropertyName="SelectedDataKey.Values[0]" Type="Decimal" />
                <asp:ControlParameter ControlID="PipeInspectionsGridView" Name="FAC_SEQ_NUM" PropertyName="SelectedDataKey.Values[1]"
                    Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
       <asp:ObjectDataSource ID="PipeMaintenanceObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
           SelectMethod="GetPipeMaintenanceByFacSeqNum" TypeName="Reports.APP_Data.PD08TableAdapters.PipeMaintenanceTableAdapter">
           <SelectParameters>
               <asp:ControlParameter ControlID="FSN_TextBox" Name="FAC_SEQ_NUM" PropertyName="Text"
                   Type="Decimal" />
           </SelectParameters>
       </asp:ObjectDataSource>
       <asp:ObjectDataSource ID="PipeSpillsObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
           SelectMethod="GetPipeSpillsByFacSeqNum" TypeName="Reports.APP_Data.PD08TableAdapters.PipeSpillsTableAdapter">
           <SelectParameters>
               <asp:ControlParameter ControlID="FSN_TextBox" Name="FAC_SEQ_NUM" PropertyName="Text"
                   Type="Decimal" />
           </SelectParameters>
       </asp:ObjectDataSource>
       <asp:ObjectDataSource ID="PipeSegmentObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
           SelectMethod="GetPipeMainByFSNandInspecNum" TypeName="Reports.APP_Data.PD08TableAdapters.PipeSegmentTableAdapter">
           <SelectParameters>
               <asp:ControlParameter ControlID="FSN_TextBox" Name="FAC_SEQ_NUM" PropertyName="Text"
                   Type="Decimal" />
               <asp:ControlParameter ControlID="PipeInspectionsGridView" Name="INSP_SEQ_NUM" PropertyName="SelectedValue"
                   Type="Decimal" />
           </SelectParameters>
       </asp:ObjectDataSource>
              <asp:ObjectDataSource ID="MainObjectDataSource"  RunAt="server"  OldValuesParameterFormatString="original_{0}"
          SelectMethod="GetMainByFacSeqNum"  TypeName="Reports.APP_Data.PLUMEATableAdapters.MainTableAdapter">
          <SelectParameters>
               <asp:ControlParameter ControlID="FSN_TextBox" Name="FAC_SEQ_NUM" PropertyName="Text" Type="Decimal" /> 
          </SelectParameters>
          </asp:ObjectDataSource>

    </form>
</body>
</html>
