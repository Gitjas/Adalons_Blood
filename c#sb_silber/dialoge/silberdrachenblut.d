ADD_TRANS_TRIGGER UDSILVER 45 ~OR(3) Global("C#SilberdrachenblutQuestTod","GLOBAL",1)
!Global("TalkedToTanally1","GLOBAL",1)
Dead("TANALLY1")~

ADD_TRANS_TRIGGER UDSILVER 52 ~OR(4)
Global("C#SilberdrachenblutQuestTod","GLOBAL",1) Global("C#SB_Silberdrachenblut","GLOBAL",1)
Global("TalkedToTanally1","GLOBAL",0)
Dead("TANALLY1")~

EXTEND_BOTTOM UDSILVER 45 //nachdem man die Eier gebracht hat
+ ~Global("C#SilberdrachenblutQuestTod","GLOBAL",0) Global("C#SB_Silberdrachenblut","GLOBAL",0) !Dead("TANALLY1")
Global("TalkedToTanally1","GLOBAL",1)~ + @0 EXTERN UDSILVER silver_01
+ ~Global("C#SilberdrachenblutQuestTod","GLOBAL",0) Global("C#SB_Silberdrachenblut","GLOBAL",0)
Global("TalkedToTanally1","GLOBAL",1) !Dead("TANALLY1")~ + @1 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ + 46
IF ~Global("C#SilberdrachenblutQuestTod","GLOBAL",0) Global("C#SB_Silberdrachenblut","GLOBAL",1)
Global("TalkedToTanally1","GLOBAL",1) !Dead("TANALLY1")~ THEN EXTERN UDSILVER silver_17
END


EXTEND_BOTTOM UDSILVER 52 //Eier sind noch nicht gerettet
+ ~Global("C#SilberdrachenblutQuestTod","GLOBAL",0) Global("C#SB_Silberdrachenblut","GLOBAL",0) !Dead("TANALLY1")
Global("TalkedToTanally1","GLOBAL",1)~ + @2 EXTERN UDSILVER silver_11
+ ~Global("C#SilberdrachenblutQuestTod","GLOBAL",0) Global("C#SB_Silberdrachenblut","GLOBAL",0) !Dead("TANALLY1")
Global("TalkedToTanally1","GLOBAL",1)~ + @3 EXIT
END

APPEND UDSILVER //Adalon

IF ~~ THEN silver_01
SAY @4
++ @5 + silver_10
+ ~!Alignment(Player1,MASK_EVIL)~ + @6 + silver_02
+ ~Alignment(Player1,MASK_EVIL)~ + @9 + silver_02
++ @7 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @8 + 46

END

IF ~~ THEN silver_02
SAY @10
+ ~!Alignment(Player1,MASK_EVIL)~ + @11 + silver_03
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatGT(Player1,16,CHR) RandomNum(4,1)~ + @11 + silver_18
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatGT(Player1,16,CHR) RandomNum(4,2)~ + @11 + silver_18
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatGT(Player1,16,CHR) RandomNum(4,3)~ + @11 + silver_03
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatGT(Player1,16,CHR) RandomNum(4,4)~ + @11 + silver_18
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatLT(Player1,17,CHR)~ + @11 + silver_18
++ @7 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @12 + 46
END

IF ~~ THEN silver_03
SAY @13
= @14
= @15
+ ~!Alignment(Player1,MASK_EVIL)~ + @16 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @17 + silver_04
+ ~Alignment(Player1,MASK_EVIL)~ + @16 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @18 + silver_04
+ ~Global("DrowCityHostile","GLOBAL",1)~ + @19 + silver_15
+ ~!Alignment(Player1,MASK_EVIL) !Global("DrowCityHostile","GLOBAL",1)~ + @20 DO ~AddJournalEntry(@21,QUEST)~ + silver_05
+ ~Alignment(Player1,MASK_EVIL) !Global("DrowCityHostile","GLOBAL",1)~ + @22 UNSOLVED_JOURNAL @23 + silver_05
+ ~!Alignment(Player1,MASK_EVIL)
Global("DrowCityHostile","GLOBAL",1)~ + @20 UNSOLVED_JOURNAL @21 + silver_16
+ ~Alignment(Player1,MASK_EVIL)
Global("DrowCityHostile","GLOBAL",1)~ + @22 UNSOLVED_JOURNAL @23 + silver_16
END

/* + ~!Alignment(Player1,MASK_EVIL) !Global("DrowCityHostile","GLOBAL",1)~ + @20 UNSOLVED_JOURNAL @21 + silver_05 */

IF ~~ THEN silver_04
SAY @24
COPY_TRANS UDSILVER 46

