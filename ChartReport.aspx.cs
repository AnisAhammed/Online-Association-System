using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ChartReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Chart1.SaveImage(Server.MapPath("../chartImage/") + "BarChart.JPG");
        Chart2.SaveImage(Server.MapPath("../chartImage/") + "PieChart.JPG");
    }

    protected void btnShowImage_Click(object sender, EventArgs e)
    {
        Image1.ImageUrl = "../chartImage/" + "BarChart.JPG";
        Image2.ImageUrl = "../chartImage/" + "PieChart.JPG";
    }
}