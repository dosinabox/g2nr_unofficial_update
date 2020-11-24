
func void Use_BookstandOWXardas1_S1()
{
	var int nDocID;
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"ћаги€ телепортации");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"ќсобенностью данных магических формул €вл€етс€ то, что хот€ они также заключены в рунах, использовать их может любой человек, обладающий магическими больше силами. ‘ормула может быть активирована мгновенно. Ќикаких ограничений дл€ магии телепортации нет.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_BookstandOWXardas2_S1()
{
	var int nDocID;
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Ќасто€ща€ —ила");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"ћаг не похож на обычных людей. ќн обладает способностью вли€ть на божественную силу, а посему и неподвластен законам природы, которым подчин€етс€ каждый смертный.  огда маг достигает того уровн€, позвол€ющего ему подн€тьс€ над рамками обычного существовани€, он может войти в другой мир, неведомый простым смертным. ћаг может прорватьс€ через границы времени и пространства, и даже смерть, основа всего сущего, не сумеет остановить его.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

