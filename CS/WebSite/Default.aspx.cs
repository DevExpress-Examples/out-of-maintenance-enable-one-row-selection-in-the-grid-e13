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

public partial class Grid_Selection_OneRowSelection_OneRowSelection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ClearSelectionOnOtherPages();
    }
    void ClearSelectionOnOtherPages() {
        if(grid.Selection.Count <= 1) return;
        int curPageSelection = GetSelectedRowOnTheCurrentPage();
        grid.Selection.UnselectAll();
        grid.Selection.SelectRow(curPageSelection);
    }
 int GetSelectedRowOnTheCurrentPage()
        {
            int startIndexOnPage = grid.PageIndex * grid.SettingsPager.PageSize;
            for (int i = 0; i < grid.VisibleRowCount; i++)
            {
                if (grid.Selection.IsRowSelected(startIndexOnPage))
                {
                    return startIndexOnPage;
                }
                
                startIndexOnPage++; // increment
            }
            return -1;
        }
}
