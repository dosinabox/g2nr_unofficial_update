
func void B_SetGuild(var C_Npc npc,var int guild)
{
	npc.guild = guild;
	Npc_SetTrueGuild(npc,guild);
};

