Attribute VB_Name = "Module1"
Public Function PolskiDzienTygodnia(data As Date) As String
  Dim dzien As Integer
  dzien = Weekday(data, vbMonday)
  PolskiDzienTygodnia = Switch(dzien = 7, "Niedziela", dzien = 1, "Poniedzia³ek", dzien = 2, "Wtorek", dzien = 3, "Œroda", dzien = 4, "Czwartek", dzien = 5, "Pi¹tek", dzien = 6, "Sobota", True, "???")
End Function
