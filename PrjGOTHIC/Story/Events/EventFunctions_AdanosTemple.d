
var int ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime;

func void adw_adanostempel_stonegrd_trigg_func_01()
{
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_01_OneTime == FALSE)
	{
		var C_Npc StoneGuardianAdanos_01;
		var C_Npc StoneGuardianAdanos_02;
		var C_Npc StoneGuardianAdanos_03;
		var C_Npc StoneGuardianAdanos_04;
		StoneGuardianAdanos_01 = Hlp_GetNpc(Stoneguardian_ADANOSTEMPELENTRANCE_01);
		StoneGuardianAdanos_02 = Hlp_GetNpc(Stoneguardian_ADANOSTEMPELENTRANCE_02);
		StoneGuardianAdanos_03 = Hlp_GetNpc(Stoneguardian_ADANOSTEMPELENTRANCE_03);
		StoneGuardianAdanos_04 = Hlp_GetNpc(Stoneguardian_ADANOSTEMPELENTRANCE_04);
		b_awake_stoneguardian(StoneGuardianAdanos_01);
		b_awake_stoneguardian(StoneGuardianAdanos_02);
		b_awake_stoneguardian(StoneGuardianAdanos_03);
		b_awake_stoneguardian(StoneGuardianAdanos_04);
		if(!Npc_IsDead(StoneGuardianAdanos_01) || !Npc_IsDead(StoneGuardianAdanos_02) || !Npc_IsDead(StoneGuardianAdanos_03) || !Npc_IsDead(StoneGuardianAdanos_04))
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
		var C_Npc StoneGuardianAdanos_05A;
		var C_Npc StoneGuardianAdanos_05C;
		var C_Npc StoneGuardianAdanos_05E;
		StoneGuardianAdanos_05A = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05A);
		StoneGuardianAdanos_05C = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05C);
		StoneGuardianAdanos_05E = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05E);
		b_awake_stoneguardian(StoneGuardianAdanos_05A);
		b_awake_stoneguardian(StoneGuardianAdanos_05C);
		b_awake_stoneguardian(StoneGuardianAdanos_05E);
		if(Kapitel > 2)
		{
			var C_Npc StoneGuardianAdanos_05B;
			var C_Npc StoneGuardianAdanos_05D;
			var C_Npc StoneGuardianAdanos_05F;
			StoneGuardianAdanos_05B = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05B);
			StoneGuardianAdanos_05D = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05D);
			StoneGuardianAdanos_05F = Hlp_GetNpc(Stoneguardian_TREASUREPITS_05F);
			b_awake_stoneguardian(StoneGuardianAdanos_05B);
			b_awake_stoneguardian(StoneGuardianAdanos_05D);
			b_awake_stoneguardian(StoneGuardianAdanos_05F);
		};
		if(!Npc_IsDead(StoneGuardianAdanos_05A) || !Npc_IsDead(StoneGuardianAdanos_05C) || !Npc_IsDead(StoneGuardianAdanos_05E))
		{
			Snd_Play("THRILLJINGLE_03");
		}
		else if(!Npc_IsDead(StoneGuardianAdanos_05B) || !Npc_IsDead(StoneGuardianAdanos_05D) || !Npc_IsDead(StoneGuardianAdanos_05F))
		{
			if(Kapitel > 2)
			{
				Snd_Play("THRILLJINGLE_03");
			};
		};
		OPEN_ADANOSTEMPELCHEST_01_FUNC_OneTime = TRUE;
	};
};


var int OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime;

func void open_adanostempelchest_02_func_s1()
{
	if(OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime == FALSE)
	{
		var C_Npc StoneGuardianAdanos_09A;
		var C_Npc StoneGuardianAdanos_09C;
		var C_Npc StoneGuardianAdanos_09E;
		StoneGuardianAdanos_09A = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09A);
		StoneGuardianAdanos_09C = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09C);
		StoneGuardianAdanos_09E = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09E);
		b_awake_stoneguardian(StoneGuardianAdanos_09A);
		b_awake_stoneguardian(StoneGuardianAdanos_09C);
		b_awake_stoneguardian(StoneGuardianAdanos_09E);
		if(Kapitel > 2)
		{
			var C_Npc StoneGuardianAdanos_09B;
			var C_Npc StoneGuardianAdanos_09D;
			var C_Npc StoneGuardianAdanos_09F;
			StoneGuardianAdanos_09B = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09B);
			StoneGuardianAdanos_09D = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09D);
			StoneGuardianAdanos_09F = Hlp_GetNpc(Stoneguardian_TREASUREPITS_09F);
			b_awake_stoneguardian(StoneGuardianAdanos_09B);
			b_awake_stoneguardian(StoneGuardianAdanos_09D);
			b_awake_stoneguardian(StoneGuardianAdanos_09F);
		};
		if(!Npc_IsDead(StoneGuardianAdanos_09A) || !Npc_IsDead(StoneGuardianAdanos_09C) || !Npc_IsDead(StoneGuardianAdanos_09E))
		{
			Snd_Play("THRILLJINGLE_02");
		}
		else if(!Npc_IsDead(StoneGuardianAdanos_09B) || !Npc_IsDead(StoneGuardianAdanos_09D) || !Npc_IsDead(StoneGuardianAdanos_09F))
		{
			if(Kapitel > 2)
			{
				Snd_Play("THRILLJINGLE_03");
			};
		};
		OPEN_ADANOSTEMPELCHEST_02_FUNC_OneTime = TRUE;
	};
};


var int ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime;

func void adw_adanostempel_stonegrd_trigg_func_02()
{
	if(ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime == FALSE)
	{
		var C_Npc StoneGuardianAdanos_14A;
		var C_Npc StoneGuardianAdanos_14B;
		var C_Npc StoneGuardianAdanos_14C;
		var C_Npc StoneGuardianAdanos_14D;
		var C_Npc StoneGuardianAdanos_14E;
		var C_Npc StoneGuardianAdanos_14F;
		StoneGuardianAdanos_14A = Hlp_GetNpc(Stoneguardian_RHADEMES_14A);
		StoneGuardianAdanos_14B = Hlp_GetNpc(Stoneguardian_RHADEMES_14B);
		StoneGuardianAdanos_14C = Hlp_GetNpc(Stoneguardian_RHADEMES_14C);
		StoneGuardianAdanos_14D = Hlp_GetNpc(Stoneguardian_RHADEMES_14D);
		StoneGuardianAdanos_14E = Hlp_GetNpc(Stoneguardian_RHADEMES_14E);
		StoneGuardianAdanos_14F = Hlp_GetNpc(Stoneguardian_RHADEMES_14F);
		b_awake_stoneguardian(StoneGuardianAdanos_14A);
		b_awake_stoneguardian(StoneGuardianAdanos_14B);
		b_awake_stoneguardian(StoneGuardianAdanos_14C);
		b_awake_stoneguardian(StoneGuardianAdanos_14D);
		b_awake_stoneguardian(StoneGuardianAdanos_14E);
		b_awake_stoneguardian(StoneGuardianAdanos_14F);
		if(!Npc_IsDead(StoneGuardianAdanos_14A) || !Npc_IsDead(StoneGuardianAdanos_14B) || !Npc_IsDead(StoneGuardianAdanos_14C) || !Npc_IsDead(StoneGuardianAdanos_14D) || !Npc_IsDead(StoneGuardianAdanos_14E) || !Npc_IsDead(StoneGuardianAdanos_14F))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		ADW_ADANOSTEMPEL_STONEGRD_TRIGG_FUNC_02_OneTime = TRUE;
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

