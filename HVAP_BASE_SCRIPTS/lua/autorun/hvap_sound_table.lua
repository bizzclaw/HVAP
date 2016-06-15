-------------------------------------------------------
--###################################################-- Misc
-------------------------------------------------------

sound.Add( -- fly large
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Fly.Large",
    level = 85,
    sound =	"hvap/bullet/large_fly_loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Explode
-------------------------------------------------------
sound.Add( -- explode small
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Explode.Small",
    level = 100,
    sound = 	{
		"hvap/bullet/explode/small_1.wav",
		"hvap/bullet/explode/small_2.wav",
		"hvap/bullet/explode/small_3.wav",
		"hvap/bullet/explode/small_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- explode medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Explode.Medium",
    level = 110,
    sound = 	{
		"hvap/bullet/explode/medium_1.wav",
		"hvap/bullet/explode/medium_2.wav",
		"hvap/bullet/explode/medium_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- explode large near
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Explode.Large.Near",
    level = 100,
    sound = 	{
		"hvap/bullet/explode/large_1.wav",
		"hvap/bullet/explode/large_2.wav",
		"hvap/bullet/explode/large_3.wav",
		"hvap/bullet/explode/large_4.wav",
		"hvap/bullet/explode/large_5.wav",
		"hvap/bullet/explode/large_6.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- explode large close
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Explode.Large.Close",
    level = 120,
    sound = 	{
		"hvap/bullet/explode/large_close_1.wav",
		"hvap/bullet/explode/large_close_2.wav",
		"hvap/bullet/explode/large_close_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- explode large far
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Explode.Large.Far",
    level = 140,
    sound = 	{
		"hvap/bullet/explode/large_far_1.wav",
		"hvap/bullet/explode/large_far_2.wav",
		"hvap/bullet/explode/large_far_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- explode flak close
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Explode.Flak.Near",
    level = 100,
    sound = 	{
		"hvap/bullet/explode/flak_1.wav",
		"hvap/bullet/explode/flak_2.wav",
		"hvap/bullet/explode/flak_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- explode flak far
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Explode.Flak.Far",
    level = 135,
    sound = 	{
		"hvap/bullet/explode/flak_far_1.wav",
		"hvap/bullet/explode/flak_far_2.wav",
		"hvap/bullet/explode/flak_far_3.wav",
		"hvap/bullet/explode/flak_far_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Impacts
-------------------------------------------------------

sound.Add( -- impact concrete
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Concrete",
    level = 90,
    sound = 	{
		"hvap/bullet/impact/concrete_1.wav",
		"hvap/bullet/impact/concrete_2.wav",
		"hvap/bullet/impact/concrete_3.wav",
		"hvap/bullet/impact/concrete_4.wav",
		"hvap/bullet/impact/concrete_5.wav",
		"hvap/bullet/impact/concrete_6.wav",
		"hvap/bullet/impact/concrete_7.wav",
		"hvap/bullet/impact/concrete_8.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact dirt
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Dirt",
    level = 80,
    sound = 	{
		"hvap/bullet/impact/dirt_1.wav",
		"hvap/bullet/impact/dirt_2.wav",
		"hvap/bullet/impact/dirt_3.wav",
		"hvap/bullet/impact/dirt_4.wav",
		"hvap/bullet/impact/dirt_5.wav",
		"hvap/bullet/impact/dirt_6.wav",
		"hvap/bullet/impact/dirt_7.wav",
		"hvap/bullet/impact/dirt_8.wav",
		"hvap/bullet/impact/dirt_9.wav",
		"hvap/bullet/impact/dirt_10.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact flesh
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Flesh",
    level = 90,
    sound = 	{
		"hvap/bullet/impact/flesh_1.wav",
		"hvap/bullet/impact/flesh_2.wav",
		"hvap/bullet/impact/flesh_3.wav",
		"hvap/bullet/impact/flesh_4.wav",
		"hvap/bullet/impact/flesh_5.wav",
		"hvap/bullet/impact/flesh_6.wav",
		"hvap/bullet/impact/flesh_7.wav",
		"hvap/bullet/impact/flesh_8.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact glass
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Glass",
    level = 90,
    sound = 	{
		"hvap/bullet/impact/glass_1.wav",
		"hvap/bullet/impact/glass_2.wav",
		"hvap/bullet/impact/glass_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact metal
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Metal",
    level = 90,
    sound = 	{
		"hvap/bullet/impact/metal_1.wav",
		"hvap/bullet/impact/metal_2.wav",
		"hvap/bullet/impact/metal_3.wav",
		"hvap/bullet/impact/metal_4.wav",
		"hvap/bullet/impact/metal_5.wav",
		"hvap/bullet/impact/metal_6.wav",
		"hvap/bullet/impact/metal_7.wav",
		"hvap/bullet/impact/metal_8.wav",
		"hvap/bullet/impact/metal_9.wav",
		"hvap/bullet/impact/metal_10.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact sand
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Sand",
    level = 80,
    sound = 	{
		"hvap/bullet/impact/sand_1.wav",
		"hvap/bullet/impact/sand_2.wav",
		"hvap/bullet/impact/sand_3.wav",
		"hvap/bullet/impact/sand_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact snow
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Snow",
    level = 90,
    sound = 	{
		"hvap/bullet/impact/snow_1.wav",
		"hvap/bullet/impact/snow_2.wav",
		"hvap/bullet/impact/snow_3.wav",
		"hvap/bullet/impact/snow_4.wav",
		"hvap/bullet/impact/snow_5.wav",
		"hvap/bullet/impact/snow_6.wav",
		"hvap/bullet/impact/snow_7.wav",
		"hvap/bullet/impact/snow_8.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact water
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Water",
    level = 85,
    sound = 	{
		"hvap/bullet/impact/water_1.wav",
		"hvap/bullet/impact/water_2.wav",
		"hvap/bullet/impact/water_3.wav",
		"hvap/bullet/impact/water_4.wav",
		"hvap/bullet/impact/water_5.wav",
		"hvap/bullet/impact/water_6.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact wood
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Wood",
    level = 85,
    sound = 	{
		"hvap/bullet/impact/wood_1.wav",
		"hvap/bullet/impact/wood_2.wav",
		"hvap/bullet/impact/wood_3.wav",
		"hvap/bullet/impact/wood_4.wav",
		"hvap/bullet/impact/wood_5.wav",
		"hvap/bullet/impact/wood_6.wav",
		"hvap/bullet/impact/wood_7.wav",
		"hvap/bullet/impact/wood_8.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Impacts Tank Large
-------------------------------------------------------

sound.Add( -- impact large ap
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Large.AP",
    level = 110,
    sound = 	{
		"hvap/bullet/impact/large/ap_1.wav",
		"hvap/bullet/impact/large/ap_2.wav",
		"hvap/bullet/impact/large/ap_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact large aphe
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Large.APHE",
    level = 110,
    sound = 	{
		"hvap/bullet/impact/large/aphe_1.wav",
		"hvap/bullet/impact/large/aphe_2.wav",
		"hvap/bullet/impact/large/aphe_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact large he
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Large.HE",
    level = 110,
    sound = 	{
		"hvap/bullet/impact/large/he_1.wav",
		"hvap/bullet/impact/large/he_2.wav",
		"hvap/bullet/impact/large/he_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact large heat
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Large.HEAT",
    level = 110,
    sound = 	{
		"hvap/bullet/impact/large/heat_1.wav",
		"hvap/bullet/impact/large/heat_2.wav",
		"hvap/bullet/impact/large/heat_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact large water
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Large.Water",
    level = 100,
    sound = 	{
		"hvap/bullet/impact/large/water_1.wav",
		"hvap/bullet/impact/large/water_2.wav",
		"hvap/bullet/impact/large/water_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Impacts Tank Medium
-------------------------------------------------------

sound.Add( -- impact medium ap
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Medium.AP",
    level = 105,
    sound = 	{
		"hvap/bullet/impact/medium/ap_1.wav",
		"hvap/bullet/impact/medium/ap_2.wav",
		"hvap/bullet/impact/medium/ap_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact medium aphe
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Medium.APHE",
    level = 105,
    sound = 	{
		"hvap/bullet/impact/medium/aphe_1.wav",
		"hvap/bullet/impact/medium/aphe_2.wav",
		"hvap/bullet/impact/medium/aphe_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact medium he
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Medium.HE",
    level = 105,
    sound = 	{
		"hvap/bullet/impact/medium/he_1.wav",
		"hvap/bullet/impact/medium/he_2.wav",
		"hvap/bullet/impact/medium/he_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact medium heat
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Medium.HEAT",
    level = 105,
    sound = 	{
		"hvap/bullet/impact/medium/heat_1.wav",
		"hvap/bullet/impact/medium/heat_2.wav",
		"hvap/bullet/impact/medium/heat_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Impacts Tank Small
-------------------------------------------------------

sound.Add( -- impact small ap
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Small.AP",
    level = 105,
    sound = 	{
		"hvap/bullet/impact/small/ap_1.wav",
		"hvap/bullet/impact/small/ap_2.wav",
		"hvap/bullet/impact/small/ap_3.wav",
		"hvap/bullet/impact/small/ap_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact small aphe
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Small.APHE",
    level = 105,
    sound = 	{
		"hvap/bullet/impact/small/aphe_1.wav",
		"hvap/bullet/impact/small/aphe_2.wav",
		"hvap/bullet/impact/small/aphe_3.wav",
		"hvap/bullet/impact/small/aphe_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact small he
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Small.HE",
    level = 105,
    sound = 	{
		"hvap/bullet/impact/small/he_1.wav",
		"hvap/bullet/impact/small/he_2.wav",
		"hvap/bullet/impact/small/he_3.wav",
		"hvap/bullet/impact/small/he_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- impact small heat
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Small.HEAT",
    level = 105,
    sound = 	{
		"hvap/bullet/impact/small/heat_1.wav",
		"hvap/bullet/impact/small/heat_2.wav",
		"hvap/bullet/impact/small/heat_3.wav",
		"hvap/bullet/impact/small/heat_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Impacts Aircraft
-------------------------------------------------------

sound.Add( -- impact aircraft
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Impact.Aircraft",
    level = 90,
    sound = 	{
		"hvap/bullet/impact/aircraft/air_impact_1.wav",
		"hvap/bullet/impact/aircraft/air_impact_2.wav",
		"hvap/bullet/impact/aircraft/air_impact_3.wav",
		"hvap/bullet/impact/aircraft/air_impact_4.wav",
		"hvap/bullet/impact/aircraft/air_impact_5.wav",
		"hvap/bullet/impact/aircraft/air_impact_6.wav",
		"hvap/bullet/impact/aircraft/air_impact_7.wav",
		"hvap/bullet/impact/aircraft/air_impact_8.wav",
		"hvap/bullet/impact/aircraft/air_impact_9.wav",
		"hvap/bullet/impact/aircraft/air_impact_10.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Miss
-------------------------------------------------------

sound.Add( -- miss small
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Miss.Small",
    level = 80,
    sound = 	{
		"hvap/bullet/miss/small_1.wav",
		"hvap/bullet/miss/small_2.wav",
		"hvap/bullet/miss/small_3.wav",
		"hvap/bullet/miss/small_4.wav",
		"hvap/bullet/miss/small_5.wav",
		"hvap/bullet/miss/small_6.wav",
		"hvap/bullet/miss/small_7.wav",
		"hvap/bullet/miss/small_8.wav",
		"hvap/bullet/miss/small_9.wav",
		"hvap/bullet/miss/small_10.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- miss large
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Miss.Large",
    level = 80,
    sound = 	{
		"hvap/bullet/miss/large_1.wav",
		"hvap/bullet/miss/large_2.wav",
		"hvap/bullet/miss/large_3.wav",
		"hvap/bullet/miss/large_4.wav",
		"hvap/bullet/miss/large_5.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Ricochet/Bounce
-------------------------------------------------------

sound.Add( -- large ricochet
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Large.Ricochet",
    level = 110,
    sound = 	{
		"hvap/bullet/ricochet/large/ricochet_1.wav",
		"hvap/bullet/ricochet/large/ricochet_2.wav",
		"hvap/bullet/ricochet/large/ricochet_3.wav",
		"hvap/bullet/ricochet/large/ricochet_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- small ricochet
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Small.Ricochet",
    level = 85,
    sound = 	{
		"hvap/bullet/ricochet/small/ricochet_1.wav",
		"hvap/bullet/ricochet/small/ricochet_2.wav",
		"hvap/bullet/ricochet/small/ricochet_3.wav",
		"hvap/bullet/ricochet/small/ricochet_4.wav",
		"hvap/bullet/ricochet/small/ricochet_5.wav",
		"hvap/bullet/ricochet/small/ricochet_6.wav",
		"hvap/bullet/ricochet/small/ricochet_7.wav",
		"hvap/bullet/ricochet/small/ricochet_8.wav",
		"hvap/bullet/ricochet/small/ricochet_9.wav",
		"hvap/bullet/ricochet/small/ricochet_10.wav",
		"hvap/bullet/ricochet/small/ricochet_11.wav",
		"hvap/bullet/ricochet/small/ricochet_12.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Penetrate
-------------------------------------------------------

sound.Add( -- large penetrate
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Large.Penetrate",
    level = 110,
    sound = 	{
		"hvap/bullet/penetrate/large_1.wav",
		"hvap/bullet/penetrate/large_2.wav",
		"hvap/bullet/penetrate/large_3.wav",
		"hvap/bullet/penetrate/large_4.wav",
		"hvap/bullet/penetrate/large_5.wav",
		"hvap/bullet/penetrate/large_6.wav",
		"hvap/bullet/penetrate/large_7.wav",
		"hvap/bullet/penetrate/large_8.wav",
		"hvap/bullet/penetrate/large_9.wav",
		"hvap/bullet/penetrate/large_10.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- medium penetrate
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Medium.Penetrate",
    level = 105,
    sound = 	{
		"hvap/bullet/penetrate/medium_1.wav",
		"hvap/bullet/penetrate/medium_2.wav",
		"hvap/bullet/penetrate/medium_3.wav",
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- small penetrate
{
    channel = CHAN_STATIC,
    name = "HVAP.Bullet.Small.Penetrate",
    level = 100,
    sound = 	{
		"hvap/bullet/penetrate/small_1.wav",
		"hvap/bullet/penetrate/small_2.wav",
		"hvap/bullet/penetrate/small_3.wav",
		"hvap/bullet/penetrate/small_4.wav",
		"hvap/bullet/penetrate/small_5.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Bombs
-------------------------------------------------------

sound.Add( -- bomb drop
{
    channel = CHAN_STATIC,
    name = "HVAP.Bomb.Drop",
    level = 80,
    sound = "hvap/secondary/bomb/drop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- bomb whistle
{
    channel = CHAN_STATIC,
    name = "HVAP.Bomb.Whistle",
    level = 95,
    sound = "hvap/secondary/bomb/whistle.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Rockets
-------------------------------------------------------

sound.Add( -- rocket atgm
{
    channel = CHAN_STATIC,
    name = "HVAP.Rocket.ATGM",
    level = 120,
    sound = 	{
		"hvap/secondary/rocket/atgm_1.wav",
		"hvap/secondary/rocket/atgm_2.wav",
		"hvap/secondary/rocket/atgm_3.wav",
		"hvap/secondary/rocket/atgm_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- rocket hvar
{
    channel = CHAN_STATIC,
    name = "HVAP.Rocket.HVAR",
    level = 120,
    sound = 	{
		"hvap/secondary/rocket/hvar_1.wav",
		"hvap/secondary/rocket/hvar_2.wav",
		"hvap/secondary/rocket/hvar_3.wav",
		"hvap/secondary/rocket/hvar_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- rocket hydra
{
    channel = CHAN_STATIC,
    name = "HVAP.Rocket.Hydra",
    level = 120,
    sound = 	{
		"hvap/secondary/rocket/hydra_1.wav",
		"hvap/secondary/rocket/hydra_2.wav",
		"hvap/secondary/rocket/hydra_3.wav",
		"hvap/secondary/rocket/hydra_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- rocket missile
{
    channel = CHAN_STATIC,
    name = "HVAP.Rocket.Missile",
    level = 120,
    sound = 	{
		"hvap/secondary/rocket/missile_1.wav",
		"hvap/secondary/rocket/missile_2.wav",
		"hvap/secondary/rocket/missile_3.wav",
		"hvap/secondary/rocket/missile_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- rocket rocket
{
    channel = CHAN_STATIC,
    name = "HVAP.Rocket.Rocket",
    level = 120,
    sound = 	{
		"hvap/secondary/rocket/rocket_1.wav",
		"hvap/secondary/rocket/rocket_2.wav",
		"hvap/secondary/rocket/rocket_3.wav",
		"hvap/secondary/rocket/rocket_4.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- rocket werfer
{
    channel = CHAN_STATIC,
    name = "HVAP.Rocket.Werfer",
    level = 120,
    sound = 	{
		"hvap/secondary/rocket/werfer_1.wav",
		"hvap/secondary/rocket/werfer_2.wav",
		"hvap/secondary/rocket/werfer_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- rocket fly
{
    channel = CHAN_STATIC,
    name = "HVAP.Rocket.Fly",
    level = 95,
    sound = "hvap/secondary/rocket/fly_loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Countermeasure
-------------------------------------------------------

sound.Add( -- cm flares small
{
    channel = CHAN_STATIC,
    name = "HVAP.CM.Flares.Small",
    level = 90,
    sound = "hvap/countermeasure/flares_small.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- cm flares large
{
    channel = CHAN_STATIC,
    name = "HVAP.CM.Flares.Large",
    level = 90,
    sound = "hvap/countermeasure/flares_large.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- cm graphite
{
    channel = CHAN_STATIC,
    name = "HVAP.CM.Graphite",
    level = 90,
    sound = 	{
		"hvap/countermeasure/graphite_1.wav",
		"hvap/countermeasure/graphite_2.wav",
		"hvap/countermeasure/graphite_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- cm smoke
{
    channel = CHAN_STATIC,
    name = "HVAP.CM.Smoke",
    level = 90,
    sound = 	{
		"hvap/countermeasure/smoke_1.wav",
		"hvap/countermeasure/smoke_2.wav",
		"hvap/countermeasure/smoke_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- cm ready
{
    channel = CHAN_STATIC,
    name = "HVAP.CM.Ready",
    level = 80,
    sound = "hvap/countermeasure/ready.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Hatch
-------------------------------------------------------

sound.Add( -- hatch start
{
    channel = CHAN_STATIC,
    name = "HVAP.Hatch.Start",
    level = 80,
    sound = "hvap/secondary/bomb/hatch_start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- hatch loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Hatch.Loop",
    level = 80,
    sound = "hvap/secondary/bomb/hatch_loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- hatch stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Hatch.Stop",
    level = 80,
    sound = "hvap/secondary/bomb/hatch_stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Reloads
-------------------------------------------------------

sound.Add( -- reload small
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.Small",
    level = 80,
    sound = "hvap/gun/reload/gunner_reload_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.Medium",
    level = 80,
    sound = "hvap/gun/reload/gunner_reload_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload large
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.Large",
    level = 80,
    sound = "hvap/gun/reload/gunner_reload_3.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload multi
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.Multi",
    level = 80,
    sound = "hvap/gun/reload/gunner_reload_multi.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload belt
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.Belt",
    level = 80,
    sound = "hvap/gun/reload/modern_gun.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload autocannon
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.AutoCannon",
    level = 80,
    sound = 	{
		"hvap/gun/reload/autoloader_1.wav",
		"hvap/gun/reload/autoloader_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload cannon
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.Cannon",
    level = 80,
    sound = 	{
		"hvap/gun/reload/reload_1.wav",
		"hvap/gun/reload/reload_2.wav",
		"hvap/gun/reload/reload_3.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload shelldrop large
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.ShellDrop.Large",
    level = 80,
    sound = 	{
		"hvap/gun/reload/shell_drop_large_1.wav",
		"hvap/gun/reload/shell_drop_large_2.wav",
		"hvap/gun/reload/shell_drop_large_3.wav",
		"hvap/gun/reload/shell_drop_large_4.wav",
		"hvap/gun/reload/shell_drop_large_5.wav",
		"hvap/gun/reload/shell_drop_large_6.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload shelldrop small
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.ShellDrop.Small",
    level = 80,
    sound = 	{
		"hvap/gun/reload/shell_drop_small_1.wav",
		"hvap/gun/reload/shell_drop_small_2.wav",
		"hvap/gun/reload/shell_drop_small_3.wav",
		"hvap/gun/reload/shell_drop_small_4.wav",
		"hvap/gun/reload/shell_drop_small_5.wav",
		"hvap/gun/reload/shell_drop_small_6.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload secondary
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.Secondary",
    level = 80,
    sound = "hvap/secondary/reload/reload.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload modern
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.Modern",
    level = 80,
    sound = "hvap/secondary/reload/modern.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload cm
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.CM",
    level = 80,
    sound = "hvap/secondary/countermeasure/reload.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- reload cm
{
    channel = CHAN_STATIC,
    name = "HVAP.Reload.CM",
    level = 80,
    sound = "hvap/secondary/countermeasure/reload.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Alarms
-------------------------------------------------------

sound.Add( -- alarm 25
{
    channel = CHAN_STATIC,
    name = "HVAP.Alarm.25",
    level = 80,
    sound = "hvap/alarm/25.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- alarm 50
{
    channel = CHAN_STATIC,
    name = "HVAP.Alarm.50",
    level = 80,
    sound = "hvap/alarm/50.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- alarm 75
{
    channel = CHAN_STATIC,
    name = "HVAP.Alarm.75",
    level = 80,
    sound = "hvap/alarm/75.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- alarm damaged
{
    channel = CHAN_STATIC,
    name = "HVAP.Alarm.Damaged",
    level = 80,
    sound = "hvap/alarm/damaged.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- alarm missile
{
    channel = CHAN_STATIC,
    name = "HVAP.Alarm.Missile",
    level = 80,
    sound = "hvap/alarm/rocket_warning.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Misc Cockpit
-------------------------------------------------------

sound.Add( -- switch clang
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.Clang",
    level = 80,
    sound = "hvap/misc/switch_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch click
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.Click",
    level = 80,
    sound = "hvap/misc/switch_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch beepclick
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.BeepClick",
    level = 80,
    sound = "hvap/misc/switch_3.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch boopclick
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.BoopClick",
    level = 80,
    sound = "hvap/misc/switch_4.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch beepflick
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.BeepFlick",
    level = 80,
    sound = "hvap/misc/switch_5.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch zoom
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.Zoom",
    level = 80,
    sound = "hvap/misc/zoom.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch select_1
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.Select_1",
    level = 80,
    sound = "hvap/misc/select_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch select_2
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.Select_2",
    level = 80,
    sound = "hvap/misc/select_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch select_3
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.Select_3",
    level = 80,
    sound = "hvap/misc/select_3.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch flir in_1
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.FLIR.In_1",
    level = 80,
    sound = "hvap/misc/flir_in_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch flir in_2
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.FLIR.In_2",
    level = 80,
    sound = "hvap/misc/flir_in_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch flir out_1
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.FLIR.Out_1",
    level = 80,
    sound = "hvap/misc/flir_out_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- switch flir out_2
{
    channel = CHAN_STATIC,
    name = "HVAP.Switch.FLIR.Out_2",
    level = 80,
    sound = "hvap/misc/flir_out_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Misc
-------------------------------------------------------

sound.Add( -- misc fpe
{
    channel = CHAN_STATIC,
    name = "HVAP.Misc.FPE",
    level = 80,
    sound = "hvap/misc/fireextinguisher.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- misc cable on
{
    channel = CHAN_STATIC,
    name = "HVAP.Misc.Cable.On",
    level = 80,
    sound = "hvap/misc/cable_on.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- misc cable off
{
    channel = CHAN_STATIC,
    name = "HVAP.Misc.Cable.Off",
    level = 80,
    sound = "hvap/misc/cable_off.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- misc jammer start
{
    channel = CHAN_STATIC,
    name = "HVAP.Misc.Jammer.Start",
    level = 80,
    sound = "hvap/misc/jammer_start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- misc jammer loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Misc.Jammer.Loop",
    level = 80,
    sound = "hvap/misc/jammer_loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- misc jammer stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Misc.Jammer.Stop",
    level = 80,
    sound = "hvap/misc/jammer_stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- misc repair large
{
    channel = CHAN_STATIC,
    name = "HVAP.Misc.Repair.Large",
    level = 80,
    sound = "hvap/misc/repair_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- misc repair small
{
    channel = CHAN_STATIC,
    name = "HVAP.Misc.Repair.Small",
    level = 80,
    sound = "hvap/misc/repair_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- Vehicle
-------------------------------------------------------

sound.Add( -- vehicle collide
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Collide",
    level = 100,
    sound = 	{
		"hvap/impact/impact_1.wav",
		"hvap/impact/impact_2.wav",
		"hvap/impact/impact_3.wav",
		"hvap/impact/impact_4.wav",
		"hvap/impact/impact_5.wav",
		"hvap/impact/impact_6.wav",
		"hvap/impact/impact_7.wav",
		"hvap/impact/impact_8.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- vehicle burn
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Burn",
    level = 85,
    sound = 	{
		"hvap/tank/burn_1.wav",
		"hvap/tank/burn_2.wav",
		"hvap/tank/burn_3.wav"		
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- vehicle lever
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Lever",
    level = 80,
    sound = 	{
		"hvap/tank/fx/lever_1.wav",
		"hvap/tank/fx/lever_2.wav",
		"hvap/tank/fx/lever_3.wav",
		"hvap/tank/fx/lever_4.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- vehicle rattle
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Rattle",
    level = 80,
    sound = 	{
		"hvap/tank/fx/rattle_1.wav",
		"hvap/tank/fx/rattle_2.wav",
		"hvap/tank/fx/rattle_3.wav",
		"hvap/tank/fx/rattle_4.wav",
		"hvap/tank/fx/rattle_5.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- vehicle turret clank
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Clank",
    level = 80,
    sound = 	{
		"hvap/tank/fx/turret_klank_01.wav",
		"hvap/tank/fx/turret_klank_02.wav",
		"hvap/tank/fx/turret_klank_03.wav",
		"hvap/tank/fx/turret_klank_04.wav",
		"hvap/tank/fx/turret_klank_05.wav",
		"hvap/tank/fx/turret_klank_06.wav",
		"hvap/tank/fx/turret_klank_07.wav",
		"hvap/tank/fx/turret_klank_08.wav",
		"hvap/tank/fx/turret_klank_09.wav",
		"hvap/tank/fx/turret_klank_10.wav",
		"hvap/tank/fx/turret_klank_11.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- vehicle interior idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Interior.Idle",
    level = 80,
    sound = "hvap/engine/shared/tank_interior.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Turrets
-------------------------------------------------------

sound.Add( -- vehicle turret traverse hydraulic
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Traverse.Hydraulic",
    level = 80,
    sound = "hvap/tank/turret/turn_1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle turret traverse crank
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Traverse.Crank",
    level = 80,
    sound = "hvap/tank/turret/turn_2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle turret traverse electric
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Traverse.Electric",
    level = 80,
    sound = "hvap/tank/turret/turn_3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle turret elevate hydraulic
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Elevate.Hydraulic",
    level = 80,
    sound = "hvap/tank/turret/elevate_1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle turret elevate crank
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Elevate.Crank",
    level = 80,
    sound = "hvap/tank/turret/elevate_2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle turret elevate electric
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Elevate.Electric",
    level = 80,
    sound = "hvap/tank/turret/elevate_3.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- vehicle turret traverse ship
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Traverse.Ship",
    level = 80,
    sound = "hvap/ship/turret/turn.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle turret elevate ship
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Turret.Elevate.Ship",
    level = 80,
    sound = "hvap/ship/turret/elevate.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Weapon Jam/Overheat
-------------------------------------------------------

sound.Add( -- gun jam belt
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Jam.Belt",
    level = 80,
    sound = "hvap/gun/jam/belt_jam.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- gun jam click end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Jam.Click.End",
    level = 80,
    sound = "hvap/gun/jam/overheat_click_end.wav",
    volume = 1.0,
	pitch = 1--
})

sound.Add( -- gun jam click loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Jam.Click.Loop",
    level = 80,
    sound = "hvap/gun/jam/overheat_click_loop.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- gun jam start
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Jam.Start",
    level = 80,
    sound = "hvap/gun/jam/overheated.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- gun jam finish
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Jam.Finish",
    level = 80,
    sound = "hvap/gun/jam/overheat_finish.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- gun jam ready
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Jam.Ready",
    level = 80,
    sound = "hvap/misc/gun_ready.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Explosions
-------------------------------------------------------

sound.Add( -- explode ammo close
{
    channel = CHAN_STATIC,
    name = "HVAP.Explode.Ammo.Close",
    level = 90,
    sound = 	{
		"hvap/explode/ammo_close_1.wav",
		"hvap/explode/ammo_close_2.wav",
		"hvap/explode/ammo_close_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- explode ammo near
{
    channel = CHAN_STATIC,
    name = "HVAP.Explode.Ammo.Near",
    level = 110,
    sound = 	{
		"hvap/explode/ammo_near_1.wav",
		"hvap/explode/ammo_near_2.wav",
		"hvap/explode/ammo_near_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- explode ammo far
{
    channel = CHAN_STATIC,
    name = "HVAP.Explode.Ammo.Far",
    level = 130,
    sound = 	{
		"hvap/explode/ammo_far_1.wav",
		"hvap/explode/ammo_far_2.wav",
		"hvap/explode/ammo_far_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- explode ammo distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Explode.Ammo.Distant",
    level = 150,
    sound = 	{
		"hvap/explode/ammo_distant_1.wav",
		"hvap/explode/ammo_distant_2.wav",
		"hvap/explode/ammo_distant_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- explode explosion close
{
    channel = CHAN_STATIC,
    name = "HVAP.Explode.Explosion.Close",
    level = 90,
    sound = 	{
		"hvap/explode/explosion_close_1.wav",
		"hvap/explode/explosion_close_2.wav",
		"hvap/explode/explosion_close_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- explode explosion near
{
    channel = CHAN_STATIC,
    name = "HVAP.Explode.Explosion.Near",
    level = 120,
    sound = 	{
		"hvap/explode/explosion_near_1.wav",
		"hvap/explode/explosion_near_2.wav",
		"hvap/explode/explosion_near_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- explode explosion far
{
    channel = CHAN_STATIC,
    name = "HVAP.Explode.Explosion.Far",
    level = 140,
    sound = 	{
		"hvap/explode/explosion_far_1.wav",
		"hvap/explode/explosion_far_2.wav",
		"hvap/explode/explosion_far_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- explode water
{
    channel = CHAN_STATIC,
    name = "HVAP.Explode.Water",
    level = 125,
    sound = 	{
		"hvap/explode/water_1.wav",
		"hvap/explode/water_2.wav",
		"hvap/explode/water_3.wav",
		"hvap/explode/water_4.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--###################################################----###################################################----###################################################-- Weapon Audio
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--###################################################-- Gun Misc
-------------------------------------------------------

sound.Add( -- gun misc blankfire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Misc.BlankFire",
    level = 80,
    sound = "hvap/gun/misc/blank.wav",
    volume = 1.0,
	pitch = { 95, 105 },
})

sound.Add( -- gun misc nosecondary
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Misc.NoSecondary",
    level = 80,
    sound = "hvap/gun/misc/no_secondary.wav",
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------
--###################################################-- 20flak38
-------------------------------------------------------

sound.Add( -- gun 20flak38 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.20flak38.Far",
    level = 125,
    sound = 	{
		"hvap/gun/cnn/20flak38/1.wav",
		"hvap/gun/cnn/20flak38/2.wav",
		"hvap/gun/cnn/20flak38/3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 20flak38 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.20flak38.Fire",
    level = 125,
    sound = 	{
		"hvap/gun/cnn/20flak38/fire_1.wav",
		"hvap/gun/cnn/20flak38/fire_2.wav",
		"hvap/gun/cnn/20flak38/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 37flak36
-------------------------------------------------------

sound.Add( -- gun 36flak36 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.37flak36.Far",
    level = 125,
    sound = 	{
		"hvap/gun/cnn/37flak36/1.wav",
		"hvap/gun/cnn/37flak36/2.wav",
		"hvap/gun/cnn/37flak36/3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 36flak36 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.37flak36.Fire",
    level = 125,
    sound = 	{
		"hvap/gun/cnn/37flak36/fire_1.wav",
		"hvap/gun/cnn/37flak36/fire_2.wav",
		"hvap/gun/cnn/37flak36/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 40m2
-------------------------------------------------------

sound.Add( -- gun 40m2 distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.40m2.Distant",
    level = 160,
    sound = "hvap/gun/cnn/40m2/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 40m2 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.40m2.Far",
    level = 145,
    sound = "hvap/gun/cnn/40m2/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 40m2 close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.40m2.Close",
    level = 130,
    sound = "hvap/gun/cnn/40m2/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 40m2 near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.40m2.Near",
    level = 115,
    sound = "hvap/gun/cnn/40m2/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 40m2 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.40m2.Fire",
    level = 100,
    sound = "hvap/gun/cnn/40m2/fire_1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 50kwk
-------------------------------------------------------

sound.Add( -- gun 50kwk distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.50kwk.Distant",
    level = 160,
    sound = "hvap/gun/cnn/50kwk/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 50kwk far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.50kwk.Far",
    level = 145,
    sound = "hvap/gun/cnn/50kwk/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 50kwk close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.50kwk.Close",
    level = 130,
    sound = "hvap/gun/cnn/50kwk/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 50kwk near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.50kwk.Near",
    level = 115,
    sound = "hvap/gun/cnn/50kwk/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 50kwk fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.50kwk.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/50kwk/fire_1.wav",
		"hvap/gun/cnn/50kwk/fire_2.wav",
		"hvap/gun/cnn/50kwk/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 75kwk
-------------------------------------------------------

sound.Add( -- gun 75kwk distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75kwk.Distant",
    level = 160,
    sound = "hvap/gun/cnn/75kwk/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 75kwk far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75kwk.Far",
    level = 145,
    sound = "hvap/gun/cnn/75kwk/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 75kwk close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75kwk.Close",
    level = 130,
    sound = "hvap/gun/cnn/75kwk/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 75kwk near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75kwk.Near",
    level = 115,
    sound = "hvap/gun/cnn/75kwk/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 75kwk fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75kwk.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/75kwk/fire_1.wav",
		"hvap/gun/cnn/75kwk/fire_2.wav",
		"hvap/gun/cnn/75kwk/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 75m3
-------------------------------------------------------

sound.Add( -- gun 75m3 distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75m3.Distant",
    level = 160,
    sound = "hvap/gun/cnn/75m3/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 75m3 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75m3.Far",
    level = 145,
    sound = "hvap/gun/cnn/75m3/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 75m3 close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75m3.Close",
    level = 130,
    sound = "hvap/gun/cnn/75m3/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 75m3 near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75m3.Near",
    level = 115,
    sound = "hvap/gun/cnn/75m3/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 75m3 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.75m3.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/75m3/fire_1.wav",
		"hvap/gun/cnn/75m3/fire_2.wav",
		"hvap/gun/cnn/75m3/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 76m1
-------------------------------------------------------

sound.Add( -- gun 76m1 distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76m1.Distant",
    level = 160,
    sound = "hvap/gun/cnn/76m1/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 76m1 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76m1.Far",
    level = 145,
    sound = "hvap/gun/cnn/76m1/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 76m1 close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76m1.Close",
    level = 130,
    sound = "hvap/gun/cnn/76m1/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 76m1 near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76m1.Near",
    level = 115,
    sound = "hvap/gun/cnn/76m1/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 76m1 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76m1.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/76m1/fire_1.wav",
		"hvap/gun/cnn/76m1/fire_2.wav",
		"hvap/gun/cnn/76m1/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 76zis5
-------------------------------------------------------

sound.Add( -- gun 76zis5 distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76zis5.Distant",
    level = 160,
    sound = "hvap/gun/cnn/76zis5/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 76zis5 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76zis5.Far",
    level = 145,
    sound = "hvap/gun/cnn/76zis5/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 76zis5 close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76zis5.Close",
    level = 130,
    sound = "hvap/gun/cnn/76zis5/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 76zis5 near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76zis5.Near",
    level = 115,
    sound = "hvap/gun/cnn/76zis5/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 76zis5 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.76zis5.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/76zis5/fire_1.wav",
		"hvap/gun/cnn/76zis5/fire_2.wav",
		"hvap/gun/cnn/76zis5/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 85d5t
-------------------------------------------------------

sound.Add( -- gun 85d5t distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.85d5t.Distant",
    level = 160,
    sound = "hvap/gun/cnn/85d5t/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 85d5t far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.85d5t.Far",
    level = 145,
    sound = "hvap/gun/cnn/85d5t/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 85d5t close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.85d5t.Close",
    level = 130,
    sound = "hvap/gun/cnn/85d5t/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 85d5t near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.85d5t.Near",
    level = 115,
    sound = "hvap/gun/cnn/85d5t/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 85d5t fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.85d5t.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/85d5t/fire_1.wav",
		"hvap/gun/cnn/85d5t/fire_2.wav",
		"hvap/gun/cnn/85d5t/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 88flak
-------------------------------------------------------

sound.Add( -- gun 88flak close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.88flak.Close",
    level = 130,
    sound = 	{
		"hvap/gun/cnn/88flak/2_1.wav",
		"hvap/gun/cnn/88flak/2_2.wav",
		"hvap/gun/cnn/88flak/2_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 88flak near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.88flak.Near",
    level = 115,
    sound = 	{
		"hvap/gun/cnn/88flak/1_1.wav",
		"hvap/gun/cnn/88flak/1_2.wav",
		"hvap/gun/cnn/88flak/1_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 88flak fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.88flak.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/88flak/fire_1.wav",
		"hvap/gun/cnn/88flak/fire_2.wav",
		"hvap/gun/cnn/88flak/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 88pak
-------------------------------------------------------

sound.Add( -- gun 88pak distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.88pak.Distant",
    level = 160,
    sound = "hvap/gun/cnn/88pak/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 88pak far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.88pak.Far",
    level = 145,
    sound = "hvap/gun/cnn/88pak/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 88pak close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.88pak.Close",
    level = 130,
    sound = "hvap/gun/cnn/88pak/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 88pak near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.88pak.Near",
    level = 115,
    sound = "hvap/gun/cnn/88pak/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 88pak fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.88pak.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/88pak/fire_1.wav",
		"hvap/gun/cnn/88pak/fire_2.wav",
		"hvap/gun/cnn/88pak/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 90m3
-------------------------------------------------------

sound.Add( -- gun 90m3 distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.90m3.Distant",
    level = 160,
    sound = "hvap/gun/cnn/90m3/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 90m3 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.90m3.Far",
    level = 145,
    sound = "hvap/gun/cnn/90m3/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 90m3 close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.90m3.Close",
    level = 130,
    sound = "hvap/gun/cnn/90m3/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 90m3 near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.90m3.Near",
    level = 115,
    sound = "hvap/gun/cnn/90m3/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 90m3 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.90m3.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/90m3/fire_1.wav",
		"hvap/gun/cnn/90m3/fire_2.wav",
		"hvap/gun/cnn/90m3/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 100d10t
-------------------------------------------------------

sound.Add( -- gun 100d10t distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.100d10t.Distant",
    level = 160,
    sound = "hvap/gun/cnn/100d10t/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 100d10t far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.100d10t.Far",
    level = 145,
    sound = "hvap/gun/cnn/100d10t/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 100d10t close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.100d10t.Close",
    level = 130,
    sound = "hvap/gun/cnn/100d10t/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 100d10t near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.100d10t.Near",
    level = 115,
    sound = "hvap/gun/cnn/100d10t/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 100d10t fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.100d10t.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/100d10t/fire_1.wav",
		"hvap/gun/cnn/100d10t/fire_2.wav",
		"hvap/gun/cnn/100d10t/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 105kwk36
-------------------------------------------------------

sound.Add( -- gun 105kwk36 distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.105kwk36.Distant",
    level = 160,
    sound = "hvap/gun/cnn/105kwk36/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 105kwk36 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.105kwk36.Far",
    level = 145,
    sound = "hvap/gun/cnn/105kwk36/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 105kwk36 close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.105kwk36.Close",
    level = 130,
    sound = "hvap/gun/cnn/105kwk36/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 105kwk36 near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.105kwk36.Near",
    level = 115,
    sound = "hvap/gun/cnn/105kwk36/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 105kwk36 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.105kwk36.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/105kwk36/fire_1.wav",
		"hvap/gun/cnn/105kwk36/fire_2.wav",
		"hvap/gun/cnn/105kwk36/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 122d25t
-------------------------------------------------------

sound.Add( -- gun 122d25t distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.122D25T.Distant",
    level = 160,
    sound = "hvap/gun/cnn/122d25t/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 122d25t far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.122D25T.Far",
    level = 145,
    sound = "hvap/gun/cnn/122d25t/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 122d25t close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.122D25T.Close",
    level = 130,
    sound = "hvap/gun/cnn/122d25t/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 122d25t near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.122D25T.Near",
    level = 115,
    sound = "hvap/gun/cnn/122d25t/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 122d25t fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.122D25T.Fire",
    level = 100,
    sound = "hvap/gun/cnn/122d25t/fire_1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 128pak44
-------------------------------------------------------

sound.Add( -- gun 128pak44 distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.128pak44.Distant",
    level = 160,
    sound = "hvap/gun/cnn/128pak44/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 128pak44 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.128pak44.Far",
    level = 145,
    sound = "hvap/gun/cnn/128pak44/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 128pak44 close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.128pak44.Close",
    level = 130,
    sound = "hvap/gun/cnn/128pak44/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 128pak44 near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.128pak44.Near",
    level = 115,
    sound = "hvap/gun/cnn/128pak44/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 128pak44 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.128pak44.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/128pak44/fire_1.wav",
		"hvap/gun/cnn/128pak44/fire_2.wav",
		"hvap/gun/cnn/128pak44/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- 152m10
-------------------------------------------------------

sound.Add( -- gun 152m10 distant
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.152m10.Distant",
    level = 160,
    sound = "hvap/gun/cnn/152m10/4.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 152m10 far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.152m10.Far",
    level = 145,
    sound = "hvap/gun/cnn/152m10/3.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 152m10 close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.152m10.Close",
    level = 130,
    sound = "hvap/gun/cnn/152m10/2.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 152m10 near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.152m10.Near",
    level = 115,
    sound = "hvap/gun/cnn/152m10/1.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun 152m10 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.152m10.Fire",
    level = 100,
    sound = 	{
		"hvap/gun/cnn/152m10/fire_1.wav",
		"hvap/gun/cnn/152m10/fire_2.wav",
		"hvap/gun/cnn/152m10/fire_3.wav",
		},
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- besa
-------------------------------------------------------

sound.Add( -- gun besa fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BESA.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/besa/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun besa fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BESA.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/besa/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun besa close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BESA.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/besa/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun besa close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BESA.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/besa/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun besa near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BESA.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/besa/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun besa near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BESA.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/besa/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun besa far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BESA.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/besa/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun besa far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BESA.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/besa/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- dp28
-------------------------------------------------------

sound.Add( -- gun dp28 fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DP28.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/dp28/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dp28 fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DP28.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/dp28/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dp28 close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DP28.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/dp28/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dp28 close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DP28.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/dp28/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dp28 near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DP28.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/dp28/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dp28 near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DP28.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/dp28/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dp28 far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DP28.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/dp28/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dp28 far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DP28.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/dp28/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- dshk
-------------------------------------------------------

sound.Add( -- gun dshk fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DShK.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/dshk/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dshk fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DShK.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/dshk/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dshk close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DShK.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/dshk/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dshk close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DShK.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/dshk/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dshk near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DShK.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/dshk/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dshk near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DShK.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/dshk/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dshk far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DShK.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/dshk/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun dshk far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.DShK.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/dshk/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- kpv
-------------------------------------------------------

sound.Add( -- gun kpv fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.KPV.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/kpv/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun kpv fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.KPV.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/kpv/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun kpv close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.KPV.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/kpv/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun kpv close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.KPV.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/kpv/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun kpv near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.KPV.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/kpv/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun kpv near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.KPV.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/kpv/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun kpv far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.KPV.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/kpv/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun kpv far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.KPV.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/kpv/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- mg34
-------------------------------------------------------

sound.Add( -- gun mg34 fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG34.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/mg34/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg34 fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG34.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/mg34/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg34 close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG34.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/mg34/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg34 close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG34.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/mg34/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg34 near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG34.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/mg34/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg34 near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG34.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/mg34/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg34 far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG34.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/mg34/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg34 far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG34.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/mg34/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- mg42
-------------------------------------------------------

sound.Add( -- gun mg42 fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG42.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/mg42/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg42 fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG42.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/mg42/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg42 close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG42.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/mg42/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg42 close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG42.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/mg42/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg42 near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG42.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/mg42/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg42 near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG42.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/mg42/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg42 far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG42.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/mg42/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mg42 far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG42.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/mg42/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- mk103
-------------------------------------------------------

sound.Add( -- gun mk103 fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/mk103/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mk103 fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/mk103/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mk103 close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/mk103/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mk103 close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/mk103/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mk103 near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/mk103/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mk103 near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/mk103/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mk103 far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/mk103/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun mk103 far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/mk103/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- oerlicon
-------------------------------------------------------

sound.Add( -- gun oerlicon fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Oerlicon.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/oerlicon/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun oerlicon fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Oerlicon.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/oerlicon/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun oerlicon close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Oerlicon.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/oerlicon/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun oerlicon close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Oerlicon.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/oerlicon/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun oerlicon near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Oerlicon.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/oerlicon/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun oerlicon near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Oerlicon.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/oerlicon/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun oerlicon far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Oerlicon.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/oerlicon/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun oerlicon far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Oerlicon.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/oerlicon/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- sg43
-------------------------------------------------------

sound.Add( -- gun sg43 fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.SG43.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/sg43/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun sg43 fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.SG43.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/sg43/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun sg43 close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.SG43.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/sg43/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun sg43 close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.SG43.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/sg43/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun sg43 near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.SG43.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/sg43/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun sg43 near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.SG43.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/sg43/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun sg43 far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.SG43.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/sg43/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun sg43 far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.SG43.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/sg43/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- tnsh
-------------------------------------------------------

sound.Add( -- gun tnsh fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.TNSh.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/tnsh/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun tnsh fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.TNSh.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/tnsh/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun tnsh close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.TNSh.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/tnsh/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun tnsh close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.TNSh.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/tnsh/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun tnsh near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.TNSh.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/tnsh/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun tnsh near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.TNSh.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/tnsh/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun tnsh far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.TNSh.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/tnsh/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun tnsh far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.TNSh.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/tnsh/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

-------------------------------------------------------
--###################################################-- vickers
-------------------------------------------------------

sound.Add( -- gun vickers fire loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Vickers.Fire.Loop",
    level = 100,
    sound = "hvap/gun/tank_mg/vickers/1_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun vickers fire end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Vickers.Fire.End",
    level = 100,
    sound = "hvap/gun/tank_mg/vickers/1_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun vickers close loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Vickers.Close.Loop",
    level = 115,
    sound = "hvap/gun/tank_mg/vickers/2_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun vickers close end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Vickers.Close.End",
    level = 115,
    sound = "hvap/gun/tank_mg/vickers/2_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun vickers near loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Vickers.Near.Loop",
    level = 130,
    sound = "hvap/gun/tank_mg/vickers/3_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun vickers near end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Vickers.Near.End",
    level = 130,
    sound = "hvap/gun/tank_mg/vickers/3_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun vickers far loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Vickers.Far.Loop",
    level = 145,
    sound = "hvap/gun/tank_mg/vickers/4_loop.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

sound.Add( -- gun vickers far end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Vickers.Far.End",
    level = 145,
    sound = "hvap/gun/tank_mg/vickers/4_end.wav",
    volume = 1.0,
	pitch = { 90, 110 },
})

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--###################################################----###################################################----###################################################-- Aircraft Gun Audio
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--###################################################-- Aircraft Guns
-------------------------------------------------------

sound.Add( -- gun 77breda end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.77Breda.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/77breda/end_1.wav",
		"hvap/gun/mg/77breda/end_2.wav",
		"hvap/gun/mg/77breda/end_3.wav",
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun 77breda loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.77Breda.Loop",
    level = 120,
    sound = "hvap/gun/mg/77breda/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun 127breda end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.127Breda.End",
    level = 120,
    sound = "hvap/gun/mg/127breda/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun 127breda loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.127Breda.Loop",
    level = 120,
    sound = "hvap/gun/mg/127breda/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun bk37 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BK37.Fire",
    level = 120,
    sound = "hvap/gun/mg/bk37/fire.wav",
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- gun bk75 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BK75.Fire",
    level = 120,
    sound = "hvap/gun/mg/bk75/fire.wav",
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- gun brezenub end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BrezenUB.End",
    level = 120,
    sound = "hvap/gun/mg/brezenub/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun brezenub loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.BrezenUB.Loop",
    level = 120,
    sound = "hvap/gun/mg/brezenub/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun ho103 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Ho103.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/ho103/end_1.wav",
		"hvap/gun/mg/ho103/end_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})


sound.Add( -- gun ho103 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Ho103.Loop",
    level = 120,
    sound = 	{
		"hvap/gun/mg/ho103/loop_1.wav",
		"hvap/gun/mg/ho103/loop_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun ho301 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Ho301.End",
    level = 120,
    sound = "hvap/gun/mg/ho301/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun ho301 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Ho301.Loop",
    level = 120,
    sound = "hvap/gun/mg/ho301/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun hs404 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Hs404.End",
    level = 120,
    sound = "hvap/gun/mg/hs404/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun hs404 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Hs404.Loop",
    level = 120,
    sound = "hvap/gun/mg/hs404/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun hsmk2 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.HsMk2.End",
    level = 120,
    sound = "hvap/gun/mg/hsmk2/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun hsmk2 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.HsMk2.Loop",
    level = 120,
    sound = "hvap/gun/mg/hsmk2/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun hsmk5 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.HsMk5.End",
    level = 120,
    sound = "hvap/gun/mg/hsmk5/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun hsmk5 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.HsMk5.Loop",
    level = 120,
    sound = "hvap/gun/mg/hsmk5/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun m2 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M2.End",
    level = 120,
    sound = "hvap/gun/mg/m2/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun m2 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M2.Loop",
    level = 120,
    sound = "hvap/gun/mg/m2/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun m2hb end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M2HB.End",
    level = 120,
    sound = "hvap/gun/mg/m2hb/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun m2hb loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M2HB.Loop",
    level = 120,
    sound = "hvap/gun/mg/m2hb/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun m3 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M3.End",
    level = 120,
    sound = "hvap/gun/mg/m3/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun m3 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M3.Loop",
    level = 120,
    sound = "hvap/gun/mg/m3/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun m4 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M4.Fire",
    level = 120,
    sound = "hvap/gun/mg/m4/fire.wav",
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- gun m57 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M57.Fire",
    level = 120,
    sound = 	{
		"hvap/gun/mg/m57/fire_1.wav",
		"hvap/gun/mg/m57/fire_2.wav",
		"hvap/gun/mg/m57/fire_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- gun m230 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M230.End",
    level = 120,
    sound = "hvap/gun/mg/m230/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun m230 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M230.Loop",
    level = 120,
    sound = "hvap/gun/mg/m230/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun m1918 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M1918.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/m1918/1_end.wav",
		"hvap/gun/mg/m1918/2_end.wav",
		"hvap/gun/mg/m1918/3_end.wav",
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun m1918 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M1918.Loop",
    level = 120,
    sound = "hvap/gun/mg/m1918/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun m1919 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M1919.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/m1919/end_1.wav",
		"hvap/gun/mg/m1919/end_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})


sound.Add( -- gun m1919 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M1919.Loop",
    level = 120,
    sound = 	{
		"hvap/gun/mg/m1919/loop_1.wav",
		"hvap/gun/mg/m1919/loop_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun maxim end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Maxim.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/maxim/end_1.wav",
		"hvap/gun/mg/maxim/end_2.wav",
		"hvap/gun/mg/maxim/end_3.wav",
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun maxim loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Maxim.Loop",
    level = 120,
    sound = "hvap/gun/mg/maxim/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun mg15 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG15.End",
    level = 120,
    sound = "hvap/gun/mg/mg15/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun mg15 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG15.Loop",
    level = 120,
    sound = "hvap/gun/mg/mg15/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun mg17 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG17.End",
    level = 120,
    sound = "hvap/gun/mg/mg17/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun mg17 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG17.Loop",
    level = 120,
    sound = "hvap/gun/mg/mg17/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun mg81 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG81.End",
    level = 120,
    sound = "hvap/gun/mg/mg81/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun mg81 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG81.Loop",
    level = 120,
    sound = "hvap/gun/mg/mg81/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun mg131 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG131.End",
    level = 120,
    sound = "hvap/gun/mg/mg131/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun mg131 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG131.Loop",
    level = 120,
    sound = "hvap/gun/mg/mg131/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun mg151 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG151.End",
    level = 120,
    sound = "hvap/gun/mg/mg151/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun mg151 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MG151.Loop",
    level = 120,
    sound = "hvap/gun/mg/mg151/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun mgff end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MGFF.End",
    level = 120,
    sound = "hvap/gun/mg/mgff/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun mgff loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MGFF.Loop",
    level = 120,
    sound = "hvap/gun/mg/mgff/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun mk103 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/mk103/end_1.wav",
		"hvap/gun/mg/mk103/end_2.wav",
		"hvap/gun/mg/mk103/end_3.wav",
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun mk103 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK103.Loop",
    level = 120,
    sound = "hvap/gun/mg/mk103/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun mk108 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK108.End",
    level = 120,
    sound = "hvap/gun/mg/m108/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun mk108 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.MK108.Loop",
    level = 120,
    sound = "hvap/gun/mg/mk108/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun ns37 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.NS37.Fire",
    level = 120,
    sound = "hvap/gun/mg/ns37/fire.wav",
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- gun ns45 fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.NS45.Fire",
    level = 120,
    sound = 	{
		"hvap/gun/mg/ns45/fire_1.wav",
		"hvap/gun/mg/ns45/fire_2.wav",
		"hvap/gun/mg/ns45/fire_3.wav"
		},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- gun shkas end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.ShKAS.End",
    level = 120,
    sound = "hvap/gun/mg/shkas/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun shkas loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.ShKAS.Loop",
    level = 120,
    sound = "hvap/gun/mg/shkas/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun shvak end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.ShVAK.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/shvak/end_1.wav",
		"hvap/gun/mg/shvak/end_2.wav",
		"hvap/gun/mg/shvak/end_3.wav",
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun shvak loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.ShVAK.Loop",
    level = 120,
    sound = "hvap/gun/mg/shvak/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun t160 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.T160.End",
    level = 120,
    sound = "hvap/gun/mg/t160/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun t160 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.T160.Loop",
    level = 120,
    sound = "hvap/gun/mg/t160/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun type97 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Type97.End",
    level = 120,
    sound = "hvap/gun/mg/type97/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun type97 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Type97.Loop",
    level = 120,
    sound = "hvap/gun/mg/type97/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun type99 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Type99.End",
    level = 120,
    sound = "hvap/gun/mg/type99/end.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun type99 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.Type99.Loop",
    level = 120,
    sound = "hvap/gun/mg/type99/loop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun vickersk end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.VickersK.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/vickersk/end_1.wav",
		"hvap/gun/mg/vickersk/end_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})


sound.Add( -- gun vickersk loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.VickersK.Loop",
    level = 120,
    sound = 	{
		"hvap/gun/mg/vickersk/loop_1.wav",
		"hvap/gun/mg/vickersk/loop_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun vickerss fire
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.VickersS.Fire",
    level = 120,
    sound = "hvap/gun/mg/vickerss/fire_1.wav",
    volume = 1.0,
	pitch = { 95, 105 }
})

-------------------------------------------------------

sound.Add( -- gun vya23 end
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.VYa23.End",
    level = 120,
    sound = 	{
		"hvap/gun/mg/vya23/end_1.wav",
		"hvap/gun/mg/vya23/end_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})


sound.Add( -- gun vya23 loop
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.VYa23.Loop",
    level = 120,
    sound = 	{
		"hvap/gun/mg/vya23/loop_1.wav",
		"hvap/gun/mg/vya23/loop_2.wav"
		},
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- GAU-8
-------------------------------------------------------

sound.Add( -- gun gau8 end close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.End.Close",
    level = 140,
    sound = "hvap/gun/gat/gau8/end_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun gau8 end near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.End.Near",
    level = 120,
    sound = "hvap/gun/gat/gau8/end_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun gau8 end far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.End.Far",
    level = 100,
    sound = "hvap/gun/gat/gau8/end_3.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun gau8 loop close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.Loop.Close",
    level = 140,
    sound = "hvap/gun/gat/gau8/loop_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun gau8 loop near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.Loop.Near",
    level = 120,
    sound = "hvap/gun/gat/gau8/loop_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun gau8 loop far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.Loop.Far",
    level = 100,
    sound = "hvap/gun/gat/gau8/loop_3.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------

sound.Add( -- gun gau8 start close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.Start.Close",
    level = 140,
    sound = "hvap/gun/gat/gau8/start_1.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun gau8 start near
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.Start.Near",
    level = 120,
    sound = "hvap/gun/gat/gau8/start_2.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- gun gau8 start far
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.GAU8.Start.Far",
    level = 100,
    sound = "hvap/gun/gat/gau8/start_3.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

-------------------------------------------------------
--###################################################-- M134
-------------------------------------------------------

sound.Add( -- gun m134 end close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M134.End.Close",
    level = 140,
    sound = "hvap/gun/gat/m134/end_near.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})


sound.Add( -- gun m134 loop close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M134.Loop.Close",
    level = 140,
    sound = "hvap/gun/gat/M134/loop_near.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})


sound.Add( -- gun m134 start close
{
    channel = CHAN_STATIC,
    name = "HVAP.Gun.M134.Start.Close",
    level = 140,
    sound = "hvap/gun/gat/m134/start_near.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--###################################################----###################################################----###################################################-- Engine Audio
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--###################################################-- Helicopter 1
-------------------------------------------------------

sound.Add( -- engine hc_1 cockpit
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_1.Cockpit",
    level = 75,
    sound = "hvap/engine/hc_1/cockpit.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_1 engine near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_1.Engine.Near",
    level = 105,
    sound = "hvap/engine/hc_1/engine_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_1 engine far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_1.Engine.Far",
    level = 120,
    sound = "hvap/engine/hc_1/engine_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_1 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_1.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_1/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_1 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_1.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_1/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_1 turbine
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_1.Turbine",
    level = 132,
    sound = "hvap/engine/hc_1/turbine.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_1 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_1.Start",
    level = 90,
    sound = "hvap/engine/shared/heli_start_1.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 2
-------------------------------------------------------

sound.Add( -- engine hc_2 cockpit
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_2.Cockpit",
    level = 75,
    sound = "hvap/engine/hc_2/cockpit.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_2 engine near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_2.Engine.Near",
    level = 105,
    sound = "hvap/engine/hc_2/engine_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_2 engine far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_2.Engine.Far",
    level = 120,
    sound = "hvap/engine/hc_2/engine_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_2 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_2.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_2/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_2 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_2.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_2/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_2 turbine
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_2.Turbine",
    level = 132,
    sound = "hvap/engine/hc_2/turbine.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_2 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_2.Start",
    level = 90,
    sound = "hvap/engine/shared/heli_start_2.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 3
-------------------------------------------------------

sound.Add( -- engine hc_3 cockpit
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_3.Cockpit",
    level = 75,
    sound = "hvap/engine/hc_3/cockpit.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_3 engine near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_3.Engine.Near",
    level = 105,
    sound = "hvap/engine/hc_3/engine_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_3 engine far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_3.Engine.Far",
    level = 120,
    sound = "hvap/engine/hc_3/engine_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_3 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_3.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_3/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_3 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_3.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_3/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_3 turbine
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_3.Turbine",
    level = 132,
    sound = "hvap/engine/hc_3/turbine.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_3 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_3.Start",
    level = 90,
    sound = "hvap/engine/shared/heli_start_3.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 4
-------------------------------------------------------

sound.Add( -- engine hc_4 cockpit
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_4.Cockpit",
    level = 75,
    sound = "hvap/engine/hc_4/cockpit.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_4 engine near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_4.Engine.Near",
    level = 105,
    sound = "hvap/engine/hc_4/engine_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_4 engine far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_4.Engine.Far",
    level = 120,
    sound = "hvap/engine/hc_4/engine_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_4 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_4.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_4/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_4 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_4.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_4/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_4 turbine
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_4.Turbine",
    level = 132,
    sound = "hvap/engine/hc_4/turbine.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_4 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_4.Start",
    level = 90,
    sound = "hvap/engine/shared/heli_start_4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 5
-------------------------------------------------------

sound.Add( -- engine hc_5 engine near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_5.Engine.Near",
    level = 105,
    sound = "hvap/engine/hc_5/engine_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_5 engine far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_5.Engine.Far",
    level = 120,
    sound = "hvap/engine/hc_5/engine_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_5 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_5.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_5/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_5 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_5.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_5/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_5 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_5.Start",
    level = 90,
    sound = "hvap/engine/shared/heli_start_5.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 6
-------------------------------------------------------

sound.Add( -- engine hc_6 engine near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_6.Engine.Near",
    level = 105,
    sound = "hvap/engine/hc_6/engine_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_6 engine far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_6.Engine.Far",
    level = 120,
    sound = "hvap/engine/hc_6/engine_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_6 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_6.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_6/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_6 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_6.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_6/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_6 turbine
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_6.Turbine",
    level = 132,
    sound = "hvap/engine/hc_6/turbine.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 7
-------------------------------------------------------

sound.Add( -- engine hc_7 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_7.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_7/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_7 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_7.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_7/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 8
-------------------------------------------------------

sound.Add( -- engine hc_8 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_8.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_8/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_8 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_8.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_8/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 8
-------------------------------------------------------

sound.Add( -- engine hc_9 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_9.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_9/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_9 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_9.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_9/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Helicopter 10
-------------------------------------------------------

sound.Add( -- engine hc_10 cockpit
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_10.Cockpit",
    level = 75,
    sound = "hvap/engine/hc_10/cockpit.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_10 engine near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_10.Engine.Near",
    level = 105,
    sound = "hvap/engine/hc_10/engine_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_10 engine far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_10.Engine.Far",
    level = 120,
    sound = "hvap/engine/hc_10/engine_far.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_10 rotor near
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_10.Rotor.Near",
    level = 116,
    sound = "hvap/engine/hc_10/rotor_close.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hc_10 rotor far
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.HC_10.Rotor.Far",
    level = 132,
    sound = "hvap/engine/hc_10/rotor_far.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Shared
-------------------------------------------------------

sound.Add( -- engine rotorwash
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Rotorwash",
    level = 90,
    sound = "hvap/engine/shared/rotorwash.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine stall
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stall",
    level = 90,
    sound = {
		"hvap/engine/shared/stall_1.wav",
		"hvap/engine/shared/stall_2.wav",
		"hvap/engine/shared/stall_3.wav"
	},
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Hetzer
-------------------------------------------------------

sound.Add( -- engine hetzer start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.Start",
    level = 80,
    sound = "hvap/engine/hetzer/start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine hetzer stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.Stop",
    level = 80,
    sound = "hvap/engine/hetzer/stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine hetzer rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.Rev",
    level = 115,
    sound = {
		"hvap/engine/hetzer/rev_1.wav",
		"hvap/engine/hetzer/rev_2.wav",
		"hvap/engine/hetzer/rev_3.wav",
		"hvap/engine/hetzer/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine hetzer external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.External.Idle",
    level = 110,
    sound = "hvap/engine/hetzer/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hetzer external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.External.Low",
    level = 110,
    sound = "hvap/engine/hetzer/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hetzer external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.External.Medium",
    level = 110,
    sound = "hvap/engine/hetzer/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hetzer external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.External.High",
    level = 110,
    sound = "hvap/engine/hetzer/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine hetzer internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.Internal.Idle",
    level = 110,
    sound = "hvap/engine/hetzer/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hetzer internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.Internal.Low",
    level = 110,
    sound = "hvap/engine/hetzer/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hetzer internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.Internal.Medium",
    level = 110,
    sound = "hvap/engine/hetzer/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine hetzer internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Hetzer.Internal.High",
    level = 110,
    sound = "hvap/engine/hetzer/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- M4A1
-------------------------------------------------------

sound.Add( -- engine m4a1 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.Start",
    level = 80,
    sound = "hvap/engine/m4a1/start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine m4a1 stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.Stop",
    level = 80,
    sound = "hvap/engine/m4a1/stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine m4a1 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.Rev",
    level = 115,
    sound = {
		"hvap/engine/m4a1/rev_1.wav",
		"hvap/engine/m4a1/rev_2.wav",
		"hvap/engine/m4a1/rev_3.wav",
		"hvap/engine/m4a1/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine m4a1 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.External.Idle",
    level = 110,
    sound = "hvap/engine/m4a1/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a1 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.External.Low",
    level = 110,
    sound = "hvap/engine/m4a1/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a1 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.External.Medium",
    level = 110,
    sound = "hvap/engine/m4a1/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a1 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.External.High",
    level = 110,
    sound = "hvap/engine/m4a1/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine m4a1 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.Internal.Idle",
    level = 110,
    sound = "hvap/engine/m4a1/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a1 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.Internal.Low",
    level = 110,
    sound = "hvap/engine/m4a1/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a1 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.Internal.Medium",
    level = 110,
    sound = "hvap/engine/m4a1/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a1 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A1.Internal.High",
    level = 110,
    sound = "hvap/engine/m4a1/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- M4A3
-------------------------------------------------------

sound.Add( -- engine m4a3 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.Rev",
    level = 115,
    sound = {
		"hvap/engine/m4a3/rev_1.wav",
		"hvap/engine/m4a3/rev_2.wav",
		"hvap/engine/m4a3/rev_3.wav",
		"hvap/engine/m4a3/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine m4a3 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.External.Idle",
    level = 110,
    sound = "hvap/engine/m4a3/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a3 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.External.Low",
    level = 110,
    sound = "hvap/engine/m4a3/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a3 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.External.Medium",
    level = 110,
    sound = "hvap/engine/m4a3/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a3 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.External.High",
    level = 110,
    sound = "hvap/engine/m4a3/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine m4a3 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.Internal.Idle",
    level = 110,
    sound = "hvap/engine/m4a3/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a3 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.Internal.Low",
    level = 110,
    sound = "hvap/engine/m4a3/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a3 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.Internal.Medium",
    level = 110,
    sound = "hvap/engine/m4a3/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m4a3 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M4A3.Internal.High",
    level = 110,
    sound = "hvap/engine/m4a3/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- M5A
-------------------------------------------------------

sound.Add( -- engine m5a rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.Rev",
    level = 115,
    sound = {
		"hvap/engine/m5a/rev_1.wav",
		"hvap/engine/m5a/rev_2.wav",
		"hvap/engine/m5a/rev_3.wav",
		"hvap/engine/m5a/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine m5a external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.External.Idle",
    level = 110,
    sound = "hvap/engine/m5a/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m5a external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.External.Low",
    level = 110,
    sound = "hvap/engine/m5a/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m5a external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.External.Medium",
    level = 110,
    sound = "hvap/engine/m5a/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m5a external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.External.High",
    level = 110,
    sound = "hvap/engine/m5a/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine m5a internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.Internal.Idle",
    level = 110,
    sound = "hvap/engine/m5a/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m5a internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.Internal.Low",
    level = 110,
    sound = "hvap/engine/m5a/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m5a internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.Internal.Medium",
    level = 110,
    sound = "hvap/engine/m5a/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m5a internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M5A.Internal.High",
    level = 110,
    sound = "hvap/engine/m5a/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- M16
-------------------------------------------------------

sound.Add( -- engine m16 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.Rev",
    level = 115,
    sound = {
		"hvap/engine/m16/rev_1.wav",
		"hvap/engine/m16/rev_2.wav",
		"hvap/engine/m16/rev_3.wav",
		"hvap/engine/m16/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine m16 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.External.Idle",
    level = 110,
    sound = "hvap/engine/m16/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m16 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.External.Low",
    level = 110,
    sound = "hvap/engine/m16/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m16 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.External.Medium",
    level = 110,
    sound = "hvap/engine/m16/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m16 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.External.High",
    level = 110,
    sound = "hvap/engine/m16/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine m16 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.Internal.Idle",
    level = 110,
    sound = "hvap/engine/m16/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m16 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.Internal.Low",
    level = 110,
    sound = "hvap/engine/m16/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m16 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.Internal.Medium",
    level = 110,
    sound = "hvap/engine/m16/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m16 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M16.Internal.High",
    level = 110,
    sound = "hvap/engine/m16/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- M18
-------------------------------------------------------

sound.Add( -- engine m18 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.Start",
    level = 80,
    sound = "hvap/engine/m18/start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine m18 stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.Stop",
    level = 80,
    sound = "hvap/engine/m18/stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine m18 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.Rev",
    level = 115,
    sound = {
		"hvap/engine/m18/rev_1.wav",
		"hvap/engine/m18/rev_2.wav",
		"hvap/engine/m18/rev_3.wav",
		"hvap/engine/m18/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine m18 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.External.Idle",
    level = 110,
    sound = "hvap/engine/m18/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m18 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.External.Low",
    level = 110,
    sound = "hvap/engine/m18/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m18 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.External.Medium",
    level = 110,
    sound = "hvap/engine/m18/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m18 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.External.High",
    level = 110,
    sound = "hvap/engine/m18/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine m18 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.Internal.Idle",
    level = 110,
    sound = "hvap/engine/m18/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m18 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.Internal.Low",
    level = 110,
    sound = "hvap/engine/m18/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m18 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.Internal.Medium",
    level = 110,
    sound = "hvap/engine/m18/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m18 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M18.Internal.High",
    level = 110,
    sound = "hvap/engine/m18/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- M24
-------------------------------------------------------

sound.Add( -- engine m24 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.Rev",
    level = 115,
    sound = {
		"hvap/engine/m24/rev_1.wav",
		"hvap/engine/m24/rev_2.wav",
		"hvap/engine/m24/rev_3.wav",
		"hvap/engine/m24/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine m24 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.External.Idle",
    level = 110,
    sound = "hvap/engine/m24/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m24 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.External.Low",
    level = 110,
    sound = "hvap/engine/m24/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m24 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.External.Medium",
    level = 110,
    sound = "hvap/engine/m24/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m24 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.External.High",
    level = 110,
    sound = "hvap/engine/m24/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine m24 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.Internal.Idle",
    level = 110,
    sound = "hvap/engine/m24/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m24 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.Internal.Low",
    level = 110,
    sound = "hvap/engine/m24/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m24 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.Internal.Medium",
    level = 110,
    sound = "hvap/engine/m24/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine m24 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.M24.Internal.High",
    level = 110,
    sound = "hvap/engine/m24/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Maus
-------------------------------------------------------

sound.Add( -- engine maus rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.Rev",
    level = 115,
    sound = {
		"hvap/engine/maus/rev_1.wav",
		"hvap/engine/maus/rev_2.wav",
		"hvap/engine/maus/rev_3.wav",
		"hvap/engine/maus/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine maus external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.External.Idle",
    level = 110,
    sound = "hvap/engine/maus/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine maus external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.External.Low",
    level = 110,
    sound = "hvap/engine/maus/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine maus external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.External.Medium",
    level = 110,
    sound = "hvap/engine/maus/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine maus external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.External.High",
    level = 110,
    sound = "hvap/engine/maus/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine maus internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.Internal.Idle",
    level = 110,
    sound = "hvap/engine/maus/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine maus internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.Internal.Low",
    level = 110,
    sound = "hvap/engine/maus/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine maus internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.Internal.Medium",
    level = 110,
    sound = "hvap/engine/maus/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine maus internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Maus.Internal.High",
    level = 110,
    sound = "hvap/engine/maus/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- PT76
-------------------------------------------------------

sound.Add( -- engine pt76 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.PT76.Rev",
    level = 115,
    sound = {
		"hvap/engine/pt76/rev_1.wav",
		"hvap/engine/pt76/rev_2.wav",
		"hvap/engine/pt76/rev_3.wav",
		"hvap/engine/pt76/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine pt76 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.PT76.External.Idle",
    level = 110,
    sound = "hvap/engine/pt76/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pt76 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.PT76.External.Low",
    level = 110,
    sound = "hvap/engine/pt76/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pt76 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.PT76.External.Medium",
    level = 110,
    sound = "hvap/engine/pt76/external/3.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine pt76 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.PT76.Internal.Idle",
    level = 110,
    sound = "hvap/engine/pt76/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pt76 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.PT76.Internal.Low",
    level = 110,
    sound = "hvap/engine/pt76/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pt76 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.PT76.Internal.Medium",
    level = 110,
    sound = "hvap/engine/pt76/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Pz3
-------------------------------------------------------

sound.Add( -- engine pz3 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.Start",
    level = 80,
    sound = "hvap/engine/pz3/start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine pz3 stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.Stop",
    level = 80,
    sound = "hvap/engine/pz3/stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine pz3 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.Rev",
    level = 115,
    sound = {
		"hvap/engine/pz3/rev_1.wav",
		"hvap/engine/pz3/rev_2.wav",
		"hvap/engine/pz3/rev_3.wav",
		"hvap/engine/pz3/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine pz3 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.External.Idle",
    level = 110,
    sound = "hvap/engine/pz3/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz3 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.External.Low",
    level = 110,
    sound = "hvap/engine/pz3/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz3 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.External.Medium",
    level = 110,
    sound = "hvap/engine/pz3/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz3 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.External.High",
    level = 110,
    sound = "hvap/engine/pz3/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine pz3 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.Internal.Idle",
    level = 110,
    sound = "hvap/engine/pz3/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz3 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.Internal.Low",
    level = 110,
    sound = "hvap/engine/pz3/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz3 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.Internal.Medium",
    level = 110,
    sound = "hvap/engine/pz3/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz3 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz3.Internal.High",
    level = 110,
    sound = "hvap/engine/pz3/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Pz4
-------------------------------------------------------

sound.Add( -- engine pz4 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.Rev",
    level = 115,
    sound = {
		"hvap/engine/pz4/rev_1.wav",
		"hvap/engine/pz4/rev_2.wav",
		"hvap/engine/pz4/rev_3.wav",
		"hvap/engine/pz4/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine pz4 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.External.Idle",
    level = 110,
    sound = "hvap/engine/pz4/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz4 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.External.Low",
    level = 110,
    sound = "hvap/engine/pz4/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz4 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.External.Medium",
    level = 110,
    sound = "hvap/engine/pz4/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz4 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.External.High",
    level = 110,
    sound = "hvap/engine/pz4/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine pz4 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.Internal.Idle",
    level = 110,
    sound = "hvap/engine/pz4/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz4 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.Internal.Low",
    level = 110,
    sound = "hvap/engine/pz4/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz4 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.Internal.Medium",
    level = 110,
    sound = "hvap/engine/pz4/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz4 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz4.Internal.High",
    level = 110,
    sound = "hvap/engine/pz4/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Pz5
-------------------------------------------------------

sound.Add( -- engine pz5 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.Start",
    level = 80,
    sound = "hvap/engine/pz5/start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine pz5 stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.Stop",
    level = 80,
    sound = "hvap/engine/pz5/stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine pz5 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.Rev",
    level = 115,
    sound = {
		"hvap/engine/pz5/rev_1.wav",
		"hvap/engine/pz5/rev_2.wav",
		"hvap/engine/pz5/rev_3.wav",
		"hvap/engine/pz5/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine pz5 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.External.Idle",
    level = 110,
    sound = "hvap/engine/pz5/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz5 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.External.Low",
    level = 110,
    sound = "hvap/engine/pz5/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz5 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.External.Medium",
    level = 110,
    sound = "hvap/engine/pz5/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz5 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.External.High",
    level = 110,
    sound = "hvap/engine/pz5/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine pz5 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.Internal.Idle",
    level = 110,
    sound = "hvap/engine/pz5/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz5 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.Internal.Low",
    level = 110,
    sound = "hvap/engine/pz5/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz5 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.Internal.Medium",
    level = 110,
    sound = "hvap/engine/pz5/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz5 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz5.Internal.High",
    level = 110,
    sound = "hvap/engine/pz5/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Pz6
-------------------------------------------------------

sound.Add( -- engine pz6 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.Start",
    level = 80,
    sound = "hvap/engine/pz6/start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine pz6 stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.Stop",
    level = 80,
    sound = "hvap/engine/pz6/stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine pz6 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.Rev",
    level = 115,
    sound = {
		"hvap/engine/pz6/rev_1.wav",
		"hvap/engine/pz6/rev_2.wav",
		"hvap/engine/pz6/rev_3.wav",
		"hvap/engine/pz6/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine pz6 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.External.Idle",
    level = 110,
    sound = "hvap/engine/pz6/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz6 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.External.Low",
    level = 110,
    sound = "hvap/engine/pz6/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz6 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.External.Medium",
    level = 110,
    sound = "hvap/engine/pz6/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz6 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.External.High",
    level = 110,
    sound = "hvap/engine/pz6/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine pz6 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.Internal.Idle",
    level = 110,
    sound = "hvap/engine/pz6/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz6 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.Internal.Low",
    level = 110,
    sound = "hvap/engine/pz6/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz6 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.Internal.Medium",
    level = 110,
    sound = "hvap/engine/pz6/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine pz6 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Pz6.Internal.High",
    level = 110,
    sound = "hvap/engine/pz6/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Sla16
-------------------------------------------------------

sound.Add( -- engine sla16 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.Rev",
    level = 115,
    sound = {
		"hvap/engine/sla16/rev_1.wav",
		"hvap/engine/sla16/rev_2.wav",
		"hvap/engine/sla16/rev_3.wav",
		"hvap/engine/sla16/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine sla16 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.External.Idle",
    level = 110,
    sound = "hvap/engine/sla16/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine sla16 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.External.Low",
    level = 110,
    sound = "hvap/engine/sla16/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine sla16 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.External.Medium",
    level = 110,
    sound = "hvap/engine/sla16/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine sla16 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.External.High",
    level = 110,
    sound = "hvap/engine/sla16/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine sla16 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.Internal.Idle",
    level = 110,
    sound = "hvap/engine/sla16/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine sla16 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.Internal.Low",
    level = 110,
    sound = "hvap/engine/sla16/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine sla16 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.Internal.Medium",
    level = 110,
    sound = "hvap/engine/sla16/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine sla16 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Sla16.Internal.High",
    level = 110,
    sound = "hvap/engine/sla16/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Stug40
-------------------------------------------------------

sound.Add( -- engine stug40 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.Rev",
    level = 115,
    sound = {
		"hvap/engine/stug40/rev_1.wav",
		"hvap/engine/stug40/rev_2.wav",
		"hvap/engine/stug40/rev_3.wav",
		"hvap/engine/stug40/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine stug40 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.External.Idle",
    level = 110,
    sound = "hvap/engine/stug40/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine stug40 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.External.Low",
    level = 110,
    sound = "hvap/engine/stug40/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine stug40 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.External.Medium",
    level = 110,
    sound = "hvap/engine/stug40/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine stug40 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.External.High",
    level = 110,
    sound = "hvap/engine/stug40/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine stug40 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.Internal.Idle",
    level = 110,
    sound = "hvap/engine/stug40/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine stug40 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.Internal.Low",
    level = 110,
    sound = "hvap/engine/stug40/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine stug40 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.Internal.Medium",
    level = 110,
    sound = "hvap/engine/stug40/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine stug40 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.Stug40.Internal.High",
    level = 110,
    sound = "hvap/engine/stug40/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- SU100
-------------------------------------------------------

sound.Add( -- engine su100 start
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.Start",
    level = 80,
    sound = "hvap/engine/su100/start.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine su100 stop
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.Stop",
    level = 80,
    sound = "hvap/engine/su100/stop.wav",
    volume = 1.0,
	pitch = { 98, 102 },
})

sound.Add( -- engine su100 rev
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.Rev",
    level = 115,
    sound = {
		"hvap/engine/su100/rev_1.wav",
		"hvap/engine/su100/rev_2.wav",
		"hvap/engine/su100/rev_3.wav",
		"hvap/engine/su100/rev_4.wav"
	},
    volume = 1.0,
	pitch = { 95, 105 },
})

-------------------------------------------------------

sound.Add( -- engine su100 external idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.External.Idle",
    level = 110,
    sound = "hvap/engine/su100/external/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine su100 external low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.External.Low",
    level = 110,
    sound = "hvap/engine/su100/external/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine su100 external medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.External.Medium",
    level = 110,
    sound = "hvap/engine/su100/external/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine su100 external high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.External.High",
    level = 110,
    sound = "hvap/engine/su100/external/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- engine su100 internal idle
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.Internal.Idle",
    level = 110,
    sound = "hvap/engine/su100/internal/1.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine su100 internal low
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.Internal.Low",
    level = 110,
    sound = "hvap/engine/su100/internal/2.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine su100 internal medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.Internal.Medium",
    level = 110,
    sound = "hvap/engine/su100/internal/3.wav",
    volume = 1.0,
	pitch = 100
})

sound.Add( -- engine su100 internal high
{
    channel = CHAN_STATIC,
    name = "HVAP.Engine.SU100.Internal.High",
    level = 110,
    sound = "hvap/engine/su100/internal/4.wav",
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------
--###################################################-- Tracks
-------------------------------------------------------

sound.Add( -- vehicle tracks light fast
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Light.Fast",
    level = 88,
    sound = 	{
		"hvap/engine/shared/tracks/light/fast_1.wav",
		"hvap/engine/shared/tracks/light/fast_2.wav",
		"hvap/engine/shared/tracks/light/fast_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle tracks light medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Light.Medium",
    level = 84,
    sound = 	{
		"hvap/engine/shared/tracks/light/medium_1.wav",
		"hvap/engine/shared/tracks/light/medium_2.wav",
		"hvap/engine/shared/tracks/light/medium_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle tracks light slow
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Light.Slow",
    level = 80,
    sound = 	{
		"hvap/engine/shared/tracks/light/slow_1.wav",
		"hvap/engine/shared/tracks/light/slow_2.wav",
		"hvap/engine/shared/tracks/light/slow_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- vehicle tracks medium fast
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Medium.Fast",
    level = 88,
    sound = 	{
		"hvap/engine/shared/tracks/medium/fast_1.wav",
		"hvap/engine/shared/tracks/medium/fast_2.wav",
		"hvap/engine/shared/tracks/medium/fast_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle tracks medium medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Medium.Medium",
    level = 84,
    sound = 	{
		"hvap/engine/shared/tracks/medium/medium_1.wav",
		"hvap/engine/shared/tracks/medium/medium_2.wav",
		"hvap/engine/shared/tracks/medium/medium_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle tracks medium slow
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Medium.Slow",
    level = 80,
    sound = 	{
		"hvap/engine/shared/tracks/medium/slow_1.wav",
		"hvap/engine/shared/tracks/medium/slow_2.wav",
		"hvap/engine/shared/tracks/medium/slow_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- vehicle tracks heavy fast
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Heavy.Fast",
    level = 88,
    sound = 	{
		"hvap/engine/shared/tracks/heavy/fast_1.wav",
		"hvap/engine/shared/tracks/heavy/fast_2.wav",
		"hvap/engine/shared/tracks/heavy/fast_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle tracks heavy medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Heavy.Medium",
    level = 84,
    sound = 	{
		"hvap/engine/shared/tracks/heavy/medium_1.wav",
		"hvap/engine/shared/tracks/heavy/medium_2.wav",
		"hvap/engine/shared/tracks/heavy/medium_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle tracks heavy slow
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.Heavy.Slow",
    level = 80,
    sound = 	{
		"hvap/engine/shared/tracks/heavy/slow_1.wav",
		"hvap/engine/shared/tracks/heavy/slow_2.wav",
		"hvap/engine/shared/tracks/heavy/slow_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

-------------------------------------------------------

sound.Add( -- vehicle tracks superheavy medium
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.SuperHeavy.Medium",
    level = 88,
    sound = 	{
		"hvap/engine/shared/tracks/superheavy/medium_1.wav",
		"hvap/engine/shared/tracks/superheavy/medium_2.wav",
		"hvap/engine/shared/tracks/superheavy/medium_3.wav"
		},
    volume = 1.0,
	pitch = 100
})

sound.Add( -- vehicle tracks superheavy slow
{
    channel = CHAN_STATIC,
    name = "HVAP.Vehicle.Tracks.SuperHeavy.Slow",
    level = 84,
    sound = 	{
		"hvap/engine/shared/tracks/superheavy/slow_1.wav",
		"hvap/engine/shared/tracks/superheavy/slow_2.wav",
		"hvap/engine/shared/tracks/superheavy/slow_3.wav"
		},
    volume = 1.0,
	pitch = 100
})


-------------------------------------------------------
--###################################################--
-------------------------------------------------------