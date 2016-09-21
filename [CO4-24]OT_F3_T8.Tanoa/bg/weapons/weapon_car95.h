class car95 : weapon
{
	wepname = "arifle_CTAR_blk_F";
	defmag = "30Rnd_580x42_Mag_F";
	extradefmags = 7;
	addmags[] = {{"30Rnd_580x42_Mag_Tracer_F",2}};
	optic = "optic_ACO_grn";
};
class car95gl : car95
{
	wepname ="arifle_CTAR_GL_blk_F";
	defglmag = "1Rnd_HE_Grenade_shell";
	extradefglmags = 5;
};

class car95ar : car95
{
	wepname = "arifle_CTARS_blk_F";
	defmag = "100Rnd_580x42_Mag_F";
	extradefmags = 3;
};
