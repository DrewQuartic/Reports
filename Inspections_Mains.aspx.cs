using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Inspections_Mains : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //!CBP Replace with Declarative QueryString Parameter Binding
        //http://www.codeproject.com/KB/aspnet/WebParameter.aspx
        string fsnParam = Request.Params.Get("fsn");
        if (fsnParam != null)
        {
            TextBox tb = this.Form.FindControl("FSN_TextBox") as TextBox ;
            //FSN_TextBox.Text = fsnParam;
            tb.Text = fsnParam;
        }
    }

    protected void TidesFormView_DataBound(object sender, EventArgs e)
    {

        // Get the ProductsRow object from the DataItem property...
        // Northwind.ProductsRow product = (Northwind.ProductsRow)((System.Data.DataRowView)LowStockedProductsInRed.DataItem).Row;
        //FormView fv = this.Form.FindControl("TidesFormView") as FormView;
        FormView fv = sender as FormView;
    //    foreach (Control item in this.Form.Controls)
    //{
    //    System.Diagnostics.Debug.Write(item);
    //} 
            
       //System.Data.DataRowView drv = (System.Data.DataRowView)TidesFormView.DataItem;
        System.Data.DataRowView drv = (System.Data.DataRowView)fv.DataItem;
     //   Label prompt = (Label)TidesPanel.FindControl("TidesPromptLabel");
        if (drv != null)
        {
            //prompt.Visible = false;
            System.Data.DataRow dr = drv.Row;
            checkTidesValues(dr, "INSD_DIAM_SIZE_NUM", "FNCTNL_INSD_DIAM_SIZE_NUM", "TIDESValueUnequal");
            checkTidesValues(dr, "P_LGTH_QTY", "M_LGTH_QTY", "TIDESValueUnequal");
            checkTidesValues(dr, "P_MATL_CD", "M_MATL_CD", "TIDESValueUnequal");
        }
        else
        {
    //        prompt.Visible = true;
        }
    }

    protected void checkTidesValues(System.Data.DataRow dr, String fld1, String fld2, String cssClass)
    {
        if (!dr[fld1].Equals(dr[fld2]))
        {

            // Make the "fld2"Label text red
            //FormView fv = Page.FindControl("TidesFormView")as FormView;
            //FormView fv = Page.Form.FindControl("TidesFormView") as FormView;
            //FormView fv = this.Form.FindControl("TidesFormView") as FormView;
            //Label fld2Label = (Label)TidesFormView.FindControl(fld2+"Label");

            //Label fld2Label = (Label)fv.FindControl(fld2 + "Label");
            Label fld2Label = (Label)Page.Form.FindControl(fld2 + "Label");
            if (fld2Label != null)
            {
                fld2Label.CssClass = cssClass;
            }
        }
       
    }

    //protected void TidesTabPanel_PreRender(object sender,  EventArgs e)
    //{
    //    FormView frmInsp = this.TidesFormView;
    //    FormView frmTide = this.InspectionFormView;

    //    if (frmInsp != null & frmTide != null)
    //    {
    //        TableCell inspCell = (TableCell) frmInsp.FindControl("tblCellInspectionDiameter");
    //        TableCell tideCell = (TableCell) frmTide.FindControl("tblCellTidesDiameter");
    //        if (inspCell != null & tideCell != null)
    //        {
    //            if (inspCell.Text != tideCell.Text)
    //            {
    //                tideCell. = "TIDESValueUnequal";
    //            }
    //        }
    //    }
    //}

}
