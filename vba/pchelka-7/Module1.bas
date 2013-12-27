Attribute VB_Name = "Module1"
Option Explicit

Public Sub ListFiles(r As Excel.Range, p As String)
  Dim fso As Scripting.FileSystemObject
  Dim fld As Scripting.Folder
  Dim f As Scripting.File

  Set fso = New Scripting.FileSystemObject
  Set fld = fso.GetFolder(p)

  For Each f In fld.Files
    r.Value = f.Path
    Set r = r.Offset(1, 0)
  Next f
End Sub
