
const int TAB_ANZAHL = 256;

const int GIL_ATTITUDES[256] =
{
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_HOSTILE,ATT_NEUTRAL,ATT_HOSTILE,ATT_FRIENDLY,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_FRIENDLY,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_HOSTILE,ATT_NEUTRAL,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,ATT_FRIENDLY,ATT_NEUTRAL,
	ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL,ATT_NEUTRAL
};