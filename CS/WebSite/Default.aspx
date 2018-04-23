<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Selection_OneRowSelection_OneRowSelection" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Enable one row selection in the grid</title>
<script type="text/javascript">
function OnRowClick(e) {
    //Clear the text selection
    _aspxClearSelection();
    //Unselect all rows
    grid._selectAllRowsOnPage(false);
    //Select the row
    grid.SelectRow(e.visibleIndex, true);
}
</script>
</head>
<body>
    <form id="form1" runat="server">
    
        <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="CustomerID">
        <%-- BeginRegion Columns --%>
             <Columns>
                <dxwgv:GridViewDataColumn FieldName="ContactName" VisibleIndex="1">
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="2">
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="3">
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="4">
                </dxwgv:GridViewDataColumn>
                <dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="5">
                </dxwgv:GridViewDataColumn>             
         </Columns>
        <%-- EndRegion --%>
         <ClientSideEvents RowClick="function(s, e) { OnRowClick(e); }" />
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
     <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT * FROM [Customers]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    </form>
</body>
</html>
