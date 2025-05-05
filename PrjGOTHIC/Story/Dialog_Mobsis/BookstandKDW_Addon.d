
func void Use_Runemaking_KDW_CIRC1_S1()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Blue_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Blue_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"МАГИЯ ВОДЫ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны Воды и ингредиенты для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Whirlwind,":"));
		Doc_PrintLine(nDocID,0,"- крылья кровавой мухи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_IceLance,":"));
		Doc_PrintLine(nDocID,0,"- ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Geyser,":"));
		Doc_PrintLine(nDocID,0,"- аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Thunderstorm,":"));
		Doc_PrintLine(nDocID,0,"- ледяной кварц");
		Doc_PrintLine(nDocID,0,"- крылья кровавой мухи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_WaterFist,":"));
		Doc_PrintLine(nDocID,0,"- аквамарин");
		Doc_PrintLine(nDocID,0,"- горный хрусталь");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,PRINT_BookstandRunes1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,PRINT_BookstandRunes2);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,PRINT_BookstandRunes3);
		Doc_Show(nDocID);
		SC_KnowsBlankRuneForFirebolt = TRUE;
	};
};

