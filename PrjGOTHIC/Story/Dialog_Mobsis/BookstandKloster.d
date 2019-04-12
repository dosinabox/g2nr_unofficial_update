
func void Use_Bookstand_Rune_01_S1()
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
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Рунные камни");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rune_02_S1()
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
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Руны и ингредиенты");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_01_S1()
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
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Учение Инноса");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_02_S1()
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
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Заповеди Инноса");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_01_S1()
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
		Doc_PrintLine(nDocID,0,"ПЕРВЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны 1-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Свет");
		Doc_PrintLine(nDocID,0,"Золотая монета");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Огненная стрела");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Малая молния");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Скелет гоблина");
		Doc_PrintLine(nDocID,0,"Кость гоблина");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечение легких ранений");
		Doc_PrintLine(nDocID,0,"Лечебная трава");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_02_S1()
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
		Doc_PrintLine(nDocID,0,"ВТОРОЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны 2-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Огненный шар");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ледяная стрела");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Вызов волка");
		Doc_PrintLine(nDocID,0,"Шкура волка");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Кулак ветра");
		Doc_PrintLine(nDocID,0,"Уголь");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Сон");
		Doc_PrintLine(nDocID,0,"Болотная трава");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_03_S1()
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
		Doc_PrintLine(nDocID,0,"ТРЕТИЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны 3-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечение средних ранений");
		Doc_PrintLine(nDocID,0,"Лечебное растение");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Малая огненная буря");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Создание скелета");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Страх");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ледяной блок");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Шаровая молния");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,0,"Огненный шар");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_04_S1()
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
		Doc_PrintLine(nDocID,0,"ЧЕТВЕРТЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны 4-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Большой огненный шар");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Молния");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Пробуждение голема");
		Doc_PrintLine(nDocID,0,"Сердце каменного голема");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Уничтожение нежити");
		Doc_PrintLine(nDocID,0,"Святая вода");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_05_S1()
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
		Doc_PrintLine(nDocID,0,"ПЯТЫЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны 5-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ледяная волна");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Большая огненная буря");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Вызов демона");
		Doc_PrintLine(nDocID,0,"Сердце демона");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечение тяжелых ранений");
		Doc_PrintLine(nDocID,0,"Лечебный корень");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Kreise_06_S1()
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
		Doc_PrintLine(nDocID,0,"ШЕСТОЙ КРУГ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны 6-го круга и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Огненный дождь");
		Doc_PrintLine(nDocID,0,"Смола");
		Doc_PrintLine(nDocID,0,"Сера");
		Doc_PrintLine(nDocID,0,"Огненный язык");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Дыхание смерти");
		Doc_PrintLine(nDocID,0,"Уголь");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Волна смерти");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Армия тьмы");
		Doc_PrintLine(nDocID,0,"Кость скелета");
		Doc_PrintLine(nDocID,0,"Черный жемчуг");
		Doc_PrintLine(nDocID,0,"Сердце каменного голема");
		Doc_PrintLine(nDocID,0,"Сердце демона");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Сморщивание монстра");
		Doc_PrintLine(nDocID,1,"Кость гоблина");
		Doc_PrintLine(nDocID,1,"Клык тролля");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rules_01_S1()
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
		Doc_PrintLine(nDocID,0,"Страница 1");
		Doc_PrintLine(nDocID,0,"Правила");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Страница 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

