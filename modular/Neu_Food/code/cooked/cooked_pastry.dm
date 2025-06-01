// For definition - any non-bread premium product dough that is also not a cake.
/*	.................   Pastry   ................... */
/obj/item/reagent_containers/food/snacks/rogue/pastry
	name = "pastry"
	desc = "Favored among children and sweetlovers."
	icon = 'modular/Neu_Food/icons/cooked/cooked_pastry.dmi'
	icon_state = "pastry"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("crispy butterdough" = 1)
	faretype = FARE_FINE
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/foodbase/biscuit_raw
	name = "uncooked raisin biscuit"
	icon = 'modular/Neu_Food/icons/cooked/cooked_pastry.dmi'
	icon_state = "biscuit_raw"
	color = "#ecce61"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/biscuit
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/biscuit
	name = "biscuit"
	desc = "A treat made for a wretched dog like you."
	icon = 'modular/Neu_Food/icons/cooked/cooked_pastry.dmi'
	icon_state = "biscuit"
	faretype = FARE_POOR
	filling_color = "#F0E68C"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT+SNACK_POOR)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	tastes = list("crispy butterdough" = 1, "raisins" = 1)
	eat_effect = /datum/status_effect/buff/foodbuff

// MISSING RECIPE
/obj/item/reagent_containers/food/snacks/rogue/cookie		//It's a biscuit.......
	name = "cookie of smiles"
	icon = 'modular/Neu_Food/icons/cooked/cooked_pastry.dmi'
	icon_state = "cookie"
	color = "#ecce61"
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/foodbase/prezzel_raw
	name = "uncooked prezzel"
	icon = 'modular/Neu_Food/icons/cooked/cooked_pastry.dmi'
	icon_state = "prezzel_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/prezzel
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/prezzel
	name = "prezzel"
	desc = "The next best thing since sliced bread, naturally, made by a dwarf."
	icon = 'modular/Neu_Food/icons/cooked/cooked_pastry.dmi'
	icon_state = "prezzel"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	faretype = FARE_FINE
	tastes = list("crispy butterdough" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw
	name = "raw handpie"
	desc = "The dwarven take on pies, called pierogi in their dialect. A fistfull of food to stand the test of time."
	icon = 'modular/Neu_Food/icons/cooked/cooked_pastry.dmi'
	icon_state = "handpie_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/handpie
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/handpie
	w_class = WEIGHT_CLASS_NORMAL
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/mushroom
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | VEGETABLES
	tastes = list("mushrooms" = 1)

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/mince
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | MEAT
	tastes = list("meat" = 1)
	
/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/berry
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | FRUIT
	tastes = list("berry" = 1)

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/poison
	list_reagents = list(/datum/reagent/berrypoison = 5)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | FRUIT
	tastes = list("bitter berry" = 1)

/obj/item/reagent_containers/food/snacks/rogue/handpie
	name = "handpie"
	desc = "The dwarven take on pies, called pierogi in their dialect. A fistfull of food to stand the test of time."
	icon = 'modular/Neu_Food/icons/cooked/cooked_pastry.dmi'
	icon_state = "handpie"
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 4
	faretype = FARE_FINE
	bonus_reagents = list(/datum/reagent/consumable/nutriment = BUTTERDOUGHSLICE_NUTRITION+MINCE_NUTRITION)
	tastes = list("crispy dough" = 1)
	rotprocess = null
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/handpie/On_Consume(mob/living/eater)
	..()
	icon_state = "handpie[bitecount]"
	if(bitecount == 1)
		rotprocess = SHELFLIFE_DECENT
		addtimer(CALLBACK(src, PROC_REF(begin_rotting)), 20, TIMER_CLIENT_TIME)
