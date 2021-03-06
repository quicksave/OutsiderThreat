class opf_t_f : faction
{
	class base : type
	{
		uniform[] = {"U_O_V_Soldier_Viper_F"};
		helmet[] = {"H_HelmetO_ViperSP_ghex_F"};
		pack[] = {"B_ViperHarness_ghex_F"};

		class primary : type115 {};
	};

	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};

	// incomplete

	/*class rat : r
	{
		class secondary : m136_hedp {};
	};

	class ar : r
	{
		class primary : mx_sw {};
	};

	class aar : r
	{
		packmags[] = {{"100Rnd_65x39_caseless_mag",2},{"100Rnd_65x39_caseless_mag_Tracer",1}};
		binos[] = {"Binocular"};
	};

	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
	};
	*/
	class dm : r
	{
		class primary : type115
		{
			optic = "optic_DMS_ghex_F";
			bipod = "bipod_02_F_blk";
		};
	};
	/*
	class gren : base
	{
		class primary : mx_3gl {};
		mags[] = {{"HandGrenade",2}, {"SmokeShell", 4}};
	};
	*/
	class ftl : r
	{
		helmet[] = {"H_HelmetSpecB_sand","H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2"};

		class primary : mx_3gl
		{
			optic = "optic_Arco_ghex_F";
		};
	};

	class dc : ftl {};
	class co : dc {};

	class mmgg : r
	{
		class primary : navid {};
	};
	//class mmgag : aar
	class mmgag : r
	{
		packmags[] = {{"130Rnd_338_Mag",3}};
	};

	class hmgg : r
	{
		pack[] = {"RHS_M2_Gun_Bag"};
	};
	class hmgag : r
	{
		pack[] = {"RHS_M2_MiniTripod_Bag"};
	};

	class matg : r
	{
		class secondary : titanc {};
		pack[] = {"B_Carryall_mcamo"};
	};
	//class matag : aar
	class matag : r
	{
		packmags[] = {{"Titan_AT",3}};
	};

	class hatg : r
	{
		pack[] = {"B_AT_01_weapon_F"};
	};
	class hatag : r
	{
		pack[] = {"B_HMG_01_support_F"};
	};

	class msamg : r
	{
		class secondary : titanaa {};
		pack[] = {"B_Carryall_mcamo"};
	};
	class msamag : r
	{
		packmags[] = {{"Titan_AA",3}};
	};


	#include "crate\crate_nato.h"
	#include "vehicle\veh_nato.h"
};
