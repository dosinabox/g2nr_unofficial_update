
func int Spell_ProcessMana_Release(var int manaInvested)
{
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	if(activeSpell == SPL_Pyrokinesis)
	{
		return SPL_SENDCAST;
	};
	if(activeSpell == SPL_ChargeFireball)
	{
		return SPL_SENDCAST;
	};
	if(activeSpell == SPL_ChargeZap)
	{
		return SPL_SENDCAST;
	};
	if(activeSpell == SPL_WindFist)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

