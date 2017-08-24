; Form Designer for Purebasic - 5.60
; Warning: this file uses a strict syntax, if you edit it, make sure to respect the Form Designer limitation or it won't be opened again.

;
; This code is automatically generated by the FormDesigner.
; Manual modification is possible to adjust existing commands, but anything else will be dropped when the code is compiled.
; Event procedures needs to be put in another source file.
;

Enumeration FormWindow
  #FrmHaubtFenster
EndEnumeration

Enumeration FormGadget
  #FrmHauptfensterInfo
  #FrmHaubtfensterEnde
EndEnumeration

Enumeration FormFont
  #Font_FrmHaubtFenster_0
  #Font_FrmHaubtFenster_1
EndEnumeration

LoadFont(#Font_FrmHaubtFenster_0,"Consolas", 16, #PB_Font_Bold)
LoadFont(#Font_FrmHaubtFenster_1,"Consolas", 14, #PB_Font_Bold)

Declare FrmHauptfensterInfo(EventType)
Declare FrmHaubtfensterEnde(EventType)

Procedure OpenFrmHaubtFenster(x = 0, y = 0, width = 270, height = 45)
  OpenWindow(#FrmHaubtFenster, x, y, width, height, "Haubtfenster", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  ButtonGadget(#FrmHauptfensterInfo, 20, 10, 100, 25, "Info", #PB_Button_Right | #PB_Button_Left)
  SetGadgetFont(#FrmHauptfensterInfo, FontID(#Font_FrmHaubtFenster_0))
  ButtonGadget(#FrmHaubtfensterEnde, 150, 10, 100, 25, "Ende")
  SetGadgetFont(#FrmHaubtfensterEnde, FontID(#Font_FrmHaubtFenster_1))
EndProcedure

Procedure FrmHaubtFenster_Events(event)
  Select event
    Case #PB_Event_CloseWindow
      ProcedureReturn #False

    Case #PB_Event_Menu
      Select EventMenu()
      EndSelect

    Case #PB_Event_Gadget
      Select EventGadget()
        Case #FrmHauptfensterInfo
          FrmHauptfensterInfo(EventType())          
        Case #FrmHaubtfensterEnde
          FrmHaubtfensterEnde(EventType())          
      EndSelect
  EndSelect
  ProcedureReturn #True
EndProcedure
