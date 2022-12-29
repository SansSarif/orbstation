/obj/item/slimepotion/genderchange
	desc = "An interesting chemical mix that changes the gender of what it's applied to. Can only be used on yourself."

/obj/item/slimepotion/genderchange/attack(mob/living/L, mob/user)
	if(L != user)
		to_chat(user, span_warning("You can't use this on someone else!"))
		return

	..()

/obj/item/storage/book/bible
	name = "holy book"
	icon_state = "holybook"
	inhand_icon_state = "holybook"
/obj/item/food/raw_meatball
	desc = "A great meal all round. Kinda raw"

/obj/item/food/meatball
	desc = "A great meal all round."

// Removed reference to tiziran genocide.
/obj/item/weaponcrafting/gunkit/temperature
	desc = "A suitcase containing the necessary gun parts to tranform a standard energy gun into a temperature gun. Fantastic at birthday parties and for mowing down snowmen."

// Replaced tohou joke which wasn't very funny
/obj/item/clothing/head/rabbitears
	name = "rabbit ears"
	desc = "bnuuy"

// Let's not call it that
/obj/item/book/granter/action/spell/blind/wgw/Initialize(mapload)
	. = ..()
	var/static/list/things_you_dont_want_to_read = list(
		"Nudes of the Mansus",
		"Wizards Gone Wild", // Didn't mean it at the time but this is retroactively what the initial in the typepath stands for
		"20th Century Internet Archives: Reddit",
		"Book Which Makes You Go Blind",)
	name = pick(things_you_dont_want_to_read)

// This didn't even fucking work as implemented smh
/obj/item/book/granter/action/spell/blind/wgw/recoil(mob/living/user)
	to_chat(user, span_notice("[length(remarks) ? pick(remarks) : "You keep reading..."]"))
	return ..()

/obj/item/tailclub
	desc = "Also known as the Thagomiser."

/obj/item/melee/chainofcommand/tailwhip
	name = "scaled tail whip"
	desc = "Simulates for the victim the experience of standing next to an excited Tiziran, but with none of the enjoyment."

/obj/item/melee/chainofcommand/tailwhip/kitty
	name = "cat tail whip"
	desc = "Simulates for the victim the experience of standing next to an excited Felinid, but with none of the enjoyment."

/obj/item/clothing/head/costume/lizard
	name = "reptilian cloche"
	desc = "A rather tasteless hat made out of synthesised scales."
