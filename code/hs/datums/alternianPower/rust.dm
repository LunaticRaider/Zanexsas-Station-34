datum
	alternians
		rust
			verb
				beUseless()
					set name = "Kill your fucking self"
					set category = "Alternian"

					new /obj/Particle/skull(usr.loc)
					spawn(5) usr:gib()

				necromancy()
					set name = "Necromancy"
					set category = "Alternian"

					usr << "Nigga this isn't done"
					new /obj/Particle/skull(usr.loc)
					return