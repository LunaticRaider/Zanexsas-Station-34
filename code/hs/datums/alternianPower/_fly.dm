#define MAX_FLY_Y 70

datum
	alternians
		fly
			var/flySpeedY = 4
			var/flying = FALSE

			verb/fly()
				set name = "Fly"
				set category = "Alternian"

				if(flying == TRUE)
					flying = FALSE
					animate(usr, pixel_z = 0,15,1,ELASTIC_EASING)
					usr << "\blue You stop flying"
				else
					flying = TRUE
					animate(usr, pixel_z = MAX_FLY_Y,15,1,ELASTIC_EASING)
					usr << "\blue You start flying"
				sleep(15)
				while(flying == TRUE && usr.stat != 2)
					spawn(tick_lag_original)
						usr.ySpeed = flySpeedY
						usr.onFloor = FALSE
						if(prob(5))
							animate(usr, pixel_z = MAX_FLY_Y - 15,15,1,ELASTIC_EASING)
							sleep(15)
						usr.pixel_z = MAX_FLY_Y-(sin(frm_counter)*15)
						if(usr.pixel_z >= MAX_FLY_Y)
							usr.pixel_z = MAX_FLY_Y
							usr.pixel_y_2 = MAX_FLY_Y
							usr.heightZ = MAX_FLY_Y
					sleep(tick_lag_original)

#undef MAX_FLY_Y