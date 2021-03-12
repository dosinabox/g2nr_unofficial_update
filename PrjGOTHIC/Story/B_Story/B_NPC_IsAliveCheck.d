
var int SLD_Bullco_is_alive;
var int SLD_Rod_is_alive;
var int SLD_Cipher_is_alive;
var int SLD_Gorn_is_alive;
var int SLD_Sylvio_is_alive;
var int GornDJG_is_alive;
var int DJG_Angar_is_alive;
var int Vino_isAlive_Kap3;
var int Malak_isAlive_Kap3;
var int Bromor_isAlive_Kap3;
var int Fernando_isAlive_Kap3;
var int Engrom_isAlive_Kap4;
var int Randolph_isAlive_preKap4;
var int Brutus_isAlive_preKap5;
var int Sekob_isAlive_Kap5;

func void B_NPC_IsAliveCheck(var int Zen)
{
	if(Zen == NEWWORLD_ZEN)
	{
		if(MIS_ReadyforChapter4 == TRUE)
		{
			if(Npc_IsDead(Randolph))
			{
				Randolph_isAlive_preKap4 = FALSE;
			}
			else
			{
				Randolph_isAlive_preKap4 = TRUE;
			};
			if(Npc_IsDead(GornNW_vor_DJG))
			{
				SLD_Gorn_is_alive = FALSE;
			}
			else
			{
				SLD_Gorn_is_alive = TRUE;
				B_RemoveNpc(PC_Fighter_NW_vor_DJG);
			};
			if(Npc_IsDead(Sylvio))
			{
				SLD_Sylvio_is_alive = FALSE;
			}
			else
			{
				SLD_Sylvio_is_alive = TRUE;
				B_RemoveNpc(SLD_806_Sylvio);
			};
			if(Npc_IsDead(Bullco))
			{
				SLD_Bullco_is_alive = FALSE;
			}
			else
			{
				SLD_Bullco_is_alive = TRUE;
				B_RemoveNpc(SLD_807_Bullco);
			};
			if(Npc_IsDead(Cipher))
			{
				SLD_Cipher_is_alive = FALSE;
			}
			else
			{
				SLD_Cipher_is_alive = TRUE;
				B_RemoveNpc(SLD_803_Cipher);
			};
			if(Npc_IsDead(Rod))
			{
				SLD_Rod_is_alive = FALSE;
			}
			else
			{
				SLD_Rod_is_alive = TRUE;
				B_RemoveNpc(SLD_804_Rod);
			};
			if(!Npc_IsDead(SLD_821_Soeldner))
			{
				Npc_ExchangeRoutine(SLD_821_Soeldner,"RODWEG");
			};
		};
	}
	else if(Zen == OLDWORLD_ZEN)
	{
		if(Kapitel >= 4)
		{
			if(Npc_IsDead(Brutus))
			{
				Brutus_isAlive_preKap5 = FALSE;
			}
			else
			{
				Brutus_isAlive_preKap5 = TRUE;
			};
			if(Npc_IsDead(GornDJG))
			{
				GornDJG_is_alive = FALSE;
			}
			else
			{
				GornDJG_is_alive = TRUE;
				B_RemoveNpc(PC_Fighter_DJG);
			};
			if(Npc_IsDead(DJG_Angar))
			{
				DJG_Angar_is_alive = FALSE;
			}
			else
			{
				DJG_Angar_is_alive = TRUE;
				B_RemoveNpc(DJG_705_Angar);
			};
		};
	};
};

