class rhs_faction_usarmy_d : faction
{
	class base : type
	{
		uniform[] = {"rhs_uniform_cu_ocp"};
		helmet[] = {"rhsusf_ach_helmet_ocp"};
		vest[] = {"rhsusf_iotv_ocp_Rifleman"};
		pack[] = {"rhsusf_assault_eagleaiii_ocp"};
		
		#include "weapon_m4a1.h"
	};
	
	class r : base
	{
		mags[] = {{"rhs_mag_m67",3}, {"rhs_mag_an_m8hc", 2}};
	};
	
	class rat : r
	{
		#include "weapon_m136_hedp.h"
	};
	
	class ar : r
	{
		#include "weapon_m249.h"
		vest[] = {"rhsusf_iotv_ocp_SAW"};
	};
	
	class aar : r
	{
		packmags[] = {{"rhs_200rnd_556x45_M_SAW",1},{"rhs_200rnd_556x45_T_SAW",2}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"rhs_mag_an_m8hc", 6}};
		vest[] = {"rhsusf_iotv_ocp_Medic"};
	};
	class dm : r
	{
		primaryattach[] = {{"RH_ta31rco","rhsusf_acc_harris_bipod"}};
	};
	class gren : base
	{
		#include "weapon_m4a1_gl.h"
		mags[] = {{"rhs_mag_m67",2}, {"rhs_mag_an_m8hc", 3}};
		vest[] = {"rhsusf_iotv_ocp_Grenadier"};
	};
	
	class ftl : gren
	{
		vest[] = {"rhsusf_iotv_ocp_Teamleader"};
	};
	class dc : ftl
	{
		primaryattach[] = {{"RH_ta31rco"}};
		vest[] = {"rhsusf_iotv_ocp_Squadleader"};
	};
	class co : dc {};
	
	class mmgg : r
	{
		#include "weapon_m240.h"
	};
	class mmgag : aar
	{
		packmags[] = {{"rhsusf_100Rnd_762x51",3}};
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
		#include "weapon_maaws.h"
	};
	class matag : aar
	{
		packmags[] = {{"MAAWS_HEDP",3}};
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
		#include "weapon_stinger.h"
	};
	class msamag : aar
	{
		packmags[] = {{"rhs_fim92_mag",1}};
	};
};