Attribute VB_Name = "Module1"
Sub Clp1()
 Dim o As New DataObject
 o.GetFromClipboard
 o.SetText Replace(UCase(o.GetText), " ", "_")
 o.PutInClipboard
 End Sub
