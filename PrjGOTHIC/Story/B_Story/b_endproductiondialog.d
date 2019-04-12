
func void b_endproductiondialog()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	player_mobsi_production = MOBSI_NONE;
};

