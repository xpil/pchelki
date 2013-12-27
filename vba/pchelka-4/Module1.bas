Attribute VB_Name = "Module1"
Option Explicit

Public Sub kombinacje()
    Dim i As Integer, j As Integer, k As Integer, n1 As Integer, n2 As Integer
    Dim r As Excel.Range
    Set r = Range("A1")
    n1 = 65
    n2 = 90
    For i = n1 To n2
        For j = n1 To n2
            For k = n1 To n2
                r.Value = Chr(i) & Chr(j) & Chr(k)
                Set r = r.Offset(1, 0)
            Next k
        Next j
    Next i
End Sub