/*IF ~~ THEN DO ~ClearActions(Player1)
ClearActions(Player2)
ClearActions(Player3)
ClearActions(Player4)
ClearActions(Player5)
ClearActions(Player6)
AddXPObject(Player1,78500)
AddXPObject(Player2,78500)
AddXPObject(Player3,78500)
AddXPObject(Player4,78500)
AddXPObject(Player5,78500)
AddXPObject(Player6,78500)
StartCutSceneMode()
StartCutScene("Cut44c")
~ EXIT
*/
END

IF ~~ THEN silver_05
SAY @25
IF ~~ THEN DO ~SetGlobal("C#SB_AbolethKampf","GLOBAL",1) SetGlobalTimer("C#SB_DrowCityHostileTimer","GLOBAL",TWO_DAYS)~ EXIT
END

/* UNSOLVED_JOURNAL @26*/

IF WEIGHT #-1
~OR(2)
Global("C#SB_AbolethKampf","GLOBAL",1)
Global("C#SB_AbolethKampf","GLOBAL",2)~ THEN silver_06
SAY @27
++ @28 DO ~SetGlobal("C#SB_AbolethKampf","GLOBAL",0)
EraseJournalEntry(@21)
EraseJournalEntry(@23)
EraseJournalEntry(@26)
EraseJournalEntry(@32)
EraseJournalEntry(@49)
SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @17 + silver_04
+ ~Global("DrowCityHostile","GLOBAL",1)~ + @79 DO ~SetGlobal("C#SB_AbolethKampf","GLOBAL",0)
EraseJournalEntry(@21)
EraseJournalEntry(@23)
EraseJournalEntry(@26)
EraseJournalEntry(@32)
EraseJournalEntry(@49)~ SOLVED_JOURNAL @17 + silver_04
++ @29 EXIT
END

IF WEIGHT #-1
~Global("C#SB_AbolethKampf","GLOBAL",3)~ THEN silver_07
SAY @30
+ ~!Alignment(Player1,MASK_EVIL)~ + @31 DO ~GiveItemCreate("MISC8H",[PC],1,0,0) SetGlobal("C#SB_BlutVonAdalon","GLOBAL",1) 
EraseJournalEntry(@21)
EraseJournalEntry(@23)
EraseJournalEntry(@26)
EraseJournalEntry(@32)
EraseJournalEntry(@49)
SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @33 + silver_08
+ ~Alignment(Player1,MASK_EVIL)~ + @34 DO ~GiveItemCreate("MISC8H",[PC],1,0,0) SetGlobal("C#SB_BlutVonAdalon","GLOBAL",1) EraseJournalEntry(@21)
EraseJournalEntry(@23)
EraseJournalEntry(@26)
EraseJournalEntry(@32)
EraseJournalEntry(@49)
SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @35 + silver_08
END

IF ~~ THEN silver_08
SAY @36
++ @37 DO ~SetGlobal("C#SB_AbolethKampf","GLOBAL",4)~ + silver_09
++ @38 DO ~SetGlobal("C#SB_AbolethKampf","GLOBAL",4)~ + silver_09
++ @39 DO ~SetGlobal("C#SB_AbolethKampf","GLOBAL",4)~ + silver_09
END

IF ~~ THEN silver_09
SAY @40
COPY_TRANS UDSILVER 46
END

IF ~~ THEN silver_10
SAY @41
IF ~~ THEN DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)
EraseJournalEntry(15797)
EraseJournalEntry(10105)
Enemy()~ SOLVED_JOURNAL @42 EXIT
END

//---

IF ~~ THEN silver_11
SAY @43
++ @44 + silver_14
++ @6 + silver_12
++ @45 EXIT
END

IF ~~ THEN silver_12
SAY @10
+ ~!Alignment(Player1,MASK_EVIL)~ + @11 + silver_13
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatGT(Player1,16,CHR) RandomNum(4,1)~ + @11 + silver_19
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatGT(Player1,16,CHR) RandomNum(4,2)~ + @11 + silver_19
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatGT(Player1,16,CHR) RandomNum(4,3)~ + @11 + silver_13
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatGT(Player1,16,CHR) RandomNum(4,4)~ + @11 + silver_19
+ ~Alignment(Player1,MASK_EVIL) 
CheckStatLT(Player1,17,CHR)~ + @11 + silver_19
++ @45 EXIT
END

IF ~~ THEN silver_13
SAY @13
= @46
IF ~~ THEN DO ~SetGlobal("C#SB_Silberdrachenblut","GLOBAL",1)~ EXIT
END

