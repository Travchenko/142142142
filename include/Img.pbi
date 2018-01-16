﻿UsePNGImageDecoder()

Global img_0 = CatchImage(#PB_Any, ?img_0, 582) ; anchor

;Global img_logo = CatchImage(#PB_Any, ?img_ico, ?img_ico_end-?img_ico)
Global img_ico = CatchImage(#PB_Any, ?img_ico, ?img_ico_end-?img_ico)
Global img_form = CatchImage(#PB_Any, ?form_png, ?form_png_end-?form_png)
Global img_code = CatchImage(#PB_Any, ?code_png, ?code_png_end-?code_png)
Global img_edit = CatchImage(#PB_Any, ?edit_png, ?edit_png_end-?edit_png)
Global img_objects = CatchImage(#PB_Any, ?objects_png, ?objects_png_end-?objects_png)
Global img_add_objects = CatchImage(#PB_Any, ?add_objects_png, ?add_objects_png_end-?add_objects_png)
Global img_close = CatchImage(#PB_Any, ?close_png, ?close_png_end-?close_png)
Global img_minimize = CatchImage(#PB_Any, ?minimize_png, ?minimize_png_end-?minimize_png)
Global img_maximize = CatchImage(#PB_Any, ?maximize_png, ?maximize_png_end-?maximize_png)
Global img_maximized = CatchImage(#PB_Any, ?maximized_png, ?maximized_png_end-?maximized_png)



DataSection ; form
  form_png:
;   Size : 438 bytes
  Data.q $0A1A0A0D474E5089,$524448490D000000,$1000000010000000,$FFF31F0000000608,$4144497D01000061
  Data.q $024B4F93A55E7854,$8E8410B157871841,$27D0839FD0EC45F5,$51468E82222A2290,$074BA221D0449162
  Data.q $444460454444BA51,$604BA22ADD104110,$DDB092D0C2DD0458,$61DF7D9A6671DD1D,$BFB0F2ECBE6D3AC2
  Data.q $1084FAFB037E1F65,$BD6364CE8BE33346,$71702116D95AF091,$C18524CE3379086E,$7C9900524C667C85
  Data.q $FE75FE7CAD4AD6D7,$5384F70813307D68,$40A9E823BF90C12D,$A9B013324A59B2C8,$BF227573D365DBF0
  Data.q $1529DC2CF7B92083,$2C6185C2F56271BD,$A92075A358413EEC,$022F8FC038856051,$1C02A14BE02C942C
  Data.q $766D479D8257395F,$590498941DB128EA,$C60DD127E2C0AB36,$6100FDB73050CF96,$ACC8D5122894319D
  Data.q $D1B282BDF21646AA,$01BA72B6241453A5,$B1F4B23555668945,$BE20A09E2C8CEE90,$28906CD7380D8F79
  Data.q $A31E4A1A34368712,$2D4860374EE37A60,$206772354B1F7E71,$7F862DF4A9828871,$C7F4929AC5328D25
  Data.q $7FD7F9BA9930500F,$503D0E816ACD9D10,$5BDCABCBFDE97C0B,$5CC1B8C30BBB8BA0,$62EE44B0814A4972
  Data.q $D7D197933258B531,$BD37748E1B1D7ED9,$3AF9E3AA9C7BDFCE,$4549000000008891
  Data.b $4E,$44,$AE,$42,$60,$82
  form_png_end:
EndDataSection

DataSection ; minimize
  minimize_png: 
  ; Size : 131 bytes
  Data.b $89,$50,$4E,$47,$0D,$0A,$1A,$0A,$00,$00,$00,$0D,$49,$48,$44,$52,$00,$00,$00,$10
  Data.b $00,$00,$00,$10,$08,$06,$00,$00,$00,$1F,$F3,$FF,$61,$00,$00,$00,$4A,$49,$44,$41
  Data.b $54,$78,$DA,$ED,$CF,$31,$0A,$00,$20,$0C,$03,$40,$2B,$38,$76,$F1,$07,$EE,$D5,$FF
  Data.b $FF,$4E,$33,$14,$04,$29,$A2,$B8,$38,$34,$70,$53,$68,$A0,$C1,$E3,$F9,$32,$04,$F1
  Data.b $10,$59,$C7,$FD,$10,$43,$5A,$07,$E2,$C5,$40,$01,$B6,$06,$58,$4B,$81,$0A,$CD,$20
  Data.b $60,$0E,$10,$24,$2D,$F2,$D6,$7C,$E1,$3D,$03,$D5,$61,$16,$C4,$CD,$6D,$97,$D8,$00
  Data.b $00,$00,$00,$49,$45,$4E,$44,$AE,$42,$60,$82
  minimize_png_end:
EndDataSection

DataSection ; maximize
  maximize_png:
  ; Size : 204 bytes
  Data.b $89,$50,$4E,$47,$0D,$0A,$1A,$0A,$00,$00,$00,$0D,$49,$48,$44,$52,$00,$00,$00,$10
  Data.b $00,$00,$00,$10,$08,$06,$00,$00,$00,$1F,$F3,$FF,$61,$00,$00,$00,$93,$49,$44,$41
  Data.b $54,$78,$DA,$CD,$D2,$B1,$0E,$82,$40,$10,$84,$61,$59,$A0,$80,$82,$80,$86,$D8,$28
  Data.b $14,$14,$24,$14,$60,$7C,$FF,$52,$E3,$23,$F8,$38,$E7,$5F,$6C,$61,$36,$7B,$39,$13
  Data.b $1B,$36,$F9,$AA,$99,$0C,$14,$77,$D8,$E5,$65,$90,$04,$3A,$FE,$BD,$11,$12,$9E,$A8
  Data.b $91,$7B,$5F,$0E,$3F,$BA,$A0,$B6,$03,$A2,$E1,$82,$1B,$36,$AC,$C6,$5D,$3B,$33,$DA
  Data.b $D8,$C0,$84,$11,$3D,$8E,$46,$FF,$D5,$E9,$62,$03,$23,$4E,$28,$21,$46,$09,$ED,$C4
  Data.b $FF,$60,$D0,$50,$10,$ED,$EC,$7F,$A0,$43,$01,$31,$8A,$D4,$C0,$03,$21,$E1,$85,$2B
  Data.b $1A,$EF,$21,$55,$38,$6B,$61,$F0,$68,$46,$87,$AE,$73,$B9,$06,$0D,$5A,$8F,$66,$95
  Data.b $76,$FF,$BF,$0F,$21,$2E,$31,$D6,$FF,$2F,$53,$8C,$00,$00,$00,$00,$49,$45,$4E,$44
  Data.b $AE,$42,$60,$82
  maximize_png_end:
EndDataSection

DataSection ; maximized
  maximized_png:
  ; Size : 241 bytes
  Data.b $89,$50,$4E,$47,$0D,$0A,$1A,$0A,$00,$00,$00,$0D,$49,$48,$44,$52,$00,$00,$00,$10
  Data.b $00,$00,$00,$10,$08,$06,$00,$00,$00,$1F,$F3,$FF,$61,$00,$00,$00,$B8,$49,$44,$41
  Data.b $54,$78,$DA,$CD,$91,$41,$0A,$C2,$30,$14,$44,$6D,$48,$41,$B1,$52,$95,$AE,$2C,$4D
  Data.b $44,$45,$04,$51,$14,$BC,$FF,$AE,$E8,$11,$BC,$4D,$9D,$C5,$84,$48,$18,$9A,$85,$1B
  Data.b $3F,$BC,$4D,$33,$79,$64,$7E,$27,$7F,$35,$05,$31,$23,$30,$A3,$2F,$BF,$C1,$30,$42
  Data.b $0F,$E6,$C0,$2A,$89,$61,$28,$87,$07,$15,$F3,$52,$70,$01,$37,$70,$4D,$B8,$F3,$FC
  Data.b $04,$D6,$7C,$85,$51,$82,$3D,$E8,$40,$C3,$60,$A0,$11,$75,$2A,$25,$70,$BC,$50,$26
  Data.b $CB,$2B,$55,$9D,$9C,$60,$FA,$25,$B0,$3C,$3F,$83,$47,$A8,$93,$0A,$FA,$CC,$02,$5F
  Data.b $E0,$00,$5C,$AC,$1B,$A7,$E0,$2F,$DA,$80,$2D,$03,$47,$B0,$03,$8E,$78,$D0,$82,$3A
  Data.b $BC,$36,$15,$58,$4A,$56,$51,$10,$17,$CA,$EF,$0B,$30,$53,$02,$4A,$28,$CA,$D7,$79
  Data.b $A6,$4B,$54,$75,$5A,$86,$9C,$C0,$B3,$6E,$1C,$55,$87,$7D,$97,$82,$9A,$E7,$BF,$CF
  Data.b $07,$CA,$A4,$3E,$2A,$D8,$8F,$BC,$14,$00,$00,$00,$00,$49,$45,$4E,$44,$AE,$42,$60
  Data.b $82
  maximized_png_end:
EndDataSection

DataSection ; close
  close_png:
  ; Size : 223 bytes
  Data.b $89,$50,$4E,$47,$0D,$0A,$1A,$0A,$00,$00,$00,$0D,$49,$48,$44,$52,$00,$00,$00,$10
  Data.b $00,$00,$00,$10,$08,$06,$00,$00,$00,$1F,$F3,$FF,$61,$00,$00,$00,$A6,$49,$44,$41
  Data.b $54,$78,$DA,$CD,$92,$BB,$0A,$C3,$30,$0C,$45,$1B,$43,$9C,$2E,$59,$D3,$25,$4B,$06
  Data.b $2F,$E9,$D8,$A4,$FF,$FF,$67,$AE,$0A,$C7,$CB,$35,$97,$0C,$5D,$6A,$38,$60,$74,$25
  Data.b $D9,$7A,$DC,$FE,$EE,$0C,$41,$82,$E1,$5A,$EF,$C5,$0A,$73,$90,$B1,$39,$7D,$D4,$04
  Data.b $09,$B1,$B1,$04,$13,$81,$83,$68,$1B,$49,$BA,$04,$B3,$38,$3E,$82,$BB,$D8,$5E,$41
  Data.b $C1,$B7,$2B,$21,$F3,$72,$35,$1C,$C1,$8E,$4F,$76,$4D,$9C,$78,$B9,$0A,$EF,$E0,$89
  Data.b $46,$69,$6E,$12,$7C,$5B,$38,$83,$15,$4D,$82,$CD,$34,$94,$CB,$04,$08,$FA,$ED,$53
  Data.b $6C,$52,$82,$0F,$3E,$A8,$79,$85,$DA,$70,$4D,$4C,$32,$AA,$BD,$8D,$F1,$8B,$34,$B6
  Data.b $D8,$3D,$60,$49,$8A,$2E,$12,$F7,$05,$6D,$73,$7B,$30,$22,$B8,$55,$CE,$4D,$C7,$F7
  Data.b $F7,$F3,$01,$8D,$28,$39,$E1,$16,$26,$7B,$2C,$00,$00,$00,$00,$49,$45,$4E,$44,$AE
  Data.b $42,$60,$82
  close_png_end:
EndDataSection

DataSection
  code_png:
    ; size : 603 bytes
    Data.q $0A1A0A0D474E5089,$524448490D000000,$1000000010000000,$FFF31F0000000608,$4D41670400000061
    Data.q $8A0537C8AF000041,$58457419000000E9,$72617774666F5374,$2065626F64410065,$6165526567616D49
    Data.q $00003C65C9717964,$CB3854414449ED01,$861450DB4F3D938D,$5BA512308E974329,$5FC46BA9082196A7
    Data.q $98A90A408420A440,$5B407E162608150A,$B69041552A0A4325,$643B9D4A9456A012,$C76C14402C0BA442
    Data.q $6F01F3B1D89DB55F,$F4B1504871B06E7D,$F8E73E3CF73DD2C8,$B9F4FB845D002EDE,$6E9763C3FF065C44
    Data.q $D7A38E3888202F3F,$B84E81A346CBF5EB,$504941B7C9932471,$2CB2C269A6C94830,$51441A69A030C31F
    Data.q $7CA54A9010411264,$B6C1B40480FC9789,$E5CA26F655AB546D,$504C4924875D7432,$4DD3A7491F4054A9
    Data.q $41EC96355BA05049,$B965904A95284A02,$1C28F04F133625AD,$645BB530977ECE89,$8A1903B98281C4C1
    Data.q $E12AC28A28ADFB61,$CF4FF974F055BE79,$F1190FDCDCE3BBD0,$5F858CBECCC14DCF,$930AB49049ED5E0A
    Data.q $046F55550F342550,$7B455F63634E56CF,$754E08BB7C425F76,$4111DE98AAD79058,$6B2AB2F62299E3EB
    Data.q $2DB2305F22426687,$C6B936C4153F4B18,$616F2E63D2D999D1,$1FA31137FCC78B6C,$E0BE10930E5A602E
    Data.q $CF673AF0D893EBC9,$DC9C02ED6262297C,$D681C4FA992A80AC,$C3FAADFDD80AD647,$B644F08332D0F3A5
    Data.q $61C1BE2E61E2F9E7,$5E1C8FC9C167993C,$0775900B56240466,$FA026DC9418D5AB5,$1E54F1A3FB7B0F0B
    Data.q $02FBC5F059CE6FC3,$41C9371AFE02E912,$3A7B8DBA41DE04DA,$D07BAEEAE097723B,$0770192D705F4B81
    Data.q $32DEEEC93EE05164,$B8F724884101BDBB,$0700FF43F5741ECE,$00E63FA2BC98CACD,$AE444E4549000000
    Data.b $42,$60,$82
  
   
;     ; size : 399 bytes
;     Data.q $0A1A0A0D474E5089,$524448490D000000,$1000000010000000,$FFF31F0000000608,$4144495601000061
;     Data.q $C351CB53A5113854,$04A0DA18CD5D1030,$BF318189088A1257,$187627F770025013,$83A48E04B895207A
;     Data.q $03D85795BEC49630,$DF6B3F6483D86487,$F20C33FD135DAB7B,$D720766DE77F3CF3,$3D9A4864D38A28A6
;     Data.q $118D5E5EF7913CBF,$BCC01B3F3C80625E,$1147FB87D6380A78,$A0BE7CD1CEF20254,$E49781BAEBA94D34
;     Data.q $010500C986EEF6FD,$7A3AD60489010837,$48A2C6385A8B5B7D,$390C523682CE05E1,$7193967021F8D316
;     Data.q $8CDD8C413B19D0CC,$8244B1DF2955EB9F,$6A7A4D84924A5ADE,$6023EB4435E92DD7,$DC9EFB604DFAFBB7
;     Data.q $89B22E5A1BEB11F1,$892E75D5C1C34E3A,$1E2E402C0E88D310,$76BB27DFA5769A0E,$5B3067A0911A6209
;     Data.q $D4D34017AE3E0B9E,$012235670B2192A1,$E7AE502E254DD41C,$2436DC69EF370D0B,$5D9170426181DB8A
;     Data.q $42575545CEBB59FE,$2DBD00911A63B96A,$986DA813112E42EB,$D199E391264C84CC,$BDEF8AB73F6C1098
;     Data.q $267F83AA2CA6C12B,$3D392DEC9E84E8A8,$624AA551860DF1F8,$4900000000115AD3
;     Data.b $45,$4E,$44,$AE,$42,$60,$82
  
   
  code_png_end:
EndDataSection

DataSection
  add_objects_png:
    ; size : 592 bytes
    Data.q $0A1A0A0D474E5089,$524448490D000000,$1000000010000000,$FFF31F0000000608,$4D41670400000061
    Data.q $8A0537C8AF000041,$58457419000000E9,$72617774666F5374,$2065626F64410065,$6165526567616D49
    Data.q $00003C65C9717964,$CB3854414449E201,$C61841136BCD93A5,$9E0F17A3D6F0DFF7,$4B0782508A07FE0A
    Data.q $DB1A1B146B5B63F1,$924486D0844490A0,$1A94B4862DA42126,$2ADB2556A4B9A5B4,$DA28C6AC55B60ACA
    Data.q $48FD9B25917CC736,$916D25D999C7953C,$FBBEF33C7E174494,$B80070EEEF3333CE,$A54C8F2D8CB381FF
    Data.q $094F5C3ED9FBBAF3,$C2FEE27F17385DC9,$C59731C1CF9BDC77,$7D867F1F77077C78,$EFE2B82DB16C23E6
    Data.q $83F95378198F3A75,$1DDE47B16E8CA668,$BC0D60BFF2BA0330,$366CD0F725703305,$7CE061B5EF86E6BB
    Data.q $87433A03468D0BF2,$1A5B628A2C6CEBAE,$986901A60AF786A4,$48D0B6C89FE8AAAA,$9AE1A69A3DDB0B4C
    Data.q $14575DBB406195E7,$D139553752827528,$406185F0F2BFBE80,$A665964326AD553F,$1E867246B446B90C
    Data.q $C35583C0C2791B22,$355092490AF891C0,$78EE75FD2AA963A1,$FA86B0AB99F18C2A,$30CC738B0F3A3FC0
    Data.q $D63952A5427ECFB0,$4B0FF3C23D1F1A03,$2F8D372D620CACF0,$3E1CB83BF5E10145,$B6346E415391DE83
    Data.q $706A9B2844A9528D,$116FE901702860D4,$89B8DC1C59447FA4,$45B39BF06A2DC6F0,$0914050914285137
    Data.q $C59F745E96C51685,$D3B3572358E25CCB,$890EDF2C2EF400D4,$77A0C1BFF61ACFEC,$AC6BCBA43227D71D
    Data.q $107AD9CE34EEFD51,$97D9367813E08610,$85238DC9D0770FE1,$B30C2531A7829793,$6BD3A0F598D2A995
    Data.q $54DB6E9504FD8A4B,$4522E3AE01FFCD3F,$00000000698B8B95,$826042AE444E4549
  add_objects_png_end:
EndDataSection

DataSection
  objects_png:
    ; size : 467 bytes
    Data.q $0A1A0A0D474E5089,$524448490D000000,$1000000010000000,$FFF31F0000000608,$4D41670400000061
    Data.q $8A0537C8AF000041,$58457419000000E9,$72617774666F5374,$2065626F64410065,$6165526567616D49
    Data.q $00003C65C9717964,$1918544144496501,$861861934EB1C1A5,$4613490D3E6DFBE1,$BA613A48B0341C19
    Data.q $61811C0E829E0FF9,$48B939B0B9388431,$0A1E0C011EA0C24A,$3209289A0653758E,$217E879F7DFC3A94
    Data.q $36C2BAF4D2400E24,$2F36DF0EEF57888B,$8480DAEE27CF1FFB,$644CE16465895225,$397B61F962524CE3
    Data.q $A0F369F6FFBE9E1C,$3B752C1FF7F45FF4,$7DC9397BA3CC4B2B,$63E726775A4CA0E0,$34E2998775AFF5E6
    Data.q $09C1EDAF331FAFBB,$1030654C6D85B155,$637CF2EE63E3F7C1,$AD93326C15525483,$D54A79DD7C6E2FC1
    Data.q $9A68C78F19B70D34,$13F6F3E6C8952554,$4A1247DCD9038308,$CC58044528CB1551,$FE2E2E3D7AF4C218
    Data.q $5252004C009FF362,$31982D7312912915,$75F5B3CBB90C7F0C,$EC9992DB69955124,$550AD6C18DCDF97C
    Data.q $D30FECECE6DC34D3,$6F7B12429C554A76,$85327DC492A6011E,$C00880C90922AA25,$011A34635D5D5B5C
    Data.q $03830886C0826101,$87D1C9E7F4E554D9,$22664528995376C3,$712B1B21245B6C89,$26623AA24258591A
    Data.q $DD02BA0B0E88B36C,$00B0B74CD33AF00D,$AE444E4549000000
    Data.b $42,$60,$82
  
;   ; size : 385 bytes
;     Data.q $0A1A0A0D474E5089,$524448490D000000,$1000000010000000,$FFF31F0000000608,$4144494801000061
;     Data.q $3FFFFFFC63113854,$BD20CD1289802503,$2837BDBDBC03302C,$FBE8F8F8C3FA2A2A,$006B75BADC6FEFF7
;     Data.q $AECEE69000DC0D48,$1565E572E0FA7C0E,$5FEFF7F0BC508B70,$FEFF7F0C11E19386,$900FE18227393861
;     Data.q $F7F0CBFFC415BE1F,$E00C8D8838B01FCF,$419BFDFEFE09002E,$3F4187FD2002E17F,$33A17F201FC30176
;     Data.q $CC6B0E00CCD40F90,$D901AEBEA0314700,$0610900628D8A270,$33F9FCF80C51C370,$E3104970DFFCC283
;     Data.q $18EB35BAC32B227E,$ADA9AF160EBF5FAE,$1B8B8B8031479146,$AC0E4D58C181F928,$B1403C0C47ADECE8
;     Data.q $FE48119F3018B8D8,$A7C0628008910067,$F0308D2032C09F4F,$060EB6F68627F3E9,$CAAA2A2BB04D4D4D
;     Data.q $6E2E00C51A605261,$5A0690D0E9E7862E,$DCDCD8408CE54A04,$B10F07C3C1806208,$F07535755D4A001B
;     Data.q $0B52038D0AA28204,$4646462665846213,$FD00824C20A0A001,$00DC0D4803EFA81E,$9C6524A34A701A02
;     Data.q $7BA62D000048F0AA,$00000009AA5B5731,$6042AE444E454900
;     Data.b $82

 
 objects_png_end:
EndDataSection

DataSection
  edit_png:
    ; size : 618 bytes
    Data.q $0A1A0A0D474E5089,$524448490D000000,$1000000010000000,$FFF31F0000000608,$4D41670400000061
    Data.q $8A0537C8AF000041,$58457419000000E9,$72617774666F5374,$2065626F64410065,$6165526567616D49
    Data.q $00003C65C9717964,$CB3854414449FC01,$C71861534BDF938D,$85D4104244457F57,$203F61087DE18DD0
    Data.q $8B0BA84233508284,$2B0BB1745D16B2EE,$8482141209416124,$58C5A88D08144918,$735B5C8B736EA45E
    Data.q $9CE7673B3B70B74B,$C9B1B61EFBD3ECFD,$F7CFBC0E70F81EA6,$3601B1E7BCE7DE73,$E177BA0974121D71
    Data.q $0555B0D4CCBF60B0,$954A95295E7CF95D,$A74E3AC42B4CB972,$E196E826A4BB6273,$D9B275EBAE872E5C
    Data.q $49693264864C992C,$F9F897D3425981E2,$769F9629D4D2C1D6,$A60590293EF0C90E,$D344BBAC14285269
    Data.q $C5A14A9521451434,$077959451AE1B0DF,$BDC79E2CCACC825A,$860521AE19024D9B,$48663F9B2AAAA061
    Data.q $A7C6CF3EB0A03EAF,$BE3751CA39BE1847,$DEA3688126CCD717,$A40BEB2B7D967CB3,$0DF08C6E18A9F7FD
    Data.q $EF986AF824DDBEB6,$4D63F9F8F71507CF,$777DA48F89A8ED82,$B1982BB5F41E98A9,$8C7D97B13B55D401
    Data.q $2416B6CD5832399C,$08786AD1C5E7A2FC,$93C23DFF593F77F3,$5ADAC7AA7E13D167,$B62DB85C13CC0890
    Data.q $19763E4C323319FD,$E4D469D9ED64EC45,$9A65F820ADA6AB2F,$F7109E1FCB3B7BC0,$8774B5B00C8F445E
    Data.q $5DF588DFFA1F54F0,$4A3501EB1EBC1476,$8ABE41FB2E02F268,$AC84FED17BC67AB7,$3C14E3F5C702AEF0
    Data.q $CC938EBC09DE0A4E,$162C53F31D251C8D,$D8C039EFE828ECEB,$7338B1CF0F5C4ED5,$ED23691D6A326C8B
    Data.q $322A0B41CDDAFF04,$CBA7DFC4270B38D3,$B00726AD4584BD85,$1AE7187B2521D051,$6E213FF6643BF472
    Data.q $000070C88DFC2C9D,$42AE444E45490000
    Data.b $60,$82
   edit_png_end:
EndDataSection

DataSection ; img_0
 img_0:
 Data.b $89,$50,$4E,$47,$0D,$0A,$1A,$0A,$00,$00,$00,$0D,$49,$48,$44,$52,$00,$00,$00,$10
 Data.b $00,$00,$00,$10,$08,$06,$00,$00,$00,$1F,$F3,$FF,$61,$00,$00,$02,$0D,$49,$44,$41
 Data.b $54,$38,$8D,$95,$91,$B1,$6B,$1A,$61,$18,$C6,$9F,$3B,$BE,$FB,$C0,$03,$6F,$38,$6F
 Data.b $38,$24,$14,$CD,$62,$14,$37,$C5,$21,$04,$11,$AC,$01,$43,$71,$0B,$84,$4E,$21,$43
 Data.b $C6,$CB,$2E,$08,$86,$24,$84,$E0,$94,$FF,$20,$90,$A4,$C3,$8D,$2E,$2E,$1D,$22,$17
 Data.b $30,$7A,$82,$06,$6C,$3A,$18,$AB,$74,$C8,$2D,$D5,$A1,$43,$D0,$0F,$73,$5F,$97,$1A
 Data.b $0A,$D5,$36,$FE,$B6,$F7,$E5,$79,$7E,$C3,$FB,$0A,$98,$43,$2E,$97,$D3,$44,$51,$7C
 Data.b $0F,$40,$01,$F0,$D3,$75,$DD,$CF,$E5,$72,$F9,$C7,$BC,$EC,$5C,$62,$B1,$D8,$8E,$65
 Data.b $59,$F6,$70,$38,$E4,$96,$65,$D9,$B1,$58,$6C,$E7,$CD,$65,$00,$50,$55,$75,$DF,$71
 Data.b $1C,$4E,$29,$CD,$3B,$8E,$C3,$55,$55,$DD,$5F,$4A,$00,$60,$CB,$34,$4D,$BB,$DF,$FF
 Data.b $C6,$4D,$D3,$B4,$01,$6C,$2D,$2B,$F8,$00,$C0,$78,$78,$F8,$C2,$01,$18,$BF,$E7,$B9
 Data.b $88,$0B,$F6,$91,$5E,$EF,$F1,$7C,$34,$1A,$A1,$D7,$7B,$3C,$07,$10,$59,$4A,$40,$08
 Data.b $79,$0A,$85,$D6,$0A,$00,$10,$0A,$AD,$15,$08,$21,$4F,$8B,$04,$24,$1A,$8D,$7E,$14
 Data.b $04,$E1,$DD,$6C,$C1,$39,$FF,$DE,$E9,$74,$AE,$08,$21,$79,$C6,$18,$00,$B8,$D3,$E9
 Data.b $F4,$6A,$41,$EE,$13,$61,$8C,$AD,$36,$1A,$8D,$A3,$66,$B3,$39,$08,$06,$83,$81,$6C
 Data.b $36,$5B,$00,$00,$D7,$75,$9F,$5F,$5E,$5C,$B8,$AE,$FB,$0C,$00,$8C,$B1,$D5,$4A,$A5
 Data.b $72,$D4,$EF,$F7,$07,$F1,$78,$3C,$90,$48,$24,$0A,$00,$20,$4E,$26,$13,$B1,$5A,$AD
 Data.b $0E,$74,$5D,$0F,$18,$C6,$C1,$C5,$78,$3C,$6E,$CF,$04,$80,$F8,$2A,$18,$8F,$C7,$6D
 Data.b $C3,$38,$B8,$D0,$75,$3D,$50,$AD,$56,$07,$93,$C9,$44,$04,$00,$91,$31,$26,$F9,$FD
 Data.b $2B,$81,$4C,$26,$73,$5C,$2C,$1E,$EE,$86,$C3,$91,$6D,$5D,$D7,$D7,$05,$41,$20,$A2
 Data.b $28,$41,$10,$04,$A2,$EB,$FA,$7A,$38,$1C,$D9,$2E,$16,$0F,$77,$33,$99,$CC,$B1,$DF
 Data.b $BF,$12,$60,$8C,$49,$00,$00,$4D,$D3,$F6,$7C,$3E,$DF,$89,$A6,$69,$39,$9F,$CF,$77
 Data.b $52,$AB,$D9,$3C,$9D,$DE,$BC,$A4,$94,$E6,$6F,$6E,$EA,$9C,$52,$9A,$4F,$A7,$37,$2F
 Data.b $6B,$35,$9B,$FF,$99,$D3,$34,$6D,$EF,$AF,$8B,$2A,$8A,$B2,$E1,$F5,$7A,$4F,$EB,$F5
 Data.b $7B,$9E,$4A,$A5,$AF,$6F,$6F,$DB,$3C,$95,$4A,$5F,$D7,$EB,$F7,$DC,$EB,$F5,$9E,$2A
 Data.b $8A,$B2,$B1,$E8,$1B,$AF,$C8,$B2,$9C,$F4,$78,$3C,$67,$AD,$56,$97,$DF,$DD,$7D,$E5
 Data.b $AD,$56,$97,$7B,$3C,$9E,$33,$59,$96,$93,$FF,$2D,$CF,$A0,$94,$26,$25,$49,$2A,$D9
 Data.b $76,$97,$4B,$92,$54,$A2,$94,$BE,$BD,$3C,$83,$10,$92,$24,$84,$94,$08,$21,$FF,$2C
 Data.b $FF,$02,$6A,$A2,$D8,$0A,$79,$12,$C2,$C4,$00,$00,$00,$00,$49,$45,$4E,$44,$AE,$42
 Data.b $60,$82
 img_0_end:
EndDataSection

DataSection
  img_ico:
    ; size : 644 bytes
    Data.q $0A1A0A0D474E5089,$524448490D000000,$1000000010000000,$FFF31F0000000608,$4144494B02000061
    Data.q $136BCB92A58D3854,$499D3B99BFC61451,$83822351B60C79A6,$4A85C6E22142280F,$2A2C9AEEBBA6D745
    Data.q $5B8DC5176BAD88D9,$DA03FED48B5608DD,$28B882911557044D,$6934D3492294BA6E,$75EE66773B92BCEE
    Data.q $E6CE0FC556216965,$291473BF0E73873B,$B56A0A9FEA47FE25,$5E5DFD56B6B6B59A,$5DFD7AF5D3218BFB
    Data.q $AA65CE4E303E5CB9,$60D23D09E736C64C,$79BB3B3B34B57575,$F4CBCBCB04924BD8,$5BE7F3CF769BFBC1
    Data.q $0A112C3057356EFB,$BA5659606E8F2608,$7139B249242DAB56,$672B1F4FE7CBF279,$2D3EEE1F278DF527
    Data.q $804C80CE6C85F9EA,$A85068311B87D35D,$C7C7B152A5620C32,$6FE73BD98AA747CC,$0EFDEDA5E9A3343B
    Data.q $7DBE26AD5B072376,$0D6E3921F5D5A26F,$DCFC676FAE757065,$009D4E9F6BA77745,$D0C7BF8153341127
    Data.q $7025888E7D040375,$AFD7EE0D23F5C297,$7158C4E2FCD4154F,$1A25C6762C99C2EA,$A84488204EB483BE
    Data.q $110E1CF0FBF7D846,$9CF2F1B8570787CA,$416E4A0B1667C855,$1356AD885106051D,$680C20A7D7626996
    Data.q $E8091C4420FC2EFB,$3399A0009B000239,$8AD8AB7E98BC697A,$69C00E2F4794BC5D,$05C00E408E94D18C
    Data.q $ADDB00BD40F71EC7,$058A200A411C582E,$87521B235C620005,$21C411F4EA09152D,$04E7B0472307BE3A
    Data.q $A6D1A1ED06866208,$D1A0231A980178E8,$8A2D000258317D0A,$E387D38E8AB4CC05,$CD0D29185DB46885
    Data.q $C053440464730B8E,$5E8603A0448C18C2,$6E2FCDE8DDF7AD9B,$755583F38AF2E09A,$64081E3949242083
    Data.q $A15068132E29F4C7,$257CDAF09552041B,$187AFB15E773F9F0,$EB4D4BDFC83FD0FC,$D85C45690A5E64A3
    Data.q $B0D9F0EBEEC7CB92,$A519906C794A4393,$9FA2FF06E87E5C74,$D74207DB3F55E157,$444E454900000000
    Data.b $AE,$42,$60,$82
  img_ico_end:
EndDataSection
