VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Option Explicit

Private Sub Worksheet_Activate()
 Loguj AktywacjaArkusza, "", Null
End Sub

Private Sub Worksheet_Calculate()
 Loguj Przeliczenie, "", Null
End Sub

Private Sub Worksheet_Change(ByVal Target As Range)
 Loguj ZmianaWartosci, Target.Address, Target.Value
End Sub

Private Sub Worksheet_Deactivate()
 Loguj DezaktywacjaArkusza, "", Null
End Sub

Private Sub Worksheet_SelectionChange(ByVal Target As Range)
 Loguj ZmianaZaznaczenia, Target.Address, Null
End Sub
