class blu_gen_f : faction
{
	class base : type
	{
		uniform[] = {"U_B_GEN_Commander_F", "U_B_GEN_Soldier_F", "U_B_GEN_Soldier_F"};
		helmet[] = {"H_Helmet_Skate"};
		vest[] = {"V_TacVest_gen_F"};
		goggles[] = {"G_Balaclava_TI_blk_F"};
		
		class primary : protector 
		{
			rail = "acc_flashlight";
		};
	};
	
	class r : base
	{
		mags[] = {{"rhs_mag_mk84",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};
	
	class rat : r
	{
		//class secondary : m136_hedp {};
	};
	
	class ar : r
	{
		class primary : lim85 {};
		pack[] = {"B_AssaultPack_blk"};
	};
	
	class aar : r
	{
		pack[] = {"B_AssaultPack_blk"};
		packmags[] = {{"200Rnd_556x45_Box_Tracer_F",2}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		pack[] = {"B_AssaultPack_blk"};
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
	};
	
	class dm : r
	{
		class primary : spar16 
		{
			optic = "optic_ERCO_blk_F";
			bipod = "RH_TD_ACB_b";
		};
	};
	
	class gren : base
	{
		class primary : m590 
		{
			extradefmags = 4;
		};
		mags[] = {{"rhsusf_8Rnd_Slug",4},{"rhs_mag_mk84",2}, {"HandGrenade",2}, {"SmokeShell", 2}};
	};
	
	class ftl : gren
	{
		uniform[] = {"U_B_GEN_Commander_F"};
		class hgun : acp {};
	};
	
	class dc : r 
	{
		uniform[] = {"U_B_GEN_Commander_F"};
		helmet[] = {"H_Beret_gen_F"};
		goggles[] = {"G_Aviator"};
	};
	class co : dc {};
	
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
		pack[] = {"RHS_M2_Gun_Bag"};
	};
	class hmgag : r
	{
		pack[] = {"RHS_M2_MiniTripod_Bag"};
	};
	
	class matg : r
	{
		class secondary : titanc {};
		pack[] = {"B_AssaultPack_blk"};
	};
	class matag : aar
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
		pack[] = {"B_AssaultPack_blk"};
	};
	class msamag : r
	{
		packmags[] = {{"Titan_AA",3}};
	};

	
	#include "crate\crate_nato.h"
	#include "vehicle\veh_nato.h"
};