IF ~~ THEN silver_14
SAY @47
IF ~~ THEN EXIT
END

IF ~~ THEN silver_15
SAY @48
+ ~!Alignment(Player1,MASK_EVIL)~ + @16 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @17 + silver_04
+ ~Alignment(Player1,MASK_EVIL)~ + @16 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @18 + silver_04
+ ~!Alignment(Player1,MASK_EVIL)~ + @20 UNSOLVED_JOURNAL @32 + silver_16
+ ~Alignment(Player1,MASK_EVIL)~ + @22 UNSOLVED_JOURNAL @49 + silver_16
END

IF ~~ THEN silver_16
SAY @50
IF ~~ THEN DO ~SetGlobal("C#SB_AbolethKampf","GLOBAL",1)~ EXIT
END 

//---

IF ~~ THEN silver_17
SAY @51
= @14
= @15
+ ~!Alignment(Player1,MASK_EVIL)~ + @16 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @52 + silver_04
+ ~Alignment(Player1,MASK_EVIL)~ + @16 DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)~ SOLVED_JOURNAL @53 + silver_04
+ ~Global("DrowCityHostile","GLOBAL",1)~ + @19 + silver_15
+ ~!Alignment(Player1,MASK_EVIL) !Global("DrowCityHostile","GLOBAL",1)~ + @20 UNSOLVED_JOURNAL @21 + silver_05
+ ~Alignment(Player1,MASK_EVIL) !Global("DrowCityHostile","GLOBAL",1)~ + @22 UNSOLVED_JOURNAL @23 + silver_05
+ ~!Alignment(Player1,MASK_EVIL)
Global("DrowCityHostile","GLOBAL",1)~ + @20 UNSOLVED_JOURNAL @21 + silver_16
+ ~Alignment(Player1,MASK_EVIL)
Global("DrowCityHostile","GLOBAL",1)~ + @22 UNSOLVED_JOURNAL @23 + silver_16
END

IF ~~ THEN silver_18
SAY @54
IF ~~ THEN DO ~SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)
EraseJournalEntry(15797)
EraseJournalEntry(10105)
Enemy()~ SOLVED_JOURNAL @55 EXIT
END

IF ~~ THEN silver_19
SAY @56
IF ~~ THEN DO ~SetGlobal("C#SB_AbolethKampf","GLOBAL",5)~ EXIT
END

IF WEIGHT #-1 //wenn man Adalon angreift
~Global("C#SB_AdalonAngegriffen","GLOBAL",1)~ THEN silver_20
SAY @41
IF ~~ THEN DO ~EraseJournalEntry(15797)
EraseJournalEntry(10105) 
EraseJournalEntry(@21)
EraseJournalEntry(@23)
EraseJournalEntry(@26)
EraseJournalEntry(@32)
EraseJournalEntry(@49) SetGlobal("C#SB_AdalonAngegriffen","GLOBAL",2)
SetGlobal("C#SB_DrowCityHostile","GLOBAL",1)
Enemy()~ SOLVED_JOURNAL @57 EXIT
END

END

//-----------------------

//Fael

ADD_TRANS_ACTION TANALLY1 BEGIN 4 5 6 7 8 26 END BEGIN END ~SetGlobal("C#SilberdrachenblutQuestTod","GLOBAL",1)~

ADD_TRANS_TRIGGER TANALLY1 17 ~!Global("C#SB_BlutVonAdalon","GLOBAL",1)~

EXTEND_BOTTOM TANALLY1 18
+ ~!Alignment(Player1,MASK_EVIL)~ + @58 + fael_01
END

EXTEND_BOTTOM TANALLY1 17
IF ~Global("C#SB_Auftraggeber","GLOBAL",1) Global("C#SB_BlutVonAdalon","GLOBAL",1)~ THEN DO ~
EraseJournalEntry(@33)
EraseJournalEntry(@60)~ SOLVED_JOURNAL @62 + fael_02
IF ~!Global("C#SB_Auftraggeber","GLOBAL",1) Global("C#SB_BlutVonAdalon","GLOBAL",1) !Alignment(Player1,MASK_EVIL)~ THEN DO ~
EraseJournalEntry(@33)
EraseJournalEntry(@60)~ SOLVED_JOURNAL @62 + fael_03
IF ~!Global("C#SB_Auftraggeber","GLOBAL",1) Global("C#SB_BlutVonAdalon","GLOBAL",1) Alignment(Player1,MASK_EVIL)~ THEN + 22
END

APPEND TANALLY1

IF ~~ THEN fael_01
SAY @59
IF ~~ THEN DO ~SetGlobal("C#SB_Auftraggeber","GLOBAL",1)~ UNSOLVED_JOURNAL @60 EXIT
END

