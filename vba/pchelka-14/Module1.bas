Attribute VB_Name = "Module1"
Option Explicit

Private Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function GetWindowDC Lib "user32" (ByVal hwnd As Long) As Long

Sub Pchelka()
    Dim Ekran As Long, x As Long, y As Long, px As Long
    Ekran = GetWindowDC(0)
    x = Range("A1").Value
    y = Range("A2").Value
    px = GetPixel(Ekran, x, y)
    Range("A3").Value = px
    Range("A3").Interior.Color = px
End Sub
