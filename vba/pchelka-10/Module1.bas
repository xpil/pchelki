Attribute VB_Name = "Module1"
Option Explicit

Global WylaczLogowanie As Boolean

Public Enum Akcja
 ZmianaWartosci
 ZmianaZaznaczenia
 AktywacjaArkusza
 DezaktywacjaArkusza
 Przeliczenie
End Enum

Public Sub Loguj(a As Akcja, adres As String, wart As Variant)
 If WylaczLogowanie Then Exit Sub
 Dim s As Excel.Worksheet
 Dim cs As Excel.Worksheet
 On Error Resume Next
 Set s = Worksheets("log")
 If Err.Number <> 0 Then
  Set cs = ActiveSheet
  WylaczLogowanie = True
  Set s = Worksheets.Add
  s.Name = "log"
  cs.Activate
  WylaczLogowanie = False
 End If
 On Error GoTo 0
 Dim r As Excel.Range
 Set r = s.Range("A:A").SpecialCells(xlCellTypeLastCell).Offset(1, 0)
 r.Value = "Akcja: " & Switch(a = AktywacjaArkusza, "Aktywacja", a = DezaktywacjaArkusza, "Dezaktywacja", a = Przeliczenie, "Przeliczenie", a = ZmianaWartosci, "Zmiana wartoœci", a = ZmianaZaznaczenia, "Zmiana zaznaczenia", True, "?")
 If a = ZmianaWartosci Or a = ZmianaZaznaczenia Then
  r.Value = r.Value & ", adres: " & adres
  If a = ZmianaWartosci Then
   If IsArray(wart) Then
    r.Value = r.Value & ", nowe wartoœci:"
    Dim i As Long, j As Long
    For i = LBound(wart, 1) To UBound(wart, 1)
     For j = LBound(wart, 2) To UBound(wart, 2)
      r.Value = r.Value & " " & wart(i, j)
     Next j
    Next i
   Else
    r.Value = r.Value & ", nowa wartoœæ: " & wart
   End If
  End If
 End If
End Sub
