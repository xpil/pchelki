Attribute VB_Name = "Module1"
Option Explicit

Private Function DoPotegi(ByVal x As Long, ByVal n As Long) As Double
Dim i As Long, retval As Double
    retval = 1
    For i = 1 To n
        retval = retval * x
    Next i
    DoPotegi = retval
End Function

Private Function NtaPierwsza(n As Long) As Long
    NtaPierwsza = Switch(n = 1, 2, n = 2, 3, n = 3, 5, n = 4, 7, n = 5, 11, n = 6, 13, n = 7, 17, n = 8, 19, n = 9, 23, n = 10, 29, n = 11, 31, n = 12, 37, n = 13, 41, n = 14, 43, n = 15, 47, True, -1)
End Function

Sub Pchelka(ByVal x As Long, ByVal np As Long)
Dim cx As Long, ca As Long, cp As Long, crow As Long
    crow = 1
    Range("A:B").Clear
    For cx = 2 To x
        For ca = 1 To cx - 1
            For cp = 1 To np
                Range("A1").Offset(crow).Value = "sprawdzamy czy (" & cx & " - " & ca & ")^" & NtaPierwsza(cp) & " mod " & NtaPierwsza(cp) & " = (" & cx & "^" & NtaPierwsza(cp) & " - " & ca & ") mod " & NtaPierwsza(cp)
                If DoPotegi(cx - ca, NtaPierwsza(cp)) Mod NtaPierwsza(cp) = (DoPotegi(cx, NtaPierwsza(cp)) - ca) Mod NtaPierwsza(cp) Then Range("B1").Offset(crow).Value = "TAK" Else Range("B1").Offset(crow).Value = "NIE"
                crow = crow + 1
            Next cp
        Next ca
    Next cx
End Sub
