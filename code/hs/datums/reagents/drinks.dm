#define SOLID 1
#define LIQUID 2
#define GAS 3

//drinks boi

datum
	reagent
		faygo
			name = "Faygo"
			//DEPRECATED id = "slurpjuice"
			description = "A refreshing beverage."
			reagent_state = LIQUID
			var/F = 0
			var/ag = 0
			on_mob_life(var/mob/M)
				if(prob(50))
					M.oxyloss += max(0,min(M.oxyloss+10,100))
					M.toxloss += max(0,min(M.toxloss+10,100))
					M.fireloss += max(0,min(M.fireloss+10,100))
					M.bruteloss += max(0,min(M.bruteloss+10,100))
					M.specialloss += max(0,min(M.specialloss+10,100))
					M:stuttering += 4
					M:confused += 3
				if(prob(50))
					if(prob(30))
						if(prob(10))
							if(prob(1))
								M:gib()
				if(prob(5)) M:emote(pick("honks hardly","cries","shiver","blink_r"))
				..()