Attribute VB_Name = "Module1"
Option Explicit

Const C_POLSKIE As String = "¯ÆÑ¥Œ£ÊÓ¿Ÿæñ¹œ³êó"

Public Function PolskieZnaki(ByVal strTekst As String) As String
  Dim strWynik As String
  Dim i As Long
  strWynik = ""
  For i = 1 To Len(strTekst)
    If InStr(1, C_POLSKIE, Mid(strTekst, i, 1)) > 0 Then
      strWynik = strWynik & Mid(strTekst, i, 1)
    End If
  Next i
  PolskieZnaki = strWynik
End Function
