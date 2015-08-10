class blu_f : faction
{
	class base : type
	{
		uniform[] = {"U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest"};
		helmet[] = {"H_HelmetB_sand","H_HelmetB_grass", "H_HelmetB_desert"};
		vest[] = {"V_PlateCarrierSpec_mtp"};
		pack[] = {"B_AssaultPack_mcamo"};
		
		#include "weapon_mx.h"
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};
	
	class rat : r
	{
		#include "weapon_m136_hedp.h"
	};
	
	class ar : r
	{
		#include "weapon_mx_sw.h"
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
	class dm : r
	{
		#include "weapon_mxm.h"
	};
	class gren : base
	{
		#include "weapon_mx_3gl.h"
		mags[] = {{"HandGrenade",2}, {"SmokeShell", 4}};
	};
	
	class ftl : gren
	{
		helmet[] = {"H_HelmetSpecB_sand","H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2"};
		primaryattach[] = {{"optic_Arco"}};
	};
	class dc : ftl {};
	class co : dc {};
	
	class mmgg : r
	{
		#include "weapon_spmg.h"
	};
	class mmgag : aar
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
		#include "weapon_titanc.h"
		pack[] = {"B_Carryall_mcamo"};
	};
	class matag : aar
	{
		packmags[] = {{"Titan_AT",3}};
	};
	
	class hatg : matg
	{
		pack[] = {"B_AT_01_weapon_F"};
	};
	class hatag : matag
	{
		pack[] = {"B_HMG_01_support_F"};
	};
	
	class msamg : r
	{
		#include "weapon_titanaa.h"
		pack[] = {"B_Carryall_mcamo"};
	};
	class msamag : aar
	{
		packmags[] = {{"Titan_AA",3}};
	};

	
	#include "crate_nato.h"
	#include "veh_nato.h"
};