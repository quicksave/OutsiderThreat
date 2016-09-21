class ind_c_f : faction
{
	class base : type
	{
		uniform[] = {"U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F"};
		helmet[] = {"H_Booniehat_oli", "H_Bandanna_khk", "H_Bandanna_sgg", "H_Bandanna_cbr", "H_Bandanna_camo","","","","","",};
		vest[] = {"V_TacChestrig_oli_F","V_TacChestrig_grn_F"};

		class primary0 : ak12 {};
		class primary1 : akm {};
		class primary2 : ak74u {};
		class primary3 : ak74u {};
	};

	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};

	class rat : r
	{
		class secondary : rpg7 {};
		pack[] = {"rhs_rpg_empty"};

	};

	class ar : r
	{
		class primary0 : lim85 {};
		class primary1 : primary0 {};
		class primary2 : primary0 {};
		class primary3 : primary0 {};

		pack[] = {"B_AssaultPack_rgr"};
		helmet[] = {"H_Bandanna_sgg", "H_Bandanna_cbr", "H_Bandanna_camo","","",""};
	};

	class aar : r
	{
		pack[] = {"B_AssaultPack_rgr"};
		packmags[] = {{"200Rnd_556x45_Box_Tracer_F",2}};
		binos[] = {"Binocular"};
	};

	class m : base
	{
		class primary0 : ak74u {};
		class primary1 : primary0 {};
		class primary2 : primary0 {};
		class primary3 : primary0 {};

		pack[] = {"B_AssaultPack_rgr"};
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
	};
	class dm : r
	{
		class primary0 : ak12
		{
			optic = "optic_SOS";
			bipod = "RH_TD_ACB_b";
		};
		class primary1 : primary0 {};
		class primary2 : primary0 {};
		class primary3 : primary0 {};
	};
	class gren : base
	{
		class primary0 : ak12gl {};
		class primary1 : primary0 {};
		class primary2 : primary0 {};
		class primary3 : primary0 {};

		mags[] = {{"HandGrenade",2}, {"SmokeShell", 4}};
	};

	class ftl : gren
	{
		uniform[] = {"U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F"};
		helmet[] = {"H_Booniehat_oli", "H_Bandanna_khk", ""};

	};
	class dc : ftl
	{
		uniform[] = {"U_I_C_Soldier_Camo_F"};
	};
	class co : dc
	{
		helmet[] = {"H_MilCap_gry"};
	};

	class mmgg : ar
	{
		//class primary : spmg {};
	};
	class mmgag : aar
	{
		//packmags[] = {{"130Rnd_338_Mag",3}};
	};

	class hmgg : r
	{
		pack[] = {"RHS_DShkM_Gun_Bag"};
	};
	class hmgag : r
	{
		pack[] = {"RHS_DShkM_TripodLow_Bag"};
	};

	class matg : rat
	{
		//class secondary : titanc {};
		//pack[] = {"B_Carryall_mcamo"};
		packmags[] = {{"rhs_rpg7_PG7VR_mag",1}};
	};
	class matag : aar
	{
		pack[] = {"rhs_rpg_empty"};
		packmags[] = {{"rhs_rpg7_PG7VR_mag",3}};
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
