Attribute VB_Name = "Module1"
'Rozwi¹zanie 1:

Public Function GetFileStats(strFileName As String) As String
  Dim f As Integer, strline As String, lines As Integer, chars As Integer

  If Len(Dir$(strFileName)) = 0 Then
    GetFileStats = "File '" & strFileName & "' could not be open."
    Exit Function
  End If

  f = FreeFile
  Open strFileName For Input As f
  Do While Not EOF(f)
    Line Input #f, strline
    lines = lines + 1
    chars = chars + Len(strline)
  Loop
  Close #f
GetFileStats = "File '" & strFileName & "': " & lines & " line(s), " & chars & " character(s)."
End Function

'Rozwi¹zanie 2:

Public Function GetFileStats2(strFileName As String) As String
  Dim fso As New FileSystemObject
  Dim lines As Integer, chars As Long, strline As String
  On Error GoTo no_file
  Set ts = fso.OpenTextFile(strFileName)
  On Error GoTo 0
  Do While Not ts.AtEndOfStream
    strline = ts.ReadLine
    lines = lines + 1
    chars = chars + Len(strline)
  Loop
  ts.Close
  GetFileStats2 = "File '" & strFileName & "': " & lines & " line(s), " & chars & " character(s)."
endf:
  Exit Function
no_file:
  GetFileStats2 = "File '" & strFileName & "' could not be open."
  Resume endf
End Function
