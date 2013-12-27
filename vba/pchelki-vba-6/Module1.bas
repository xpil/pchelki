Attribute VB_Name = "Module1"
Public Sub PrzelaczArkusz(ByVal nazwa As String)
 On Error Resume Next
 ThisWorkbook.Sheets(nazwa).Activate
 On Error GoTo 0
End Sub
