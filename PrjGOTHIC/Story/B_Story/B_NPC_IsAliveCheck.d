
var int SLD_Bullco_isAlive;
var int SLD_Rod_isAlive;
var int SLD_Cipher_isAlive;
var int SLD_Gorn_isAlive;
var int SLD_Sylvio_isAlive;
var int DJG_Gorn_isAlive;
var int DJG_Angar_isAlive;
var int Hodges_isAlive_Kap3;
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
			if(!Npc_IsDead(Randolph))
			{
				Randolph_isAlive_preKap4 = TRUE;
			};
			if(!Npc_IsDead(GornNW_vor_DJG))
			{
				SLD_Gorn_isAlive = TRUE;
				B_DeletePetzCrime(GornNW_vor_DJG);
				B_RemoveNpc(PC_Fighter_NW_vor_DJG);
			};
			if(!Npc_IsDead(Bullco))
			{
				SLD_Bullco_isAlive = TRUE;
				B_DeletePetzCrime(Bullco);
				B_RemoveNpc(SLD_807_Bullco);
			};
			if(!Npc_IsDead(Cipher))
			{
				SLD_Cipher_isAlive = TRUE;
				B_DeletePetzCrime(Cipher);
				B_RemoveNpc(SLD_803_Cipher);
			};
			if(!Npc_IsDead(Rod))
			{
				SLD_Rod_isAlive = TRUE;
				B_DeletePetzCrime(Rod);
				B_RemoveNpc(SLD_804_Rod);
			};
			if(!Npc_IsDead(Sylvio))
			{
				SLD_Sylvio_isAlive = TRUE;
				B_DeletePetzCrime(Sylvio);
				B_RemoveNpc(SLD_806_Sylvio);
			};
			B_StartOtherRoutine(SLD_821_Soeldner,"RODWEG");
		};
	}
	else if(Zen == OLDWORLD_ZEN)
	{
		if(Kapitel >= 4)
		{
			if(!Npc_IsDead(Brutus))
			{
				Brutus_isAlive_preKap5 = TRUE;
			};
			if(!Npc_IsDead(GornDJG))
			{
				DJG_Gorn_isAlive = TRUE;
				B_RemoveNpc(PC_Fighter_DJG);
			};
			if(!Npc_IsDead(DJG_Angar))
			{
				DJG_Angar_isAlive = TRUE;
				B_RemoveNpc(DJG_705_Angar);
			};
		};
	};
};