IF ~~ THEN fael_02
SAY @61
COPY_TRANS TANALLY1 22
END

IF ~~ THEN fael_03
//SAY #53772 /* ~Ich habe da ein paar Bekannte, die Euch gerne sprechen würden, Nun ja, nicht so sehr sprechen, als vielmehr töten.~ */
SAY @78
COPY_TRANS TANALLY1 22
END

END
//-----

BEGIN C#SBABOL

IF ~Global("C#SB_AbolethTalked","GLOBAL",1)~ THEN aboleth_talk
SAY @63
IF ~~ THEN DO ~SetGlobal("C#SB_AbolethTalked","GLOBAL",2) StartCutScene("C#SBABO1")
StartCutSceneMode()~ EXIT
END

IF ~Global("C#SB_AbolethTalked","GLOBAL",3)~ THEN aboleth_talk_2
SAY @64
IF ~~ THEN DO ~SetGlobal("C#SB_AbolethTalked","GLOBAL",4) StartCutScene("C#SBABO2")
StartCutSceneMode()~ EXIT
END

IF ~Global("C#SB_AbolethGibtAuf","GLOBAL",2)~ THEN aboleth_06
SAY @65
= @66
IF ~~ THEN DO ~SetGlobal("C#SB_AbolethGibtAuf","GLOBAL",4) SetGlobal("C#SB_AbolethKampf","GLOBAL",3) SetGlobal("C#SB_AbolethKaempft","GLOBAL",2) SetGlobal("DrowCityHostile","GLOBAL",1) DestroySelf()~ EXIT
END

IF ~Global("C#SB_AbolethGibtAuf","GLOBAL",3)~ THEN aboleth_07
SAY @67
= @66
IF ~~ THEN DO ~SetGlobal("C#SB_AbolethGibtAuf","GLOBAL",4) SetGlobal("C#SB_AbolethKampf","GLOBAL",3) SetGlobal("C#SB_AbolethKaempft","GLOBAL",2) SetGlobal("DrowCityHostile","GLOBAL",1) DestroySelf()~ EXIT
END



BEGIN C#SBDUER

IF ~Global("C#SB_DuergarFriedlich","GLOBAL",2)~ THEN duergar
SAY @68
IF ~~ THEN DO ~GiveItemCreate("BOOT01",[PC],1,0,0) SetGlobal("C#SB_DuergarFriedlich","GLOBAL",3) EscapeArea()~ EXIT
END


EXTEND_BOTTOM HELMPR 0
+ ~PartyHasItem("LEAT21") 
!Alignment(Player1,MASK_EVIL)~ + @69 + haut_entsorgen
END

EXTEND_BOTTOM DOGHMA 0
+ ~PartyHasItem("LEAT21") 
!Alignment(Player1,MASK_EVIL)~ + @69 + haut_entsorgen
END

EXTEND_BOTTOM DAWNMAS 0
+ ~PartyHasItem("LEAT21") 
!Alignment(Player1,MASK_EVIL)~ + @69 + haut_entsorgen
END

EXTEND_BOTTOM SLILMAT 0
+ ~PartyHasItem("LEAT21") 
!Alignment(Player1,MASK_EVIL)~ + @69 + haut_entsorgen
END

APPEND HELMPR

IF ~~ THEN haut_entsorgen
SAY @70
IF ~~ THEN DO ~TakePartyItem("LEAT21")
           DestroyItem("LEAT21") EraseJournalEntry(@62)
AddexperienceParty(28800)~ SOLVED_JOURNAL @71  EXIT
END
END

APPEND DOGHMA

IF ~~ THEN haut_entsorgen
SAY @72
IF ~~ THEN DO ~TakePartyItem("LEAT21")
           DestroyItem("LEAT21") EraseJournalEntry(@62)
AddexperienceParty(28800)~ SOLVED_JOURNAL @73  EXIT
END
END

APPEND DAWNMAS

IF ~~ THEN haut_entsorgen
SAY @74
IF ~~ THEN DO ~TakePartyItem("LEAT21")
           DestroyItem("LEAT21") EraseJournalEntry(@62)
AddexperienceParty(28800)~ SOLVED_JOURNAL @75  EXIT
END
END

APPEND SLILMAT

IF ~~ THEN haut_entsorgen
SAY @76
IF ~~ THEN DO ~TakePartyItem("LEAT21")
           DestroyItem("LEAT21") EraseJournalEntry(@62)
AddexperienceParty(28800)~ SOLVED_JOURNAL @77  EXIT
END
END
