Attribute VB_Name = "Module1"
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Const BottomRight As String = "BF47"

Sub Preformatuj()
  Range("A1:" & BottomRight).ColumnWidth = 1
  Range("A1:" & BottomRight).RowHeight = 8
  Range("A1:" & BottomRight).ClearFormats
  Range("A1:" & BottomRight).ClearContents
  Range("A1:" & BottomRight).BorderAround LineStyle:=xlContinuous, Weight:=xlMedium, Color:=RGB(200, 100, 100)
End Sub

Sub Lissa()
  Dim x As Integer, y As Integer, maxx As Integer, maxy As Integer, stepx As Integer, stepy As Integer

  maxx = Range(BottomRight).Column - 1
  maxy = Range(BottomRight).Row - 1

  x = 0
  y = 0

  stepx = 1
  stepy = 1

  Do
    x = x + stepx
    y = y + stepy
    If x = maxx Then stepx = -1
    If x = 0 Then stepx = 1
    If y = maxy Then stepy = -1
    If y = 0 Then stepy = 1
    Range("A1").Offset(y, x).Value = "."
    Range("A1").Offset(y, x).Interior.Color = RGB(10, 20, 100)
    Sleep 10
    DoEvents
  Loop While Not ((x = 0 Or x = maxx) And (y = 0 Or y = maxy))
End Sub
