/obj/item/autosurgeon/syndicate/chainsaw
	desc = "A single use autosurgeon that contains a combat arms-up chainsaw augment. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/internal/cyberimp/arm/melee/chainsaw

/obj/item/organ/internal/cyberimp/arm/melee/chainsaw/l
	zone = BODY_ZONE_L_ARM

/obj/item/organ/internal/cyberimp/arm/melee/chainsaw
	name = "arm-mounted chainsaw implant"
	desc = "A chainsaw hand implanted inside the arm. The chainsaw emerges from the subject's arm and remains inside when not in use."
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "chainsaw_off"
	items_to_create = list(/obj/item/chainsaw/mounted_chainsaw/implanted)

/datum/uplink_item/role_restricted/intergrated_chainsaw
	name = "Intergrated Chainsaw"
	desc = "A chainsaw hand implanted inside the arm. The chainsaw emerges from the subject's arm and remains inside when not in use."
	item = /obj/item/autosurgeon/syndicate/chainsaw
	cost = 12
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_CHIEF_ENGINEER, JOB_BOTANIST, JOB_ASSISTANT, JOB_ASSISTANT_ENG)
	surplus = 15
	progression_minimum = 30 MINUTES

/obj/item/chainsaw/mounted_chainsaw/implanted
	name = "mounted chainsaw"
	desc = "A chainsaw that has replaced your arm."
	icon_state = "chainsaw_on"
	inhand_icon_state = "mounted_chainsaw"
	lefthand_file = 'icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	item_flags = ABSTRACT
	w_class = WEIGHT_CLASS_HUGE
	force = 24
	throwforce = 0
	throw_range = 0
	throw_speed = 0
	sharpness = SHARP_EDGED
	attack_verb_continuous = list("saws", "tears", "lacerates", "cuts", "chops", "dices")
	attack_verb_simple = list("saw", "tear", "lacerate", "cut", "chop", "dice")
	hitsound = 'sound/weapons/chainsawhit.ogg'
	tool_behaviour = TOOL_SAW
	toolspeed = 1

/obj/item/chainsaw/mounted_chainsaw/implanted/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)

/obj/item/chainsaw/mounted_chainsaw/implanted/Destroy()
	var/obj/item/bodypart/part
	new /obj/item/chainsaw(get_turf(src))
	if(iscarbon(loc))
		var/mob/living/carbon/holder = loc
		var/index = holder.get_held_index_of_item(src)
		if(index)
			part = holder.hand_bodyparts[index]
	. = ..()
	if(part)
		part.drop_limb()
