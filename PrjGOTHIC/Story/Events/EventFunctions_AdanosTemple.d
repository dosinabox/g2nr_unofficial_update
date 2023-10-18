
var int ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime;

func void adw_adanostempel_stonegrd_trigg_func_01()
{
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime == FALSE)
	{
		B_Awake_StoneGuardian(Stoneguardian_ADANOSTEMPELENTRANCE_01);
		B_Awake_StoneGuardian(Stoneguardian_ADANOSTEMPELENTRANCE_02);
		B_Awake_StoneGuardian(Stoneguardian_ADANOSTEMPELENTRANCE_03);
		B_Awake_StoneGuardian(Stoneguardian_ADANOSTEMPELENTRANCE_04);
		if(!Npc_IsDead(Stoneguardian_ADANOSTEMPELENTRANCE_01) || !Npc_IsDead(Stoneguardian_ADANOSTEMPELENTRANCE_02) || !Npc_IsDead(Stoneguardian_ADANOSTEMPELENTRANCE_03) || !Npc_IsDead(Stoneguardian_ADANOSTEMPELENTRANCE_04))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime = TRUE;
	};
};


var int OPEN_ADANOSTEMPELCHEST_01_FUNC_OneTime;

func void open_adanostempelchest_01_func_s1()
{
	if(OPEN_ADANOSTEMPELCHEST_01_FUNC_OneTime == FALSE)
	{
		B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_05A);
		B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_05C);
		B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_05E);
		if(Kapitel > 2)
		{
			B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_05B);
			B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_05D);
			B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_05F);
		};
		if(!Npc_IsDead(Stoneguardian_TREASUREPITS_05A) || !Npc_IsDead(Stoneguardian_TREASUREPITS_05C) || !Npc_IsDead(Stoneguardian_TREASUREPITS_05E))
		{
			Snd_Play("THRILLJINGLE_03");
		}
		else if(!Npc_IsDead(Stoneguardian_TREASUREPITS_05B) || !Npc_IsDead(Stoneguardian_TREASUREPITS_05D) || !Npc_IsDead(Stoneguardian_TREASUREPITS_05F))
		{
			if(Kapitel > 2)
			{
				Snd_Play("THRILLJINGLE_03");
			};
		};
		OPEN_ADANOSTEMPELCHEST_01_FUNC_OneTime = TRUE;
	};
};


var int ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime;

func void adw_adanostempel_stonegrd_trigg_func_02()
{
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime == FALSE)
	{
		B_Awake_StoneGuardian(Stoneguardian_RHADEMES_14A);
		B_Awake_StoneGuardian(Stoneguardian_RHADEMES_14B);
		B_Awake_StoneGuardian(Stoneguardian_RHADEMES_14C);
		B_Awake_StoneGuardian(Stoneguardian_RHADEMES_14D);
		B_Awake_StoneGuardian(Stoneguardian_RHADEMES_14E);
		B_Awake_StoneGuardian(Stoneguardian_RHADEMES_14F);
		if(!Npc_IsDead(Stoneguardian_RHADEMES_14A) || !Npc_IsDead(Stoneguardian_RHADEMES_14B) || !Npc_IsDead(Stoneguardian_RHADEMES_14C) || !Npc_IsDead(Stoneguardian_RHADEMES_14D) || !Npc_IsDead(Stoneguardian_RHADEMES_14E) || !Npc_IsDead(Stoneguardian_RHADEMES_14F))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime = TRUE;
	};
};


var int OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime;

func void open_adanostempelchest_02_func_s1()
{
	if(OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime == FALSE)
	{
		B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_09A);
		B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_09C);
		B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_09E);
		if(Kapitel > 2)
		{
			B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_09B);
			B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_09D);
			B_Awake_StoneGuardian(Stoneguardian_TREASUREPITS_09F);
		};
		if(!Npc_IsDead(Stoneguardian_TREASUREPITS_09A) || !Npc_IsDead(Stoneguardian_TREASUREPITS_09C) || !Npc_IsDead(Stoneguardian_TREASUREPITS_09E))
		{
			Snd_Play("THRILLJINGLE_02");
		}
		else if(!Npc_IsDead(Stoneguardian_TREASUREPITS_09B) || !Npc_IsDead(Stoneguardian_TREASUREPITS_09D) || !Npc_IsDead(Stoneguardian_TREASUREPITS_09F))
		{
			if(Kapitel > 2)
			{
				Snd_Play("THRILLJINGLE_03");
			};
		};
		OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime = TRUE;
	};
};


func void evt_raven_awake_func()
{
	if((Raven_Awaken == FALSE) && !Npc_IsDead(Raven))
	{
		AI_Standup(Raven);
		AI_TurnToNPC(Raven,hero);
		B_StartOtherRoutine(Raven,"WaitForPlayer");
		Raven_Awaken = TRUE;
	};
};

