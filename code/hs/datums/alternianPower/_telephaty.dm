datum
	alternians
		telephaty
			verb/teleTalk(mob/m in oview(30))
				set name = "Tele Talk"
				set category = "Alternians"
				var/msg = input("Tele Talk(tm) [m]")as null|text //if this doesn't work...
				if(msg)
					usr << "You said \"[msg]\" telephatically to [m]"
					m << "[usr] talks through your mind: [msg]"