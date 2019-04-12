
var int ALchemy_1_permanent;
var int ALchemy_2_permanent;
var int ALchemy_3_permanent;

func void Use_BookstandALCHEMY1_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Зелья магической силы");
		Doc_PrintLine(nDocID,0,"и ингредиенты");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Эссенция маны");
		Doc_PrintLine(nDocID,0,"2 огненные крапивы");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Экстракт маны");
		Doc_PrintLine(nDocID,0,"2 огненные травы");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Эликсир маны");
		Doc_PrintLine(nDocID,0,"2 огненных корня");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для работы на алхимическом столе необходима мензурка.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы сварить любое лечебное зелье или зелье, усиливающее магическую силу, необходим особый ингредиент и растение:");
		Doc_PrintLine(nDocID,1,"Луговой горец");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы сварить зелье, оказывающее перманентное воздействие на тело или дух, необходимо определенное растение:");
		Doc_PrintLines(nDocID,1,"Царский щавель");
		Doc_Show(nDocID);
		if(ALchemy_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_1_permanent = TRUE;
		};
	};
};

func void Use_BookstandALCHEMY2_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечебные зелья");
		Doc_PrintLine(nDocID,0,"и ингредиенты");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечебная эссенция");
		Doc_PrintLine(nDocID,0,"2 лечебные травы");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечебный экстракт");
		Doc_PrintLine(nDocID,0,"2 лечебных растения");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечебный эликсир");
		Doc_PrintLine(nDocID,0,"2 лечебных корня");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Для работы на алхимическом столе необходима мензурка.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы сварить любое лечебное зелье или зелье, усиливающее магическую силу, необходим особый ингредиент и растение:");
		Doc_PrintLine(nDocID,1,"Луговой горец");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы сварить зелье, имеющее перманентное действие на тело или дух, необходимо определенное растение:");
		Doc_PrintLines(nDocID,1,"Царский щавель");
		Doc_Show(nDocID);
		if(ALchemy_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_2_permanent = TRUE;
		};
	};
};

func void Use_BookstandALCHEMY3_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Зелья, дающие перманентные изменения");
		Doc_PrintLine(nDocID,0,"и ингредиенты");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Эликсир ловкости");
		Doc_PrintLine(nDocID,0,"1 гоблинская ягода");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Зелье скорости");
		Doc_PrintLines(nDocID,0,"1 снеппер-трава - для этого зелья необходим не царский щавель, а луговой горец.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Эликсир силы");
		Doc_PrintLine(nDocID,0,"1 драконий корень");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Эликсир жизни");
		Doc_PrintLine(nDocID,0,"1 лечебный корень");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Эликсир духа");
		Doc_PrintLine(nDocID,0,"1 огненный корень");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Применение этих рецептов - высшее алхимическое искусство. Все они требуют царского щавеля.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Зелье скорости варить значительно легче, частично потому, что для него не требуется царского щавеля.");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(ALchemy_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			ALchemy_3_permanent = TRUE;
		};
	};
};

