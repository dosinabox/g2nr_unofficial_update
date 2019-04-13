
func void Use_Bookstand_Addon_BL_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Шахта");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Кримсон: получено и переплавлено 79 золотых самородков");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Скатти: получено товаров на 250 золотых");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Гараз: получено 6 золотых самородков");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Все стражники: получено 9 золотых самородков");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Лагерь:");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Стража Ворона: 25 золотых");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Финн: 60 золотых");
		Doc_PrintLines(nDocID,1,"Леннар: 40 золотых");
		Doc_PrintLines(nDocID,1,"Эмилио: 50 золотых");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Остальные: 20 золотых");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Хуно, Фиск, Снаф: каждому выдано в соответствии с товарами");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Охотники: на усмотрение начальника! Франко получил 7 золотых");
		Doc_Show(nDocID);
	};
};


var int BookstandMayaHierchary_1_permanent;
var int BookstandMayaHierchary_2_permanent;
var int BookstandMayaHierchary_3_permanent;
var int BookstandMayaHierchary_4_permanent;
var int BookstandMayaHierchary_5_permanent;
var int BookstandMayaArt;

func int C_CanReadBookStand()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		return TRUE;
	};
};

func void Use_BookstandMaya()
{
	if(BookstandMayaArt == 1)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"...так как только СТРАЖИ МЕРТВЫХ могут вызывать предков.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Их отсутствие - большая потеря для нас. Без совета предков, нам придется полагаться только на себя.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"ЦЕЛИТЕЛЯМ было поручено закрыть портал и уничтожить ключ. Одному Аданосу ведомо, что случилось с ними и удалось ли им достичь своей цели.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"КАСТА ВОИНОВ уничтожена гневом Аданоса. Сердце принца-воина разбито.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Только оставшиеся ЖРЕЦЫ вселяют в нас надежду и постоянно проповедуют о возрождении нашего когда-то великого города.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Но мы, УЧЕНЫЕ, знаем горькую правду. ЯРКЕНДАР пал и скоро растворится в реке времени.");
		Doc_PrintLines(StPl_nDocID,1,"");
	}
	else if(BookstandMayaArt == 2)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"РАДЕМЕС заточен навеки в храме АДАНОСА, но меч не лишен своей силы.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Его влияние стало слишком велико. Убийства на улицах не остановить.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Гнев АДАНОСА положил конец всему. Море поднялось и затопило ЯРКЕНДАР.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Почти не пострадали только храмы и сооружения, находившиеся на возвышенностях.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"У тех немногих, кому удалось выжить в этой катастрофе, недостаточно сил, чтобы восстановить город.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Судьба ЯРКЕНДАРА предрешена.");
		if(SC_Knows_WeaponInAdanosTempel == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			SC_Knows_WeaponInAdanosTempel = TRUE;
		};
	}
	else if(BookstandMayaArt == 3)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Возраст КУАРХОДРОНА не позволял ему возглавлять нашу армию. И жрецы настояли на своем праве приказывать ему.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Они повелели ему покинуть свой штаб и передать меч преемнику.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Преемника должен был определить Совет Пяти. Однако каста воинов лишила совет права выбора.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Воины больше не прислушивались к Совету Пяти, и их новым лидером был выбран его сын РАДЕМЕС.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Опозоренный и лишенный уверенности в своих силах, КУАРХОДРОН решил подчиниться им.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Он передал меч своему сыну в надежде, что тот сможет держать его такой же твердой рукой, как когда-то он сам.");
	}
	else if(BookstandMayaArt == 4)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Но РАДЕМЕС был слаб. Воля меча взяла верх над ним и сделала его своим рабом.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Даже целители не смогли облегчить боль и страдания, которые он принес своему народу, ослепленный мечом.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Меч быстро осознал, что этот народ слишком слаб, чтобы помешать его планам.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Только сила наших предков еще могла противостоять ему.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Но так как РАДЕМЕС изгнал или убил всех стражей мертвых, он лишил нас надежды избавления от этого зла.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"И тогда, когда не стало ни одного стража мертвых, оставшиеся четыре предводителя нашего народа, лишенные своей былой власти, приняли горькое решение сдать ЯРКЕНДАР.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"На улицах шла резня, когда целители отправились в путь, чтобы навечно закрыть единственный вход в нашу долину.");
	}
	else if(BookstandMayaArt == 5)
	{
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"В этих залах КУАРХОДРОН, верховный жрец КАРДИМОН и я обсуждали способы уничтожить РАДЕМЕСА и меч.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"КУАРХОДРОН и КАРДИМОН склонялись к мнению, что РАДЕМЕСА можно победить в бою, если объединить все оставшиеся силы. Но я слишком хорошо знал силу этого меча, и понимал, что это невозможно.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Поэтому я использовал свое право вето на решения остальных. Я решил, что РАДЕМЕСА нужно заманить в ловушку.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"КУАРХОДРОН подчинился этому решению Совета. Он вошел в храм Аданоса и послал за своим сыном.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Ненависть его сына приняла такие формы, что РАДЕМЕС ворвался в храм в дикой ярости, чтобы убить своего отца.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Он понял наши планы, когда было уже слишком поздно.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"КУАРХОДРОН закрыл за ним священные покои нашего храма и РАДЕМЕС оказался навечно заперт в этой ловушке.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"");
	};
};

func void InitUse_BookstandMaya()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,FONT_Book);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_Show(StPl_nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else if(C_CanReadBookStand())
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,FONT_Book);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Use_BookstandMaya();
			Doc_Show(StPl_nDocID);
		};
	};
	BookstandMayaArt = 0;
};

func void Use_BookstandMayaHierchary_01_S1()
{
	BookstandMayaArt = 1;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_1_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_1_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_02_S1()
{
	BookstandMayaArt = 2;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_2_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_2_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_03_S1()
{
	BookstandMayaArt = 3;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_3_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_3_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_04_S1()
{
	BookstandMayaArt = 4;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_4_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_4_permanent = TRUE;
	};
};

func void Use_BookstandMayaHierchary_05_S1()
{
	BookstandMayaArt = 5;
	InitUse_BookstandMaya();
	if((BookstandMayaHierchary_5_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_5_permanent = TRUE;
	};
};

