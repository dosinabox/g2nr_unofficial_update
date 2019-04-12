
var int Animals_1_permanent;
var int Animals_2_permanent;
var int Animals_3_permanent;

func void Use_BookstandAnimals1_S1()
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
		Doc_PrintLine(nDocID,0,"Охота и трофеи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"С каждого зверя или животного можно получить трофеи,  преумножающие славу и благосостояние опытного охотника.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Опытный охотник знает все о трофеях жертвы и как получить их.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Изъятие зубов");
		Doc_PrintLines(nDocID,0,"Зубы - это оружие многих зверей и животных. Если вы знаете, как изъять их у вашей жертвы, то волков, снепперов, мракорисов, болотных акул и троллей можно считать лучшими целями.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Снятие шкур");
		Doc_PrintLines(nDocID,1,"Талантливые и опытные охотники высоко ценятся, у них всегда много шкур - овец, волков и мракорисов, например.");
		Doc_PrintLines(nDocID,1,"Очень опытные охотники могут также снимать шкуры с болотных акул и луркеров.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Изъятие когтей");
		Doc_PrintLines(nDocID,1,"Это искусство применимо ко всем типам ящеров, снепперам, луркерам и мракорисам.");
		Doc_Show(nDocID);
		if(Animals_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_1_permanent = TRUE;
		};
	};
};

func void Use_BookstandAnimals2_S1()
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
		Doc_PrintLine(nDocID,0,"Охота и трофеи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"С каждого зверя или животного можно получить трофеи,  преумножающие славу и благосостояние опытного охотника.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Кровавые мухи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Чтобы выпотрошить этих летающих дьяволов, необходимо обладать двумя навыками.");
		Doc_PrintLines(nDocID,0,"У них можно вырезать крылья и жала.");
		Doc_PrintLines(nDocID,0,"Оба этих навыка используются опытными охотниками для добывания трофеев.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Полевые хищники и краулеры атакуют при помощи мандибул. Мандибулы краулеров");
		Doc_PrintLines(nDocID,1,"особенно ценятся, так как они содержат железы, повышающие магическую силу.");
		Doc_PrintLines(nDocID,1,"Однако, их следует использовать аккуратно, так как человеческий организм постепенно становится невосприимчив к ним.");
		Doc_PrintLines(nDocID,1,"Панцири краулеров также весьма популярны. Из них можно изготавливать доспехи.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
		if(Animals_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_2_permanent = TRUE;
		};
	};
};

func void Use_BookstandAnimals3_S1()
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
		Doc_PrintLine(nDocID,0,"Охота и трофеи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"С каждого зверя или животного можно получить трофеи,  преумножающие славу и благосостояние опытного охотника.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Огненный ящер");
		Doc_PrintLines(nDocID,0,"Этот зверь - ящер, изрыгающий огонь, который может убить любого в пределах нескольких шагов от этой твари.");
		Doc_PrintLines(nDocID,0,"Только те, кто обладает защитой от огня, могут охотиться на этих созданий и добывать их ценные языки.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Мракорис");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Мракорис - это древний зверь, предпочитающий уединение и живущий под покровом леса.");
		Doc_PrintLines(nDocID,1,"Этих созданий осталось очень мало, и поэтому они не представляют особой опасности для людей, если только те не забредут на территорию их охоты.");
		Doc_PrintLines(nDocID,1,"Рог мракориса считается ценным охотничьим трофеем. Но чтобы заполучить его, охотник");
		Doc_PrintLines(nDocID,1,"должен уметь правильно вырезать рог.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(Animals_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_3_permanent = TRUE;
		};
	};
};

