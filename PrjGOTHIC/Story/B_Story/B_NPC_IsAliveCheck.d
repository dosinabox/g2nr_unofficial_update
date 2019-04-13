
var int SLD_Bullco_is_alive;
var int SLD_Rod_is_alive;
var int SLD_Cipher_is_alive;
var int SLD_Gorn_is_alive;
var int SLD_Sylvio_is_alive;
var int GornDJG_is_alive;
var int DJG_Angar_is_alive;
var int DiegoOW_is_alive;
var int GornOw_is_alive;
var int Vino_isAlive_Kap3;
var int Malak_isAlive_Kap3;

func void B_NPC_IsAliveCheck(var int Zen)
{
	var C_Npc SLD_Bullco_OWCheck;
	var C_Npc SLD_Rod_OWCheck;
	var C_Npc Sld_821;
	var C_Npc SLD_Cipher_OWCheck;
	var C_Npc SLD_Gorn_OWCheck;
	var C_Npc SLD_Sylvio_OWCheck;
	var C_Npc GornDJG_NWCheck;
	var C_Npc DJG_Angar_NWCheck;
	if(Zen == NEWWORLD_ZEN)
	{
		if(Kapitel >= 2)
		{
		};
		if(Kapitel >= 3)
		{
		};
		if(MIS_ReadyforChapter4 == TRUE)
		{
			SLD_Bullco_OWCheck = Hlp_GetNpc(Sld_807_Bullco);
			if(Npc_IsDead(SLD_Bullco_OWCheck))
			{
				SLD_Bullco_is_alive = FALSE;
			}
			else
			{
				SLD_Bullco_is_alive = TRUE;
				B_RemoveNpc(SLD_Bullco_OWCheck);
			};
			SLD_Rod_OWCheck = Hlp_GetNpc(Sld_804_Rod);
			if(Npc_IsDead(SLD_Rod_OWCheck))
			{
				SLD_Rod_is_alive = FALSE;
			}
			else
			{
				SLD_Rod_is_alive = TRUE;
				B_RemoveNpc(SLD_Rod_OWCheck);
			};
			Sld_821 = Hlp_GetNpc(SLD_821_Soeldner);
			Npc_ExchangeRoutine(Sld_821,"RODWEG");
			SLD_Cipher_OWCheck = Hlp_GetNpc(Sld_803_Cipher);
			if(Npc_IsDead(SLD_Cipher_OWCheck))
			{
				SLD_Cipher_is_alive = FALSE;
			}
			else
			{
				SLD_Cipher_is_alive = TRUE;
				B_RemoveNpc(SLD_Cipher_OWCheck);
			};
			SLD_Gorn_OWCheck = Hlp_GetNpc(PC_Fighter_NW_vor_DJG);
			if(Npc_IsDead(SLD_Gorn_OWCheck))
			{
				SLD_Gorn_is_alive = FALSE;
			}
			else
			{
				SLD_Gorn_is_alive = TRUE;
				B_RemoveNpc(SLD_Gorn_OWCheck);
			};
			SLD_Sylvio_OWCheck = Hlp_GetNpc(SLD_806_Sylvio);
			if(Npc_IsDead(SLD_Sylvio_OWCheck))
			{
				SLD_Sylvio_is_alive = FALSE;
			}
			else
			{
				SLD_Sylvio_is_alive = TRUE;
				B_RemoveNpc(SLD_Sylvio_OWCheck);
			};
		};
		if(Kapitel >= 5)
		{
		};
		if(Kapitel >= 6)
		{
		};
	};
	if(Zen == OldWorld_Zen)
	{
		if(Kapitel >= 2)
		{
		};
		if(Kapitel >= 3)
		{
		};
		if(Kapitel >= 4)
		{
			GornDJG_NWCheck = Hlp_GetNpc(GornDJG);
			if(Npc_IsDead(GornDJG))
			{
				GornDJG_is_alive = FALSE;
			}
			else
			{
				GornDJG_is_alive = TRUE;
				B_RemoveNpc(GornDJG_NWCheck);
			};
			DJG_Angar_NWCheck = Hlp_GetNpc(DJG_Angar);
			if(Npc_IsDead(DJG_Angar))
			{
				DJG_Angar_is_alive = FALSE;
			}
			else
			{
				DJG_Angar_is_alive = TRUE;
				B_RemoveNpc(DJG_Angar_NWCheck);
			};
		};
		if(Kapitel >= 5)
		{
		};
		if(Kapitel >= 6)
		{
		};
	};
};

