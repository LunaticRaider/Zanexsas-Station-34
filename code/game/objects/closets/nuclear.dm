/obj/closet/syndicate/nuclear/New()
	..()
	sleep(2)
	new /obj/item/weapon/ammo/a357( src )
	new /obj/item/weapon/ammo/a357( src )
	new /obj/item/weapon/ammo/a357( src )
	new /obj/item/weapon/storage/handcuff_kit( src )
	new /obj/item/weapon/storage/flashbang_kit( src )
	new /obj/item/device/pda/syndicate( src )
	var/obj/item/weapon/syndicate_uplink/U = new /obj/item/weapon/syndicate_uplink( src )
	U.uses = 40
	return
