﻿
DeclareModule Widget
  EnableExplicit
  
  ;- - STRUCTUREs
  ;- - Default_S
  Structure Default_S
    Gadget.i
    Window.i
    Type.i
    Event.i
    *Function
    *Widget.Widget_S
    *Active.Widget_S
  EndStructure
  
  ;- - Coordinate_S
  Structure Coordinate_S
    y.i[4]
    x.i[4]
    height.i[4]
    width.i[4]
  EndStructure
  
  ;- - Color_S
  Structure Color_S
    State.b ; entered; selected; focused; lostfocused
    Front.i[4]
    Line.i[4]
    Fore.i[4]
    Back.i[4]
    Frame.i[4]
    Alpha.a[2]
  EndStructure
  
  ;- - Page_S
  Structure Page_S
    Pos.i
    len.i
  EndStructure
  
  ;- - Align_S
  Structure Align_S
    X.i
    y.i
    x1.i
    y1.i
    Left.b
    Top.b
    Right.b
    Bottom.b
    Vertical.b
    Horizontal.b
  EndStructure
  
  ;- - Flag_S
  Structure Flag_S
    InLine.b
    Lines.b
    Buttons.b
    GridLines.b
    CheckBoxes.b
    FullSelection.b
    AlwaysSelection.b
    MultiSelect.b
    ClickSelect.b
  EndStructure
  
  ;- - Image_S
  Structure Image_S Extends Coordinate_S
    index.i
    adress.i
    change.b
    Align.Align_S
  EndStructure
  
  ;- - Text_S
  Structure Text_S Extends Coordinate_S
    Big.i[3]
    Pos.i
    Len.i
    Caret.i[3] ; 0 = Pos ; 1 = PosFixed
    
    FontID.i
    String.s[3]
    Count.i[2]
    Change.b
    
    Lower.b
    Upper.b
    Pass.b
    Editable.b
    Numeric.b
    MultiLine.b
    Vertical.b
    Rotate.f
    
    Align.Align_S
  EndStructure
  
  ;- - Bar_S
  Structure Bar_S Extends Coordinate_S
    *i          ; index parent item
    *p.Widget_S ; adress parent
    *s.Scroll_S ; 
    *Splitter.Scroll_S
    
    ; track bar
    Ticks.b
    
    ; progress bar
    Smooth.b
    
    at.b
    Type.i[3] ; [2] for splitter
    Radius.a
    ArrowSize.a[3]
    ArrowType.b[3]
    
    Max.i
    Min.i
    *Step
    Hide.b[2]
    
    Focus.b
    Change.i
    Resize.b
    Vertical.b
    Inverted.b
    Direction.i
    ButtonLen.i[4] 
    
    Page.Page_S
    Area.Page_S
    Thumb.Page_S
    Color.Color_S[4]
  EndStructure
  
  ;- - Scroll_S
  Structure Scroll_S Extends Coordinate_S
    *v.Widget_S
    *h.Widget_S
  EndStructure
  
  ;- - Items_S
  Structure Items_S Extends Coordinate_S
    index.i[3]  ; Index[0] of new list element ; inex[1]-entered ; index[2]-selected
    *adress.Items_S
    Drawing.i
    
    Image.Image_S
    Text.Text_S[4]
    box.Coordinate_S
    
    State.b
    Hide.b[2]
    Caret.i[3]  ; 0 = Pos ; 1 = PosFixed
    Checked.b[2]
    Vertical.b
    Radius.i
    
    change.b
    sublevel.i
    sublevellen.i
    
    collapsed.b
    childrens.i
    *data      ; set/get item data
  EndStructure
  
  ;- - Mouse_S
  Structure Mouse_S
    X.i
    Y.i
    at.i ; at point widget
    Wheel.i ; delta
    Buttons.i ; state
    *Delta.Mouse_S
  EndStructure
  
  ;- - Canvas_S
  Structure Canvas_S
    Mouse.Mouse_S
    Gadget.i[3]
    Window.i
    Widget.i
    
    Input.c
    Key.i[2]
  EndStructure
  
  
  ;- - Anchor_S
  Structure Anchor_S
    X.i
    Y.i
    Pos.i
    State.i
    Width.i
    Height.i
    *p.Widget_S ; adress parent
    Cursor.i[2]
    Color.Color_S[4]
  EndStructure
  
  ;- - Widget_S
  Structure Widget_S Extends Bar_S
    index.i[3]  ; Index[0] of new list element ; inex[1]-entered ; index[2]-selected
    adress.i
    Drawing.i
    Container.i
    
    *anchor.Anchor_S[12]
    Grid.i
    
    fs.i 
    bs.i
    TabHeight.i
    
    Text.Text_S
    Image.Image_S
    Flag.Flag_S
    
    List *Childrens.Widget_S()
    List *Tabs.Items_S()
    List *Draws.Items_S()
    
    *Tab.Widget_S
    
    *Align.Align_S
    clip.Coordinate_S
    
    Cursor.i[2]
    
    sublevellen.i
    Drag.i[2]
    Attribute.i
    List Items.Items_S()
    Canvas.Canvas_S
  EndStructure
  
  
  ;-
  ;- - DECLAREs CONSTANTs
  Enumeration #PB_Event_FirstCustomValue
    #PB_Event_Widget
  EndEnumeration
  
  Enumeration #PB_EventType_FirstCustomValue
    CompilerIf #PB_Compiler_Version =< 546
      #PB_EventType_Resize
    CompilerEndIf
    #PB_EventType_Free
    #PB_EventType_Create
    
    #PB_EventType_Repaint
    #PB_EventType_ScrollChange
  EndEnumeration
  
  #PB_GadgetType_Property = 40
  ;
  #PB_Bar_Minimum = 1
  #PB_Bar_Maximum = 2
  #PB_Bar_PageLength = 3
  #PB_Bar_NoButtons = 4
  #PB_Bar_Ticks = 1<<5
  #PB_Bar_Smooth = 1<<6
  
  #PB_Bar_Direction = 1<<2
  
  #PB_Flag_NoButtons = #PB_Tree_NoButtons                     ; 2 1 Hide the '+' node buttons.
  #PB_Flag_NoLines = #PB_Tree_NoLines                         ; 1 2 Hide the little lines between each nodes.
  #PB_Flag_CheckBoxes = #PB_Tree_CheckBoxes                   ; 4 256 Add a checkbox before each Item.
  #PB_Flag_ThreeState = #PB_Tree_ThreeState                   ; 8 65535 The checkboxes can have an "in between" state.
  
  
  #PB_Widget_First = 1<<7
  #PB_Widget_Second = 1<<8
  #PB_Widget_FirstFixed = 1<<9
  #PB_Widget_SecondFixed = 1<<10
  #PB_Widget_FirstMinimumSize = 1<<11
  #PB_Widget_SecondMinimumSize = 1<<12
  
  EnumerationBinary WidgetFlags
    #PB_Center
    #PB_Right
    #PB_Left = 4
    #PB_Top
    #PB_Bottom
    #PB_Vertical 
    #PB_Horizontal
    
    #PB_Toggle
    #PB_Bar_Inverted
    #PB_BorderLess
    
    #PB_Text_Numeric
    #PB_Text_ReadOnly
    #PB_Text_LowerCase 
    #PB_Text_UpperCase
    #PB_Text_Password
    #PB_Text_WordWrap
    #PB_Text_MultiLine 
    #PB_Text_InLine
    
    #PB_Flag_Double
    #PB_Flag_Flat
    #PB_Flag_Raised
    #PB_Flag_Single
    
    #PB_Flag_GridLines
    #PB_Flag_Invisible
    
    #PB_Flag_MultiSelect
    #PB_Flag_ClickSelect
    
    #PB_Flag_AutoSize
    #PB_Flag_AutoRight
    #PB_Flag_AutoBottom
    #PB_Flag_AnchorsGadget
    
    #PB_Flag_FullSelection; = 512 ; #PB_ListIcon_FullRowSelect
    
    #PB_Flag_Limit
  EndEnumeration
  
  If (#PB_Flag_Limit>>1) > 2147483647 ; 8589934592
    Debug "Исчерпан лимит в x32 ("+Str(#PB_Flag_Limit>>1)+")"
  EndIf
  
  #PB_Full = #PB_Left|#PB_Right|#PB_Top|#PB_Bottom
  #PB_Gadget_FrameColor = 10
  
  ; Set/Get Attribute
  #PB_DisplayMode = 1<<13
  #PB_Image = 1<<13
  #PB_Text = 1<<14
  #PB_Flag = 1<<15
  #PB_State = 1<<16
  
  
  #PB_DisplayMode_Default =- 1
  
  Enumeration
    #PB_DisplayMode_SmallIcon ;  = #PB_ListIcon_LargeIcon                 ; 0 0
    #PB_DisplayMode_LargeIcon ;  = #PB_ListIcon_SmallIcon                 ; 1 1
  EndEnumeration
  
  EnumerationBinary Attribute
    #PB_State_Selected        ; = #PB_Tree_Selected                       ; 1
    #PB_State_Expanded        ; = #PB_Tree_Expanded                       ; 2
    #PB_State_Checked         ; = #PB_Tree_Checked                        ; 4
    #PB_State_Collapsed       ; = #PB_Tree_Collapsed                      ; 8
    
    #PB_Image_Center
    #PB_Image_Mosaic
    #PB_Image_Stretch
    #PB_Image_Proportionally
    
    #PB_DisplayMode_NoFullSelection  ; = 512 ; #PB_ListIcon_FullRowSelect
    #PB_DisplayMode_AlwaysShowSelection                                    ; 0 32 Even If the gadget isn't activated, the selection is still visible.
  EndEnumeration
  
  ;- - DECLAREs GLOBALs
  Global *Value.Default_S
  
  Prototype.i Resize(*This, iX.i,iY.i,iWidth.i,iHeight.i) 
  
  ;- - DECLAREs MACROs
  ;-
  Macro IsBar(_this_)
    Bool(_this_ And _this_\Type);(_this_\Type = #PB_GadgetType_ScrollBar Or _this_\Type = #PB_GadgetType_TrackBar Or _this_\Type = #PB_GadgetType_ProgressBar Or _this_\Type = #PB_GadgetType_Splitter))
  EndMacro
  
  Macro IsList(_index_, _list_)
    Bool(_index_ >= 0 And _index_ < ListSize(_list_))
  EndMacro
  
  Macro SelectList(_index_, _list_)
    Bool(IsList(_index_, _list_) And _index_ <> ListIndex(_list_) And SelectElement(_list_, _index_))
  EndMacro
  
  Macro BoxGradient(_type_, _x_,_y_,_width_,_height_,_color_1_,_color_2_, _radius_=0, _alpha_=255)
    BackColor(_color_1_&$FFFFFF|_alpha_<<24)
    FrontColor(_color_2_&$FFFFFF|_alpha_<<24)
    If _type_
      LinearGradient(_x_,_y_, (_x_+_width_), _y_)
    Else
      LinearGradient(_x_,_y_, _x_, (_y_+_height_))
    EndIf
    RoundBox(_x_,_y_,_width_,_height_, _radius_,_radius_)
    BackColor(#PB_Default) : FrontColor(#PB_Default) ; bug
  EndMacro
  
  Macro X(_this_) 
    (_this_\X + Bool(_this_\hide[1] Or Not _this_\color\alpha) * _this_\Width) 
  EndMacro
  Macro Y(_this_) 
    (_this_\Y + Bool(_this_\hide[1] Or Not _this_\color\alpha) * _this_\Height) 
  EndMacro
  Macro Width(_this_) 
    (Bool(Not _this_\hide[1] And _this_\color\alpha) * _this_\Width) 
  EndMacro
  Macro Height(_this_) 
    (Bool(Not _this_\hide[1] And _this_\color\alpha) * _this_\Height) 
  EndMacro
  
  Macro IsStart(_this_)
    Bool(_this_\Page\Pos =< _this_\Min)
  EndMacro
  
  ; Then scroll bar end position
  Macro IsStop(_this_)
    Bool(_this_\Page\Pos >= (_this_\Max-_this_\Page\len))
  EndMacro
  
  ; Inverted scroll bar position
  Macro Invert(_this_, _scroll_pos_, _inverted_=1)
    (Bool(_inverted_) * ((_this_\Min + (_this_\Max - _this_\Page\len)) - (_scroll_pos_)) + Bool(Not _inverted_) * (_scroll_pos_))
  EndMacro
  
  Macro SetImage(_item_, _image_)
    IsImage(_image_)
    
    _item_\Image\change = 1
    _item_\image\index = _image_
    
    If IsImage(_image_)
      _item_\image\adress = ImageID(_image_)
      _item_\Image\width = ImageWidth(_image_)
      _item_\Image\height = ImageHeight(_image_)
    Else
      _item_\image\adress = 0
      _item_\Image\width = 0
      _item_\Image\height = 0
    EndIf
  EndMacro
  
  
  ;-
  ;- - DECLAREs
  ;-
  Declare.i Draw(*This.Widget_S)
  Declare.i GetState(*This.Widget_S)
  Declare.i SetState(*This.Widget_S, State.i)
  Declare.i GetAttribute(*This.Widget_S, Attribute.i)
  Declare.i SetAttribute(*This.Widget_S, Attribute.i, Value.i)
  Declare.i CallBack(*This.Widget_S, EventType.i, mouseX=0, mouseY=0)
  Declare.i SetColor(*This.Widget_S, ColorType.i, Color.i, State.i=0, Item.i=0)
  Declare.i Resize(*This.Widget_S, iX.i,iY.i,iWidth.i,iHeight.i);, *That.Widget_S=#Null)
  Declare.i Hide(*This.Widget_S, State.i)
  
  Declare.i SetAlignment(*This.Widget_S, Mode.i, Type.i=1)
  Declare.i SetItemData(*This.Widget_S, Item.i, *Data)
  Declare.i GetItemData(*This.Widget_S, Item.i)
  Declare.i CountItems(*This.Widget_S)
  Declare.i ClearItems(*This.Widget_S)
  Declare.i RemoveItem(*This.Widget_S, Item.i)
  Declare.i SetItemAttribute(*This.Widget_S, Item.i, Attribute.i, Value.i)
  Declare.i GetItemAttribute(*This.Widget_S, Item.i, Attribute.i)
  
  Declare.i Scroll(X.i,Y.i,Width.i,Height.i, Min.i, Max.i, PageLength.i, Flag.i=0, Radius.i=7)
  Declare.i Track(X.i,Y.i,Width.i,Height.i, Min.i, Max.i, Flag.i=0)
  Declare.i Progress(X.i,Y.i,Width.i,Height.i, Min.i, Max.i, Flag.i=0)
  Declare.i Splitter(X.i,Y.i,Width.i,Height.i, First.i, Second.i, Flag.i=0)
  Declare.i Image(X.i,Y.i,Width.i,Height.i, Image.i, Flag.i=0)
  Declare.i ScrollArea(X.i,Y.i,Width.i,Height.i, ScrollAreaWidth.i, ScrollAreaHeight.i, ScrollStep.i=1, Flag.i=0)
  Declare.i Button(X.i,Y.i,Width.i,Height.i, Text.s, Flag.i=0, Image.i=-1)
  Declare.i Container(X.i,Y.i,Width.i,Height.i, Flag.i=0)
  Declare.i Frame(X.i,Y.i,Width.i,Height.i, Text.s, Flag.i=0)
  Declare.i Panel(X.i,Y.i,Width.i,Height.i, Flag.i=0)
  Declare.i Text(X.i,Y.i,Width.i,Height.i, Text.s, Flag.i=0)
  Declare.i Tree(X.i,Y.i,Width.i,Height.i, Flag.i=0)
  Declare.i Window(X.i,Y.i,Width.i,Height.i, Text.s, Flag.i=0)
  Declare.i Property(X.i,Y.i,Width.i,Height.i, SplitterPos.i = 80, Flag.i=0)
  
  Declare.i OpenList(*This.Widget_S, Item.i=-1)
  Declare.i CloseList()
  Declare.i SetParent(*This.Widget_S, *Parent.Widget_S, Item.i=-1)
  Declare.i AddItem(*This.Widget_S, Item.i, Text.s, Image.i=-1, Flag.i=0)
  
  Declare.i Bars(*Scroll.Scroll_S, Size.i, Radius.i, Both.b)
  Declare.i Resizes(*Scroll.Scroll_S, X.i,Y.i,Width.i,Height.i)
  Declare.i Draws(*Scroll.Scroll_S, ScrollHeight.i, ScrollWidth.i)
  Declare.i Updates(*Scroll.Scroll_S, ScrollArea_X, ScrollArea_Y, ScrollArea_Width, ScrollArea_Height)
  Declare.i Arrow(X,Y, Size, Direction, Color, Style.b = 1, Length = 1)
EndDeclareModule

Module Widget
  ;- MODULE
  
  *Value = AllocateStructure(Default_S)
  *Value\Type =- 1
  *Value\Gadget =- 1
  *Value\Window =- 1
  
  Global Colors.Color_S
  Global NewList *openedlist.Widget_S()
  
  With Colors                          
    \State = 0
    ; - Синие цвета
    ; Цвета по умолчанию
    \Front[0] = $80000000
    \Fore[0] = $FFF8F8F8 
    \Back[0] = $80E2E2E2
    \Frame[0] = $80C8C8C8
    
    ; Цвета если мышь на виджете
    \Front[1] = $80000000
    \Fore[1] = $FFFAF8F8
    \Back[1] = $80FCEADA
    \Frame[1] = $80FFC288
    
    ; Цвета если нажали на виджет
    \Front[2] = $FFFEFEFE
    \Fore[2] = $C8E9BA81;$C8FFFCFA
    \Back[2] = $C8E89C3D; $80E89C3D
    \Frame[2] = $C8DC9338; $80DC9338
  EndWith
  
  CompilerIf #PB_Compiler_OS = #PB_OS_MacOS 
    Global _drawing_mode_
    
    Macro PB(Function)
      Function
    EndMacro
    
    Macro DrawingMode(_mode_)
      PB(DrawingMode)(_mode_) : _drawing_mode_ = _mode_
    EndMacro
    
    Macro ClipOutput(x, y, width, height)
      PB(ClipOutput)(x, y, width, height)
      ClipOutput_(x, y, width, height)
    EndMacro
    
    Macro UnclipOutput()
      PB(UnclipOutput)()
      ClipOutput_(0, 0, OutputWidth(), OutputHeight())
    EndMacro
    
    Macro DrawText(x, y, Text, FrontColor=$ffffff, BackColor=0)
      DrawRotatedText_(x, y, Text, 0, FrontColor, BackColor)
    EndMacro
    
    Macro DrawRotatedText(x, y, Text, Angle, FrontColor=$ffffff, BackColor=0)
      DrawRotatedText_(x, y, Text, Angle, FrontColor, BackColor)
    EndMacro
    
    
    Procedure.i DrawRotatedText_(x.CGFloat, y.CGFloat, Text.s, Angle.CGFloat, FrontColor=$ffffff, BackColor=0)
      Protected.CGFloat r,g,b,a
      Protected.i Transform, NSString, Attributes, Color
      Protected Size.NSSize, Point.NSPoint
      
      If Text.s
        CocoaMessage(@Attributes, 0, "NSMutableDictionary dictionaryWithCapacity:", 2)
        
        r = Red(FrontColor)/255 : g = Green(FrontColor)/255 : b = Blue(FrontColor)/255 : a = 1
        Color = CocoaMessage(0, 0, "NSColor colorWithDeviceRed:@", @r, "green:@", @g, "blue:@", @b, "alpha:@", @a)
        CocoaMessage(0, Attributes, "setValue:", Color, "forKey:$", @"NSColor")
        
        r = Red(BackColor)/255 : g = Green(BackColor)/255 : b = Blue(BackColor)/255 : a = Bool(_drawing_mode_&#PB_2DDrawing_Transparent=0)
        Color = CocoaMessage(0, 0, "NSColor colorWithDeviceRed:@", @r, "green:@", @g, "blue:@", @b, "alpha:@", @a)
        CocoaMessage(0, Attributes, "setValue:", Color, "forKey:$", @"NSBackgroundColor")  
        
        NSString = CocoaMessage(0, 0, "NSString stringWithString:$", @Text)
        CocoaMessage(@Size, NSString, "sizeWithAttributes:", Attributes)
        
        If Angle
          CocoaMessage(0, 0, "NSGraphicsContext saveGraphicsState")
          
          y = OutputHeight()-y
          Transform = CocoaMessage(0, 0, "NSAffineTransform transform")
          CocoaMessage(0, Transform, "translateXBy:@", @x, "yBy:@", @y)
          CocoaMessage(0, Transform, "rotateByDegrees:@", @Angle)
          x = 0 : y = -Size\height
          CocoaMessage(0, Transform, "translateXBy:@", @x, "yBy:@", @y)
          CocoaMessage(0, Transform, "concat")
          CocoaMessage(0, NSString, "drawAtPoint:@", @Point, "withAttributes:", Attributes)
          
          CocoaMessage(0, 0,  "NSGraphicsContext restoreGraphicsState")
        Else
          Point\x = x : Point\y = OutputHeight()-Size\height-y
          CocoaMessage(0, NSString, "drawAtPoint:@", @Point, "withAttributes:", Attributes)
        EndIf
      EndIf
    EndProcedure
    
    Procedure.i ClipOutput_(x.i, y.i, width.i, height.i)
      Protected Rect.NSRect
      Rect\origin\x = x 
      Rect\origin\y = OutputHeight()-height-y
      Rect\size\width = width 
      Rect\size\height = height
      
      CocoaMessage(0, CocoaMessage(0, 0, "NSBezierPath bezierPathWithRect:@", @Rect), "setClip")
      ;CocoaMessage(0, CocoaMessage(0, 0, "NSBezierPath bezierPathWithRect:@", @Rect), "addClip")
    EndProcedure
  CompilerEndIf
  
  Macro SetAutoSize(_this_, _state_)
    _this_\Canvas\Gadget = *Value\Gadget
    _this_\Canvas\Window = *Value\Window
    
    If Bool(_state_) : x=0 : y=0
      _this_\Align = AllocateStructure(Align_S)
      _this_\Align\Left = 1
      _this_\Align\Top = 1
      _this_\Align\Right = 1
      _this_\Align\Bottom = 1
    EndIf
  EndMacro
  
  Macro SetLastParent(_this_)
    ; Set parent
    If LastElement(*openedlist())
      If LastElement(*openedlist()\Tabs())
        SetParent(_this_, *openedlist(), ListIndex(*openedlist()\Tabs()))
      Else
        SetParent(_this_, *openedlist(), 0)
      EndIf
    EndIf
  EndMacro
  
  Macro ThumbLength(_this_)
    Round(_this_\Area\len - (_this_\Area\len / (_this_\Max-_this_\Min)) * ((_this_\Max-_this_\Min) - _this_\Page\len), #PB_Round_Nearest)
    : If _this_\Thumb\Len > _this_\Area\Len : _this_\Thumb\Len = _this_\Area\Len : EndIf 
    : If _this_\Vertical : _this_\Height[3] = _this_\Thumb\len : Else : _this_\Width[3] = _this_\Thumb\len : EndIf
  EndMacro
  
  Macro ThumbPos(_this_, _scroll_pos_)
    (_this_\Area\Pos + Round((_scroll_pos_-_this_\Min) * (_this_\Area\len / (_this_\Max-_this_\Min)), #PB_Round_Nearest)) 
    : If _this_\Thumb\Pos < _this_\Area\Pos : _this_\Thumb\Pos = _this_\Area\Pos : EndIf 
    : If _this_\Thumb\Pos > _this_\Area\Pos+_this_\Area\Len : _this_\Thumb\Pos = (_this_\Area\Pos+_this_\Area\Len)-_this_\Thumb\Len : EndIf 
    : If _this_\Vertical : _this_\Y[3] = _this_\Thumb\Pos : Else : _this_\X[3] = _this_\Thumb\Pos : EndIf
  EndMacro
  
  ;- Anchors
  Macro DrawAnchors(_this_)
    DrawingMode(#PB_2DDrawing_Outlined)
    If _this_\anchor[10] : Box(_this_\anchor[10]\x, _this_\anchor[10]\y, _this_\anchor[10]\width, _this_\anchor[10]\height ,_this_\anchor[10]\color[_this_\anchor[10]\State]\frame) : EndIf
    
    DrawingMode(#PB_2DDrawing_Default)
    If _this_\anchor[1] : Box(_this_\anchor[1]\x, _this_\anchor[1]\y, _this_\anchor[1]\width, _this_\anchor[1]\height ,_this_\anchor[1]\color[_this_\anchor[1]\State]\back) : EndIf
    If _this_\anchor[2] : Box(_this_\anchor[2]\x, _this_\anchor[2]\y, _this_\anchor[2]\width, _this_\anchor[2]\height ,_this_\anchor[2]\color[_this_\anchor[2]\State]\back) : EndIf
    If _this_\anchor[3] : Box(_this_\anchor[3]\x, _this_\anchor[3]\y, _this_\anchor[3]\width, _this_\anchor[3]\height ,_this_\anchor[3]\color[_this_\anchor[3]\State]\back) : EndIf
    If _this_\anchor[4] : Box(_this_\anchor[4]\x, _this_\anchor[4]\y, _this_\anchor[4]\width, _this_\anchor[4]\height ,_this_\anchor[4]\color[_this_\anchor[4]\State]\back) : EndIf
    If _this_\anchor[5] : Box(_this_\anchor[5]\x, _this_\anchor[5]\y, _this_\anchor[5]\width, _this_\anchor[5]\height ,_this_\anchor[5]\color[_this_\anchor[5]\State]\back) : EndIf
    If _this_\anchor[6] : Box(_this_\anchor[6]\x, _this_\anchor[6]\y, _this_\anchor[6]\width, _this_\anchor[6]\height ,_this_\anchor[6]\color[_this_\anchor[6]\State]\back) : EndIf
    If _this_\anchor[7] : Box(_this_\anchor[7]\x, _this_\anchor[7]\y, _this_\anchor[7]\width, _this_\anchor[7]\height ,_this_\anchor[7]\color[_this_\anchor[7]\State]\back) : EndIf
    If _this_\anchor[8] : Box(_this_\anchor[8]\x, _this_\anchor[8]\y, _this_\anchor[8]\width, _this_\anchor[8]\height ,_this_\anchor[8]\color[_this_\anchor[8]\State]\back) : EndIf
    If _this_\anchor[9] : Box(_this_\anchor[9]\x, _this_\anchor[9]\y, _this_\anchor[9]\width, _this_\anchor[9]\height ,_this_\anchor[9]\color[_this_\anchor[9]\State]\back) : EndIf
    
    DrawingMode(#PB_2DDrawing_Outlined)
    If _this_\anchor[1] : Box(_this_\anchor[1]\x, _this_\anchor[1]\y, _this_\anchor[1]\width, _this_\anchor[1]\height ,_this_\anchor[1]\color[_this_\anchor[1]\State]\frame) : EndIf
    If _this_\anchor[2] : Box(_this_\anchor[2]\x, _this_\anchor[2]\y, _this_\anchor[2]\width, _this_\anchor[2]\height ,_this_\anchor[2]\color[_this_\anchor[2]\State]\frame) : EndIf
    If _this_\anchor[3] : Box(_this_\anchor[3]\x, _this_\anchor[3]\y, _this_\anchor[3]\width, _this_\anchor[3]\height ,_this_\anchor[3]\color[_this_\anchor[3]\State]\frame) : EndIf
    If _this_\anchor[4] : Box(_this_\anchor[4]\x, _this_\anchor[4]\y, _this_\anchor[4]\width, _this_\anchor[4]\height ,_this_\anchor[4]\color[_this_\anchor[4]\State]\frame) : EndIf
    If _this_\anchor[5] : Box(_this_\anchor[5]\x, _this_\anchor[5]\y, _this_\anchor[5]\width, _this_\anchor[5]\height ,_this_\anchor[5]\color[_this_\anchor[5]\State]\frame) : EndIf
    If _this_\anchor[6] : Box(_this_\anchor[6]\x, _this_\anchor[6]\y, _this_\anchor[6]\width, _this_\anchor[6]\height ,_this_\anchor[6]\color[_this_\anchor[6]\State]\frame) : EndIf
    If _this_\anchor[7] : Box(_this_\anchor[7]\x, _this_\anchor[7]\y, _this_\anchor[7]\width, _this_\anchor[7]\height ,_this_\anchor[7]\color[_this_\anchor[7]\State]\frame) : EndIf
    If _this_\anchor[8] : Box(_this_\anchor[8]\x, _this_\anchor[8]\y, _this_\anchor[8]\width, _this_\anchor[8]\height ,_this_\anchor[8]\color[_this_\anchor[8]\State]\frame) : EndIf
    If _this_\anchor[9] : Box(_this_\anchor[9]\x, _this_\anchor[9]\y, _this_\anchor[9]\width, _this_\anchor[9]\height ,_this_\anchor[9]\color[_this_\anchor[9]\State]\frame) : EndIf
  EndMacro
  
  Macro ResizeAnchors(_this_)
    If _this_\anchor[1] 
      _this_\anchor[1]\x = _this_\x-_this_\anchor[1]\width+_this_\anchor[1]\Pos
      _this_\anchor[1]\y = _this_\y+(_this_\height-_this_\anchor[1]\height)/2
    EndIf
    If _this_\anchor[2] 
      _this_\anchor[2]\x = _this_\x+(_this_\width-_this_\anchor[2]\width)/2
      _this_\anchor[2]\y = _this_\y-_this_\anchor[2]\height+_this_\anchor[2]\Pos
    EndIf
    If  _this_\anchor[3]
      _this_\anchor[3]\x = _this_\x+_this_\width-_this_\anchor[3]\Pos
      _this_\anchor[3]\y = _this_\y+(_this_\height-_this_\anchor[3]\height)/2
    EndIf
    If _this_\anchor[4] 
      _this_\anchor[4]\x = _this_\x+(_this_\width-_this_\anchor[4]\width)/2
      _this_\anchor[4]\y = _this_\y+_this_\height-_this_\anchor[4]\Pos
    EndIf
    If _this_\anchor[5] 
      _this_\anchor[5]\x = _this_\x-_this_\anchor[5]\width+_this_\anchor[5]\Pos
      _this_\anchor[5]\y = _this_\y-_this_\anchor[5]\height+_this_\anchor[5]\Pos
    EndIf
    If _this_\anchor[6] 
      _this_\anchor[6]\x = _this_\x+_this_\width-_this_\anchor[6]\Pos
      _this_\anchor[6]\y = _this_\y-_this_\anchor[6]\height+_this_\anchor[6]\Pos
    EndIf
    If _this_\anchor[7] 
      _this_\anchor[7]\x = _this_\x+_this_\width-_this_\anchor[7]\Pos
      _this_\anchor[7]\y = _this_\y+_this_\height-_this_\anchor[7]\Pos
    EndIf
    If _this_\anchor[8] 
      _this_\anchor[8]\x = _this_\x-_this_\anchor[8]\width+_this_\anchor[8]\Pos
      _this_\anchor[8]\y = _this_\y+_this_\height-_this_\anchor[8]\Pos
    EndIf
    If _this_\anchor[9] 
      _this_\anchor[9]\x = _this_\x+(_this_\anchor[9]\Pos+2)
      _this_\anchor[9]\y = _this_\y-_this_\anchor[9]\height+_this_\anchor[9]\Pos 
    EndIf
    If _this_\anchor[10] 
      _this_\anchor[10]\x = _this_\x
      _this_\anchor[10]\y = _this_\y
      _this_\anchor[10]\width = _this_\width
      _this_\anchor[10]\height = _this_\height
    EndIf
  EndMacro
  
  Procedure SetAnchors(*This.Widget_S, State)
    Structure DataBuffer
      cursor.i[11]
    EndStructure
    
    Protected *Cursor.DataBuffer = ?CursorsBuffer
    
    With *This
      \Grid = 5
          
      If State
        Protected i
        
        For i=1 To 10-Bool(\Container)
          \anchor[i] = AllocateStructure(Anchor_S)
          \anchor[i]\p = *This
          \anchor[i]\Cursor = *Cursor\Cursor[i]
          \anchor[i]\Color[0]\Frame = $000000
          \anchor[i]\Color[1]\Frame = $FF0000
          \anchor[i]\Color[2]\Frame = $0000FF
          
          \anchor[i]\Color[0]\Back = $FFFFFF
          \anchor[i]\Color[1]\Back = $FFFFFF
          \anchor[i]\Color[2]\Back = $FFFFFF
          
          \anchor[i]\Height = 6
          \anchor[i]\Width = 6
          \anchor[i]\Pos = \anchor[i]\Height/2
        Next i
        \anchor[9]\Width * 2
      EndIf
    EndWith
    
    DataSection
      CursorsBuffer:
      Data.i 0
      Data.i #PB_Cursor_LeftRight
      Data.i #PB_Cursor_UpDown
      Data.i #PB_Cursor_LeftRight
      Data.i #PB_Cursor_UpDown
      Data.i #PB_Cursor_LeftUpRightDown
      Data.i #PB_Cursor_LeftDownRightUp
      Data.i #PB_Cursor_LeftUpRightDown
      Data.i #PB_Cursor_LeftDownRightUp
      Data.i #PB_Cursor_Hand
      Data.i #PB_Cursor_Arrows
    EndDataSection
    
  EndProcedure
  
  
  ;-
  Procedure.i SetAlignment(*This.Widget_S, Mode.i, Type.i=1)
    With *This
      If \p
        Select Type
          Case 1 ; widget
          Case 2 ; text
          Case 3 ; image
        EndSelect
        
        \Align.Align_S = AllocateStructure(Align_S)
        
        \Align\Right = 0
        \Align\Bottom = 0
        \Align\Left = 0
        \Align\Top = 0
        \Align\Horizontal = 0
        \Align\Vertical = 0
        
        If Mode&#PB_Right=#PB_Right
          \Align\x = (\p\Width-\p\bs*2 - (\x-\p\x-\p\bs)) - \Width
          \Align\Right = 1
        EndIf
        If Mode&#PB_Bottom=#PB_Bottom
          \Align\y = (\p\height-\p\bs*2 - (\y-\p\y-\p\bs)) - \height
          \Align\Bottom = 1
        EndIf
        If Mode&#PB_Left=#PB_Left
          \Align\Left = 1
          If Mode&#PB_Right=#PB_Right
            \Align\x1 = (\p\Width - \p\bs*2) - \Width
          EndIf
        EndIf
        If Mode&#PB_Top=#PB_Top
          \Align\Top = 1
          If Mode&#PB_Bottom=#PB_Bottom
            \Align\y1 = (\p\height -\p\bs*2)- \height
          EndIf
        EndIf
       
        If Mode&#PB_Center=#PB_Center
          \Align\Horizontal = 1
          \Align\Vertical = 1
        EndIf
        If Mode&#PB_Horizontal=#PB_Horizontal
          \Align\Horizontal = 1
        EndIf
        If Mode&#PB_Vertical=#PB_Vertical
          \Align\Vertical = 1
        EndIf
        
        Resize(\p, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
      EndIf
    EndWith
  EndProcedure
  
  Procedure.s Make(*This.Widget_S, Text.s)
    Protected String.s, i.i, Len.i
    
    With *This
      If \Text\Numeric And Text.s <> #LF$
        Static Dot, Minus
        Protected Chr.s, Input.i, left.s, count.i
        
        Len = Len(Text.s) 
        For i = 1 To Len 
          Chr = Mid(Text.s, i, 1)
          Input = Asc(Chr)
          
          Select Input
            Case '0' To '9', '.','-'
            Case 'Ю','ю','Б','б',44,47,60,62,63 : Input = '.' : Chr = Chr(Input)
            Default
              Input = 0
          EndSelect
          
          If Input
            If \Type = #PB_GadgetType_IPAddress
              left.s = Left(\Text\String, \Text\Caret)
              Select CountString(left.s, ".")
                Case 0 : left.s = StringField(left.s, 1, ".")
                Case 1 : left.s = StringField(left.s, 2, ".")
                Case 2 : left.s = StringField(left.s, 3, ".")
                Case 3 : left.s = StringField(left.s, 4, ".")
              EndSelect                                           
              count = Len(left.s+Trim(StringField(Mid(\Text\String, \Text\Caret+1), 1, "."), #LF$))
              If count < 3 And (Val(left.s) > 25 Or Val(left.s+Chr.s) > 255)
                Continue
                ;               ElseIf Mid(\Text\String, \Text\Caret + 1, 1) = "."
                ;                 \Text\Caret + 1 : \Text\Caret[1]=\Text\Caret
              EndIf
            EndIf
            
            If Not Dot And Input = '.' And Mid(\Text\String, \Text\Caret + 1, 1) <> "."
              Dot = 1
            ElseIf Input <> '.' And count < 3
              Dot = 0
            Else
              Continue
            EndIf
            
            If Not Minus And Input = '-' And Mid(\Text\String, \Text\Caret + 1, 1) <> "-"
              Minus = 1
            ElseIf Input <> '-'
              Minus = 0
            Else
              Continue
            EndIf
            
            String.s + Chr
          EndIf
        Next
        
      ElseIf \Text\Pass
        Len = Len(Text.s) 
        For i = 1 To Len : String.s + "●" : Next
        
      Else
        Select #True
          Case \Text\Lower : String.s = LCase(Text.s)
          Case \Text\Upper : String.s = UCase(Text.s)
          Default
            String.s = Text.s
        EndSelect
      EndIf
    EndWith
    
    ProcedureReturn String.s
  EndProcedure
  
  Procedure.s Wrap (*This.Widget_S, Text.s, Width.i, Mode=-1, nl$=#LF$, DelimList$=" "+Chr(9))
    Protected.i CountString, i, start, ii, found, length
    Protected line$, ret$="", LineRet$="", TextWidth
    
    ;     Text.s = ReplaceString(Text.s, #LFCR$, #LF$)
    ;     Text.s = ReplaceString(Text.s, #CRLF$, #LF$)
    ;     Text.s = ReplaceString(Text.s, #CR$, #LF$)
    ;     Text.s + #LF$
    ;  
    
    
    CountString = CountString(Text.s, #LF$) 
    ; Protected time = ElapsedMilliseconds()
    
    ; ;     Protected Len
    ; ;     Protected *s_0.Character = @Text.s
    ; ;     Protected *e_0.Character = @Text.s 
    ; ;     #SOC = SizeOf (Character)
    ; ;       While *e_0\c 
    ; ;         If *e_0\c = #LF
    ; ;           Len = (*e_0-*s_0)>>#PB_Compiler_Unicode
    ; ;           line$ = PeekS(*s_0, Len) ;Trim(, #LF$)
    
    For i = 1 To CountString
      line$ = StringField(Text.s, i, #LF$)
      start = Len(line$)
      length = start
      
      ; Get text len
      While length > 1
        ; Debug ""+TextWidth(RTrim(Left(Line$, length))) +" "+ GetTextWidth(RTrim(Left(Line$, length)), length)
        If width > TextWidth(RTrim(Left(Line$, length))) ; GetTextWidth(RTrim(Left(Line$, length)), length) ;   
          Break
        Else
          length - 1
        EndIf
      Wend 
      
      ;  Debug ""+start +" "+ length
      While start > length 
        If mode
          For ii = length To 0 Step - 1
            If mode = 2 And CountString(Left(line$,ii), " ") > 1     And width > 71 ; button
              found + FindString(delimList$, Mid(RTrim(line$),ii,1))
              If found <> 2
                Continue
              EndIf
            Else
              found = FindString(delimList$, Mid(line$,ii,1))
            EndIf
            
            If found
              start = ii
              Break
            EndIf
          Next
        EndIf
        
        If found
          found = 0
        Else
          start = length
        EndIf
        
        LineRet$ + Left(line$, start) + nl$
        line$ = LTrim(Mid(line$, start+1))
        start = Len(line$)
        length = start
        
        ; Get text len
        While length > 1
          ; Debug ""+TextWidth(RTrim(Left(Line$, length))) +" "+ GetTextWidth(RTrim(Left(Line$, length)), length)
          If width > TextWidth(RTrim(Left(Line$, length))) ; GetTextWidth(RTrim(Left(Line$, length)), length) ; 
            Break
          Else
            length - 1
          EndIf
        Wend 
        
      Wend   
      
      ret$ + LineRet$ + line$ + #CR$+nl$
      LineRet$=""
    Next
    
    ; ;       *s_0 = *e_0 + #SOC : EndIf : *e_0 + #SOC : Wend
    ;Debug  ElapsedMilliseconds()-time
    ; MessageRequester("",Str( ElapsedMilliseconds()-time))
    
    If Width > 1
      ProcedureReturn ret$ ; ReplaceString(ret$, " ", "*")
    EndIf
  EndProcedure
  
  Procedure.i Arrow(X.i,Y.i, Size.i, Direction.i, Color.i, Style.b = 1, Length.i = 1)
    Protected I
    
    If Not Length
      Style =- 1
    EndIf
    Length = (Size+2)/2
    
    
    If Direction = 1 ; top
      If Style > 0 : x-1 : y+2
        Size / 2
        For i = 0 To Size 
          LineXY((X+1+i)+Size,(Y+i-1)-(Style),(X+1+i)+Size,(Y+i-1)+(Style),Color)         ; Левая линия
          LineXY(((X+1+(Size))-i),(Y+i-1)-(Style),((X+1+(Size))-i),(Y+i-1)+(Style),Color) ; правая линия
        Next
      Else : x-1 : y-1
        For i = 1 To Length 
          If Style =- 1
            LineXY(x+i, (Size+y), x+Length, y, Color)
            LineXY(x+Length*2-i, (Size+y), x+Length, y, Color)
          Else
            LineXY(x+i, (Size+y)-i/2, x+Length, y, Color)
            LineXY(x+Length*2-i, (Size+y)-i/2, x+Length, y, Color)
          EndIf
        Next 
        i = Bool(Style =- 1) 
        LineXY(x, (Size+y)+Bool(i=0), x+Length, y+1, Color) 
        LineXY(x+Length*2, (Size+y)+Bool(i=0), x+Length, y+1, Color) ; bug
      EndIf
    ElseIf Direction = 3 ; bottom
      If Style > 0 : x-1 : y+2
        Size / 2
        For i = 0 To Size
          LineXY((X+1+i),(Y+i)-(Style),(X+1+i),(Y+i)+(Style),Color) ; Левая линия
          LineXY(((X+1+(Size*2))-i),(Y+i)-(Style),((X+1+(Size*2))-i),(Y+i)+(Style),Color) ; правая линия
        Next
      Else : x-1 : y+1
        For i = 0 To Length 
          If Style =- 1
            LineXY(x+i, y, x+Length, (Size+y), Color)
            LineXY(x+Length*2-i, y, x+Length, (Size+y), Color)
          Else
            LineXY(x+i, y+i/2-Bool(i=0), x+Length, (Size+y), Color)
            LineXY(x+Length*2-i, y+i/2-Bool(i=0), x+Length, (Size+y), Color)
          EndIf
        Next
      EndIf
    ElseIf Direction = 0 ; в лево
      If Style > 0 : y-1
        Size / 2
        For i = 0 To Size 
          ; в лево
          LineXY(((X+1)+i)-(Style),(((Y+1)+(Size))-i),((X+1)+i)+(Style),(((Y+1)+(Size))-i),Color) ; правая линия
          LineXY(((X+1)+i)-(Style),((Y+1)+i)+Size,((X+1)+i)+(Style),((Y+1)+i)+Size,Color)         ; Левая линия
        Next  
      Else : x-1 : y-1
        For i = 1 To Length
          If Style =- 1
            LineXY((Size+x), y+i, x, y+Length, Color)
            LineXY((Size+x), y+Length*2-i, x, y+Length, Color)
          Else
            LineXY((Size+x)-i/2, y+i, x, y+Length, Color)
            LineXY((Size+x)-i/2, y+Length*2-i, x, y+Length, Color)
          EndIf
        Next 
        i = Bool(Style =- 1) 
        LineXY((Size+x)+Bool(i=0), y, x+1, y+Length, Color) 
        LineXY((Size+x)+Bool(i=0), y+Length*2, x+1, y+Length, Color)
      EndIf
    ElseIf Direction = 2 ; в право
      If Style > 0 : y-1
        Size / 2
        For i = 0 To Size 
          ; в право
          LineXY(((X+1)+i)-(Style),((Y+1)+i),((X+1)+i)+(Style),((Y+1)+i),Color) ; Левая линия
          LineXY(((X+1)+i)-(Style),(((Y+1)+(Size*2))-i),((X+1)+i)+(Style),(((Y+1)+(Size*2))-i),Color) ; правая линия
        Next
      Else : y-1 : x+1
        For i = 0 To Length 
          If Style =- 1
            LineXY(x, y+i, Size+x, y+Length, Color)
            LineXY(x, y+Length*2-i, Size+x, y+Length, Color)
          Else
            LineXY(x+i/2-Bool(i=0), y+i, Size+x, y+Length, Color)
            LineXY(x+i/2-Bool(i=0), y+Length*2-i, Size+x, y+Length, Color)
          EndIf
        Next
      EndIf
    EndIf
    
  EndProcedure
  
  Procedure.i Match(Value.i, Grid.i, Max.i=$7FFFFFFF)
    ProcedureReturn ((Bool(Value>Max) * Max) + (Bool(Grid And Value<Max) * (Round((Value/Grid), #PB_Round_Nearest) * Grid)))
  EndProcedure
  
  Procedure.i Pos(*This.Widget_S, ThumbPos.i)
    Protected ScrollPos.i
    
    With *This
      ScrollPos = \Min + Round((ThumbPos - \Area\Pos) / (\Area\len / (\Max-\Min)), #PB_Round_Nearest)
      ScrollPos = Round(ScrollPos/(\Step + Bool(Not \Step)), #PB_Round_Nearest) * \Step
      If (\Vertical And \Type = #PB_GadgetType_TrackBar)
        ScrollPos = Invert(*This, ScrollPos, \Inverted)
      EndIf
    EndWith
    
    ProcedureReturn ScrollPos
  EndProcedure
  
  ;-
  Macro Resize_Splitter(_this_)
    If _this_\Vertical
      Resize(_this_\Splitter\v, 0, 0, _this_\width, _this_\Thumb\Pos-_this_\y)
      Resize(_this_\Splitter\h, 0, (_this_\Thumb\Pos+_this_\Thumb\len)-_this_\y, _this_\width, _this_\height-((_this_\Thumb\Pos+_this_\Thumb\len)-_this_\y))
    Else
      Resize(_this_\Splitter\v, 0, 0, _this_\Thumb\Pos-_this_\x, _this_\height)
      Resize(_this_\Splitter\h, (_this_\Thumb\Pos+_this_\Thumb\len)-_this_\x, 0, _this_\width-((_this_\thumb\Pos+_this_\thumb\len)-_this_\x), _this_\height)
    EndIf
  EndMacro
  
  Macro Resize_Childrens(_this_, _change_x_, _change_y_)
    ForEach _this_\Childrens()
      Resize(_this_\Childrens(), (_this_\Childrens()\x-_this_\x-_this_\bs) + _change_x_, (_this_\Childrens()\y-_this_\y-_this_\bs-_this_\TabHeight) + _change_y_, #PB_Ignore, #PB_Ignore)
    Next
  EndMacro
  
  ;-
  ;- DRAWING
  Procedure.i Draw_Box(X,Y, Width, Height, Type, Checked, Color, BackColor, Radius, Alpha=255) 
    Protected I, checkbox_backcolor
    
    DrawingMode(#PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
    If Checked
      BackColor = $F67905&$FFFFFF|255<<24
      BackColor($FFB775&$FFFFFF|255<<24) 
      FrontColor($F67905&$FFFFFF|255<<24)
    Else
      BackColor = $7E7E7E&$FFFFFF|255<<24
      BackColor($FFFFFF&$FFFFFF|255<<24)
      FrontColor($EEEEEE&$FFFFFF|255<<24)
    EndIf
    
    LinearGradient(X,Y, X, (Y+Height))
    RoundBox(X,Y,Width,Height, Radius,Radius)
    BackColor(#PB_Default) : FrontColor(#PB_Default) ; bug
    
    DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
    RoundBox(X,Y,Width,Height, Radius,Radius, BackColor)
    
    If Checked
      DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
      If Type = 1
        Circle(x+5,y+5,2,Color&$FFFFFF|alpha<<24)
      ElseIf Type = 3
        For i = 0 To 1
          LineXY((X+2),(i+Y+6),(X+3),(i+Y+7),Color&$FFFFFF|alpha<<24) ; Левая линия
          LineXY((X+7+i),(Y+2),(X+4+i),(Y+8),Color&$FFFFFF|alpha<<24) ; правая линия
                                                                      ;           LineXY((X+1),(i+Y+5),(X+3),(i+Y+7),Color&$FFFFFF|alpha<<24) ; Левая линия
                                                                      ;           LineXY((X+8+i),(Y+3),(X+3+i),(Y+8),Color&$FFFFFF|alpha<<24) ; правая линия
        Next
      EndIf
    EndIf
    
  EndProcedure
  
  Procedure.i Draw_Window(*This.Widget_S, scroll_x,scroll_y)
    With *This 
      Protected sx,sw,x = \x
      Protected px=2,py
      Protected start, stop
      
      Protected State_3 = \Color[3]\State
      Protected Alpha = \color\alpha<<24
      
      ; Draw thumb  
      If \Color\back[State_3]<>-1
        If \Color\Fore[State_3]
          DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
        EndIf
        BoxGradient( \Vertical, scroll_x+\X, scroll_y+\Y, \Width, \Height, \Color\Fore[State_3], \Color\Back[State_3], \Radius, \color\alpha)
      EndIf
      
      ; Draw thumb frame
      If \Color\Frame[State_3] 
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        RoundBox( scroll_x+\X, scroll_y+\Y, \Width, \Height, \Radius, \Radius, \Color\Frame[State_3]&$FFFFFF|Alpha)
      EndIf
      
      ; Draw string
      If \Text\String
        DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
        DrawText(scroll_x+\Text\x, scroll_y+\Text\y, \Text\String.s, \Color\Front[State_3]&$FFFFFF|Alpha)
      EndIf
      
      ; Draw image
      If \image\adress
        DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
        DrawAlphaImage(\image\adress, \Image\x, \Image\y, \color\alpha)
      EndIf
      
      ; 1 - frame
      If \Color\Frame<>-1
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        RoundBox( scroll_x+\X, scroll_y+\Y+\TabHeight, \Width, \Height-\TabHeight, \Radius, \Radius, \Color\Frame&$FFFFFF|Alpha)
      EndIf
      
    EndWith
  EndProcedure
  
  Procedure.i Draw_Scroll(*This.Widget_S, scroll_x,scroll_y)
    Protected.i State_0, State_1, State_2, State_3, Alpha, LinesColor
    
    With *This 
      ; ClipOutput(\x,\y,\width,\height)
      
      ;       Debug ""+Str(\Area\Pos+\Area\len) +" "+ \x[2]
      ;       Debug ""+Str(\Area\Pos+\Area\len) +" "+ \Y[2]
      ;Debug \width
      State_0 = \Color[0]\State
      State_1 = \Color[1]\State
      State_2 = \Color[2]\State
      State_3 = \Color[3]\State
      Alpha = \color\alpha<<24
      LinesColor = \Color[3]\Front[State_3]&$FFFFFF|Alpha
      
      ; Draw scroll bar background
      If \Color\Back[State_0]<>-1
        DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
        RoundBox( scroll_x+\X, scroll_y+\Y, \Width, \Height, \Radius, \Radius, \Color\Back[State_0]&$FFFFFF|Alpha)
      EndIf
      
      ; Draw line
      If \Color\Line[State_0]<>-1
        If \Vertical
          Line( scroll_x+\X, scroll_y+\Y, 1, \Page\len + Bool(\height<>\Page\len), \Color\Line[State_0]&$FFFFFF|Alpha)
        Else
          Line( scroll_x+\X, scroll_y+\Y, \Page\len + Bool(\width<>\Page\len), 1, \Color\Line[State_0]&$FFFFFF|Alpha)
        EndIf
      EndIf
      
      If \Thumb\len 
        ; Draw thumb  
        If \Color[3]\back[State_3]<>-1
          If \Color[3]\Fore[State_3]
            DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
          EndIf
          BoxGradient( \Vertical, scroll_x+\X[3], scroll_y+\Y[3], \Width[3], \Height[3], \Color[3]\Fore[State_3], \Color[3]\Back[State_3], \Radius, \color\alpha)
        EndIf
        
        ; Draw thumb frame
        If \Color[3]\Frame[State_3]<>-1
          DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
          RoundBox( scroll_x+\X[3], scroll_y+\Y[3], \Width[3], \Height[3], \Radius, \Radius, \Color[3]\Frame[State_3]&$FFFFFF|Alpha)
        EndIf
      EndIf
      
      If \ButtonLen[1]
        ; Draw buttons
        If \Color[1]\back[State_1]<>-1
          If \Color[1]\Fore[State_1]
            DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
          EndIf
          BoxGradient( \Vertical, scroll_x+\X[1], scroll_y+\Y[1], \Width[1], \Height[1], \Color[1]\Fore[State_1], \Color[1]\Back[State_1], \Radius, \color\alpha)
        EndIf
        
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        
        ; Draw buttons frame
        If \Color[1]\Frame[State_1]
          RoundBox( scroll_x+\X[1], scroll_y+\Y[1], \Width[1], \Height[1], \Radius, \Radius, \Color[1]\Frame[State_1]&$FFFFFF|Alpha)
        EndIf
        
        ; Draw arrows
        Arrow( scroll_x+\X[1]+( \Width[1]-\ArrowSize[1])/2, scroll_y+\Y[1]+( \Height[1]-\ArrowSize[1])/2, \ArrowSize[1], Bool( \Vertical),
               (Bool(Not IsStart(*This)) * \Color[1]\Front[State_1] + IsStart(*This) * \Color[1]\Frame[0])&$FFFFFF|Alpha, \ArrowType[1])
      EndIf
      
      If \ButtonLen[2]
        ; Draw buttons
        If \Color[2]\back[State_2]<>-1
          If \Color[2]\Fore[State_2]
            DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
          EndIf
          BoxGradient( \Vertical, scroll_x+\X[2], scroll_y+\Y[2], \Width[2], \Height[2], \Color[2]\Fore[State_2], \Color[2]\Back[State_2], \Radius, \color\alpha)
        EndIf
        
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        
        ; Draw buttons frame
        If \Color[2]\Frame[State_2]
          RoundBox( scroll_x+\X[2], scroll_y+\Y[2], \Width[2], \Height[2], \Radius, \Radius, \Color[2]\Frame[State_2]&$FFFFFF|Alpha)
        EndIf
        
        ; Draw arrows
        Arrow( scroll_x+\X[2]+( \Width[2]-\ArrowSize[2])/2, scroll_y+\Y[2]+( \Height[2]-\ArrowSize[2])/2, \ArrowSize[2], Bool( \Vertical)+2, 
               (Bool(Not IsStop(*This)) * \Color[2]\Front[State_2] + IsStop(*This) * \Color[2]\Frame[0])&$FFFFFF|Alpha, \ArrowType[2])
      EndIf
      
      If \Thumb\len And \Color[3]\Fore[State_3]<>-1  ; Draw thumb lines
        If \Focus And Not State_3 = 2
          LinesColor = $FF0000FF
        EndIf
        
        DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
        If \Vertical
          Line( scroll_x+\X[3]+(\Width[3]-8)/2, scroll_y+\Y[3]+\Height[3]/2-3,9,1, LinesColor)
          Line( scroll_x+\X[3]+(\Width[3]-8)/2, scroll_y+\Y[3]+\Height[3]/2,9,1, LinesColor)
          Line( scroll_x+\X[3]+(\Width[3]-8)/2, scroll_y+\Y[3]+\Height[3]/2+3,9,1, LinesColor)
        Else
          Line( scroll_x+\X[3]+\Width[3]/2-3, scroll_y+\Y[3]+(\Height[3]-8)/2,1,9, LinesColor)
          Line( scroll_x+\X[3]+\Width[3]/2, scroll_y+\Y[3]+(\Height[3]-8)/2,1,9, LinesColor)
          Line( scroll_x+\X[3]+\Width[3]/2+3, scroll_y+\Y[3]+(\Height[3]-8)/2,1,9, LinesColor)
        EndIf
      EndIf
      
    EndWith
  EndProcedure
  
  Procedure.i Draw_Tree(*This.Widget_S, scroll_x,scroll_y)
    Protected y_point,x_point, level,iY, start,i, back_color=$FFFFFF, point_color=$7E7E7E, box_color=$7E7E7E
    Protected hide_color=$FEFFFF, box_size = 9,box_1_size = 12, alpha = 255, item_alpha = 255
    Protected line_size=8, box_1_pos.b = 0, checkbox_color = $FFFFFF, checkbox_backcolor, box_type.b = -1
    Protected Drawing.I, text_color, State_3
    
    With *This
      If *This > 0
        If \Text\FontID : DrawingFont(\Text\FontID) : EndIf
        DrawingMode(#PB_2DDrawing_Default)
        Box(\x, \y, \width, \height, back_color)
        
        If ListSize(\items())
          
          ; set vertical bar state
          If \s\v\Max And \Change > 0
            If (\Change*\Text\height-\s\v\Page\len) > \s\v\Max
              \s\v\Page\Pos = (\Change*\Text\height-\s\v\Page\len)
            EndIf
          EndIf
          
          ForEach \items()
            If Not \items()\Text\change And Not \Resize And Not \Change
              Break
            EndIf
            
            If Not ListIndex(\Items())
              \s\Width=0
              \s\height=0
            EndIf
            
            If Not \items()\hide 
              \items()\width=\s\h\Page\len
              \items()\x=\s\h\x-\s\h\Page\Pos
              \items()\y=(\s\v\y+\s\height)-\s\v\Page\Pos
              
              If \items()\text\change = 1
                \items()\text\height = TextHeight("A")
                \items()\text\width = TextWidth(\items()\text\string.s)
              EndIf
              
              \items()\sublevellen=2+\items()\x+((Bool(\flag\Buttons) * \sublevellen)+\items()\sublevel * \sublevellen)
              
              \items()\box\width = box_size
              \items()\box\height = box_size
              \items()\box\x = \items()\sublevellen-(\sublevellen+\items()\box\width)/2
              \items()\box\y = (\items()\y+\items()\height)-(\items()\height+\items()\box\height)/2
              
              If \items()\image\adress
                \items()\Image\x = 3+\items()\sublevellen
                \items()\Image\y = \items()\y+(\items()\height-\items()\Image\height)/2
                
                \image\adress = \items()\image\adress
                \Image\width = \items()\Image\width+4
              EndIf
              
              \items()\text\x = 3+\items()\sublevellen+\Image\width
              \items()\text\y = \items()\y+(\items()\height-\items()\text\height)/2
              
              If \flag\CheckBoxes
                \items()\box\x+\sublevellen-2
                \items()\text\x+\sublevellen-2
                \items()\Image\x+\sublevellen-2 
                
                \items()\box\width[1] = box_1_size
                \items()\box\height[1] = box_1_size
                
                \items()\box\x[1] = \Items()\x+4
                \items()\box\y[1] = (\items()\y+\items()\height)-(\items()\height+\items()\box\height[1])/2
              EndIf
              
              \s\height+\items()\height
              
              If \s\Width < (\items()\text\x-\x+\items()\text\width)+\s\h\Page\Pos
                \s\Width = (\items()\text\x-\x+\items()\text\width)+\s\h\Page\Pos
              EndIf
            EndIf
              
              \Items()\Drawing = Bool(Not \items()\hide And \items()\y+\items()\height>\y+\bs And \items()\y<\y+\height-\bs)
              If \Items()\Drawing And Not Drawing
                Drawing = @\Items()
              EndIf
            
            \items()\text\change = 0
            \items()\change = 0
          Next
          
          If Drawing
            \Drawing = Drawing
          EndIf
          
          If \Drawing
            ChangeCurrentElement(\Items(), \Drawing)
            Repeat 
              If \Items()\Drawing
                State_3 = \Items()\State
              
                ; Draw selections
                If \flag\FullSelection
                  If State_3 = 1
                    DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                    Box(\items()\x+1+\s\h\Page\Pos,\items()\y+1,\items()\width-2,\items()\height-2, \Color\Back[State_3]&$FFFFFFFF|item_alpha<<24)
                    
                    DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                    Box(\items()\x+\s\h\Page\Pos,\items()\y,\items()\width,\items()\height, \Color\Frame[State_3]&$FFFFFFFF|item_alpha<<24)
                  EndIf
                  
                  If State_3 = 2
                    If \Focus : item_alpha = 200
                      DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                      Box(\items()\x+1+\s\h\Page\Pos,\items()\y+1,\items()\width-2,\items()\height-2, $E89C3D&back_color|item_alpha<<24)
                      
                      DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                      Box(\items()\x+\s\h\Page\Pos,\items()\y,\items()\width,\items()\height, $DC9338&back_color|item_alpha<<24)
                    Else
                      ;If \flag\AlwaysSelection
                      DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                      Box(\items()\x+1+\s\h\Page\Pos,\items()\y+1,\items()\width-2,\items()\height-2, $E2E2E2&back_color|item_alpha<<24)
                      
                      DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                      Box(\items()\x+\s\h\Page\Pos,\items()\y,\items()\width,\items()\height, $C8C8C8&back_color|item_alpha<<24)
                      ;EndIf
                    EndIf
                  EndIf
                EndIf
                
                ; Draw boxes
                If \flag\Buttons And \items()\childrens
                  If box_type=-1
                    DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                    Widget::Arrow(\items()\box\X[0]+(\items()\box\Width[0]-6)/2,\items()\box\Y[0]+(\items()\box\height[0]-6)/2, 6, Bool(Not \items()\collapsed)+2, \Color\Front[Bool(\Focus) * State_3]&$FFFFFFFF|alpha<<24, 0,0) 
                  Else
                    DrawingMode(#PB_2DDrawing_Gradient)
                    BackColor($FFFFFF) : FrontColor($EEEEEE)
                    LinearGradient(\items()\box\x, \items()\box\y, \items()\box\x, (\items()\box\y+\items()\box\height))
                    RoundBox(\items()\box\x+1,\items()\box\y+1,\items()\box\width-2,\items()\box\height-2,box_type,box_type)
                    BackColor(#PB_Default) : FrontColor(#PB_Default) ; bug
                    
                    DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                    RoundBox(\items()\box\x,\items()\box\y,\items()\box\width,\items()\box\height,box_type,box_type,box_color&$FFFFFF|alpha<<24)
                    
                    Line(\items()\box\x+2,\items()\box\y+\items()\box\height/2 ,\items()\box\width/2+1,1, box_color&$FFFFFF|alpha<<24)
                    If \items()\collapsed : Line(\items()\box\x+\items()\box\width/2,\items()\box\y+2,1,\items()\box\height/2+1, box_color&$FFFFFF|alpha<<24) : EndIf
                  EndIf
                EndIf
                
                ; Draw plot
                If \flag\Lines 
                  x_point=\items()\box\x+\items()\box\width/2
                  y_point=\items()\box\y+\items()\box\height/2
                  
                  If x_point>\x+\fs
                    ; Horisontal plot
                    DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                    Line(x_point,y_point,line_size,1, point_color&$FFFFFF|alpha<<24)
                    
                    ; Vertical plot
                    If \items()\adress 
                      start=Bool(Not \items()\sublevel)
                      
                      If start 
                        start = (\y+\fs*2+\items()\adress\height/2)-\s\v\Page\Pos
                      Else 
                        start = \items()\adress\y+\items()\adress\height+\items()\adress\height/2-line_size
                      EndIf
                      
                      Line(x_point,start,1,y_point-start, point_color&$FFFFFF|alpha<<24)
                    EndIf
                  EndIf
                EndIf
                
                ; Draw checkbox
                If \flag\CheckBoxes
                  Draw_Box(\items()\box\x[1],\items()\box\y[1],\items()\box\width[1],\items()\box\height[1], 3, \items()\Checked, checkbox_color, box_color, 2, alpha);, box_type)
                EndIf
                
                ; Draw image
                If \items()\image\adress
                  DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                  DrawAlphaImage(\items()\image\adress, \items()\Image\x, \items()\Image\y, alpha)
                EndIf
                
                ; Draw string
                If \items()\text\string.s
                  DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                  DrawText(\items()\text\x, \items()\text\y, \items()\text\string.s, \Color\Front[Bool(\Focus) * State_3]&$FFFFFFFF|alpha<<24)
                EndIf
              EndIf
            
            Until Not NextElement(\Items())
          EndIf
          
          
        EndIf
        
        
        ; Задаем размеры скролл баров
        If \s\v And \s\v\Page\Len And \s\v\Max<>\s\height And 
           Widget::SetAttribute(\s\v, #PB_Bar_Maximum, \s\height)
          Widget::Resizes(\s, \x-\s\h\x+1, \y-\s\v\y+1, #PB_Ignore, #PB_Ignore)
          \s\v\Step = \Text\height
        EndIf
        
        If \s\h And \s\h\Page\Len And \s\h\Max<>\s\Width And 
           Widget::SetAttribute(\s\h, #PB_Bar_Maximum, \s\Width)
          Widget::Resizes(\s, \x-\s\h\x+1, \y-\s\v\y+1, #PB_Ignore, #PB_Ignore)
        EndIf
        
        ;         If \bs
        ;           DrawingMode(#PB_2DDrawing_Outlined)
        ;           Box(\x, \y, \width, \height, $ADADAE)
        ;         EndIf
      EndIf
    EndWith
    
  EndProcedure
  
  Procedure.i Draw_ScrollArea(*This.Widget_S, scroll_x,scroll_y)
    Protected Alpha.i
    
    With *This 
      Alpha = \color\alpha<<24
      
      ; draw background
      If \Color\Back<>-1
        DrawingMode( #PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
        RoundBox(scroll_x+\X+2,scroll_y+\Y+2,\Width-4,\height-4, \Radius, \Radius, \Color\Back&$FFFFFF|Alpha)
      EndIf
      
      ; 1 - frame
      If \Color\Frame<>-1
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        RoundBox( scroll_x+\X, scroll_y+\Y, \Width, \Height, \Radius, \Radius, \Color\Frame&$FFFFFF|Alpha)
      EndIf
      
      If \s And (\s\v And \s\h)
        DrawingMode(#PB_2DDrawing_Outlined)
        Box(scroll_x+\s\h\x-GetState(\s\h), scroll_y+\s\v\y-GetState(\s\v), \s\h\Max, \s\v\Max, $FFFF0000)
        Box(scroll_x+\s\h\x, scroll_y+\s\v\y, \s\h\Page\Len, \s\v\Page\Len, $FF00FF00)
      EndIf
      
    EndWith
  EndProcedure
  
  Procedure.i Draw_Container(*This.Widget_S, scroll_x,scroll_y)
    Protected Alpha.i
    
    With *This 
      Alpha = \color\alpha<<24
      
      ; draw background
      If \Color\Back<>-1
        DrawingMode( #PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
        RoundBox(scroll_x+\X+2,scroll_y+\Y+2,\Width-4,\height-4, \Radius, \Radius, \Color\Back&$FFFFFF|Alpha)
      EndIf
      
      ; 1 - frame
      If \Color\Frame<>-1
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        RoundBox( scroll_x+\X, scroll_y+\Y, \Width, \Height, \Radius, \Radius, \Color\Frame&$FFFFFF|Alpha)
      EndIf
      
      If \s And (\s\v And \s\h)
        DrawingMode(#PB_2DDrawing_Outlined)
        Box(scroll_x+\s\h\x-GetState(\s\h), scroll_y+\s\v\y-GetState(\s\v), \s\h\Max, \s\v\Max, $FFFF0000)
        Box(scroll_x+\s\h\x, scroll_y+\s\v\y, \s\h\Page\Len, \s\v\Page\Len, $FF00FF00)
      EndIf
      
    EndWith
  EndProcedure
  
  Procedure.i Draw_Frame(*This.Widget_S, scroll_x,scroll_y)
    Protected Alpha.i
    
    With *This 
      Alpha = \color\alpha<<24
      
      ; 1 - frame
      If \Color\Frame<>-1
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        RoundBox( scroll_x+\X, scroll_y+\Y+\Text\height/2, \Width, \Height-\Text\height/2, \Radius, \Radius, \Color\Frame&$FFFFFF|Alpha)
        Line(scroll_x+\Text\x+5, scroll_y+\Y+\Text\height/2, \Text\width+6, 1)
      EndIf
      
      DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
      DrawText(scroll_x+\Text\x+8, scroll_y+\Text\y, \Text\String.s, \Color\Front&$FFFFFF|Alpha)
    EndWith
  EndProcedure
  
  Procedure.i Draw_Panel(*This.Widget_S, scroll_x,scroll_y)
    Protected Alpha.i
    
    With *This 
      Alpha = \color\alpha<<24
      Protected sx,sw,x = \x
      Protected State_3,px=2,py
      Protected start, stop
      
      ClipOutput(\clip\x+\Tab\ButtonLen[1]+3, \clip\y, \clip\width-\Tab\ButtonLen[1]-\Tab\ButtonLen[2]-6, \clip\height)
      
      ForEach \Tabs()
        If \index[2] = \Tabs()\index ; ListIndex(\Tabs()) ; (\Index=*This\Index[1] Or \Index=\focus Or \Index=\Index[1])
          State_3 = 2
          py=0
        Else
          State_3 = \Tabs()\State
          py=4
        EndIf
        
        \Tabs()\Image\x[1] = 8 ; Bool(\Tabs()\Image\width) * 4
        
        If \Tabs()\Text\Change
          \Tabs()\Text\width = TextWidth(\Tabs()\Text\String)
          \Tabs()\Text\height = TextHeight("A")
        EndIf
        
        \Tabs()\y = scroll_y+\y+py
        \Tabs()\x = scroll_x+x+px-\Tab\Page\Pos  + (\Tab\ButtonLen[1]+1)
        
        \Tabs()\width = \Tabs()\Text\width + \Tabs()\Image\x[1]*2 + \Tabs()\Image\width + Bool(\Tabs()\Image\width) * 3; +8+Bool(\Tabs()\Image\width) * (\Tabs()\Image\width+\Tabs()\Image\x[1]*2)+Bool(Not \Tabs()\Image\width) * 10
        x + \Tabs()\width + 1
        
        \Tabs()\Image\x = \Tabs()\x+\Tabs()\Image\x[1] - 1
        \Tabs()\Image\y = \Tabs()\y+((\Tabs()\height-py+Bool(State_3 = 2)*4)-\Tabs()\Image\height)/2
        
        \Tabs()\Text\x = \Tabs()\Image\x + \Tabs()\Image\width + Bool(\Tabs()\Image\width) * 3
        \Tabs()\Text\y = \Tabs()\y+((\Tabs()\height-py+Bool(State_3 = 2)*4)-\Tabs()\Text\height)/2
        
        If \index[2] = \Tabs()\index
          sx = \Tabs()\x
          sw = \Tabs()\width
          start = Bool(\Tabs()\x<\Tab\Area\Pos+1 And \Tabs()\x+\Tabs()\width>\Tab\Area\Pos+1)*2
          stop = Bool(\Tabs()\x<\Tab\Area\Pos+\Tab\Area\len-2 And \Tabs()\x+\Tabs()\width>\Tab\Area\Pos+\Tab\Area\len-2)*2
        EndIf
        
        ; Draw thumb  
        If \Color\back[State_3]<>-1
          If \Color\Fore[State_3]
            DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
          EndIf
          BoxGradient( \Vertical, \Tabs()\X, \Tabs()\Y+Bool(State_3 = 2)*2, \Tabs()\Width, \Tabs()\Height-py-1-Bool(State_3 = 2)*(\Tabs()\Height-4), \Color\Fore[State_3], \Color\Back[State_3], \Radius, \color\alpha)
        EndIf
        
        ; Draw string
        If \Tabs()\Text\String
          DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
          DrawText(\Tabs()\Text\x, \Tabs()\Text\y, \Tabs()\Text\String.s, \Color\Front[0]&$FFFFFF|Alpha)
        EndIf
        
        ; Draw image
        If \Tabs()\image\adress
          DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
          DrawAlphaImage(\Tabs()\image\adress, \Tabs()\Image\x, \Tabs()\Image\y, \color\alpha)
        EndIf
        
        ; Draw thumb frame
        If \Color\Frame[State_3] 
          DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
          
          If State_3 = 2
            Line(\Tabs()\X, \Tabs()\Y+Bool(State_3 = 2)*2, \Tabs()\Width, 1, \Color\Frame[State_3]&$FFFFFF|Alpha)
            Line(\Tabs()\X, \Tabs()\Y+Bool(State_3 = 2)*2, 1, \Tabs()\Height-py-1, \Color\Frame[State_3]&$FFFFFF|Alpha)
            Line(\Tabs()\X+\Tabs()\width-1, \Tabs()\Y+Bool(State_3 = 2)*2, 1, \Tabs()\Height-py-1, \Color\Frame[State_3]&$FFFFFF|Alpha)
          Else
            RoundBox( \Tabs()\X, \Tabs()\Y+Bool(State_3 = 2)*2, \Tabs()\Width, \Tabs()\Height-py-1, \Radius, \Radius, \Color\Frame[State_3]&$FFFFFF|Alpha)
          EndIf
        EndIf
        
        \Tabs()\Text\Change = 0
      Next
      
      If ListSize(\Tabs()) And SetAttribute(\Tab, #PB_Bar_Maximum, (\Tab\ButtonLen[1]+(((\Tabs()\x+\Tab\Page\Pos)-\x)+\Tabs()\width)))
        \Tab\Step = \Tab\Thumb\len
      EndIf
      
      ClipOutput(\clip\x, \clip\y, \clip\width, \clip\height)
      
      ; Линии на концах 
      DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
      If Not IsStart(\Tab)
        Line( scroll_x+\Tab\Area\Pos+1, scroll_y+\Tab\y+3, 1, \Tab\height-5+start, \Color\Frame[start]&$FFFFFF|Alpha)
      EndIf
      If Not IsStop(\Tab)
        Line( scroll_x+(\Tab\Area\Pos+\Tab\Area\len-2), scroll_y+\Tab\y+3, 1, \Tab\height-5+stop, \Color\Frame[stop]&$FFFFFF|Alpha)
      EndIf
      
      ; 1 - frame
      If \Color\Frame<>-1
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        ;RoundBox( scroll_x+\X, scroll_y+\Y+\Tab\Height, \Width, \Height-\Tab\Height, \Radius, \Radius, \Color\Frame&$FFFFFF|Alpha)
        Line(scroll_x+\X, scroll_y+\Y+\Tab\Height, \Tab\Area\Pos-\x, 1, \Color\Frame&$FFFFFF|Alpha)
        
        Line(scroll_x+\Tab\Area\Pos, scroll_y+\Y+\Tab\Height, sx-\Tab\Area\Pos, 1, \Color\Frame&$FFFFFF|Alpha)
        Line(scroll_x+sx+sw, scroll_y+\Y+\Tab\Height, \width-((sx+sw)-\x), 1, \Color\Frame&$FFFFFF|Alpha)
        
        Line(scroll_x+\Tab\Area\Pos+\Tab\Area\len, scroll_y+\Y+\Tab\Height, \Tab\Area\Pos-\x, 1, \Color\Frame&$FFFFFF|Alpha)
        
        Line(scroll_x+\X, scroll_y+\Y+\Tab\Height, 1, \Height-\Tab\Height, \Color\Frame&$FFFFFF|Alpha)
        Line(scroll_x+\X+\width-1, scroll_y+\Y+\Tab\Height, 1, \Height-\Tab\Height, \Color\Frame&$FFFFFF|Alpha)
        Line(scroll_x+\X, scroll_y+\Y+\height-1, \width, 1, \Color\Frame&$FFFFFF|Alpha)
      EndIf
      
    EndWith
    
    With *This\Tab
      Protected State_1 = \Color[1]\State
      Protected State_2 = \Color[2]\State
      
      If \ButtonLen[1] Or \ButtonLen[2]
        ; Draw buttons
        If State_1 
          DrawingMode( #PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
          RoundBox( scroll_x+\X[1], scroll_y+\Y[1]+2, \Width[1], \Height[1]-4, \Radius, \Radius, \Color[1]\Back[State_1]&$FFFFFF|Alpha)
          DrawingMode( #PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
          RoundBox( scroll_x+\X[1], scroll_y+\Y[1]+2, \Width[1], \Height[1]-4, \Radius, \Radius, \Color[1]\Frame[State_1]&$FFFFFF|Alpha)
        EndIf
        
        If State_2 
          DrawingMode( #PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
          RoundBox( scroll_x+\X[2], scroll_y+\Y[2]+2, \Width[2], \Height[2]-4, \Radius, \Radius, \Color[2]\Back[State_2]&$FFFFFF|Alpha)
          DrawingMode( #PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
          RoundBox( scroll_x+\X[2], scroll_y+\Y[2]+2, \Width[2], \Height[2]-4, \Radius, \Radius, \Color[2]\Frame[State_2]&$FFFFFF|Alpha)
        EndIf
        
        ; Draw arrows
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        Arrow( scroll_x+\X[1]+( \Width[1]-\ArrowSize[1])/2, scroll_y+\Y[1]+( \Height[1]-\ArrowSize[1])/2, \ArrowSize[1], Bool( \Vertical),
               (Bool(Not IsStart(*This\Tab)) * \Color[1]\Front[State_1] + IsStart(*This\Tab) * \Color[1]\Frame[0])&$FFFFFF|Alpha, \ArrowType[1])
        
        Arrow( scroll_x+\X[2]+( \Width[2]-\ArrowSize[2])/2, scroll_y+\Y[2]+( \Height[2]-\ArrowSize[2])/2, \ArrowSize[2], Bool( \Vertical)+2, 
               (Bool(Not IsStop(*This\Tab)) * \Color[2]\Front[State_2] + IsStop(*This\Tab) * \Color[2]\Frame[0])&$FFFFFF|Alpha, \ArrowType[2])
      EndIf
    EndWith
  EndProcedure
  
  Procedure.i Draw_Progress(*This.Widget_S, scroll_x,scroll_y)
    With *This 
      ; Draw progress
      If \Vertical
        DrawingMode(#PB_2DDrawing_Default)
        RoundBox(scroll_x+\X+2,scroll_y+\y,\Width-4,\Thumb\Pos, \Radius, \Radius,\Color[3]\Back)
        
        DrawingMode(#PB_2DDrawing_Outlined)
        RoundBox(scroll_x+\X+2,scroll_y+\y+2,\Width-4,\Thumb\Pos-2, \Radius, \Radius,\Color[3]\Frame)
        
        DrawingMode(#PB_2DDrawing_Default)
        RoundBox(scroll_x+\X+2,scroll_y+\Thumb\Pos+\y,\Width-4,(\height-\Thumb\Pos), \Radius, \Radius,\Color[3]\Back[2])
        
        DrawingMode(#PB_2DDrawing_Transparent)
        DrawRotatedText(scroll_x+\x+(\width+TextHeight("A")+2)/2, scroll_y+\y+(\height-TextWidth("%"+Str(\Page\Pos)))/2, "%"+Str(\Page\Pos), Bool(\Vertical) * 270, 0)
      Else
        DrawingMode(#PB_2DDrawing_Default)
        RoundBox(scroll_x+\Thumb\Pos,scroll_y+\Y+2,\width-(\Thumb\Pos-\x),\height-4, \Radius, \Radius,\Color[3]\Back)
        
        DrawingMode(#PB_2DDrawing_Outlined)
        RoundBox(scroll_x+\Thumb\Pos,scroll_y+\Y+2,\width-(\Thumb\Pos-\x)-2,\height-4, \Radius, \Radius,\Color[3]\Frame)
        
        DrawingMode(#PB_2DDrawing_Default)
        RoundBox(scroll_x+\X,scroll_y+\Y+2,(\Thumb\Pos-\x),\height-4, \Radius, \Radius,\Color[3]\Back[2])
        
        DrawingMode(#PB_2DDrawing_Transparent)
        DrawText(scroll_x+\x+(\width-TextWidth("%"+Str(\Page\Pos)))/2, scroll_y+\y+(\height-TextHeight("A"))/2, "%"+Str(\Page\Pos),0)
        
        ;Debug ""+\x+" "+\Thumb\Pos
      EndIf
      
      ; 2 - frame
      If \Color\Back<>-1
        DrawingMode(#PB_2DDrawing_Outlined)
        RoundBox( scroll_x+\X+1, scroll_y+\Y+1, \Width-2, \Height-2, \Radius, \Radius, \Color\Back)
      EndIf
      
      ; 1 - frame
      If \Color[3]\Frame<>-1
        DrawingMode(#PB_2DDrawing_Outlined)
        RoundBox( scroll_x+\X, scroll_y+\Y, \Width, \Height, \Radius, \Radius, \Color[3]\Frame)
      EndIf
      
    EndWith
  EndProcedure
  
  Procedure.i Draw_Splitter(*This.Widget_S, scroll_x,scroll_y)
    Protected IsVertical,Pos, Size, X,Y,Width,Height, fColor, Color
    Protected Radius.d = 2, Border=1, Circle=1, Separator=0
    
    With *This
      If *This > 0
        X = scroll_x+\X
        Y = scroll_y+\Y
        Width = \Width 
        Height = \Height
        
        ; Позиция сплиттера 
        Size = \Thumb\len
        
        If \Vertical
          Pos = \Thumb\Pos-y
        Else
          Pos = \Thumb\Pos-x
        EndIf
        
        If Border And (Pos > 0 And pos < \Area\len)
          fColor = 0;\Color[3]\Frame[0]
          DrawingMode(#PB_2DDrawing_Outlined) 
          If \Vertical
            If \Type[1]<>#PB_GadgetType_Splitter
              Box(X,Y,Width,Pos,fColor) 
            EndIf
            If \Type[2]<>#PB_GadgetType_Splitter
              Box( X,Y+(Pos+Size),Width,(Height-(Pos+Size)),fColor)
            EndIf
          Else
            If \Type[1]<>#PB_GadgetType_Splitter
              Box(X,Y,Pos,Height,fColor) 
            EndIf 
            If \Type[2]<>#PB_GadgetType_Splitter
              Box(X+(Pos+Size), Y,(Width-(Pos+Size)),Height,fColor)
            EndIf
          EndIf
        EndIf
        
        If Circle
          Color = 0;\Color[3]\Frame[\Color[3]\State]
          DrawingMode(#PB_2DDrawing_Outlined) 
          If \Vertical ; horisontal
                       ;;ClipOutput(\x[3], \y[3]+\height[3]-\Thumb\len, \width[3], \Thumb\len);, $0000FF)
            Circle(X+((Width-Radius)/2-((Radius*2+2)*2+2)),Y+Pos+Size/2,Radius,Color)
            Circle(X+((Width-Radius)/2-(Radius*2+2)),Y+Pos+Size/2,Radius,Color)
            Circle(X+((Width-Radius)/2),Y+Pos+Size/2,Radius,Color)
            Circle(X+((Width-Radius)/2+(Radius*2+2)),Y+Pos+Size/2,Radius,Color)
            Circle(X+((Width-Radius)/2+((Radius*2+2)*2+2)),Y+Pos+Size/2,Radius,Color)
            ;;UnclipOutput()
          Else
            ;;ClipOutput(\x[3]+\width[3]-\Thumb\len, \y[3], \Thumb\len, \height[3]);, $0000FF)
            Circle(X+Pos+Size/2,Y+((Height-Radius)/2-((Radius*2+2)*2+2)),Radius,Color)
            Circle(X+Pos+Size/2,Y+((Height-Radius)/2-(Radius*2+2)),Radius,Color)
            Circle(X+Pos+Size/2,Y+((Height-Radius)/2),Radius,Color)
            Circle(X+Pos+Size/2,Y+((Height-Radius)/2+(Radius*2+2)),Radius,Color)
            Circle(X+Pos+Size/2,Y+((Height-Radius)/2+((Radius*2+2)*2+2)),Radius,Color)
            ;;UnclipOutput()
          EndIf
          
        ElseIf Separator
          DrawingMode(#PB_2DDrawing_Outlined) 
          If \Vertical
            ;Box(X,(Y+Pos),Width,Size,Color)
            Line(X,(Y+Pos)+Size/2,Width,1,Color)
          Else
            ;Box(X+Pos,Y,Size,Height,Color)
            Line((X+Pos)+Size/2,Y,1,Height,Color)
          EndIf
        EndIf
        
; ;         If \Vertical
; ;           ;Box(\x[3], \y[3]+\height[3]-\Thumb\len, \width[3], \Thumb\len, $FF0000)
; ;           Box(X,Y,Width,Height/2,$FF0000)
; ;         Else
; ;           ;Box(\x[3]+\width[3]-\Thumb\len, \y[3], \Thumb\len, \height[3], $FF0000)
; ;           Box(X,Y,Width/2,Height,$FF0000)
; ;         EndIf
      EndIf
      
    EndWith
  EndProcedure
  
  Procedure.i Draw_Track(*This.Widget_S, scroll_x,scroll_y)
    With *This 
      Protected i, a = 3
      DrawingMode(#PB_2DDrawing_Default)
      Box(scroll_x+*This\X[0],scroll_y+*This\Y[0],*This\Width[0],*This\Height[0],\Color[0]\Back)
      
      If \Vertical
        DrawingMode(#PB_2DDrawing_Default)
        Box(scroll_x+\X[0]+5,scroll_y+\Y[0],a,\Height[0],\Color[3]\Frame)
        Box(scroll_x+\X[0]+5,scroll_y+\Y[0]+\Thumb\Pos,a,(\y+\height)-\Thumb\Pos,\Color[3]\Back[2])
      Else
        DrawingMode(#PB_2DDrawing_Default)
        Box(scroll_x+\X[0],scroll_y+\Y[0]+5,\Width[0],a,\Color[3]\Frame)
        Box(scroll_x+\X[0],scroll_y+\Y[0]+5,\Thumb\Pos-\x,a,\Color[3]\Back[2])
      EndIf
      
      If \Vertical
        DrawingMode(#PB_2DDrawing_Default)
        Box(scroll_x+\X[3],scroll_y+\Y[3],\Width[3]/2,\Height[3],\Color[3]\Back[\Color[3]\State])
        
        Line(scroll_x+\X[3],scroll_y+\Y[3],1,\Height[3],\Color[3]\Frame[\Color[3]\State])
        Line(scroll_x+\X[3],scroll_y+\Y[3],\Width[3]/2,1,\Color[3]\Frame[\Color[3]\State])
        Line(scroll_x+\X[3],scroll_y+\Y[3]+\Height[3]-1,\Width[3]/2,1,\Color[3]\Frame[\Color[3]\State])
        Line(scroll_x+\X[3]+\Width[3]/2,scroll_y+\Y[3],\Width[3]/2,\Height[3]/2+1,\Color[3]\Frame[\Color[3]\State])
        Line(scroll_x+\X[3]+\Width[3]/2,scroll_y+\Y[3]+\Height[3]-1,\Width[3]/2,-\Height[3]/2-1,\Color[3]\Frame[\Color[3]\State])
        
      Else
        DrawingMode(#PB_2DDrawing_Default)
        Box(scroll_x+\X[3],scroll_y+\Y[3],\Width[3],\Height[3]/2,\Color[3]\Back[\Color[3]\State])
        
        Line(scroll_x+\X[3],scroll_y+\Y[3],\Width[3],1,\Color[3]\Frame[\Color[3]\State])
        Line(scroll_x+\X[3],scroll_y+\Y[3],1,\Height[3]/2,\Color[3]\Frame[\Color[3]\State])
        Line(scroll_x+\X[3]+\Width[3]-1,scroll_y+\Y[3],1,\Height[3]/2,\Color[3]\Frame[\Color[3]\State])
        Line(scroll_x+\X[3],scroll_y+\Y[3]+\Height[3]/2,\Width[3]/2+1,\Height[3]/2,\Color[3]\Frame[\Color[3]\State])
        Line(scroll_x+\X[3]+\Width[3]-1,scroll_y+\Y[3]+\Height[3]/2,-\Width[3]/2-1,\Height[3]/2,\Color[3]\Frame[\Color[3]\State])
      EndIf
      
      If \Ticks
        Protected PlotStep = (\width)/(\Max-\Min)
        
        For i=3 To (\Width-PlotStep)/2 
          If Not ((scroll_x+\X+i-3)%PlotStep)
            Box(scroll_x+\X+i, scroll_y+\Y[3]+\Height[3]-4, 1, 4, $FF808080)
          EndIf
        Next
        For i=\Width To (\Width-PlotStep)/2+3 Step - 1
          If Not ((scroll_x+\X+i-6)%PlotStep)
            Box(scroll_x+\X+i, scroll_y+\Y[3]+\Height[3]-4, 1, 4, $FF808080)
          EndIf
        Next
      EndIf
      
      
    EndWith
  EndProcedure
  
  Procedure.i Draw_Image(*This.Widget_S, scroll_x,scroll_y)
    With *This 
      ; Draw image
      ClipOutput(scroll_x+\x+2,scroll_y+\y+2,\s\h\Page\len,\s\v\Page\len)
      If \image\adress
        DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
        DrawAlphaImage(\image\adress, scroll_x+\Image\x, scroll_y+\Image\y, \color\alpha)
      EndIf
      UnclipOutput()  
      
      ; 2 - frame
      If \Color\Back<>-1
        DrawingMode(#PB_2DDrawing_Outlined)
        RoundBox( scroll_x+\X+1, scroll_y+\Y+1, \Width-2, \Height-2, \Radius, \Radius, \Color\Back)
      EndIf
      
      ; 1 - frame
      If \Color\Frame<>-1
        DrawingMode(#PB_2DDrawing_Outlined)
        RoundBox( scroll_x+\X, scroll_y+\Y, \Width, \Height, \Radius, \Radius, \Color\Frame)
      EndIf
      
    EndWith
    
    With *This\s
      ; Scroll area coordinate
      Box(scroll_x+\h\x-\h\Page\Pos, scroll_y+\v\y-\v\Page\Pos, \h\Max, \v\Max, $FF0000)
      
      ; page coordinate
      Box(scroll_x+\h\x, scroll_y+\v\y, \h\Page\Len, \v\Page\Len, $00FF00)
      
    EndWith
  EndProcedure
  
  Procedure.i Draw_Button(*This.Widget_S, scroll_x,scroll_y)
    With *This
      Protected State_3 = \Color[3]\State
      Protected Alpha = \color\alpha<<24
      
      ; Draw thumb  
      If \Color\back[State_3]<>-1
        If \Color\Fore[State_3]
          DrawingMode( #PB_2DDrawing_Gradient|#PB_2DDrawing_AlphaBlend)
        EndIf
        BoxGradient( \Vertical, scroll_x+\X, scroll_y+\Y, \Width, \Height, \Color\Fore[State_3], \Color\Back[State_3], \Radius, \color\alpha)
      EndIf
      
      ; Draw thumb frame
      If \Color\Frame[State_3] 
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        RoundBox( scroll_x+\X, scroll_y+\Y, \Width, \Height, \Radius, \Radius, \Color\Frame[State_3]&$FFFFFF|Alpha)
      EndIf
      
      ; Draw string
      If \Text\String
        DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
        DrawText(scroll_x+\Text\x, scroll_y+\Text\y, \Text\String.s, \Color\Front[State_3]&$FFFFFF|Alpha)
      EndIf
      
      ; Draw image
      If \image\adress
        DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
        DrawAlphaImage(\image\adress, \Image\x, \Image\y, \color\alpha)
      EndIf
      
    EndWith 
  EndProcedure
  
  Procedure.i Draw_Text(*This.Widget_S, scroll_x,scroll_y)
    With *This
      Protected Alpha = \color\alpha<<24
      
      ; Draw frame
      If \Color\Frame
        DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
        RoundBox( scroll_x+\X, scroll_y+\Y, \Width, \Height, \Radius, \Radius, \Color\Frame&$FFFFFF|Alpha)
      EndIf
      
      ; Draw string
      If \Text\String
        DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
        DrawText(scroll_x+\Text\x, scroll_y+\Text\y, \Text\String.s, \Color\Front&$FFFFFF|Alpha)
      EndIf
    EndWith 
  EndProcedure
  
  Procedure.i Draw_Property(*This.Widget_S, scroll_x,scroll_y)
    Protected y_point,x_point, level,iY, start,i, back_color=$FFFFFF, point_color=$7E7E7E, box_color=$7E7E7E
    Protected hide_color=$FEFFFF, box_size = 9,box_1_size = 12, alpha = 255, item_alpha = 255
    Protected line_size=8, box_1_pos.b = 0, checkbox_color = $FFFFFF, checkbox_backcolor, box_type.b = -1
    Protected Drawing.I, text_color, State_3
    
          
          Protected IsVertical,Pos, Size, X,Y,Width,Height, fColor, Color
    Protected Radius.d = 2, Border=1, Circle=1, Separator=0
    
    
    With *This
      If *This > 0
        If \Text\FontID : DrawingFont(\Text\FontID) : EndIf
        DrawingMode(#PB_2DDrawing_Default)
        Box(\x, \y, \width, \height, back_color)
        
        If ListSize(\items())
          
          X = scroll_x+\X
            Y = scroll_y+\Y
            Width = \Width 
            Height = \Height
            
            ; Позиция сплиттера 
            Size = \Thumb\len
            
            If \Vertical
              Pos = \Thumb\Pos-y
            Else
              Pos = \Thumb\Pos-x
            EndIf
            
            
          ; set vertical bar state
          If \s\v\Max And \Change > 0
            If (\Change*\Text\height-\s\h\Page\len) > \s\h\Max
              \s\h\Page\Pos = (\Change*\Text\height-\s\h\Page\len)
            EndIf
          EndIf
          
          ForEach \items()
            If Not \items()\Text\change And Not \Resize And Not \Change
              Break
            EndIf
            
            If Not ListIndex(\Items())
              \s\Width=0
              \s\height=0
            EndIf
            
            If Not \items()\hide 
              \items()\width=\s\h\Page\len
              \items()\x=\s\h\x-\s\h\Page\Pos
              \items()\y=(\s\v\y+\s\height)-\s\v\Page\Pos
              
              If \items()\text\change = 1
                \items()\text\height = TextHeight("A")
                \items()\text\width = TextWidth(\items()\text\string.s)
              EndIf
              
              \items()\sublevellen=2+\items()\x+((Bool(\flag\Buttons) * \sublevellen)+\items()\sublevel * \sublevellen)
              
              \items()\box\width = box_size
              \items()\box\height = box_size
              \items()\box\x = \items()\sublevellen-(\sublevellen+\items()\box\width)/2
              \items()\box\y = (\items()\y+\items()\height)-(\items()\height+\items()\box\height)/2
              
              If \items()\image\adress
                \items()\Image\x = 3+\items()\sublevellen
                \items()\Image\y = \items()\y+(\items()\height-\items()\Image\height)/2
                
                \image\adress = \items()\image\adress
                \Image\width = \items()\Image\width+4
              EndIf
              
              \items()\text\x = 3+\items()\sublevellen+\Image\width
              \items()\text\y = \items()\y+(\items()\height-\items()\text\height)/2
              
              If \flag\CheckBoxes
                \items()\box\x+\sublevellen-2
                \items()\text\x+\sublevellen-2
                \items()\Image\x+\sublevellen-2 
                
                \items()\box\width[1] = box_1_size
                \items()\box\height[1] = box_1_size
                
                \items()\box\x[1] = \Items()\x+4
                \items()\box\y[1] = (\items()\y+\items()\height)-(\items()\height+\items()\box\height[1])/2
              EndIf
              
              \s\height+\items()\height
              
              If \s\Width < (\items()\text\x-\x+\items()\text\width)+\s\h\Page\Pos
                \s\Width = (\items()\text\x-\x+\items()\text\width)+\s\h\Page\Pos
              EndIf
            EndIf
              
              \Items()\Drawing = Bool(Not \items()\hide And \items()\y+\items()\height>\y+\bs And \items()\y<\y+\height-\bs)
              If \Items()\Drawing And Not Drawing
                Drawing = @\Items()
              EndIf
            
            \items()\text\change = 0
            \items()\change = 0
          Next
          
          If Drawing
            \Drawing = Drawing
          EndIf
          
          If \Drawing
            ChangeCurrentElement(\Items(), \Drawing)
            Repeat 
              If \Items()\Drawing
                State_3 = \Items()\State
              
                ; Draw selections
                If \flag\FullSelection
                  If State_3 = 1
                    DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                    Box(\items()\x+1+\s\h\Page\Pos,\items()\y+1,\items()\width-2,\items()\height-2, \Color\Back[State_3]&$FFFFFFFF|item_alpha<<24)
                    
                    DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                    Box(\items()\x+\s\h\Page\Pos,\items()\y,\items()\width,\items()\height, \Color\Frame[State_3]&$FFFFFFFF|item_alpha<<24)
                  EndIf
                  
                  If State_3 = 2
                    If \Focus : item_alpha = 200
                      DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                      Box(\items()\x+1+\s\h\Page\Pos,\items()\y+1,\items()\width-2,\items()\height-2, $E89C3D&back_color|item_alpha<<24)
                      
                      DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                      Box(\items()\x+\s\h\Page\Pos,\items()\y,\items()\width,\items()\height, $DC9338&back_color|item_alpha<<24)
                    Else
                      ;If \flag\AlwaysSelection
                      DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                      Box(\items()\x+1+\s\h\Page\Pos,\items()\y+1,\items()\width-2,\items()\height-2, $E2E2E2&back_color|item_alpha<<24)
                      
                      DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                      Box(\items()\x+\s\h\Page\Pos,\items()\y,\items()\width,\items()\height, $C8C8C8&back_color|item_alpha<<24)
                      ;EndIf
                    EndIf
                  EndIf
                EndIf
                
                ; Draw boxes
                If \flag\Buttons And \items()\childrens
                  If box_type=-1
                    DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                    Widget::Arrow(\items()\box\X[0]+(\items()\box\Width[0]-6)/2,\items()\box\Y[0]+(\items()\box\height[0]-6)/2, 6, Bool(Not \items()\collapsed)+2, \Color\Front[Bool(\Focus) * State_3]&$FFFFFFFF|alpha<<24, 0,0) 
                  Else
                    DrawingMode(#PB_2DDrawing_Gradient)
                    BackColor($FFFFFF) : FrontColor($EEEEEE)
                    LinearGradient(\items()\box\x, \items()\box\y, \items()\box\x, (\items()\box\y+\items()\box\height))
                    RoundBox(\items()\box\x+1,\items()\box\y+1,\items()\box\width-2,\items()\box\height-2,box_type,box_type)
                    BackColor(#PB_Default) : FrontColor(#PB_Default) ; bug
                    
                    DrawingMode(#PB_2DDrawing_Outlined|#PB_2DDrawing_AlphaBlend)
                    RoundBox(\items()\box\x,\items()\box\y,\items()\box\width,\items()\box\height,box_type,box_type,box_color&$FFFFFF|alpha<<24)
                    
                    Line(\items()\box\x+2,\items()\box\y+\items()\box\height/2 ,\items()\box\width/2+1,1, box_color&$FFFFFF|alpha<<24)
                    If \items()\collapsed : Line(\items()\box\x+\items()\box\width/2,\items()\box\y+2,1,\items()\box\height/2+1, box_color&$FFFFFF|alpha<<24) : EndIf
                  EndIf
                EndIf
                
                ; Draw plot
                If \flag\Lines 
                  x_point=\items()\box\x+\items()\box\width/2
                  y_point=\items()\box\y+\items()\box\height/2
                  
                  If x_point>\x+\fs
                    ; Horisontal plot
                    DrawingMode(#PB_2DDrawing_Default|#PB_2DDrawing_AlphaBlend)
                    Line(x_point,y_point,line_size,1, point_color&$FFFFFF|alpha<<24)
                    
                    ; Vertical plot
                    If \items()\adress 
                      start=Bool(Not \items()\sublevel)
                      
                      If start 
                        start = (\y+\fs*2+\items()\adress\height/2)-\s\v\Page\Pos
                      Else 
                        start = \items()\adress\y+\items()\adress\height+\items()\adress\height/2-line_size
                      EndIf
                      
                      Line(x_point,start,1,y_point-start, point_color&$FFFFFF|alpha<<24)
                    EndIf
                  EndIf
                EndIf
                
                ; Draw checkbox
                If \flag\CheckBoxes
                  Draw_Box(\items()\box\x[1],\items()\box\y[1],\items()\box\width[1],\items()\box\height[1], 3, \items()\Checked, checkbox_color, box_color, 2, alpha);, box_type)
                EndIf
                
                ; Draw image
                If \items()\image\adress
                  DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                  DrawAlphaImage(\items()\image\adress, \items()\Image\x, \items()\Image\y, alpha)
                EndIf
                
          
                ClipOutput(\clip\x,\clip\y,\clip\width-(\width-(\Thumb\Pos-\x)),\clip\height)
                
                 ; Draw string
                If \items()\text\string.s
                  DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                  DrawText(\items()\text\x, \items()\text\y, \items()\text\string.s, \Color\Front[Bool(\Focus) * State_3]&$FFFFFFFF|alpha<<24)
                EndIf
                
                ClipOutput(\clip\x+(\Thumb\Pos-\x),\clip\y,\clip\width-(\Thumb\Pos-\x),\clip\height)
          
                ;\items()\text[1]\x[1] = 5
                \items()\text[1]\x = \x+\items()\text[1]\x[1]+\Thumb\len
                \items()\text[1]\y = \items()\text\y
                 ; Draw string
                If \items()\text[1]\string.s
                  DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
                  DrawText(\items()\text[1]\x+pos, \items()\text[1]\y, \items()\text[1]\string.s, \Color\Front[Bool(\Focus) * State_3]&$FFFFFFFF|alpha<<24)
                EndIf
                
                ClipOutput(\clip\x,\clip\y,\clip\width,\clip\height)
             EndIf
            
            Until Not NextElement(\Items())
          EndIf
          
          If *This > 0
            If Border And (Pos > 0 And pos < \Area\len)
              fColor = 0;\Color[3]\Frame[0]
              DrawingMode(#PB_2DDrawing_Outlined) 
              If \Vertical
                If \Type[1]<>#PB_GadgetType_Splitter
                  Box(X,Y,Width,Pos,fColor) 
                EndIf
                If \Type[2]<>#PB_GadgetType_Splitter
                  Box( X,Y+(Pos+Size),Width,(Height-(Pos+Size)),fColor)
                EndIf
              Else
                If \Type[1]<>#PB_GadgetType_Splitter
                  Box(X,Y,Pos,Height,fColor) 
                EndIf 
                If \Type[2]<>#PB_GadgetType_Splitter
                  Box(X+(Pos+Size), Y,(Width-(Pos+Size)),Height,fColor)
                EndIf
              EndIf
            EndIf
            
            If Circle
              Color = 0;\Color[3]\Frame[\Color[3]\State]
              DrawingMode(#PB_2DDrawing_Outlined) 
              If \Vertical ; horisontal
                           ;;ClipOutput(\x[3], \y[3]+\height[3]-\Thumb\len, \width[3], \Thumb\len);, $0000FF)
                Circle(X+((Width-Radius)/2-((Radius*2+2)*2+2)),Y+Pos+Size/2,Radius,Color)
                Circle(X+((Width-Radius)/2-(Radius*2+2)),Y+Pos+Size/2,Radius,Color)
                Circle(X+((Width-Radius)/2),Y+Pos+Size/2,Radius,Color)
                Circle(X+((Width-Radius)/2+(Radius*2+2)),Y+Pos+Size/2,Radius,Color)
                Circle(X+((Width-Radius)/2+((Radius*2+2)*2+2)),Y+Pos+Size/2,Radius,Color)
                ;;UnclipOutput()
              Else
                ;;ClipOutput(\x[3]+\width[3]-\Thumb\len, \y[3], \Thumb\len, \height[3]);, $0000FF)
                Circle(X+Pos+Size/2,Y+((Height-Radius)/2-((Radius*2+2)*2+2)),Radius,Color)
                Circle(X+Pos+Size/2,Y+((Height-Radius)/2-(Radius*2+2)),Radius,Color)
                Circle(X+Pos+Size/2,Y+((Height-Radius)/2),Radius,Color)
                Circle(X+Pos+Size/2,Y+((Height-Radius)/2+(Radius*2+2)),Radius,Color)
                Circle(X+Pos+Size/2,Y+((Height-Radius)/2+((Radius*2+2)*2+2)),Radius,Color)
                ;;UnclipOutput()
              EndIf
              
            ElseIf Separator
              DrawingMode(#PB_2DDrawing_Outlined) 
              If \Vertical
                ;Box(X,(Y+Pos),Width,Size,Color)
                Line(X,(Y+Pos)+Size/2,Width,1,Color)
              Else
                ;Box(X+Pos,Y,Size,Height,Color)
                Line((X+Pos)+Size/2,Y,1,Height,Color)
              EndIf
            EndIf
            
            ; ;         If \Vertical
            ; ;           ;Box(\x[3], \y[3]+\height[3]-\Thumb\len, \width[3], \Thumb\len, $FF0000)
            ; ;           Box(X,Y,Width,Height/2,$FF0000)
            ; ;         Else
            ; ;           ;Box(\x[3]+\width[3]-\Thumb\len, \y[3], \Thumb\len, \height[3], $FF0000)
            ; ;           Box(X,Y,Width/2,Height,$FF0000)
            ; ;         EndIf
          EndIf
          
        EndIf
        
        
        ; Задаем размеры скролл баров
        If \s\v And \s\v\Page\Len And \s\v\Max<>\s\height And 
           Widget::SetAttribute(\s\v, #PB_Bar_Maximum, \s\height)
          Widget::Resizes(\s, \x-\s\h\x+1, \y-\s\v\y+1, #PB_Ignore, #PB_Ignore)
          \s\v\Step = \Text\height
        EndIf
        
        If \s\h And \s\h\Page\Len And \s\h\Max<>\s\Width And 
           Widget::SetAttribute(\s\h, #PB_Bar_Maximum, \s\Width)
          Widget::Resizes(\s, \x-\s\h\x+1, \y-\s\v\y+1, #PB_Ignore, #PB_Ignore)
        EndIf
        
        ;         If \bs
        ;           DrawingMode(#PB_2DDrawing_Outlined)
        ;           Box(\x, \y, \width, \height, $ADADAE)
        ;         EndIf
      EndIf
    EndWith
    
  EndProcedure
  
  
  Procedure.i Draw(*This.Widget_S)
    Protected x,y
    
    If *This > 0 And *This\Type 
      With *This
        CompilerIf #PB_Compiler_OS <>#PB_OS_MacOS 
          DrawingFont(GetGadgetFont(-1))
        CompilerEndIf
        
        ; Get text size
        If \Text\Change
          \Text\width = TextWidth(\Text\String.s[1])
          \Text\height = TextHeight("A")
        EndIf
        
        ; Make multi line text
        If \Text\Change Or \Resize
          If \Text\MultiLine > 0
            \Text\String.s = Wrap(*This, \Text\String.s[1], \Width-\bs*2, \Text\MultiLine)
          Else
            \Text\String.s = \Text\String.s[1]
          EndIf
          
          
          ; Text coordinate
          If \Text\String
            \Text\x[1] = (Bool((\Text\Align\Right Or \Text\Align\Horizontal)) * (\width-\Text\width)) / (\Text\Align\Horizontal+1) : \Text\x = \Text\x[1]+\x
            \Text\y[1] = (Bool((\Text\Align\Bottom Or \Text\Align\Vertical)) * (\height-\Text\height)) / (\Text\Align\Vertical+1) : \Text\y = \Text\y[1]+\y
          EndIf
          
          ; Image coordinate
          If \image\adress
            If (\Type = #PB_GadgetType_Image)
              \Image\x[1] = (Bool(\s\h\Page\len>\Image\width And (\Image\Align\Right Or \Image\Align\Horizontal)) * (\s\h\Page\len-\Image\width)) / (\Image\Align\Horizontal+1)
              \Image\y[1] = (Bool(\s\v\Page\len>\Image\height And (\Image\Align\Bottom Or \Image\Align\Vertical)) * (\s\v\Page\len-\Image\height)) / (\Image\Align\Vertical+1)
              \Image\y = \s\y+\Image\y[1]+\y+\bs+\TabHeight
              \Image\x = \s\x+\Image\x[1]+\x+\bs
            Else
              \Image\x[1] = (Bool(\Image\Align\Right Or \Image\Align\Horizontal) * (\width-\Image\width)) / (\Image\Align\Horizontal+1)
              \Image\y[1] = (Bool(\Image\Align\Bottom Or \Image\Align\Vertical) * (\height-\Image\height)) / (\Image\Align\Vertical+1)
              \Image\y = \Image\y[1]+\y+\bs+\TabHeight
              \Image\x = \Image\x[1]+\x+\bs
            EndIf
          EndIf
        EndIf
        
        ; 
        If \height>0 And \width>0 And Not \hide And \color\alpha 
          ClipOutput(\clip\x,\clip\y,\clip\width,\clip\height)
          
          Select \Type
            Case -1 : Draw_Window(*This, x,y)
            Case #PB_GadgetType_Property : Draw_Property(*This, x,y)
            Case #PB_GadgetType_Tree : Draw_Tree(*This, x,y)
            Case #PB_GadgetType_Text : Draw_Text(*This, x,y)
            Case #PB_GadgetType_Panel : Draw_Panel(*This, x,y)
            Case #PB_GadgetType_Frame : Draw_Frame(*This, x,y)
            Case #PB_GadgetType_Image : Draw_Image(*This, x,y)
            Case #PB_GadgetType_Button : Draw_Button(*This, x,y)
            Case #PB_GadgetType_TrackBar : Draw_Track(*This, x,y)
            Case #PB_GadgetType_ScrollBar : Draw_Scroll(*This, x,y)
            Case #PB_GadgetType_Splitter : Draw_Splitter(*This, x,y)
            Case #PB_GadgetType_Container : Draw_Container(*This, x,y)
            Case #PB_GadgetType_ProgressBar : Draw_Progress(*This, x,y)
            Case #PB_GadgetType_ScrollArea : Draw_ScrollArea(*This, x,y)
          EndSelect
          
          ; Draw image
          If \image\adress
            DrawingMode(#PB_2DDrawing_Transparent|#PB_2DDrawing_AlphaBlend)
            DrawAlphaImage(\image\adress, \Image\x, \Image\y, \color\alpha)
          EndIf
          
          If ListSize(\Childrens())
            ForEach \Childrens() : Draw(\Childrens()) : Next
          EndIf
          
          ClipOutput(\clip\x,\clip\y,\clip\width,\clip\height)
          
          If \Type = #PB_GadgetType_Splitter
            If \Splitter
              If \Type[1] : Draw(\Splitter\v) : EndIf
              If \Type[2] : Draw(\Splitter\h) : EndIf
            EndIf
          Else  
            If \s 
              If \s\v And \s\v\Type And Not \s\v\Hide : Draw_Scroll(\s\v, x,y) : EndIf
              If \s\h And \s\h\Type And Not \s\h\Hide : Draw_Scroll(\s\h, x,y) : EndIf
            EndIf
          EndIf
          
          ; Demo clip
          If \clip\width>0 And \clip\height>0
            DrawingMode(#PB_2DDrawing_Outlined)
            Box(\clip\x,\clip\y,\clip\width,\clip\height, $0000FF)
          EndIf
          
          UnclipOutput()
          DrawAnchors(*This)
        EndIf
        
        ; reset 
        \Change = 0
        \Resize = 0
        \Text\Change = 0
        \Image\change = 0
        
        *Value\Type =- 1 
        *Value\Widget = 0
      EndWith 
    EndIf
  EndProcedure
  
  Procedure.i Draws(*Scroll.Scroll_S, ScrollHeight.i, ScrollWidth.i)
    With *Scroll
      UnclipOutput()
      If \v And \v\page\len And \v\max<>ScrollHeight And 
         SetAttribute(\v, #PB_ScrollBar_Maximum, ScrollHeight)
        Resizes(*Scroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
      EndIf
      If \h And \h\page\len And \h\max<>ScrollWidth And
         SetAttribute(\h, #PB_ScrollBar_Maximum, ScrollWidth)
        Resizes(*Scroll, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
      EndIf
      
      If \v And Not \v\hide : Draw(\v) : EndIf
      If \h And Not \h\hide : Draw(\h) : EndIf
      
      DrawingMode(#PB_2DDrawing_Outlined)
      ; max coordinate
      Box(\h\x-GetState(\h), \v\y-GetState(\v), \h\Max, \v\Max, $FF0000)
      
      ; page coordinate
      Box(\h\x, \v\y, \h\Page\Len, \v\Page\Len, $00FF00)
      
      ; area coordinate
      Box(\h\x, \v\y, \h\Area\Len, \v\Area\Len, $00FFFF)
      
      ; scroll coordinate
      Box(\h\x, \v\y, \h\width, \v\height, $FF00FF)
      
      ; frame coordinate
      Box(\h\x, \v\y, 
          \h\Page\len + (Bool(Not \v\hide) * \v\width),
          \v\Page\len + (Bool(Not \h\hide) * \h\height), $FFFF00)
      
    EndWith
  EndProcedure
  
  ;-
  Procedure.i Hides(*This.Widget_S, State.i)
    With *This
      If State
        \Hide = 1
      Else
        \Hide = \Hide[1]
      EndIf
      
      If ListSize(\Childrens())
        ForEach \Childrens()
          Hides(\Childrens(), State)
        Next
      EndIf
    EndWith
  EndProcedure
  
  Procedure.i Hide(*This.Widget_S, State.i)
    With *This
      \Hide = State
      \Hide[1] = \Hide
      
      If ListSize(\Childrens())
        ForEach \Childrens()
          Hides(\Childrens(), State)
        Next
      EndIf
    EndWith
  EndProcedure
  
  Procedure.i SetParent(*This.Widget_S, *Parent.Widget_S, Item.i=-1)
    Protected x,y
    
    With *This
      If *This > 0
        x = \x
        y = \y
        
        \p = *Parent
        \i = Item
        \Hide = Bool(Item > 0 Or \p\Hide)
        
        LastElement(\p\Childrens())
        If AddElement(\p\Childrens())
          \p\Childrens() = *This 
        EndIf
        
        If \p\s
          x-\p\s\h\Page\Pos
          y-\p\s\v\Page\Pos
        EndIf
        
        Resize(*This, x, y, #PB_Ignore, #PB_Ignore)
      EndIf
    EndWith
  EndProcedure
  
  Procedure.i OpenList(*This.Widget_S, Item.i=-1)
    With *This
      If *This > 0
        LastElement(*openedlist())
        If AddElement(*openedlist())
          *openedlist() = *This 
        EndIf
      EndIf
    EndWith
  EndProcedure
  
  Procedure.i CloseList()
    If LastElement(*openedlist())
      DeleteElement(*openedlist())
    EndIf
  EndProcedure
  
  Procedure Tree_AddItem(*This.Widget_S,Item.i,Text.s,Image.i=-1,sublevel.i=0)
    Static *adress.Items_S
    
    If Not *This
      ProcedureReturn 0
    EndIf
    
    With *This
      ;{ Генерируем идентификатор
      If Item =- 1 Or Item > ListSize(\items()) - 1
        LastElement(\items())
        AddElement(\items()) 
        Item = ListIndex(\items())
      Else
        SelectElement(\items(), Item)
        If \items()\sublevel>sublevel
          sublevel=\items()\sublevel 
        EndIf
        
        InsertElement(\items())
        
        PushListPosition(\items())
        While NextElement(\items())
          \items()\index= ListIndex(\items())
        Wend
        PopListPosition(\items())
      EndIf
      ;}
      
      If subLevel
        If sublevel>ListIndex(\items())
          sublevel=ListIndex(\items())
        EndIf
        
        PushListPosition(\items()) 
        While PreviousElement(\items()) 
          If subLevel = \items()\subLevel
            *adress = \items()\adress
            Break
          ElseIf subLevel > \items()\subLevel
            *adress = @\items()
            Break
          EndIf
        Wend 
        PopListPosition(\items()) 
         
        If *adress
          If subLevel > *adress\subLevel
            sublevel = *adress\sublevel + 1
            *adress\childrens + 1
;             *adress\collapsed = 1
;             \items()\hide = 1
          EndIf
        EndIf
      EndIf
      
      \items()\change = 1
      \items()\index= Item
      \items()\index[1] =- 1
      \items()\adress = *adress
      \items()\text\change = 1
      \items()\text\string.s = Text.s
      \items()\sublevel = sublevel
      \items()\height = \Text\height
      
      SetImage(\Items(), Image)
      \Text\Count + 1
    EndWith
    
    ProcedureReturn Item
  EndProcedure
  
  Procedure Property_AddItem(*This.Widget_S,Item.i,Text.s,Image.i=-1,sublevel.i=0)
    Static *adress.Items_S
    
    If Not *This
      ProcedureReturn 0
    EndIf
    
    With *This
      ;{ Генерируем идентификатор
      If Item =- 1 Or Item > ListSize(\items()) - 1
        LastElement(\items())
        AddElement(\items()) 
        Item = ListIndex(\items())
      Else
        SelectElement(\items(), Item)
        If \items()\sublevel>sublevel
          sublevel=\items()\sublevel 
        EndIf
        
        InsertElement(\items())
        
        PushListPosition(\items())
        While NextElement(\items())
          \items()\index= ListIndex(\items())
        Wend
        PopListPosition(\items())
      EndIf
      ;}
      
      If subLevel
        If sublevel>ListIndex(\items())
          sublevel=ListIndex(\items())
        EndIf
        
        PushListPosition(\items()) 
        While PreviousElement(\items()) 
          If subLevel = \items()\subLevel
            *adress = \items()\adress
            Break
          ElseIf subLevel > \items()\subLevel
            *adress = @\items()
            Break
          EndIf
        Wend 
        PopListPosition(\items()) 
         
        If *adress
          If subLevel > *adress\subLevel
            sublevel = *adress\sublevel + 1
            *adress\childrens + 1
;             *adress\collapsed = 1
;             \items()\hide = 1
          EndIf
        EndIf
      EndIf
      
      \items()\change = 1
      \items()\index= Item
      \items()\index[1] =- 1
      \items()\adress = *adress
      \items()\text\change = 1
      
      Protected Type$ = Trim(StringField(Text, 1, " "))
      Protected Info$ = Trim(StringField(Text, 2, " ")) 
      
      If sublevel
        If Info$ : Info$+":" : EndIf
      EndIf
      
      Protected Title$ = Trim(StringField(Text, 3, " "))
      
      
      \items()\text\string.s = Info$
      \items()\text[1]\string.s = Title$
      \items()\sublevel = sublevel
      \items()\height = \Text\height
      
      SetImage(\Items(), Image)
      \Text\Count + 1
    EndWith
    
    ProcedureReturn Item
  EndProcedure
  
  Procedure.i AddItem(*This.Widget_S, Item.i, Text.s, Image.i=-1, Flag.i=0)
    With *This
      
      Select \Type
        Case #PB_GadgetType_Property
          Property_AddItem(*This, Item.i,Text.s,Image, Flag)
          
        Case #PB_GadgetType_Tree, #PB_GadgetType_Property
          Tree_AddItem(*This, Item.i,Text.s,Image, Flag)
          
        Case #PB_GadgetType_Panel
          \index[2] = 0
          LastElement(\Tabs())
          AddElement(\Tabs())
          
          \Tabs() = AllocateStructure(Items_S)
          \Tabs()\index = ListIndex(\Tabs())
          \Tabs()\Text\String = Text.s
          \Tabs()\Text\Change = 1
          \Tabs()\height = \Tab\Height
          
          SetImage(\Tabs(), Image)
      EndSelect
      
    EndWith
  EndProcedure
  
  Procedure.i SetText(*This.Widget_S, Text.s)
    Protected Result.i, Len.i, String.s, i.i
    If Text.s="" : Text.s=#LF$ : EndIf
    
    With *This
      If \Text\String.s[1] <> Text.s
        \Text\String.s[1] = Make(*This, Text.s)
        
        If \Text\String.s[1]
          If \Text\MultiLine
            Text.s = ReplaceString(Text.s, #LFCR$, #LF$)
            Text.s = ReplaceString(Text.s, #CRLF$, #LF$)
            Text.s = ReplaceString(Text.s, #CR$, #LF$)
            
            If \Text\MultiLine > 0
              Text.s + #LF$
            EndIf
            
            \Text\String.s[1] = Text.s
            \Text\Count = CountString(\Text\String.s[1], #LF$)
          Else
            \Text\String.s[1] = RemoveString(\Text\String.s[1], #LF$) ; + #LF$
            ; \Text\String.s = RTrim(ReplaceString(\Text\String.s[1], #LF$, " ")) + #LF$
          EndIf
          
          \Text\Len = Len(\Text\String.s[1])
          \Text\Change = #True
          Result = #True
        EndIf
      EndIf
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i GetState(*This.Widget_S)
    Protected Result.i
    
    With *This
      Select \Type
        Case #PB_GadgetType_Tree : Result = \index[2]
        Case #PB_GadgetType_Panel : Result = \index[2]
        Case #PB_GadgetType_Image : Result = \image\index
        Case #PB_GadgetType_ScrollBar : Result = Invert(*This, \Page\Pos, \Inverted)
      EndSelect
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetState(*This.Widget_S, State.i)
    Protected Result.b, Direction.i ; Направление и позиция скролла (вверх,вниз,влево,вправо)
    
    With *This
      If *This > 0
        Select \Type
          Case #PB_GadgetType_Tree
            If State < 0 : State = 0 : EndIf
            If State > \Text\Count
              State = \Text\Count
            EndIf
            
            If SelectElement(\Items(), State) 
              \Items()\State = 2
              \index[2] = State
              \Change = State+1
              *Value\Widget = *This
              *Value\Type = #PB_EventType_Change
              
              PostEvent(#PB_Event_Gadget, *Value\Window, *Value\Gadget, #PB_EventType_Change)
              
              
              ; \s\v\Change = 1
            EndIf
            
          Case #PB_GadgetType_Image
            Result = SetImage(*This, State)
            If Result
              If \s
                SetAttribute(\s\v, #PB_Bar_Maximum, \Image\height)
                SetAttribute(\s\h, #PB_Bar_Maximum, \Image\width)
                
                \Resize = 1<<1|1<<2|1<<3|1<<4 
                Resize(*This, \x, \y, \width, \height) 
                \Resize = 0
              EndIf
            EndIf
            
          Case #PB_GadgetType_Panel
            If State >= 0 And \Index[2] <> State : \Index[2] = State
              
              ForEach \Childrens()
                Hides(\Childrens(), Bool(\Childrens()\i<>State))
              Next
              
              \Change = 1
              Result = 1
            EndIf
            
          Default
            If (\Vertical And \Type = #PB_GadgetType_TrackBar)
              State = Invert(*This, State, \Inverted)
            EndIf
            
            If State < \Min
              State = \Min 
            EndIf
            
            If State > \Max-\Page\len
              If \Max > \Page\len 
                State = \Max-\Page\len
              Else
                State = \Min 
              EndIf
            EndIf
            
            If \Page\Pos <> State 
              \Thumb\Pos = ThumbPos(*This, State)
              
              If \Inverted
                If \Page\Pos > State
                  \Direction = Invert(*This, State, \Inverted)
                Else
                  \Direction =- Invert(*This, State, \Inverted)
                EndIf
              Else
                If \Page\Pos > State
                  \Direction =- State
                Else
                  \Direction = State
                EndIf
              EndIf
              
              *Value\Widget = *This
              *Value\Type = #PB_EventType_Change
              \Change = \Page\Pos - State
              \Page\Pos = State
              
              If \Type = #PB_GadgetType_Splitter
                Resize_Splitter(*This)
              Else
                If \p
                  \p\Change =- 1
                  
                  If \p\s
                    If \Vertical
                      \p\s\y =- \Page\Pos
                      Resize_Childrens(\p, 0, \Change)
                    Else
                      \p\s\x =- \Page\Pos
                      Resize_Childrens(\p, \Change, 0)
                    EndIf
                  EndIf
                EndIf
              EndIf
              
              Result = #True
            EndIf
        EndSelect
      EndIf
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i GetAttribute(*This.Widget_S, Attribute.i)
    Protected Result.i
    
    With *This
      Select \Type
        Case #PB_GadgetType_Button
          Select Attribute 
            Case #PB_Button_Image ; 1
              Result = \Image\index
          EndSelect
          
        Case #PB_GadgetType_Splitter
          Select Attribute
            Case #PB_Splitter_FirstMinimumSize : Result = \ButtonLen[1]
            Case #PB_Splitter_SecondMinimumSize : Result = \ButtonLen[2] - \ButtonLen[3]
          EndSelect 
          
        Default 
          Select Attribute
            Case #PB_Bar_Minimum : Result = \Min  ; 1
            Case #PB_Bar_Maximum : Result = \Max  ; 2
            Case #PB_Bar_Inverted : Result = \Inverted
            Case #PB_Bar_NoButtons : Result = \ButtonLen ; 4
            Case #PB_Bar_Direction : Result = \Direction
            Case #PB_Bar_PageLength : Result = \Page\len ; 3
          EndSelect
      EndSelect
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetAttribute(*This.Widget_S, Attribute.i, Value.i)
    Protected Resize.i
    
    With *This
      If *This > 0
        Select \Type
          Case #PB_GadgetType_Button
            Select Attribute 
              Case #PB_Button_Image
                SetImage(*This, Value)
                ProcedureReturn 1
            EndSelect
            
          Case #PB_GadgetType_Splitter
            Select Attribute
              Case #PB_Splitter_FirstMinimumSize : \ButtonLen[1] = Value
              Case #PB_Splitter_SecondMinimumSize : \ButtonLen[2] = \ButtonLen[3] + Value
            EndSelect 
            
            If \Vertical
              \Area\Pos = \Y+\ButtonLen[1]
              \Area\len = (\Height-\ButtonLen[1]-\ButtonLen[2])
            Else
              \Area\Pos = \X+\ButtonLen[1]
              \Area\len = (\Width-\ButtonLen[1]-\ButtonLen[2])
            EndIf
            
            ProcedureReturn 1
            
          Case #PB_GadgetType_Image
            Select Attribute
              Case #PB_DisplayMode
                
                Select Value
                  Case 0 ; Default
                    \Image\Align\Vertical = 0
                    \Image\Align\Horizontal = 0
                    
                  Case 1 ; Center
                    \Image\Align\Vertical = 1
                    \Image\Align\Horizontal = 1
                    
                  Case 3 ; Mosaic
                  Case 2 ; Stretch
                    
                  Case 5 ; Proportionally
                EndSelect
                
                ;Resize = 1
                \Resize = 1<<1|1<<2|1<<3|1<<4
                Resize(*This, \x, \y, \width, \height)
                \Resize = 0
            EndSelect
            
          Default
            
            Select Attribute
              Case #PB_Bar_NoButtons : Resize = 1
                \ButtonLen[0] = Value
                \ButtonLen[1] = Value
                \ButtonLen[2] = Value
                
              Case #PB_Bar_Inverted
                \Inverted = Bool(Value)
                \Page\Pos = Invert(*This, \Page\Pos)
                \Thumb\Pos = ThumbPos(*This, \Page\Pos)
                ProcedureReturn 1
                
              Case #PB_Bar_Minimum ; 1 -m&l
                If \Min <> Value 
                  \Min = Value
                  \Page\Pos + Value
                  
                  If \Page\Pos > \Max-\Page\len
                    If \Max > \Page\len 
                      \Page\Pos = \Max-\Page\len
                    Else
                      \Page\Pos = \Min 
                    EndIf
                  EndIf
                  
                  If \Max > \Min
                    \Thumb\Pos = ThumbPos(*This, \Page\Pos)
                    \Thumb\len = ThumbLength(*This)
                  Else
                    \Thumb\Pos = \Area\Pos
                    \Thumb\len = \Area\len
                    
                    If \Vertical 
                      \Y[3] = \Thumb\Pos  
                      \Height[3] = \Thumb\len
                    Else 
                      \X[3] = \Thumb\Pos 
                      \Width[3] = \Thumb\len
                    EndIf
                  EndIf
                  
                  Resize = 1
                EndIf
                
              Case #PB_Bar_Maximum ; 2 -m&l
                If \Max <> Value
                  \Max = Value
                  
                  If \Page\len > \Max 
                    \Page\Pos = \Min
                  EndIf
                  
                  \Thumb\Pos = ThumbPos(*This, \Page\Pos)
                  
                  If \Max > \Min
                    \Thumb\len = ThumbLength(*This)
                  Else
                    \Thumb\len = \Area\len
                    
                    If \Vertical 
                      \Height[3] = \Thumb\len
                    Else 
                      \Width[3] = \Thumb\len
                    EndIf
                  EndIf
                  
                  If \Step = 0
                    \Step = 1
                  EndIf
                  
                  Resize = 1
                EndIf
                
              Case #PB_Bar_PageLength ; 3 -m&l
                If \Page\len <> Value
                  If Value > (\Max-\Min)
                    If \Max = 0 
                      \Max = Value 
                    EndIf
                    Value = (\Max-\Min)
                    \Page\Pos = \Min
                  EndIf
                  \Page\len = Value
                  
                  \Thumb\Pos = ThumbPos(*This, \Page\Pos)
                  
                  If \Page\len > \Min
                    \Thumb\len = ThumbLength(*This)
                  Else
                    \Thumb\len = \ButtonLen[3]
                  EndIf
                  
                  If \Step = 0
                    \Step = 1
                  EndIf
                  If \Step < 2 And \Page\len
                    \Step = (\Max-\Min) / \Page\len 
                  EndIf
                  
                  Resize = 1
                EndIf
                
            EndSelect
            
        EndSelect
        
        If Resize
          \Resize = 1<<1|1<<2|1<<3|1<<4
          \Hide = Resize(*This, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore)
          \Resize = 0
          ProcedureReturn 1
        EndIf
      EndIf
    EndWith
  EndProcedure
  
  Procedure.i GetItemAttribute(*This.Widget_S, Item.i, Attribute.i)
    Protected Result.i
    
    With *This
      Select \Type
        Case #PB_GadgetType_Tree
          ForEach \items()
            If \items()\index= Item 
              Select Attribute
                Case #PB_Tree_SubLevel
                  Result = \items()\sublevel
                  
              EndSelect
              Break
            EndIf
          Next
      EndSelect
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetItemAttribute(*This.Widget_S, Item.i, Attribute.i, Value.i)
    Protected Result.i
    
    With *This
      Select \Type
        Case #PB_GadgetType_Panel
          If SelectElement(\Tabs(), Item)
            Select Attribute 
              Case #PB_Button_Image
                Result = SetImage(\Tabs(), Value)
            EndSelect
          EndIf
      EndSelect
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i GetItemData(*This.Widget_S, Item.i)
    Protected Result.i
    
    With *This
      PushListPosition(\items()) 
      ForEach \items()
        If \items()\index = Item 
          Result = \items()\data
          Break
        EndIf
      Next
      PopListPosition(\items())
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i SetItemData(*This.Widget_S, Item.i, *Data)
    Protected Result.i
    ;     Debug " "+Item +" "+ *Data
    ;     
    With *This
      ForEach \items()
        If \items()\index = Item 
          \items()\data = *Data
          Break
        EndIf
      Next
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i CountItems(*This.Widget_S)
    ProcedureReturn *This\Text\Count
  EndProcedure
  
  Procedure.i ClearItems(*This.Widget_S) 
    With *This
      \Text\Count = 0
      \Text\Change = 1 
      If \Text\Editable
        \Text\String = #LF$
      EndIf
      ;       If Not \Repaint : \Repaint = 1
      ;         PostEvent(#PB_Event_Gadget, \Canvas\Window, \Canvas\Gadget, #PB_EventType_Repaint)
      ;       EndIf
    EndWith
  EndProcedure
  
  Procedure.i RemoveItem(*This.Widget_S, Item.i) 
    With *This
      \Text\Count - 1
      \Text\Change = 1
      If \Text\Count =- 1 
        \Text\Count = 0 
        \Text\String = #LF$
        ;         If Not \Repaint : \Repaint = 1
        ;           PostEvent(#PB_Event_Gadget, \Canvas\Window, \Canvas\Gadget, #PB_EventType_Repaint)
        ;         EndIf
      Else
        \Text\String = RemoveString(\Text\String, StringField(\Text\String, Item+1, #LF$) + #LF$)
      EndIf
    EndWith
  EndProcedure
  
  Procedure.i SetColor(*This.Widget_S, ColorType.i, Color.i, State.i=0, Item.i=0)
    Protected Result, Count 
    State =- 1
    If Item < 0 
      Item = 0 
    ElseIf Item > 3 
      Item = 3 
    EndIf
    
    With *This
      If State =- 1
        Count = 2
        \Color\State = 0
      Else
        Count = State
        \Color\State = State
      EndIf
      
      For State = \Color\State To Count
        
        Select ColorType
          Case #PB_Gadget_LineColor
            If \Color[Item]\Line[State] <> Color 
              \Color[Item]\Line[State] = Color
              Result = #True
            EndIf
            
          Case #PB_Gadget_BackColor
            If \Color[Item]\Back[State] <> Color 
              \Color[Item]\Back[State] = Color
              Result = #True
            EndIf
            
          Case #PB_Gadget_FrontColor
            If \Color[Item]\Front[State] <> Color 
              \Color[Item]\Front[State] = Color
              Result = #True
            EndIf
            
          Case #PB_Gadget_FrameColor
            If \Color[Item]\Frame[State] <> Color 
              \Color[Item]\Frame[State] = Color
              Result = #True
            EndIf
            
        EndSelect
        
      Next
    EndWith
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure.i Resize(*This.Widget_S, X.i,Y.i,Width.i,Height.i);, *That.Widget_S=#Null)
    Protected Lines.i, hide.i, Change_x, Change_y, Change_width, Change_height
    
    If *This > 0
      If Not Bool(X=#PB_Ignore And Y=#PB_Ignore And Width=#PB_Ignore And Height=#PB_Ignore)
        *Value\Widget = *This
        *Value\Type = #PB_EventType_Resize
      EndIf
      
      With *This
        If \p 
          If X<>#PB_Ignore
            x+\p\x+\p\bs
          EndIf
          If y<>#PB_Ignore
            y+\p\y+\p\bs+\p\TabHeight
          EndIf
        EndIf
        
        ; Set scroll bar coordinate
        If X=#PB_Ignore : X = \X : Else : If \X <> X : Change_x = x-\x : \X = X : \Resize | 1<<1 : EndIf : EndIf  
        If Y=#PB_Ignore : Y = \Y : Else : If \Y <> Y : Change_y = y-\y : \Y = Y : \Resize | 1<<2 : EndIf : EndIf  
        If Width=#PB_Ignore : Width = \Width : Else : If \Width <> Width : Change_width = width-\width : \Width = Width : \Resize | 1<<3 : EndIf : EndIf  
        If Height=#PB_Ignore : Height = \Height : Else : If \Height <> Height : Change_height = height-\height : \Height = Height : \Resize | 1<<4 : EndIf : EndIf 
        
        If \Resize
          Lines = Bool(\Type=#PB_GadgetType_ScrollBar)
          hide = Bool(\Page\len And Not ((\Max-\Min) > \Page\Len))
          
          If \ButtonLen
            \ButtonLen[1] = \ButtonLen
            \ButtonLen[2] = \ButtonLen
          EndIf
          
          If \Max
            If \Vertical
              \Area\Pos = \Y+\ButtonLen[1]
              \Area\len = \Height-(\ButtonLen[1]+\ButtonLen[2]) - Bool(\Thumb\len>0 And (\Type = #PB_GadgetType_Splitter))*\Thumb\len
            Else
              \Area\Pos = \X+\ButtonLen[1]
              \Area\len = \width-(\ButtonLen[1]+\ButtonLen[2]) - Bool(\Thumb\len>0 And (\Type = #PB_GadgetType_Splitter))*\Thumb\len
            EndIf
          EndIf
          
          If (\Type <> #PB_GadgetType_Splitter) And Bool(\Resize & (1<<4 | 1<<3))
            \Thumb\len = ThumbLength(*This)
            
            If (\Area\len > \ButtonLen)
              If \ButtonLen
                If (\Thumb\len < \ButtonLen)
                  \Area\len = Round(\Area\len - (\ButtonLen[2]-\Thumb\len), #PB_Round_Nearest)
                  \Thumb\len = \ButtonLen[2] 
                EndIf
              Else
                If (\Thumb\len < \ButtonLen[3]) And (\Type <> #PB_GadgetType_ProgressBar)
                  \Area\len = Round(\Area\len - (\ButtonLen[3]-\Thumb\len), #PB_Round_Nearest)
                  \Thumb\len = \ButtonLen[3]
                EndIf
              EndIf
            Else
              \Thumb\len = \Area\len 
            EndIf
          EndIf
          
          If \Area\len > 0
            If IsStop(*This) And (\Type = #PB_GadgetType_ScrollBar)
              SetState(*This, \Max)
            EndIf
            
            \Thumb\Pos = ThumbPos(*This, \Page\Pos)
          EndIf
          
          If \Vertical
            If \ButtonLen
              \X[1] = X + Lines : \Y[1] = Y : \Width[1] = Width - Lines : \Height[1] = \ButtonLen[1]                       ; Top button coordinate on scroll bar
              \X[2] = X + Lines : \Width[2] = Width - Lines : \Height[2] = \ButtonLen[2] : \Y[2] = \y+\height-\ButtonLen[2]; (\Area\Pos+\Area\len)   ; Bottom button coordinate on scroll bar
            EndIf
            \X[3] = X + Lines : \Width[3] = Width - Lines : \Y[3] = \Thumb\Pos : \Height[3] = \Thumb\len                   ; Thumb coordinate on scroll bar
          Else
            If \ButtonLen
              \X[1] = X : \Y[1] = Y + Lines : \Height[1] = Height - Lines : \Width[1] = \ButtonLen[1]                      ; Left button coordinate on scroll bar
              \Y[2] = Y + Lines : \Height[2] = Height - Lines : \Width[2] = \ButtonLen[2] : \X[2] = \x+\width-\ButtonLen[2]; (\Area\Pos+\Area\len)  ; Right button coordinate on scroll bar
            EndIf
            \Y[3] = Y + Lines : \Height[3] = Height - Lines : \X[3] = \Thumb\Pos : \Width[3] = \Thumb\len                  ; Thumb coordinate on scroll bar
          EndIf
        EndIf 
        
        ; Draw clip coordinate
        If \p And \x < \p\clip\x+\p\bs : \clip\x = \p\clip\x+\p\bs : Else : \clip\x = \x : EndIf
        If \p And \y < \p\clip\y+\p\bs+\p\TabHeight : \clip\y = \p\clip\y+\p\bs+\p\TabHeight : Else : \clip\y = \y : EndIf
        
        If \p 
          If \p\s And \p\s\v And \p\s\h
            Protected v=Bool(\p\width=\p\clip\width And Not \p\s\v\Hide And \p\s\v\type = #PB_GadgetType_ScrollBar)*(\p\s\v\width) ;: If Not v : v = \p\bs : EndIf
            Protected h=Bool(\p\height=\p\clip\height And Not \p\s\h\Hide And \p\s\h\type = #PB_GadgetType_ScrollBar)*(\p\s\h\height) ;: If Not h : h = \p\bs : EndIf
          EndIf
          
;           If \Splitter
;             v = \p\Thumb\Pos
;           EndIf
        EndIf
        
        If \p And \x+\width>\p\clip\x+\p\clip\width-v-\p\bs : \clip\width = \p\clip\width-v-\p\bs-(\clip\x-\p\clip\x) : Else : \clip\width = \width-(\clip\x-\x) : EndIf
        If \p And \y+\height>=\p\clip\y+\p\clip\height-h-\p\bs : \clip\height = \p\clip\height-h-\p\bs-(\clip\y-\p\clip\y) : Else : \clip\height = \height-(\clip\y-\y) : EndIf
        
          If (\Type = #PB_GadgetType_Splitter)
            If \Splitter 
              Resize_Splitter(*This)
            EndIf
          Else
            If \s 
              Resizes(\s, 0,0,\Width-\bs*2,\Height-\bs*2)
            EndIf
          EndIf
          
          If \Tab
            \Tab\Page\len = \Width-\bs*2-2
            Resize(\Tab, 1,-\Tab\height,\Tab\Page\len,#PB_Ignore)
          EndIf   
          
          ; Resize childrens
          If ListSize(\Childrens())
            ForEach \Childrens()
              If \Childrens()\Align
                If \Childrens()\Align\Horizontal
                  x = (\width-\bs*2 - (\Childrens()\Align\x+\Childrens()\width))/2
                ElseIf \Childrens()\Align\Right And Not \Childrens()\Align\Left
                  x = (\width-\bs*2 - (\Childrens()\Align\x+\Childrens()\width));+Bool(\Grid>1)
                Else
                  x = (\Childrens()\x-\x-\bs) + Change_x
                EndIf
                
                If \Childrens()\Align\Vertical
                  y = (\height-\bs*2-\TabHeight - (\Childrens()\Align\y+\Childrens()\height))/2 
                ElseIf \Childrens()\Align\Bottom And Not \Childrens()\Align\Top
                  y = (\height-\bs*2 - \TabHeight - (\Childrens()\Align\y+\Childrens()\height));+Bool(\Grid>1)
                Else
                  y = (\Childrens()\y-\y-\bs-\TabHeight) + Change_y 
                EndIf
                
                If \Childrens()\Align\Top And \Childrens()\Align\Bottom
                  Height = (\height-\bs*2-\TabHeight)-\Childrens()\Align\y1;+Bool(\Grid>1)
                Else
                  Height = #PB_Ignore
                EndIf
                
                If \Childrens()\Align\Left And \Childrens()\Align\Right
                  Width = (\width-\bs*2)-\Childrens()\Align\x1;+Bool(\Grid>1)
                Else
                  Width = #PB_Ignore
                EndIf
                
                Resize(\Childrens(), x, y, Width, Height)
               ;Resize(\Childrens(), (\Childrens()\x-\x-\bs) + Change_x, (\Childrens()\y-\y-\bs-\TabHeight) + Change_y, \width-\bs*2, \height-\bs*2-\TabHeight)
              Else
                Resize(\Childrens(), (\Childrens()\x-\x-\bs) + Change_x, (\Childrens()\y-\y-\bs-\TabHeight) + Change_y, #PB_Ignore, #PB_Ignore)
              EndIf
            Next
          EndIf
          
          ; anchors widgets
          ResizeAnchors(*This)
        
        ProcedureReturn hide
      EndWith
    EndIf
  EndProcedure
  
  
  Procedure.i Updates(*Scroll.Scroll_S, ScrollArea_X, ScrollArea_Y, ScrollArea_Width, ScrollArea_Height)
    With *Scroll
      Protected iWidth = X(\v)-(\v\Width-\v\Radius/2)+1, iHeight = Y(\h)-(\h\Height-\h\Radius/2)+1
      Static hPos, vPos : vPos = \v\Page\Pos : hPos = \h\Page\Pos
      
      ; Вправо работает как надо
      If ScrollArea_Width<\h\Page\Pos+iWidth 
        ScrollArea_Width=\h\Page\Pos+iWidth
        ; Влево работает как надо
      ElseIf ScrollArea_X>\h\Page\Pos And
             ScrollArea_Width=\h\Page\Pos+iWidth 
        ScrollArea_Width = iWidth 
      EndIf
      
      ; Вниз работает как надо
      If ScrollArea_Height<\v\Page\Pos+iHeight
        ScrollArea_Height=\v\Page\Pos+iHeight 
        ; Верх работает как надо
      ElseIf ScrollArea_Y>\v\Page\Pos And
             ScrollArea_Height=\v\Page\Pos+iHeight 
        ScrollArea_Height = iHeight 
      EndIf
      
      If ScrollArea_X>0 : ScrollArea_X=0 : EndIf
      If ScrollArea_Y>0 : ScrollArea_Y=0 : EndIf
      
      If ScrollArea_X<\h\Page\Pos : ScrollArea_Width-ScrollArea_X : EndIf
      If ScrollArea_Y<\v\Page\Pos : ScrollArea_Height-ScrollArea_Y : EndIf
      
      If \v\max<>ScrollArea_Height : SetAttribute(\v, #PB_Bar_Maximum, ScrollArea_Height) : EndIf
      If \h\max<>ScrollArea_Width : SetAttribute(\h, #PB_Bar_Maximum, ScrollArea_Width) : EndIf
      
      If \v\Page\len<>iHeight : SetAttribute(\v, #PB_Bar_PageLength, iHeight) : EndIf
      If \h\Page\len<>iWidth : SetAttribute(\h, #PB_Bar_PageLength, iWidth) : EndIf
      
      If ScrollArea_Y<0 : SetState(\v, (ScrollArea_Height-ScrollArea_Y)-ScrollArea_Height) : EndIf
      If ScrollArea_X<0 : SetState(\h, (ScrollArea_Width-ScrollArea_X)-ScrollArea_Width) : EndIf
      
      ;     \v\hide = Resize(\v, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, \h) 
      ;     \h\hide = Resize(\h, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore, \v)
      \v\Hide = Resize(\v, #PB_Ignore, #PB_Ignore, #PB_Ignore, (\h\Y + Bool(\h\Hide) * \h\Height) - \v\Y) ; #PB_Ignore, \h) 
      \h\Hide = Resize(\h, #PB_Ignore, #PB_Ignore, (\v\X + Bool(\v\Hide) * \v\Width) - \h\X, #PB_Ignore)  ; #PB_Ignore, #PB_Ignore, \v)
      
      If \v\hide : \v\Page\Pos = 0 : If vPos : \v\hide = vPos : EndIf : Else : \v\Page\Pos = vPos : \h\Width = iWidth+\v\Width : EndIf
      If \h\hide : \h\Page\Pos = 0 : If hPos : \h\hide = hPos : EndIf : Else : \h\Page\Pos = hPos : \v\Height = iHeight+\h\Height : EndIf
      
      ProcedureReturn Bool(ScrollArea_Height>=iHeight Or ScrollArea_Width>=iWidth)
    EndWith
  EndProcedure
  
  Procedure.i Resizes(*Scroll.Scroll_S, X.i,Y.i,Width.i,Height.i)
    With *Scroll
      If y=#PB_Ignore : y = \v\Y : EndIf
      If x=#PB_Ignore : x = \h\X : EndIf
      If Width=#PB_Ignore : Width = \v\X-\h\X+\v\width : EndIf
      If Height=#PB_Ignore : Height = \h\Y-\v\Y+\h\height : EndIf
      
      ;       If \v\p
      ;         y - \v\p\bs
      ;       EndIf
      
      \v\Page\len = Height - Bool(Not \h\hide) * \h\height
      \h\Page\len = Width - Bool(Not \v\hide) * \v\width
      
      \v\Hide = Resize(\v, Width+x-\v\Width, y, #PB_Ignore, \v\Page\len)
      \h\Hide = Resize(\h, x, Height+y-\h\Height, \h\Page\len, #PB_Ignore)
      
      \v\Page\len = Height - Bool(Not \h\hide) * \h\height
      \h\Page\len = Width - Bool(Not \v\hide) * \v\width
      
      \v\Hide = Resize(\v, #PB_Ignore, #PB_Ignore, #PB_Ignore, \v\Page\len); + Bool(\v\Radius And Not \h\Hide And Not \v\Hide)*4)
      \h\Hide = Resize(\h, #PB_Ignore, #PB_Ignore, \h\Page\len, #PB_Ignore); + Bool(\h\Radius And Not \v\Hide And Not \h\hide)*4, #PB_Ignore)
      
      If Not \v\Hide 
        \h\Hide = Resize(\h, #PB_Ignore, #PB_Ignore, (\v\x-\h\x)+Bool(\v\Radius)*4, #PB_Ignore)
      EndIf
      If Not \h\Hide 
        \v\Hide = Resize(\v, #PB_Ignore, #PB_Ignore, #PB_Ignore, (\h\y-\v\y)+Bool(\h\Radius)*4)
      EndIf
      ProcedureReturn 1 ; Bool(Not Bool(\v\Hide And \h\Hide))
    EndWith
  EndProcedure
  
  Procedure.i Events(*This.Widget_S, at.i, EventType.i, MouseScreenX.i, MouseScreenY.i, WheelDelta.i = 0)
    Static delta, cursor, lastat.i
    Protected Repaint.i
    Protected window = EventWindow()
    Protected canvas = EventGadget()
    
    If *This > 0
      
      *Value\Widget = *This
      *Value\Type = EventType
      
      With *This
        Select EventType
          Case #PB_EventType_Focus : \Focus = 1 : Repaint = 1
          Case #PB_EventType_LostFocus : \Focus = 0 : Repaint = 1
          Case #PB_EventType_LeftButtonUp : Repaint = 1 : delta = 0
          Case #PB_EventType_LeftDoubleClick 
            If \Type = #PB_GadgetType_ScrollBar
              Select at
                Case - 1
                  If \Vertical
                    Repaint = (MouseScreenY-\Thumb\len/2)
                  Else
                    Repaint = (MouseScreenX-\Thumb\len/2)
                  EndIf
                  
                  Repaint = SetState(*This, Pos(*This, Repaint))
              EndSelect
            EndIf
            
          Case #PB_EventType_LeftButtonDown
            If \Type = #PB_GadgetType_ScrollBar
              Select at
                Case 1 : Repaint = SetState(*This, (\Page\Pos - \Step)) ; Up button
                Case 2 : Repaint = SetState(*This, (\Page\Pos + \Step)) ; Down button
              EndSelect
              
            ElseIf ListSize(\Tabs())
              SetState(*This, \index[1])
              
            ElseIf ListSize(\Items())
              If \index[1] >= 0
                If \index[2]>=0 And SelectElement(\Items(), \index[2])
                  \Items()\State = 0
                EndIf
                
                \Index[2] = \index[1]
                
                If SelectElement(\Items(), \index[2]) : \Items()\State = 2
                  Protected sublevel, collapsed, adress
                  
                  If (MouseScreenY > (\items()\box\y[1]) And MouseScreenY =< ((\items()\box\y[1]+\items()\box\height[1]))) And 
                     ((MouseScreenX > \items()\box\x[1]) And (MouseScreenX =< (\items()\box\x[1]+\items()\box\width[1])))
                    
                    \items()\Checked ! 1
                  EndIf
                  
                  If (\flag\buttons And \items()\childrens) And
                     (MouseScreenY > (\items()\box\y[0]) And MouseScreenY =< ((\items()\box\y[0]+\items()\box\height[0]))) And 
                     ((MouseScreenX > \items()\box\x[0]) And (MouseScreenX =< (\items()\box\x[0]+\items()\box\width[0])))
                    
                    sublevel = \items()\sublevel
                    \items()\collapsed ! 1
                    \Change = 1
                    
                    PushListPosition(\items())
                    While NextElement(\items())
                      If sublevel = \items()\sublevel
                        Break
                      ElseIf sublevel < \items()\sublevel 
                        If \items()\adress
                          collapsed = \items()\adress\collapsed
                          If \items()\adress\hide
                            collapsed = 1
                          EndIf
                        EndIf
                        
                        \items()\hide = collapsed
                      EndIf
                    Wend
                    PopListPosition(\items())
                  EndIf
                EndIf
                
                Repaint = 1
              EndIf
            EndIf
            
            Select at
              Case 3                                                  ; Thumb button
                If \Vertical
                  delta = MouseScreenY - \Thumb\Pos
                Else
                  delta = MouseScreenX - \Thumb\Pos
                EndIf
            EndSelect
            
          Case #PB_EventType_MouseMove
            If delta
              If \Vertical
                Repaint = (MouseScreenY-delta)
              Else
                Repaint = (MouseScreenX-delta)
              EndIf
              
              Repaint = SetState(*This, Pos(*This, Repaint))
;             Else
;               If \Type = #PB_GadgetType_Splitter And at <> 3
;                 SetGadgetAttribute(canvas, #PB_Canvas_Cursor, \Cursor[1])
;               EndIf
            EndIf
            
          Case #PB_EventType_MouseWheel
            If WheelDelta <> 0
              If WheelDelta < 0 ; up
                If \Step = 1
                  Repaint + ((\Max-\Min) / 100)
                Else
                  Repaint + \Step
                EndIf
                
              ElseIf WheelDelta > 0 ; down
                If \Step = 1
                  Repaint - ((\Max-\Min) / 100)
                Else
                  Repaint - \Step
                EndIf
              EndIf
              
              Repaint = SetState(*This, (\Page\Pos + Repaint))
            EndIf  
            
        EndSelect
        
        Select EventType
          Case #PB_EventType_MouseLeave
            
            If at > 0
              ;,Debug "leave "+*This +" "+ \Type
              \Color[at]\State = 0
            Else
              ; Debug ""+*This +" "+ EventType +" "+ lastat
              
              If \cursor[1] <> GetGadgetAttribute(canvas, #PB_Canvas_Cursor)
                SetGadgetAttribute(canvas, #PB_Canvas_Cursor, \cursor[1])
              EndIf
              
              \Color[1]\State = 0
              \Color[2]\State = 0
              \Color[3]\State = 0
            EndIf
            
            ; For list
            If Not \Tab
              If \adress
                ChangeCurrentElement(\Items(), \adress)
                If \Items()\State = 1
                  \Items()\State = 0
                EndIf
              EndIf
              \index[1] =- 1
            EndIf
            
            Repaint = #True
            
          Case #PB_EventType_LeftButtonDown, #PB_EventType_LeftButtonUp, #PB_EventType_MouseEnter
            If ((at = 1 And IsStart(*This)) Or (at = 2 And IsStop(*This)))
              \Color[at]\State = 0
              at = 0
            EndIf
            
            If at>0
              ; Debug "enter "+*This +" "+ \Type
              \Color[at]\State = 1+Bool(EventType=#PB_EventType_LeftButtonDown)
              
              \Cursor[1] = GetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor)
              
              If (\Type = #PB_GadgetType_Splitter And at = 3)
                SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, \Cursor)
              Else
                SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, \Cursor)
              EndIf
              
              Repaint = #True
            Else
              ; Debug ""+*This +" "+ EventType +" "+ at
              
              If Not \cursor[1]
                \cursor[1] = GetGadgetAttribute(canvas, #PB_Canvas_Cursor)
              EndIf
              SetGadgetAttribute(canvas, #PB_Canvas_Cursor, \Cursor)
              
            EndIf
            
        EndSelect
      EndWith
    EndIf  
    
    ProcedureReturn Repaint
  EndProcedure
  
  Procedure CallBackAnchors(*This.Widget_S, mouse_x,mouse_y)
    With *This
      Protected px,py,Grid = \Grid
;       If \Container
;         Grid = \anchor\Grid-1
;       EndIf
      If \p
        px = (\p\x+\p\fs)
        py = (\p\y+\p\fs+\p\TabHeight)
      EndIf
      
      Protected mx = Match(mouse_x-px, Grid)
      Protected my = Match(mouse_y-py, Grid)
      Protected mw = Match((\x+\Width-Bool(Grid>1))-mouse_x, Grid)+Bool(Grid>1)
      Protected mh = Match((\y+\height-Bool(Grid>1))-mouse_y, Grid)+Bool(Grid>1)
      Protected mxw = Match(mouse_x-\x, Grid)+Bool(Grid>1)
      Protected myh = Match(mouse_y-\y, Grid)+Bool(Grid>1)
      
      Select \anchor
        Case \anchor[1] : Resize(*This, mx, #PB_Ignore, mw, #PB_Ignore)
        Case \anchor[2] : Resize(*This, #PB_Ignore, my, #PB_Ignore, mh)
        Case \anchor[3] : Resize(*This, #PB_Ignore, #PB_Ignore, mxw, #PB_Ignore)
        Case \anchor[4] : Resize(*This, #PB_Ignore, #PB_Ignore, #PB_Ignore, myh)
          
        Case \anchor[5] : Resize(*This, mx, my, mw, mh)
        Case \anchor[6] : Resize(*This, #PB_Ignore, my, mxw, mh)
        Case \anchor[7] : Resize(*This, #PB_Ignore, #PB_Ignore, mxw, myh)
        Case \anchor[8] : Resize(*This, mx, #PB_Ignore, mw, myh)
          
        Case \anchor[10] : Resize(*This, mx, my, #PB_Ignore, #PB_Ignore)
      EndSelect
    EndWith
  EndProcedure

  Procedure.i CallBack(*This.Widget_S, EventType.i, MouseScreenX.i=0, MouseScreenY.i=0)
    Protected repaint.i
    Static Last.i, Down.i, *Lastat.Widget_S, *Last.Widget_S, mouseB.i, *mouseat.Widget_S, Buttons
    
    With *This
      If *This > 0 And \color\alpha And Not \hide
        If Not MouseScreenX
          MouseScreenX = GetGadgetAttribute(EventGadget(), #PB_Canvas_MouseX)
        EndIf
        If Not MouseScreenY
          MouseScreenY = GetGadgetAttribute(EventGadget(), #PB_Canvas_MouseY)
        EndIf
        
        ; Если виджет под скроллбаром родителя то выходим
        If Bool(\p And \p\s And *This<>\p\s\v And \p\s\h<>*This And (\p\s\v\at Or \p\s\h\at))
          ProcedureReturn
        EndIf
        
        ; Panel tabs events
        If \Tab And \Tab\Type 
          \Tab\Hide = \Hide
          CallBack(\Tab, EventType.i, MouseScreenX.i, MouseScreenY.i) 
          If \Tab\at=1 Or \Tab\at=2
            ProcedureReturn 1
          EndIf
        EndIf
        
        ; childrens events
        If \s ; And \Type <> #PB_GadgetType_Splitter
          If \s\v And \s\v\Type And (CallBack(\s\v, EventType.i, MouseScreenX.i, MouseScreenY.i) Or \s\v\at)
            ProcedureReturn 1
          EndIf
          If \s\h And \s\h\Type And (CallBack(\s\h, EventType.i, MouseScreenX.i, MouseScreenY.i) Or \s\h\at)
            ProcedureReturn 1
          EndIf
        EndIf
        
        ; childrens events
        If \Splitter ; And \Type <> #PB_GadgetType_Splitter
          If \Splitter\v And \Splitter\v\Type And (CallBack(\Splitter\v, EventType.i, MouseScreenX.i, MouseScreenY.i) Or \Splitter\v\at)
            ProcedureReturn 1
          EndIf
          If \Splitter\h And \Splitter\h\Type And (CallBack(\Splitter\h, EventType.i, MouseScreenX.i, MouseScreenY.i) Or \Splitter\h\at)
            ProcedureReturn 1
          EndIf
        EndIf
        
        Select EventType 
          Case #PB_EventType_LeftButtonDown, 
               #PB_EventType_MiddleButtonDown, 
               #PB_EventType_RightButtonDown
            Buttons = 1
          Case #PB_EventType_LeftButtonUp, 
               #PB_EventType_MiddleButtonUp, 
               #PB_EventType_RightButtonUp
            Buttons = 0
        EndSelect
        
        ; anchors events
        Protected i 
        Static *p.Widget_S
        
        Select EventType 
          Case #PB_EventType_MouseMove
            If *p And *p\anchor
              Protected x = MouseScreenX-*p\anchor\Width/2
              Protected y = MouseScreeny-*p\anchor\Height/2
              
              CallBackAnchors(*p, x,y)
              
              ProcedureReturn 1
            Else
              For i = 10 To 1 Step - 1
                If \anchor[i]
                  If (MouseScreenX>\anchor[i]\X And MouseScreenX=<\anchor[i]\X+\anchor[i]\Width And 
                      MouseScreenY>\anchor[i]\Y And MouseScreenY=<\anchor[i]\Y+\anchor[i]\Height)
                    
                    If \anchor <> \anchor[i] : \anchor = \anchor[i]
                      If Not \anchor[i]\State
                        \anchor[i]\State = 1
                      EndIf
                      
                      If i<10
                        \anchor[i]\Cursor[1] = GetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor)
                        SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, \anchor[i]\Cursor)
                      EndIf
                      ProcedureReturn 1
                    EndIf
                    
                  ElseIf \anchor[i]\State = 1
                    \anchor[i]\State = 0
                    \anchor = 0
                    
                    If GetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor) <> \anchor[i]\Cursor[1]
                      SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, \anchor[i]\Cursor[1])
                    EndIf
                    ProcedureReturn 1
                  EndIf
                EndIf
              Next
            EndIf
            
          Case #PB_EventType_LeftButtonDown
            If \anchor : \anchor\State = 2 : *p = *This
              SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, \anchor\Cursor)
              ProcedureReturn 1
            EndIf
            
          Case #PB_EventType_LeftButtonUp
            If \anchor : \anchor\State = 1 : *p = 0
              SetGadgetAttribute(EventGadget(), #PB_Canvas_Cursor, \anchor\Cursor[1])
              ProcedureReturn 1
            EndIf
            
        EndSelect
        
        ; get at point buttons
        If (mouseB Or Buttons)
        ElseIf (MouseScreenX>=\X And MouseScreenX<\X+\Width And MouseScreenY>\Y And MouseScreenY=<\Y+\Height) 
          If (MouseScreenX>\X[1] And MouseScreenX=<\X[1]+\Width[1] And  MouseScreenY>\Y[1] And MouseScreenY=<\Y[1]+\Height[1])
            \at = 1
          ElseIf (MouseScreenX>\X[3] And MouseScreenX=<\X[3]+\Width[3] And MouseScreenY>\Y[3] And MouseScreenY=<\Y[3]+\Height[3])
            \at = 3
          ElseIf (MouseScreenX>\X[2] And MouseScreenX=<\X[2]+\Width[2] And MouseScreenY>\Y[2] And MouseScreenY=<\Y[2]+\Height[2])
            \at = 2
          Else
            \at =- 1 + Bool(\Type = #PB_GadgetType_Button)*4
          EndIf 
          
          Select EventType 
            Case #PB_EventType_MouseEnter : EventType = #PB_EventType_MouseMove
            Case #PB_EventType_MouseLeave : EventType = #PB_EventType_MouseMove
          EndSelect
          
           
          ; item at point
          If \at =- 1
            ; Panel tabs at point
            If \Tab
              ForEach \Tabs()
                If Not \Tabs()\Hide
                  If (MouseScreenX>\Tabs()\X And MouseScreenX=<\Tabs()\X+\Tabs()\Width And 
                      MouseScreenY>\Tabs()\Y And MouseScreenY=<\Tabs()\Y+\Tabs()\Height)
                    
                    If \index[1] <> ListIndex(\Tabs())
                      \index[1] = ListIndex(\Tabs())
                      \Tabs()\State = 1
                      repaint=1
                    EndIf
                    
                  ElseIf \Tabs()\State = 1
                    \Tabs()\State = 0
                    \index[1] =- 1
                    repaint=1
                  EndIf
                EndIf
              Next
            EndIf
            
            ForEach \Items()
              If \Items()\Drawing
                If (MouseScreenX>\Items()\X And MouseScreenX=<\Items()\X+\Items()\Width And 
                    MouseScreenY>\Items()\Y And MouseScreenY=<\Items()\Y+\Items()\Height)
                  
                  If \index[1] <> ListIndex(\Items())
                    \index[1] = ListIndex(\Items())
                    If Not \Items()\State
                      \Items()\State = 1
                    EndIf
                    \adress = @\Items()
                    ;;Debug \index[1]
                    repaint=1
                  EndIf
                  
                ElseIf \Items()\State = 1
                  \Items()\State = 0
                  \index[1] =- 1
                  repaint=1
                EndIf
              EndIf
            Next
            

            
; ;             ForEach \Draws()
; ;               If (MouseScreenX>\Draws()\X And MouseScreenX=<\Draws()\X+\Draws()\Width And 
; ;                       MouseScreenY>\Draws()\Y And MouseScreenY=<\Draws()\Y+\Draws()\Height)
; ;                     
; ;                     If \index[1] <> ListIndex(\Draws())
; ;                       \index[1] = ListIndex(\Draws())
; ;                       If Not \Draws()\State
; ;                         \Draws()\State = 1
; ;                       EndIf
; ;                       \adress = @\Draws()
; ;                       ;;Debug \index[1]
; ;                       repaint=1
; ;                     EndIf
; ;                     
; ;                   ElseIf \Draws()\State = 1
; ;                     \Draws()\State = 0
; ;                     \index[1] =- 1
; ;                     repaint=1
; ;                   EndIf
; ;                 Next
; ;                 
; ;             ; items at point
; ;             If \Drawing
; ;               ChangeCurrentElement(\Items(), \Drawing)
; ;               Repeat
; ;                 If \Items()\Drawing
; ;                   If (MouseScreenX>\Items()\X And MouseScreenX=<\Items()\X+\Items()\Width And 
; ;                       MouseScreenY>\Items()\Y And MouseScreenY=<\Items()\Y+\Items()\Height)
; ;                     
; ;                     If \index[1] <> ListIndex(\Items())
; ;                       \index[1] = ListIndex(\Items())
; ;                       If Not \Items()\State
; ;                         \Items()\State = 1
; ;                       EndIf
; ;                       \adress = @\Items()
; ;                       ;;Debug \index[1]
; ;                       repaint=1
; ;                     EndIf
; ;                     
; ;                   ElseIf \Items()\State = 1
; ;                     \Items()\State = 0
; ;                     \index[1] =- 1
; ;                     repaint=1
; ;                   EndIf
; ;                 EndIf
; ;               Until Not NextElement(\Items())
; ;             EndIf
            
          EndIf
          
          *mouseat = *This
        Else
          \at = 0
          
          Select EventType 
            Case #PB_EventType_MouseEnter, #PB_EventType_MouseLeave
              EventType = #PB_EventType_MouseMove
          EndSelect
          
          *mouseat = 0
        EndIf
        
        If *mouseat And *Lastat <> *mouseat
          If *Lastat
            repaint | Events(*Lastat, 0, #PB_EventType_MouseLeave, MouseScreenX, MouseScreenY)
          EndIf
          If *mouseat
            repaint | Events(*mouseat, 0, #PB_EventType_MouseEnter, MouseScreenX, MouseScreenY)
          EndIf
          
          *Last = *mouseat
          *Lastat = *mouseat
        EndIf
        
        Select EventType 
          Case #PB_EventType_Focus
            If \at       
              *Value\Active = *This
              repaint | Events(*This, \at, #PB_EventType_Focus, MouseScreenX, MouseScreenY)
            EndIf
            
          Case #PB_EventType_LostFocus 
            If *Value\Active
              *Value\Active = 0 
              repaint | Events(*This, - 1, #PB_EventType_LostFocus, MouseScreenX, MouseScreenY)
            EndIf
        EndSelect
        
        If *Lastat = *This
          If Last <> \at
            ;
            ; Debug ""+Last +" "+ *This\at +" "+ *This +" "+ *Last
            If Last > 0 Or (Last = 2 And \at =- 1 And *Last)
              repaint | Events(*This, Last, #PB_EventType_MouseLeave, MouseScreenX, MouseScreenY) : *Last = 0
            EndIf
            If Not \at Or (Last = 2 And \at =- 1 And *Last)
              repaint | Events(*This, - 1, #PB_EventType_MouseLeave, MouseScreenX, MouseScreenY) : *Last = 0
            EndIf
            
            If \at > 0 Or (\at And Not last) ; Or (Last =- 1 And \at = 2 And *Last)
              repaint | Events(*This, \at, #PB_EventType_MouseEnter, MouseScreenX, MouseScreenY)
            EndIf
            
            Last = \at
          EndIf
          
          
          
          Select EventType 
            Case #PB_EventType_MouseWheel
              Protected WheelDelta = GetGadgetAttribute(EventGadget(), #PB_Canvas_WheelDelta) ; bug in mac os
              
              If \at
                repaint | Events(*This, \at, EventType, MouseScreenX, MouseScreenY, -WheelDelta)
              ElseIf *Value\Active
                repaint | Events(*Value\Active, - 1, EventType, MouseScreenX, MouseScreenY, WheelDelta)
              EndIf
              
            Case #PB_EventType_LeftButtonDown : mouseB = 1
              If \at
                If *Value\Active <> *This
                  If *Value\Active
                    repaint | Events(*Value\Active, \at, #PB_EventType_LostFocus, MouseScreenX, MouseScreenY)
                  EndIf
                  repaint | Events(*This, \at, #PB_EventType_Focus, MouseScreenX, MouseScreenY)
                  *Value\Active = *This
                EndIf
                
                Down = \at
                repaint | Events(*This, \at, EventType, MouseScreenX, MouseScreenY)
              EndIf
              
            Case #PB_EventType_LeftButtonUp : mouseB = 0
              If Down
                repaint | Events(*This, Down, EventType, MouseScreenX, MouseScreenY)
                Down = 0
              EndIf
              
            Case #PB_EventType_LeftDoubleClick, 
                 #PB_EventType_LeftButtonDown, 
                 #PB_EventType_MouseMove
              
              If \at
                repaint | Events(*This, \at, EventType, MouseScreenX, MouseScreenY)
              EndIf
          EndSelect
        EndIf
      EndIf
    EndWith
    
    ProcedureReturn repaint
  EndProcedure
  
  
  ;-
  Procedure.i Bar(Type.i, X.i,Y.i,Width.i,Height.i, Min.i, Max.i, PageLength.i, Flag.i=0, Radius.i=7, SliderLen.i=7)
    Protected *This.Widget_S = AllocateStructure(Widget_S)
    
    With *This
      \X =- 1
      \Y =- 1
      \Type = Type
      \Radius = Radius
      \ButtonLen[3] = SliderLen ; min thumb size
      \Ticks = Bool(Flag&#PB_Bar_Ticks)
      \Smooth = Bool(Flag&#PB_Bar_Smooth)
      \Vertical = Bool(Flag&#PB_Vertical)
      
      \ArrowSize[1] = 4
      \ArrowSize[2] = 4
      \ArrowType[1] =- 1 ; -1 0 1
      \ArrowType[2] =- 1 ; -1 0 1
      
      ; Цвет фона скролла
      \color[0]\alpha = 255
      \color\alpha[1] = 0
      \Color\State = 0
      \Color\Back = $FFF9F9F9
      \Color\Frame = \Color\Back
      \Color\Line = $FFFFFFFF
      
      \Color[1] = Colors
      \Color[2] = Colors
      \Color[3] = Colors
      
      \color[1]\alpha = 255
      \color[2]\alpha = 255
      \color[3]\alpha = 255
      \color[1]\alpha[1] = 128
      \color[2]\alpha[1] = 128
      \color[3]\alpha[1] = 128
      
      If Not Bool(Flag&#PB_Bar_NoButtons)
        If \Vertical
          If width < 21
            \ButtonLen = width - 1
          Else
            \ButtonLen = 17
          EndIf
        Else
          If height < 21
            \ButtonLen = height - 1
          Else
            \ButtonLen = 17
          EndIf
        EndIf
      EndIf
      
      If \Min <> Min : SetAttribute(*This, #PB_Bar_Minimum, Min) : EndIf
      If \Max <> Max : SetAttribute(*This, #PB_Bar_Maximum, Max) : EndIf
      If \Page\len <> Pagelength : SetAttribute(*This, #PB_Bar_PageLength, Pagelength) : EndIf
      If Bool(Flag&#PB_Bar_Inverted) : SetAttribute(*This, #PB_Bar_Inverted, #True) : EndIf
      
    EndWith
    
    SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
    Resize(*This, X,Y,Width,Height)
    SetLastParent(*This)
    
    ProcedureReturn *This
  EndProcedure
    
  Procedure.i Bars(*Scroll.Scroll_S, Size.i, Radius.i, Both.b)
    With *Scroll     
      \v = Scroll(#PB_Ignore,#PB_Ignore,Size,#PB_Ignore, 0,0,0, #PB_Vertical, Radius)
      \v\hide = \v\hide[1]
      \v\s = *Scroll
      
      If Both
        \h = Scroll(#PB_Ignore,#PB_Ignore,#PB_Ignore,Size, 0,0,0, 0, Radius)
        \h\hide = \h\hide[1]
      Else
        \h.Widget_S = AllocateStructure(Widget_S)
        \h\hide = 1
      EndIf
      \h\s = *Scroll
    EndWith
    
    ProcedureReturn *Scroll
  EndProcedure
  
  Procedure.i Scroll(X.i,Y.i,Width.i,Height.i, Min.i, Max.i, PageLength.i, Flag.i=0, Radius.i=7)
    ProcedureReturn Bar(#PB_GadgetType_ScrollBar, X,Y,Width,Height, Min, Max, PageLength, Flag, Radius)
  EndProcedure
  
  Procedure.i Progress(X.i,Y.i,Width.i,Height.i, Min.i, Max.i, Flag.i=0)
    Protected Smooth = Bool(Flag&#PB_ProgressBar_Smooth) * #PB_Bar_Smooth
    Protected Vertical = Bool(Flag&#PB_ProgressBar_Vertical) * (#PB_Vertical|#PB_Bar_Inverted)
    ProcedureReturn Bar(#PB_GadgetType_ProgressBar, X,Y,Width,Height, Min, Max, 0, Smooth|Vertical|#PB_Bar_NoButtons, 0)
  EndProcedure
  
  Procedure.i Track(X.i,Y.i,Width.i,Height.i, Min.i, Max.i, Flag.i=0)
    Protected Ticks = Bool(Flag&#PB_TrackBar_Ticks) * #PB_Bar_Ticks
    Protected Vertical = Bool(Flag&#PB_TrackBar_Vertical) * (#PB_Vertical|#PB_Bar_Inverted)
    ProcedureReturn Bar(#PB_GadgetType_TrackBar, X,Y,Width,Height, Min, Max, 0, Ticks|Vertical|#PB_Bar_NoButtons, 0)
  EndProcedure
  
  Procedure.i Image(X.i,Y.i,Width.i,Height.i, Image.i, Flag.i=0)
    Protected Size = 16, *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \s = AllocateStructure(Scroll_S)
      \Type = #PB_GadgetType_Image
      \Color = Colors
      \color\alpha = 255
      
      \fs = 1
      \bs = 1
      
      If IsImage(Image)
        \Image\change = 1
        \image\index = Image
        \image\adress = ImageID(Image)
        \Image\width = ImageWidth(Image)
        \Image\height = ImageHeight(Image)
      EndIf
      
      \s\v = Scroll(#PB_Ignore,#PB_Ignore,Size,#PB_Ignore, 0,\Image\height, Height, #PB_Vertical, 7) : \s\v\p = *This
      \s\h = Scroll(#PB_Ignore,#PB_Ignore,#PB_Ignore,Size, 0,\Image\width,Width, 0, 7) : \s\h\p = *This
      
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Button(X.i,Y.i,Width.i,Height.i, Text.s, Flag.i=0, Image.i=-1)
    Protected *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \Type = #PB_GadgetType_Button
      \Color = Colors
      \color\alpha = 255
      
      \fs = 1
      
      \Text\Align\Vertical = 1
      \Text\Align\Horizontal = 1
      
      If IsImage(Image)
        \image\index = Image
        \image\adress = ImageID(Image)
        \Image\width = ImageWidth(Image)
        \Image\height = ImageHeight(Image)
        
        \Image\Align\Vertical = 1
        \Image\Align\Horizontal = 1
      EndIf
      
      SetText(*This, Text.s)
      SetAnchors(*This, Flag&#PB_Flag_AnchorsGadget)
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Width=Match(Width,\Grid)+Bool(\Grid>1)
      Height=Match(Height,\Grid)+Bool(\Grid>1)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Text(X.i,Y.i,Width.i,Height.i, Text.s, Flag.i=0)
    Protected *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \Type = #PB_GadgetType_Text
      \Color = Colors
      \color\alpha = 255
      
      \fs = 1
      
      \Text\x[1] = 5
      \Text\y[2] = 5
      
      Flag|#PB_Text_MultiLine|#PB_Text_ReadOnly;|#PB_Flag_BorderLess
      
      If Bool(Flag&#PB_Text_WordWrap)
        Flag&~#PB_Text_MultiLine
        \Text\MultiLine =- 1
      EndIf
      
      If Bool(Flag&#PB_Text_MultiLine)
        Flag&~#PB_Text_WordWrap
        \Text\MultiLine = 1
      EndIf
      
      SetText(*This, Text.s)
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Tree(X.i,Y.i,Width.i,Height.i, Flag.i=0)
    Protected Size = 16, *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \s = AllocateStructure(Scroll_S) 
      \Type = #PB_GadgetType_Tree
      \Color = Colors
      \color\alpha = 255
      \Color\Back = $FFF9F9F9
      
      \index[1] =- 1
      \index[2] =- 1
      \Text\height = 20
      
      \sublevellen = 18
      \Flag\GridLines = Bool(flag&Widget::#PB_Flag_GridLines)
      \Flag\MultiSelect = Bool(flag&Widget::#PB_Flag_MultiSelect)
      \Flag\ClickSelect = Bool(flag&Widget::#PB_Flag_ClickSelect)
      \Flag\FullSelection = Bool(Not flag&Widget::#PB_DisplayMode_NoFullSelection)
      \Flag\AlwaysSelection = Bool(flag&Widget::#PB_DisplayMode_AlwaysShowSelection)
      
      \Flag\Lines = Bool(Not flag&Widget::#PB_Flag_NoLines)*8
      \flag\buttons = Bool(Not flag&Widget::#PB_Flag_NoButtons)*9 ; Это еще будет размер чек бокса
      \Flag\CheckBoxes = Bool(flag&Widget::#PB_Flag_CheckBoxes)*12; Это еще будет размер чек бокса
      
      \fs = 1
      \bs = 2
      
      \s\v = Scroll(#PB_Ignore,#PB_Ignore,Size,#PB_Ignore, 0,0,Height, #PB_Vertical, 7) : \s\v\p = *This
      \s\h = Scroll(#PB_Ignore,#PB_Ignore,#PB_Ignore,Size, 0,0,Width, 0, 7) : \s\h\p = *This
      
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Frame(X.i,Y.i,Width.i,Height.i, Text.s, Flag.i=0)
    Protected Size = 16, *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \Type = #PB_GadgetType_Frame
      \Color = Colors
      \color\alpha = 255
      \Color\Back = $FFF9F9F9
      
      \fs = 1
      
      \Text\String = Text.s
      \Text\Change = 1
      
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Splitter(X.i,Y.i,Width.i,Height.i, First.i, Second.i, Flag.i=0)
    Protected Vertical = Bool(Not Flag&#PB_Splitter_Vertical) * #PB_Vertical
    Protected *Bar.Widget_S, *This.Widget_S, Max : If Vertical : Max = Height : Else : Max = Width : EndIf
    *This = Bar(0, X,Y,Width,Height, 0, Max, 0, Vertical|#PB_Bar_NoButtons, 0, 7)
    
    With *This
      \Splitter = AllocateStructure(Scroll_S)
      \Splitter\v = First
      \Splitter\h = Second
      
      \Type = #PB_GadgetType_Splitter
      \Thumb\len = 7
      
      *Bar = \Splitter\v 
      ; thisis bar
      If Not IsGadget(First) And IsBar(*Bar)
        *Bar\p = *This
        \Type[1] = *Bar\Type
      EndIf
      
      *Bar = \Splitter\h 
      ; thisis bar
      If Not IsGadget(Second) And IsBar(*Bar)
        *Bar\p = *This
        \Type[2] = *Bar\Type
      EndIf
      
      If \Vertical
        \Cursor = #PB_Cursor_UpDown
        SetState(*This, \height/2-1)
      Else
        \Cursor = #PB_Cursor_LeftRight
        SetState(*This, \width/2-1)
      EndIf
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Property(X.i,Y.i,Width.i,Height.i, SplitterPos.i = 80, Flag.i=0)
     Protected Size = 16, *This.Widget_S = AllocateStructure(Widget_S) 
    
     With *This
       \X =- 1
      \Y =- 1
      
      \ButtonLen[3] = 7 ; min thumb size
      
      
      SetAttribute(*This, #PB_Bar_Maximum, Width) 
       
       
       
       
      \Container = 1
      \Thumb\len = 7
      \Type = #PB_GadgetType_Property
      
      
      \Cursor = #PB_Cursor_LeftRight
      SetState(*This, SplitterPos)
      
      
     \s = AllocateStructure(Scroll_S) 
      \Color = Colors
      \color\alpha = 255
      \Color\Back = $FFF9F9F9
      
      \index[1] =- 1
      \index[2] =- 1
      \Text\height = 20
      
      \sublevellen = 18
      \Flag\GridLines = Bool(flag&Widget::#PB_Flag_GridLines)
      \Flag\MultiSelect = Bool(flag&Widget::#PB_Flag_MultiSelect)
      \Flag\ClickSelect = Bool(flag&Widget::#PB_Flag_ClickSelect)
      \Flag\FullSelection = Bool(Not flag&Widget::#PB_DisplayMode_NoFullSelection)
      \Flag\AlwaysSelection = Bool(flag&Widget::#PB_DisplayMode_AlwaysShowSelection)
      
      \Flag\Lines = Bool(Not flag&Widget::#PB_Flag_NoLines)*8
      \flag\buttons = Bool(Not flag&Widget::#PB_Flag_NoButtons)*9 ; Это еще будет размер чек бокса
      \Flag\CheckBoxes = Bool(flag&Widget::#PB_Flag_CheckBoxes)*12; Это еще будет размер чек бокса
      
      \fs = 1
      \bs = 2
      
      \s\v = Scroll(#PB_Ignore,#PB_Ignore,Size,#PB_Ignore, 0,0,Height, #PB_Vertical, 7) : \s\v\p = *This
      \s\h = Scroll(#PB_Ignore,#PB_Ignore,#PB_Ignore,Size, 0,0,Width, 0, 7) : \s\h\p = *This
      
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  ;- Containers
  Procedure.i ScrollArea(X.i,Y.i,Width.i,Height.i, ScrollAreaWidth.i, ScrollAreaHeight.i, ScrollStep.i=1, Flag.i=0)
    Protected Size = 16, *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \Container = 1
      \s = AllocateStructure(Scroll_S) 
      \Type = #PB_GadgetType_ScrollArea
      \Color = Colors
      \color\alpha = 255
      \Color\Back = $FFF9F9F9
      
      \fs = 1
      \bs = 2
      
      \s\v = Scroll(#PB_Ignore,#PB_Ignore,Size,#PB_Ignore, 0,ScrollAreaHeight,Height, #PB_Vertical, 7) : \s\v\p = *This
      \s\h = Scroll(#PB_Ignore,#PB_Ignore,#PB_Ignore,Size, 0,ScrollAreaWidth,Width, 0, 7) : \s\h\p = *This
      
      SetAnchors(*This, Flag&#PB_Flag_AnchorsGadget)
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Width=Match(Width,\Grid)+Bool(\Grid>1)
      Height=Match(Height,\Grid)+Bool(\Grid>1)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
      OpenList(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Container(X.i,Y.i,Width.i,Height.i, Flag.i=0)
    Protected Size = 16, *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \Container = 1
      \Type = #PB_GadgetType_Container
      \Color = Colors
      \color\alpha = 255
      \Color\Back = $FFF9F9F9
      
      \fs = 1
      \bs = 1
      
      SetAnchors(*This, Flag&#PB_Flag_AnchorsGadget)
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Width=Match(Width,\Grid)+Bool(\Grid>1)
      Height=Match(Height,\Grid)+Bool(\Grid>1)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
      OpenList(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Panel(X.i,Y.i,Width.i,Height.i, Flag.i=0)
    Protected Size = 16, *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \Container = 1
      \Type = #PB_GadgetType_Panel
      \Color = Colors
      \color\alpha = 255
      \Color\Back = $FFF9F9F9
      
      \index[1] =- 1
      \index[2] =- 1
      
      \Tab = AllocateStructure(Widget_S)
      \Tab\Type = #PB_GadgetType_ScrollBar
      \Tab\p = *This
      \Tab\Height = 27
      \Tab\ButtonLen = 13 
      \Tab\Page\len = Width
      
      \Tab\ArrowSize[1] = 6
      \Tab\ArrowSize[2] = 6
      \Tab\ArrowType[1] =- 1
      \Tab\ArrowType[2] =- 1
      \Tab\Color[1] = Colors
      \Tab\Color[2] = Colors
      
      \Tab\color[0]\alpha = 255
      \Tab\color[1]\alpha = 255
      \Tab\color[2]\alpha = 255
      
      \TabHeight = \Tab\height
      
      \fs = 1
      \bs = 1
      
      SetAnchors(*This, Flag&#PB_Flag_AnchorsGadget)
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Width=Match(Width,\Grid)+Bool(\Grid>1)
      Height=Match(Height,\Grid)+Bool(\Grid>1)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
      OpenList(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
  
  Procedure.i Window(X.i,Y.i,Width.i,Height.i, Text.s, Flag.i=0)
    Protected Size = 16, *This.Widget_S = AllocateStructure(Widget_S) 
    
    With *This
      \Container =- 1
      \Type =- 1
      \Color = Colors
      \color\alpha = 255
      \Color\Back = $FFF9F9F9
      
      \index[1] =- 1
      \index[2] =- 1
      
      \TabHeight = 27
      
      \fs = 1
      \bs = 1
      
      SetText(*This, Text.s)
      SetAnchors(*This, Flag&#PB_Flag_AnchorsGadget)
      SetAutoSize(*This, Flag&#PB_Flag_AutoSize)
      Width=Match(Width,\Grid)+Bool(\Grid>1)
      Height=Match(Height,\Grid)+Bool(\Grid>1)
      Resize(*This, X.i,Y.i,Width.i,Height)
      SetLastParent(*This)
      OpenList(*This)
    EndWith
    
    ProcedureReturn *This
  EndProcedure
EndModule

;-
Macro GetActiveWidget()
  Widget::*Value\Active
EndMacro

Macro EventWidget()
  Widget::*Value\Widget
EndMacro

Macro WidgetEventType()
  Widget::*Value\Type
EndMacro


;- EXAMPLE
CompilerIf #PB_Compiler_IsMainFile ;= 100
  EnableExplicit
  UseModule Widget
  
  Global.i gEvent, gQuit, value, direction, x=10,y=10
  Global *Bar_0.Widget_S=AllocateStructure(Widget_S)
  Global *Bar_1.Widget_S=AllocateStructure(Widget_S)
  Global *Scroll_1.Widget_S=AllocateStructure(Widget_S)
  Global *Scroll_2.Widget_S=AllocateStructure(Widget_S)
  Global *Scroll_3.Widget_S=AllocateStructure(Widget_S)
  Global *child_0.Widget_S=AllocateStructure(Widget_S)
  Global *child_1.Widget_S=AllocateStructure(Widget_S)
  Global *child_2.Widget_S=AllocateStructure(Widget_S)
  Global *ScrollArea.Widget_S=AllocateStructure(Widget_S)
  Global *Tree_0.Widget_S=AllocateStructure(Widget_S)
  Global *Tree_3.Widget_S=AllocateStructure(Widget_S)
  Global *Tree_4.Widget_S=AllocateStructure(Widget_S)
  
  UsePNGImageDecoder()
  
  If Not LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/Background.bmp")
    End
  EndIf
  
  If Not LoadImage(1, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Paste.png")
    End
  EndIf
  
  If Not LoadImage(2, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Copy.png")
    End
  EndIf
  
  If CreateImage(3, 600,600, 32,#PB_Image_Transparent) And StartDrawing(ImageOutput(3))
    DrawingMode(#PB_2DDrawing_AllChannels) 
    For x=0 To 600 Step 5
      For y=0 To 600 Step 5
        Line(x, y, 1,1, $FF000000)
      Next y
    Next x
    StopDrawing()
  EndIf
   
;    CreateImage(3,300,200,24,$FFFFFF)
; StartDrawing(ImageOutput(3))
; For X = 10 To 300 Step 40
;   For Y = 10 To 200 Step 40
;      Line(0,Y,300,1,$C0C0C2)
;      Line(X,0,1,200,$C0C0C2)
;   Next
; Next
; StopDrawing()


; CreateImage(3,300,200,24,$FFFFFF)
; StartDrawing(ImageOutput(3))
; For X = 10 To 300 Step 20
;   For Y = 10 To 200 Step 20
;      Line(0,Y,300,1,$C0C0C2)
;      Line(X,0,1,200,$C0C0C2)
;   Next
; Next
; StopDrawing()

  Procedure ReDraw(Gadget.i)
    If StartDrawing(CanvasOutput(Gadget))
      DrawingMode(#PB_2DDrawing_Default)
      Box(0,0,OutputWidth(),OutputHeight(), $FFFFFF)
      
      Draw(*Bar_1)
      ;Draw(*Bar_0)
      
      StopDrawing()
    EndIf
  EndProcedure
  
  ;   Procedure Widgets_CallBack()
  ;     Debug 4444
  ;   EndProcedure
  
  Procedure Canvas_Events(Canvas.i, EventType.i)
    Protected Repaint, iWidth, iHeight
    Protected Width = GadgetWidth(Canvas)
    Protected Height = GadgetHeight(Canvas)
    Protected mouseX = GetGadgetAttribute(Canvas, #PB_Canvas_MouseX)
    Protected mouseY = GetGadgetAttribute(Canvas, #PB_Canvas_MouseY)
    
    
    
    Select EventType
      Case #PB_EventType_Resize : ResizeGadget(Canvas, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore) ; Bug (562)
        Resize(*Bar_1, x, y, Width-x*2, Height-y*2)  
        Repaint = 1 
    EndSelect
    
    Repaint | CallBack(*Bar_1, EventType, mouseX,mouseY)
    Repaint | CallBack(*Tree_4, EventType, mouseX,mouseY)
    Repaint | CallBack(*Tree_0, EventType, mouseX,mouseY)
    Repaint | CallBack(*Tree_3, EventType, mouseX,mouseY)
    ;     Repaint | CallBack(*child_0, EventType, mouseX,mouseY)
    ;     Repaint | CallBack(*child_2, EventType, mouseX,mouseY)
    ;     Repaint | CallBack(*Bar_0, EventType, mouseX,mouseY)
    ;     Repaint | CallBack(*Scroll_3, EventType, mouseX,mouseY)
    ;     Repaint | CallBack(*ScrollArea, EventType, mouseX,mouseY)
    ;     Repaint | CallBack(*Scroll_1, EventType, mouseX,mouseY)
    
    ;Debug WidgetEventType()
    
    If Repaint
      ReDraw(1)
    EndIf
  EndProcedure
  
  Procedure Canvas_CallBack()
    ; Canvas events bug fix
    Protected Result.b
    Static MouseLeave.b
    Protected EventGadget.i = EventGadget()
    Protected EventType.i = EventType()
    Protected Width = GadgetWidth(EventGadget)
    Protected Height = GadgetHeight(EventGadget)
    Protected MouseX = GetGadgetAttribute(EventGadget, #PB_Canvas_MouseX)
    Protected MouseY = GetGadgetAttribute(EventGadget, #PB_Canvas_MouseY)
    
    ; Это из за ошибки в мак ос и линукс
    CompilerIf #PB_Compiler_OS = #PB_OS_MacOS Or #PB_Compiler_OS = #PB_OS_Linux
      Select EventType 
        Case #PB_EventType_MouseEnter 
          If GetGadgetAttribute(EventGadget, #PB_Canvas_Buttons) Or MouseLeave =- 1
            EventType = #PB_EventType_MouseMove
            MouseLeave = 0
          EndIf
          
        Case #PB_EventType_MouseLeave 
          If GetGadgetAttribute(EventGadget, #PB_Canvas_Buttons)
            EventType = #PB_EventType_MouseMove
            MouseLeave = 1
          EndIf
          
        Case #PB_EventType_LeftButtonDown
          If GetActiveGadget()<>EventGadget
            SetActiveGadget(EventGadget)
          EndIf
          
        Case #PB_EventType_LeftButtonUp
          If MouseLeave = 1 And Not Bool((MouseX>=0 And MouseX<Width) And (MouseY>=0 And MouseY<Height))
            MouseLeave = 0
            CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
              Result | Canvas_Events(EventGadget, #PB_EventType_LeftButtonUp)
              EventType = #PB_EventType_MouseLeave
            CompilerEndIf
          Else
            MouseLeave =- 1
            Result | Canvas_Events(EventGadget, #PB_EventType_LeftButtonUp)
            EventType = #PB_EventType_LeftClick
          EndIf
          
        Case #PB_EventType_LeftClick : ProcedureReturn 0
      EndSelect
    CompilerEndIf
    
    
    If EventType = #PB_EventType_MouseMove
      Static Last_X, Last_Y
      If Last_Y <> Mousey
        Last_Y = Mousey
        Result | Canvas_Events(EventGadget, EventType)
      EndIf
      If Last_x <> Mousex
        Last_x = Mousex
        Result | Canvas_Events(EventGadget, EventType)
      EndIf
    Else
      Result | Canvas_Events(EventGadget, EventType)
    EndIf
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure Window_0_Resize()
    ResizeGadget(1, #PB_Ignore, #PB_Ignore, WindowWidth(EventWindow(), #PB_Window_InnerCoordinate)-20, WindowHeight(EventWindow(), #PB_Window_InnerCoordinate)-50)
    ResizeGadget(10, #PB_Ignore, WindowHeight(EventWindow(), #PB_Window_InnerCoordinate)-35, WindowWidth(EventWindow(), #PB_Window_InnerCoordinate)-10, #PB_Ignore)
  EndProcedure
  
  Procedure Window_0()
    If OpenWindow(0, 0, 0, 400, 400, "Demo inverted scrollbar direction", #PB_Window_SystemMenu | #PB_Window_ScreenCentered | #PB_Window_SizeGadget)
      ButtonGadget   (10,    5,   365, 390,  30, "start change scrollbar", #PB_Button_Toggle)
      
      CanvasGadget(1, 10,10, 380, 350, #PB_Canvas_Keyboard|#PB_Canvas_Container)
      SetGadgetAttribute(1, #PB_Canvas_Cursor, #PB_Cursor_Hand)
      
      
      ;*Scroll_1.Widget_S  = Image(0, 0, 0, 0, 0, #PB_Flag_AutoSize); : SetState(*Scroll_1, 1) 
;       *Scroll_1.Widget_S = Tree(10,20,250,135, #PB_Flag_AutoSize|#PB_Flag_Checkboxes) 
;       AddItem(*Scroll_1, 0, "Tree_0", -1 )
;       AddItem(*Scroll_1, 1, "Tree_1_1", -1, 1) 
;       AddItem(*Scroll_1, 4, "Tree_1_1_1", -1, 2) 
;       AddItem(*Scroll_1, 5, "Tree_1_1_2", -1, 2) 
;       AddItem(*Scroll_1, 6, "Tree_1_1_2_1", -1, 3) 
;       AddItem(*Scroll_1, 8, "Tree_1_1_2_1_1_4jhhhhhhhhhhhhh", -1, 4) 
;       AddItem(*Scroll_1, 7, "Tree_1_1_2_2", -1, 3) 
;       AddItem(*Scroll_1, 2, "Tree_1_2", -1, 1) 
;       AddItem(*Scroll_1, 3, "Tree_1_3", -1, 1) 
;       AddItem(*Scroll_1, 9, "Tree_2",-1 )
;       AddItem(*Scroll_1, 10, "Tree_3", -1 )
;       Define i
;       For i=0 To 20;0;00
;         AddItem(*Scroll_1, -1, "Tree_item_"+Str(i), -1 )
;       Next
      
      *Scroll_1.Widget_S = Property(10,20,250,135,65, #PB_Flag_AutoSize) 
      AddItem(*Scroll_1, -1, " Общее", -1, 0)
      AddItem(*Scroll_1, -1, "String Text Button_0", -1, 1)
      AddItem(*Scroll_1, -1, " Координаты", -1, 0)
      AddItem(*Scroll_1, -1, "Spin X 0|100", -1, 1)
      AddItem(*Scroll_1, -1, "Spin Y 0|200", -1, 1)
      AddItem(*Scroll_1, -1, "Spin Width 0|100", -1, 1)
      AddItem(*Scroll_1, -1, "Spin Height 0|200", -1, 1)
      
      AddItem(*Scroll_1, -1, " Поведение", -1, 0)
      
      AddItem(*Scroll_1, -1, "Button Puch C:\as\Img\Image.png", -1, 1)
      AddItem(*Scroll_1, -1, "ComboBox Disable True|False", -1, 1)
      AddItem(*Scroll_1, -1, "ComboBox Flag #_Event_Close|#_Event_Size|#_Event_Move", -1, 1)
      
      *Scroll_2.Widget_S  = ScrollArea(0, 0, 0, 0, 250,250) : SetState(*Scroll_2\s\h, 45) : CloseList()
      ; *Scroll_3.Widget_S  = Progress(0, 0, 0, 0, 0,100,0) : SetState(*Scroll_3, 50)
      *Scroll_3.Widget_S = Panel(1, 1, 548, 548) 
      AddItem(*Scroll_3, -1, "Panel_0")
      Define Text.s = "Vertical & Horizontal" + #LF$ + "   Centered   Text in   " + #LF$ + "Multiline TextWidget"
      
      ;*Tree_4.Widget_S = Window(10,10,150,75,"Window_0", #PB_Flag_AnchorsGadget) 
      *Tree_4.Widget_S = Container(10,10,150,75,#PB_Flag_AnchorsGadget) 
      *Tree_0.Widget_S = Button(15,15,100,30, "butt_anchor_0", #PB_Flag_AnchorsGadget)
      CloseList()
      *Tree_3.Widget_S = Button(15,95,100,20, "butt_anchor_0", #PB_Flag_AnchorsGadget)
      
      SetImage(*Scroll_3, 3)
      SetImage(*Tree_4, 3)
      
      AddItem(*Scroll_3, -1, "Panel_1")
         
      *Tree_0.Widget_S = Tree(10,20,250,135, #PB_Flag_AutoSize) 
      AddItem(*Tree_0, 0, "Tree_0", -1 )
      AddItem(*Tree_0, 1, "Tree_1_1", -1, 1) 
      AddItem(*Tree_0, 4, "Tree_1_1_1", -1, 2) 
      AddItem(*Tree_0, 5, "Tree_1_1_2", -1, 2) 
      AddItem(*Tree_0, 6, "Tree_1_1_2_1", -1, 3) 
      AddItem(*Tree_0, 8, "Tree_1_1_2_1_1_4jhhhhhhhhhhhhh", -1, 4) 
      AddItem(*Tree_0, 7, "Tree_1_1_2_2", -1, 3) 
      AddItem(*Tree_0, 2, "Tree_1_2", -1, 1) 
      AddItem(*Tree_0, 3, "Tree_1_3", -1, 1) 
      AddItem(*Tree_0, 9, "Tree_2",-1 )
      AddItem(*Tree_0, 10, "Tree_3", -1 )
;       Define i
;       For i=0 To 10;0;0
;         AddItem(*Tree_0, -1, "Tree_item_"+Str(i), -1 )
;       Next
      ;*Scroll_3.Widget_S = *Tree_0
      SetState(*Tree_0, 1)
      
      AddItem(*Scroll_3, -1, "Panel_2")
      Container(10,10,150,55,#PB_Container_Flat) 
      Hide(Container(-10,-10,150,55,#PB_Container_Flat), 1)  
      Button(50,-10,50,35, "butt") 
      CloseList()
      CloseList()
      
      AddItem(*Scroll_3, -1, "Panel_3")
      Container(10,10,150,55,#PB_Container_Flat) 
      Container(10,10,150,55,#PB_Container_Flat) 
      Hide(Button(10,-10,50,35, "butt_0"), 1) 
      Button(10,20,50,35, "butt_1") 
      CloseList()
      CloseList()
      
      AddItem(*Scroll_3, -1, "Panel_4")
      Button(0,0,50,35, "butt_0")
      
      AddItem(*Scroll_3, -1, "Panel_5")
      Button(1,1,50,35, "butt_0")
      CloseList()
      
      
;       *Scroll_3\Image\index = 3
;       *Scroll_3\Image\adress = ImageID(3)
;       *Scroll_3\Image\width = ImageWidth(3)
;       *Scroll_3\Image\height = ImageHeight(3)
      
      
      *Bar_0 = Splitter(10, 10, 360,  330, *Scroll_3, *Scroll_2)
      *Bar_1 = Splitter(10, 10, 360,  330, *Scroll_1, *Bar_0, #PB_Splitter_Vertical)
      
      *child_0.Widget_S  = Progress(50, 20, 150, 20, 0,200,100) : SetState(*child_0, 20)
      *child_1.Widget_S  = Progress(10, 40, 100, 20, 0,200,100) : SetState(*child_1, 50)
      *child_2.Widget_S  = Progress(10, 70, 100, 20, 0,200,100) : SetState(*child_2, 80)
      
      *ScrollArea.Widget_S  = ScrollArea(50, 50, 150, 150, 250,250) : CloseList() : SetParent(*ScrollArea, *Scroll_2)
      
      SetParent(*child_0, *Scroll_2)
      SetParent(*child_1, *ScrollArea)
      SetParent(*child_2, *ScrollArea)
      
      ;
      ;   SetAttribute(*Scroll_1, #PB_DisplayMode, 0)
      
      ;       SetAttribute(*Bar_1, #PB_Splitter_FirstFixed, 120)
      ;       SetAttribute(*Bar_1, #PB_Splitter_SecondFixed, 80)
      ;       
      ;       SetAttribute(*Bar_1, #PB_Splitter_FirstMinimumSize, 120)
      ;       SetAttribute(*Bar_1, #PB_Splitter_SecondMinimumSize, 80)
      ;       
      ;       SetAttribute(*Bar_0, #PB_Splitter_FirstMinimumSize, 100)
      ;       SetAttribute(*Bar_0, #PB_Splitter_SecondMinimumSize, 50)
      
      ;       SetState(*Bar_0, 25)
      
      BindGadgetEvent(1, @Canvas_CallBack())
      
      CloseGadgetList()
      
      ReDraw(1)
      
      BindEvent(#PB_Event_SizeWindow, @Window_0_Resize(), 0)
    EndIf
  EndProcedure
  
  Window_0()
  
  direction = 1
  Repeat
    gEvent= WaitWindowEvent()
    
    Select gEvent
      Case #PB_Event_CloseWindow
        gQuit= #True
        
      Case #PB_Event_Timer
        ;         If IsStart(*Bar_0)
        ;           direction = 1
        ;         EndIf
        ;         If IsStop(*Bar_0)
        ;           direction =- 1
        ;         EndIf
        ;         
        ;         value + direction
        ;         
        ;         If SetState(*Bar_0, value)
        ;           ;PostEvent(#PB_Event_Gadget, 0, 1, -1)
        ;           ReDraw(1)
        ;         EndIf
        
      Case #PB_Event_Gadget
        
        ;         Select EventGadget()
        ;           Case 10
        ;             value = GetState(*Bar_0)
        ;             If GetGadgetState(10)
        ;               AddWindowTimer(0, 1, 10)
        ;             Else
        ;               RemoveWindowTimer(0, 1)
        ;             EndIf
        ;         EndSelect
        ;         
        ;         ; Get interaction with the scroll bar
        ;         CallBack(*Bar_0, EventType())
        ;         
        ;         If WidgetEventType() = #PB_EventType_Change
        ;           SetWindowTitle(0, "Change scroll direction "+ Str(GetAttribute(EventWidget(), #PB_Direction)))
        ;         EndIf
        ;         
        ;         ReDraw(1)
    EndSelect
    
  Until gQuit
CompilerEndIf


;- EXAMPLE
CompilerIf #PB_Compiler_IsMainFile
  
  UseModule Widget
  UsePNGImageDecoder()
  
  If Not LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/Background.bmp")
    End
  EndIf
  
  If Not LoadImage(1, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Paste.png")
    End
  EndIf
  
  If Not LoadImage(2, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Copy.png")
    End
  EndIf
  
  Global NewMap Widgets.i()
  
  Procedure Widget_Draws(Gadget.i)
    If StartDrawing(CanvasOutput(Gadget))
      DrawingMode(#PB_2DDrawing_Default)
      Box(0,0,OutputWidth(),OutputHeight(), $FFFFFF)
      
      ForEach Widgets()
        Draw(Widgets())
      Next
      
      StopDrawing()
    EndIf
  EndProcedure
  
  Procedure Widgets_Events(Canvas.i, EventType.i)
    Protected Repaint, iWidth, iHeight
    Protected Width = GadgetWidth(Canvas)
    Protected Height = GadgetHeight(Canvas)
    Protected mouseX = GetGadgetAttribute(Canvas, #PB_Canvas_MouseX)
    Protected mouseY = GetGadgetAttribute(Canvas, #PB_Canvas_MouseY)
    
    Select EventType
      Case #PB_EventType_Resize : ResizeGadget(Canvas, #PB_Ignore, #PB_Ignore, #PB_Ignore, #PB_Ignore) ; Bug (562)
        Resize(*Bar_1, x, y, Width-x*2, Height-y*2)  
        Repaint = 1 
    EndSelect
    
    ForEach Widgets()
      Repaint | CallBack(Widgets(), EventType, mouseX,mouseY)
    Next
    
    If Repaint
      Widget_Draws(Canvas)
    EndIf
  EndProcedure
  
  Procedure Widgets_CallBack()
    ; Canvas events bug fix
    Protected Result.b
    Static MouseLeave.b
    Protected EventGadget.i = EventGadget()
    Protected EventType.i = EventType()
    Protected Width = GadgetWidth(EventGadget)
    Protected Height = GadgetHeight(EventGadget)
    Protected MouseX = GetGadgetAttribute(EventGadget, #PB_Canvas_MouseX)
    Protected MouseY = GetGadgetAttribute(EventGadget, #PB_Canvas_MouseY)
    
    ; Это из за ошибки в мак ос и линукс
    CompilerIf #PB_Compiler_OS = #PB_OS_MacOS Or #PB_Compiler_OS = #PB_OS_Linux
      Select EventType 
        Case #PB_EventType_MouseEnter 
          If GetGadgetAttribute(EventGadget, #PB_Canvas_Buttons) Or MouseLeave =- 1
            EventType = #PB_EventType_MouseMove
            MouseLeave = 0
          EndIf
          
        Case #PB_EventType_MouseLeave 
          If GetGadgetAttribute(EventGadget, #PB_Canvas_Buttons)
            EventType = #PB_EventType_MouseMove
            MouseLeave = 1
          EndIf
          
        Case #PB_EventType_LeftButtonDown
          If GetActiveGadget()<>EventGadget
            SetActiveGadget(EventGadget)
          EndIf
          
        Case #PB_EventType_LeftButtonUp
          If MouseLeave = 1 And Not Bool((MouseX>=0 And MouseX<Width) And (MouseY>=0 And MouseY<Height))
            MouseLeave = 0
            CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
              Result | Widgets_Events(EventGadget, #PB_EventType_LeftButtonUp)
              EventType = #PB_EventType_MouseLeave
            CompilerEndIf
          Else
            MouseLeave =- 1
            Result | Widgets_Events(EventGadget, #PB_EventType_LeftButtonUp)
            EventType = #PB_EventType_LeftClick
          EndIf
          
        Case #PB_EventType_LeftClick : ProcedureReturn 0
      EndSelect
    CompilerEndIf
    
    Result | Widgets_Events(EventGadget, EventType)
    
    ProcedureReturn Result
  EndProcedure
  
  Procedure Clip(Gadget)
    CompilerIf #PB_Compiler_OS = #PB_OS_Windows
      Protected ClipMacroGadgetHeight = GadgetHeight( Gadget )
      SetWindowLongPtr_( GadgetID( Gadget ), #GWL_STYLE, GetWindowLongPtr_( GadgetID( Gadget ), #GWL_STYLE )|#WS_CLIPSIBLINGS )
      If ClipMacroGadgetHeight And GadgetType( Gadget ) = #PB_GadgetType_ComboBox
        ResizeGadget( Gadget, #PB_Ignore, #PB_Ignore, #PB_Ignore, ClipMacroGadgetHeight )
      EndIf
      SetWindowPos_( GadgetID( Gadget ), #GW_HWNDFIRST, 0,0,0,0, #SWP_NOMOVE|#SWP_NOSIZE )
    CompilerEndIf
  EndProcedure
  
  If OpenWindow(3, 0, 0, 665, 605, "Position de la souris sur la fenêtre", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
    CanvasGadget(100, 0, 0, 665, 605, #PB_Canvas_Keyboard ) : Clip(100)
    
    Widgets(Str(#PB_GadgetType_Button)) = Button(5, 5, 160,70, "ButtonGadget_"+Str(#PB_GadgetType_Button) ) ; ok
    StringGadget(#PB_GadgetType_String, 5, 80, 160,70, "StringGadget_"+Str(#PB_GadgetType_String))          ; ok
    TextGadget(#PB_GadgetType_Text, 5, 155, 160,70, "TextGadget_"+Str(#PB_GadgetType_Text), #PB_Text_Border); ok
    CheckBoxGadget(#PB_GadgetType_CheckBox, 5, 230, 160,70, "CheckBoxGadget_"+Str(#PB_GadgetType_CheckBox) ); ok
    OptionGadget(#PB_GadgetType_Option, 5, 305, 160,70, "OptionGadget_"+Str(#PB_GadgetType_Option) )        ; ok
    ListViewGadget(#PB_GadgetType_ListView, 5, 380, 160,70 )
    AddGadgetItem(#PB_GadgetType_ListView, -1, "ListView_0_"+Str(#PB_GadgetType_ListView))                                                 ; ok
    AddGadgetItem(#PB_GadgetType_ListView, -1, "ListView_1_"+Str(#PB_GadgetType_ListView))                                                 ; ok
    AddGadgetItem(#PB_GadgetType_ListView, -1, "ListView_2_"+Str(#PB_GadgetType_ListView))                                                 ; ok
    Widgets(Str(#PB_GadgetType_Frame)) = Frame(5, 455, 160,70, "FrameGadget_"+Str(#PB_GadgetType_Frame) )
    ComboBoxGadget(#PB_GadgetType_ComboBox, 5, 530, 160,70 ) : AddGadgetItem(#PB_GadgetType_ComboBox, -1, "ComboBoxGadget_"+Str(#PB_GadgetType_ComboBox)) : SetGadgetState(#PB_GadgetType_ComboBox, 0)
    
    Widgets(Str(#PB_GadgetType_Image)) = Image(170, 5, 160,70,0, #PB_Image_Border ) ; ok
    HyperLinkGadget(#PB_GadgetType_HyperLink, 170, 80, 160,70,"HyperLinkGadget_"+Str(10),0,#PB_HyperLink_Underline ) ; ok
    Widgets(Str(#PB_GadgetType_Container)) = Container(170, 155, 160,70,#PB_Container_Flat ) : Widgets(Str(101)) = Button(10, 10, 100,20, "ContainerGadget_"+Str(#PB_GadgetType_Container) ) : CloseList() ;: SetParent(Widgets(Str(101)), Widgets(Str(#PB_GadgetType_Container)))
    ListIconGadget(#PB_GadgetType_ListIcon, 170, 230, 160,70,"ListIconGadget_"+Str(#PB_GadgetType_ListIcon),120 )                                                                                          ; ok
    IPAddressGadget(#PB_GadgetType_IPAddress, 170, 305, 160,70 ) : SetGadgetState(#PB_GadgetType_IPAddress, MakeIPAddress(1, 2, 3, 4))                                                                     ; ok
    Widgets(Str(#PB_GadgetType_ProgressBar)) = Progress(170, 380, 160,70,0,100) : SetState(Widgets(Str(#PB_GadgetType_ProgressBar)), 50)
    Widgets(Str(#PB_GadgetType_ScrollBar)) = Scroll(170, 455, 160,70,0,100,20) : SetState(Widgets(Str(#PB_GadgetType_ScrollBar)), 40)
    Widgets(Str(#PB_GadgetType_ScrollArea)) = ScrollArea(170, 530, 160,70,180,90,1,#PB_ScrollArea_Flat ) 
    Widgets(Str(201)) = Button(10, 10, 110,20, "ScrollArea_201_"+Str(#PB_GadgetType_ScrollArea) ) 
    Widgets(Str(202)) = Button(70, 70, 110,20, "Button_202" ) 
    CloseList() ;: SetParent(Widgets(Str(201)), Widgets(Str(#PB_GadgetType_ScrollArea)))
    
    Widgets(Str(#PB_GadgetType_TrackBar)) = Track(335, 5, 160,70,0,100) : SetState(Widgets(Str(#PB_GadgetType_TrackBar)), 50)
    WebGadget(#PB_GadgetType_Web, 335, 80, 160,70,"" )
    Widgets(Str(#PB_GadgetType_ButtonImage)) = Button(335, 155, 160,70, "", 0, 1 )
    CalendarGadget(#PB_GadgetType_Calendar, 335, 230, 160,70 )
    DateGadget(#PB_GadgetType_Date, 335, 305, 160,70 )
    EditorGadget(#PB_GadgetType_Editor, 335, 380, 160,70 ):AddGadgetItem(#PB_GadgetType_Editor, -1, "EditorGadget_"+Str(#PB_GadgetType_Editor))  
    ExplorerListGadget(#PB_GadgetType_ExplorerList, 335, 455, 160,70,"" )
    ExplorerTreeGadget(#PB_GadgetType_ExplorerTree, 335, 530, 160,70,"" )
    
    ExplorerComboGadget(#PB_GadgetType_ExplorerCombo, 500, 5, 160,70,"" )
    SpinGadget(#PB_GadgetType_Spin, 500, 80, 160,70,0,10, #PB_Spin_Numeric)
    TreeGadget(#PB_GadgetType_Tree, 500, 155, 160,70 )
    
    Widgets(Str(#PB_GadgetType_Panel)) = Panel(500, 230, 160,70 +70) 
    AddItem(Widgets(Str(#PB_GadgetType_Panel)), -1, "Panel_0_"+Str(#PB_GadgetType_Panel), 2) 
    Widgets(Str(250)) = Button(5, 0, 90,20, "Button_0" )
    ; Widgets(Str(250)) = Splitter(5, 55, 160,50, Button(0, 0, 100,20, "ButtonGadget"), Button(0, 0, 0,20, "StringGadget")) 
    
    AddItem(Widgets(Str(#PB_GadgetType_Panel)), -1, "Panel_1_"+Str(#PB_GadgetType_Panel)) 
    Widgets(Str(255)) = Container(10,10,150,55,#PB_Container_Flat) 
    Widgets(Str(256)) = Container(10,10,150,55,#PB_Container_Flat) 
    Widgets(Str(257)) = Button(10,10,50,35, "butt") 
    CloseList()
    CloseList()
    CloseList()
    
    AddItem(Widgets(Str(#PB_GadgetType_Panel)), -1, "Panel_2_"+Str(#PB_GadgetType_Panel)) 
    
    ;     CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    ;       MDIGadget(#PB_GadgetType_MDI, 500, 305, 160,70,1, 2);, #PB_MDI_AutoSize)
    ;     CompilerEndIf
    
    Widgets(Str(#PB_GadgetType_Splitter)) = Splitter(500, 380, 160,70, Button(0, 0, 100,20, "ButtonGadget"), Button(0, 0, 0,20, "StringGadget")) 
    InitScintilla()
    ScintillaGadget(#PB_GadgetType_Scintilla, 500, 455, 160,70,0 )
    ShortcutGadget(#PB_GadgetType_Shortcut, 500, 530, 160,70 ,-1)
    
    Define i
    For i=1 To 33
      If IsGadget(i) : Clip(i) : EndIf
    Next
    
    BindGadgetEvent(100, @Widgets_CallBack())
    Widget_Draws(100)
    Repeat
      Define  Event = WaitWindowEvent()
    Until Event= #PB_Event_CloseWindow
    
  EndIf   
CompilerEndIf
; IDE Options = PureBasic 5.70 LTS (MacOS X - x64)
; Folding = --------------------------------------------------------------------------------------------------------------
; EnableXP