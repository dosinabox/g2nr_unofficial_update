
func void Use_Bookstand_Kreise_01_S1()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ПЕРВЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны первого круга и ингредиенты для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_LIGHT,":"));
		Doc_PrintLine(nDocID,0,"- золотая монета");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Firebolt,":"));
		Doc_PrintLine(nDocID,0,"- сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Zap,":"));
		Doc_PrintLine(nDocID,0,"- горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_SummonGoblinSkeleton,":"));
		Doc_PrintLine(nDocID,0,"- кость гоблина");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_LightHeal,":"));
		Doc_PrintLine(nDocID,0,"- лечебная трава");
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

func void Use_Bookstand_Kreise_02_S1()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ВТОРОЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны второго круга и ингредиенты для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_InstantFireball,":"));
		Doc_PrintLine(nDocID,0,"- смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Icebolt,":"));
		Doc_PrintLine(nDocID,0,"- ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_SummonWolf,":"));
		Doc_PrintLine(nDocID,0,"- шкура волка");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_WINDFIST,":"));
		Doc_PrintLine(nDocID,0,"- уголь");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Sleep,":"));
		Doc_PrintLine(nDocID,0,"- болотная трава");
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

func void Use_Bookstand_Kreise_03_S1()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ТРЕТИЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны третьего круга и ингредиенты для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_MediumHeal,":"));
		Doc_PrintLine(nDocID,0,"- лечебное растение");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Firestorm,":"));
		Doc_PrintLine(nDocID,0,"- смола");
		Doc_PrintLine(nDocID,0,"- сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_SummonSkeleton,":"));
		Doc_PrintLine(nDocID,0,"- кость скелета");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Fear,":"));
		Doc_PrintLine(nDocID,0,"- черная жемчужина");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_IceCube,":"));
		Doc_PrintLine(nDocID,0,"- ледяной кварц");
		Doc_PrintLine(nDocID,0,"- аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_ChargeZap,":"));
		Doc_PrintLine(nDocID,0,"- горный хрусталь");
		Doc_PrintLine(nDocID,0,"- сера");
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

func void Use_Bookstand_Kreise_04_S1()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ЧЕТВЕРТЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны четвертого круга и ингредиенты для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_ChargeFireball,":"));
		Doc_PrintLine(nDocID,0,"- сера");
		Doc_PrintLine(nDocID,0,"- смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_LightningFlash,":"));
		Doc_PrintLine(nDocID,0,"- горный хрусталь");
		Doc_PrintLine(nDocID,0,"- ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_SummonGolem,":"));
		Doc_PrintLine(nDocID,0,"- сердце каменного голема");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_DestroyUndead,":"));
		Doc_PrintLine(nDocID,0,"- святая вода");
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

func void Use_Bookstand_Kreise_05_S1()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ПЯТЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны пятого круга и ингредиенты для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_IceWave,":"));
		Doc_PrintLine(nDocID,0,"- ледяной кварц");
		Doc_PrintLine(nDocID,0,"- аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Pyrokinesis,":"));
		Doc_PrintLine(nDocID,0,"- сера");
		Doc_PrintLine(nDocID,0,"- огненный язык");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_SummonDemon,":"));
		Doc_PrintLine(nDocID,0,"- сердце демона");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_FullHeal,":"));
		Doc_PrintLine(nDocID,0,"- лечебный корень");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Shrink,":"));
		Doc_PrintLine(nDocID,0,"- кость гоблина");
		Doc_PrintLine(nDocID,0,"- клык тролля");
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

func void Use_Bookstand_Kreise_06_S1()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ШЕСТОЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны шестого круга и ингредиенты для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_Firerain,":"));
		Doc_PrintLine(nDocID,0,"- смола");
		Doc_PrintLine(nDocID,0,"- сера");
		Doc_PrintLine(nDocID,0,"- огненный язык");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_BreathOfDeath,":"));
		Doc_PrintLine(nDocID,0,"- уголь");
		Doc_PrintLine(nDocID,0,"- черная жемчужина");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_MassDeath,":"));
		Doc_PrintLine(nDocID,0,"- кость скелета");
		Doc_PrintLine(nDocID,0,"- черная жемчужина");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings(NAME_SPL_ArmyOfDarkness,":"));
		Doc_PrintLine(nDocID,0,"- кость скелета");
		Doc_PrintLine(nDocID,0,"- черная жемчужина");
		Doc_PrintLine(nDocID,0,"- сердце каменного голема");
		Doc_PrintLine(nDocID,0,"- сердце демона");
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

