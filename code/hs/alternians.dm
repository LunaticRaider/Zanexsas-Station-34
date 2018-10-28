/mob/living/carbon/human
	var/gooze = 0
	Life()
		..()
		if(src.species == "alternian")
			if(src.sign)
				switch(src.sign)
					if("Rust")
						gooze++

	New()
		..()
		spawn()
			if(src.alternian_blood_type != "Mutant")
				var/enum = pick(1,2,3)
				switch(src.alternian_blood_type)
					if("Rust")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "rust_[enum]")
							src.overlays += sign
					if("Bronze")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "bronze_[enum]")
							src.overlays += sign
					if("Gold")
						src.mutations = src.mutations |= 1
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "gold_[enum]")
							src.overlays += sign
					if("Lime")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "lime_[enum]")
							src.overlays += sign
					if("Olive")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "olive_[enum]")
							src.overlays += sign
					if("Jade")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "jade_[enum]")
							src.overlays += sign
					if("Teal")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "teal_[enum]")
							src.overlays += sign
					if("Cerulean")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "cerulean_[enum]")
							src.overlays += sign
					if("Indigo")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "indigo_[enum]")
							src.overlays += sign
					if("Purple")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "purple_[enum]")
							src.overlays += sign
					if("Violet")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "violet_[enum]")
							src.overlays += sign
					if("Fuschia")
						if(src.sign)
							var/image/sign = image("icon" = 'icons/hs/signs.dmi', "icon_state" = "fuschia_[enum]")
							src.overlays += sign