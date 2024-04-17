
func void B_SetNpcVisual(var C_Npc slf,var int gender,var string headMesh,var int faceTex,var int bodyTex,var int armorInstance)
{
	var int teethTex;
	teethTex = slf.aivar[AIV_Teeth];
	slf.aivar[AIV_Gender] = gender;
	Mdl_SetVisual(slf,"HUMANS.MDS");
	if(gender == MALE)
	{
		Mdl_SetVisualBody(slf,"hum_body_Naked0",bodyTex,0,headMesh,faceTex,teethTex,armorInstance);
		if(slf.attribute[ATR_STRENGTH] < 50)
		{
			Mdl_SetModelScale(slf,0.9,1,1);
		}
		else if(slf.attribute[ATR_STRENGTH] > 100)
		{
			Mdl_SetModelScale(slf,1.1,1,1);
		};
	}
	else
	{
		Mdl_SetVisualBody(slf,"Hum_Body_Babe0",bodyTex,0,headMesh,faceTex,teethTex,armorInstance);
	};
};

