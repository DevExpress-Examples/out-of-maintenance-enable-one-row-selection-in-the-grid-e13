Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Grid_Selection_OneRowSelection_OneRowSelection
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		ClearSelectionOnOtherPages()
	End Sub
	Private Sub ClearSelectionOnOtherPages()
		If grid.Selection.Count <= 1 Then
		Return
		End If
		Dim curPageSelection As Integer = GetSelectedRowOnTheCurrentPage()
		grid.Selection.UnselectAll()
		grid.Selection.SelectRow(curPageSelection)
	End Sub
	Private Function GetSelectedRowOnTheCurrentPage() As Integer
		Dim startIndexOnPage As Integer = grid.PageIndex * grid.SettingsPager.PageSize
		For i As Integer = 0 To grid.VisibleRowCount - 1
			If grid.Selection.IsRowSelected(startIndexOnPage + i) Then
				Return startIndexOnPage + i
			End If
		Next i
		Return -1
	End Function
End Class
