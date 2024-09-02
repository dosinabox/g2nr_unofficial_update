
var int EnterDI_Kapitel6;

func void Enter_DI_FirstTime_Trigger()
{
	if(EnterDI_Kapitel6 == FALSE)
	{
		var C_Npc player;
		player = Hlp_GetNpc(PC_Hero);
		if(player.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};
		if(!Npc_HasItems(player,ItMi_InnosEye_MIS))
		{
			Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
			if(!Npc_HasItems(player,ItMi_InnosEye_Discharged_MIS))
			{
				Wld_InsertItem(ItSe_XardasNotfallBeutel_MIS,"FP_ITEM_SHIP_12");
				SC_InnosEyeVergessen_DI = TRUE;
				B_LogEntry(TOPIC_HallenVonIrdorath,"Прошлой ночью мне приснился сон. Со мной говорил Ксардас, он попросил меня подойти к алхимическому столу на корабле, чтобы забрать кое-что с него. Это очень странно, но я ничего не пил вчера вечером.");
			};
			if(!Npc_HasItems(player,ItAt_IcedragonHeart) && !Npc_HasItems(player,ItAt_RockdragonHeart) && !Npc_HasItems(player,ItAt_FiredragonHeart) && !Npc_HasItems(player,ItAt_SwampdragonHeart))
			{
				CreateInvItems(AntiPaladin_DI,ItAt_RockdragonHeart,1);
			};
		};
		if(PedroGotLostInnosStatue == TRUE)
		{
			CreateInvItems(AntiPaladin_DI,ItMi_LostInnosStatue_Daron,1);
		};
		Log_CreateTopic(TOPIC_MyCrew,LOG_NOTE);
		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Йорген, мой капитан, будет ждать на корабле моего возвращения.");
		}
		else if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Торлоф, мой капитан, будет ждать на корабле и оборонять его во время моего отсутствия. Он также может помочь мне повысить мою силу и ловкость.");
		}
		else if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Джек, мой капитан, будет ждать на корабле моего возвращения. Похоже, он немного испуган. Надеюсь, он возьмет себя в руки. Он нужен мне.");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Ли будет командовать кораблем в мое отсутствие. Он также может помочь мне научиться лучше владеть двуручным и одноручным оружием.");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			if(player.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Милтен может помочь мне с повышением маны и созданием новых рун.");
			}
			else
			{
				Log_AddEntry(TOPIC_MyCrew,"Милтен может помочь мне повысить мою ману.");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"У меня такое впечатление, что состояние Лестера только ухудшилось на этом странном острове.");
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Марио ведет себя немного странно. Он просто сидит на корме и уже давно от него никто не слышал ни слова.");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Вольф может обучить меня стрельбе из арбалета и лука.");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			if(player.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Ватрас удалился в каюту магов. Он может лечить меня и знает множество рецептов приготовления зелий. Также с его помощью я смогу повысить свой Круг магии.");
			}
			else
			{
				Log_AddEntry(TOPIC_MyCrew,"Ватрас удалился в каюту магов. Он может лечить меня и знает множество рецептов приготовления зелий.");
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Беннет обучит меня кузнечному делу, если я захочу. Также он может помочь мне повысить мою силу.");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Диего поможет мне, если я не знаю, что делать, также у него есть амуниция для меня. Он может научить меня пользоваться отмычками и метко стрелять из лука и арбалета.");
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Горн ни разу не прилег за время нашего путешествия. Он будет присматривать за кораблем. Я думаю, корабль будет в надежных руках. Также Горн может помочь мне научиться лучше владеть двуручным оружием.");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Ларес обещал научить меня красться и сражаться одноручным оружием. Кроме этого он может повысить мою ловкость.");
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Бифф слишком жаден до денег, это огорчает. Его тяжело контролировать.");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Ангар очень беспокоен. Мне кажется, что еще немного, и он побежит куда-нибудь сражаться без приказа.");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Гирион невозмутим. Его спокойствие поражает. И он превосходный инструктор боя. Это может пригодиться мне.");
		};
		IntroduceChapter(KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav",6000);
		EnterDI_Kapitel6 = TRUE;
	};
};

