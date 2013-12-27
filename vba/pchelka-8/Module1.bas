Attribute VB_Name = "Module1"
Option Explicit

Public Function silnia(n As Integer) As Long
 On Error Resume Next
 If n = 1 Then
  silnia = 1
 Else
  silnia = n * silnia(n - 1)
 End If
 If Err.Number <> 0 Then silnia = 0
 On Error GoTo 0
End Function
