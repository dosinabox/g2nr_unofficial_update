
var int History_1_permanent;
var int History_2_permanent;
var int History_3_permanent;

func void Use_BookstandHistory1_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Путь воина");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Лучшая защита - это хорошее нападение, по крайней мере, когда дело касается зверей. Бесполезно парировать атаки зверей или монстров.");
		Doc_PrintLines(nDocID,0,"Лучше всего держать врага на расстоянии при помощи точных, выверенных ударов, а затем нанести неожиданную комбинационную атаку.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Конечно, только опытные бойцы могут пользоваться комбинациями. Если вы станете мастером боя, вы даже сможете использовать несколько комбинаций.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_1_permanent = TRUE;
		};
	};
};

func void Use_BookstandHistory2_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Остров");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Портовый город Хоринис находится на острове у побережья королевства Миртана.");
		Doc_PrintLines(nDocID,0,"Этот остров известен, прежде всего, своей Долиной рудников. О ней ходят разные слухи, много лет она была закрыта магическим барьером и служила тюрьмой для всех осужденных королевства.");
		Doc_PrintLines(nDocID,0,"Таким образом, эта долина стала тюремной колонией, где каторжники глубоко под землей добывали магическую руду.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Неподалеку от Хориниса находятся несколько ферм, где крестьяне на плодородной почве выращивают пшеницу и репу, а также разводят овец.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Уже многие поколения самая большая ферма принадлежит лендлорду, который сдает в аренду прилежащие земли другим фермерам.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"В центре острова находится древний монастырь Инноса, возглавляемый магами огня. Они проводят там исследования в области магии и алхимии, а также делают неплохое вино.");
		Doc_Show(nDocID);
		if(History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_2_permanent = TRUE;
		};
	};
};

func void Use_BookstandHistory3_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Закон на острове");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Когда люди живут вместе, приходится искать способы поддержания мира - будь это монастырь, город или ферма лендлорда.");
		Doc_PrintLines(nDocID,0,"Любое преступление против сообщества подлежит наказанию.");
		Doc_PrintLines(nDocID,0,"Сообщество запрещает нападать на других, а также ввязываться в уже идущую схватку.");
		Doc_PrintLines(nDocID,0,"Воровство также подлежит наказанию. Кроме того под защитой закона также находятся священные животные - овцы.");
		Doc_PrintLines(nDocID,0," ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Если кто-либо ударит другого или убьет его, правосудие обычно вершится на месте.");
		Doc_PrintLines(nDocID,1,"Чтобы избежать подобной судьбы, виновный должен заплатить высокий штраф.");
		Doc_PrintLines(nDocID,1,"Во всех местах большого скопления народа, спокойствие поддерживают судьи. До них доходят сведения обо всех преступлениях, и в их обязанность входит вынесение приговора и восстановление порядка.");
		Doc_PrintLines(nDocID,1,"Тот, кто стал жертвой преступления или был свидетелем такового, обязан сообщить об этом властям.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_2_permanent = TRUE;
		};
	};
};

