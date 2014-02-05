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

public partial class Inspections_Manholes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //!CBP Replace with Declarative QueryString Parameter Binding
        //http://www.codeproject.com/KB/aspnet/WebParameter.aspx
        string fsnParam = Request.Params.Get("fsn");
        if (fsnParam != null)
        {
            //FSN_TextBox.Text = fsnParam;
            TextBox tb = this.Form.FindControl("FSN_TextBox") as TextBox;
            //FSN_TextBox.Text = fsnParam;
            tb.Text = fsnParam;
        }
    }
}
