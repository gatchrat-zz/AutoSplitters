state("FOTONICA")
{
	//This takes the X-Position of the Player in every Level, it starts at 1 when you spawn and increases
	int Brenta:"FOTONICA.exe",0x00ABD0AC,0x34,0xb4,0x44,0x0,0xc8;
	int Emilia :"FOTONICA.exe",0x00A2F2C8,0x4,0xac,0x524,0xa4,0x128;
	int endlesspoints:"FOTONICA.exe",0x00A2236C,0x198,0x144,0x378,0x2c4,0x788;
	// 1 life, 2 death
	int endlessdeath:"FOTONICA.exe",0x00A248BC,0x18;
	//Current difficulty displayed in the mainmenu
	int difficulty:"FOTONICA.exe",0x00A240E0,0x5c,0x7b8,0x50,0x300,0x24;

	int gamestate:"FOTONICA.exe",0x00A236EC,0x2b0,0x18,0x15c,0x8,0x8;
	//This turns from 0 to 1 when crossing the finishline
	int theChosenOne:"mono.dll",0x001F2648,0x150,0x7e0,0x590,0x38,0x50;
	
}

init
{	

	vars.canresetemilia=false;
	
	//Bool if you are currently running a level
	vars.runninglevel=false;
	
	//Bool to know if you should be able to reset in Brenta
	vars.canresetBrenta=false;
	
	//Bools to know what Level you already finished
	vars.didBrenta  = false;
	vars.didAffori  = false;
	vars.didInganni  = false;
	vars.didCadorna = false;
	vars.didPalestro  = false;
	vars.didBandeNere = false;
	vars.didMissori  = false;
	vars.didRomolo = false;
	
	//Bools to know what Level you are currently doing
	vars.doingBrenta  = false;
	vars.doingAffori  = false;
	vars.doingInganni  = false;
	vars.doingCadorna = false;
	vars.doingPalestro  = false;
	vars.doingBandeNere = false;
	vars.doingMissori  = false;
	vars.doingRomolo = false;
	
	//Time since the start of the timer in 1/Refreshrate
	vars.timesincestart=0;
	
	//Bool to know if the game loads
	vars.loadstop=false;
	
	//Bool to tell the timer to pause
	vars.loadstopper=false;
	
}
startup{
	//Adds the setting of Running Individual Levels
	settings.Add("RunSingleLevels", false, "RunSingleLevels");
	settings.Add("EndlessLevels", false, "EndlessLevels");
}
start
{
	
	
	
	//Endless Mode
	if(settings["EndlessLevels"]==true){
		if(current.Emilia==0&&current.gamestate==1){
				vars.canresetemilia=false;
				vars.runninglevel=false;
				vars.canresetBrenta=false;
				vars.didBrenta  = false;
				vars.didAffori  = false;
				vars.didInganni  = false;
				vars.didCadorna = false;
				vars.didPalestro  = false;
				vars.didBandeNere = false;
				vars.didMissori  = false;
				vars.didRomolo = false;
				vars.doingBrenta  = false;
				vars.doingAffori  = false;
				vars.doingInganni  = false;
				vars.doingCadorna = false;
				vars.doingPalestro  = false;
				vars.doingBandeNere = false;
				vars.doingMissori  = false;
				vars.doingRomolo = false;
				vars.timesincestart=0;
				vars.loadstop=false;
				vars.loadstopper=false;
			print("current start emilia");
			return true;
		
		}
	}
	//Single Levels
	if(settings["RunSingleLevels"]==true){
		//When at the start of any Level
		if(current.Brenta==1||current.Emilia==0){
			if(current.gamestate==1){
				vars.canresetemilia=false;
				vars.runninglevel=false;
				vars.canresetBrenta=false;
				vars.didBrenta  = false;
				vars.didAffori  = false;
				vars.didInganni  = false;
				vars.didCadorna = false;
				vars.didPalestro  = false;
				vars.didBandeNere = false;
				vars.didMissori  = false;
				vars.didRomolo = false;
				vars.doingBrenta  = false;
				vars.doingAffori  = false;
				vars.doingInganni  = false;
				vars.doingCadorna = false;
				vars.doingPalestro  = false;
				vars.doingBandeNere = false;
				vars.doingMissori  = false;
				vars.doingRomolo = false;
				vars.timesincestart=0;
				vars.loadstop=false;
				vars.loadstopper=false;
				print("current start indiv");
				//reset values and start timer
				vars.timesincestart=0;
				vars.runninglevel=true;
				return true;
			}
		}
	}
	//Any%
	if(settings["RunSingleLevels"]==false&&settings["EndlessLevels"]==false){
		//When playing and at the start of the first Level
		
		if(current.Brenta==1&&current.gamestate==1){
			vars.canresetemilia=false;
			vars.runninglevel=false;
			vars.canresetBrenta=false;
			vars.didBrenta  = false;
			vars.didAffori  = false;
			vars.didInganni  = false;
			vars.didCadorna = false;
			vars.didPalestro  = false;
			vars.didBandeNere = false;
			vars.didMissori  = false;
			vars.didRomolo = false;
			vars.doingBrenta  = false;
			vars.doingAffori  = false;
			vars.doingInganni  = false;
			vars.doingCadorna = false;
			vars.doingPalestro  = false;
			vars.doingBandeNere = false;
			vars.doingMissori  = false;
			vars.doingRomolo = false;
			vars.timesincestart=0;
			vars.loadstop=false;
			vars.loadstopper=false;
			print("current start any");
			//start timer and confirm that you are currently in Brenta
			vars.doingBrenta=true;
			vars.loadstopper=false;
			
			
			return true;
			
		}
	}
 
	
}

split{

	//Endless Mode
	if(settings["EndlessLevels"]==true){
		if(current.endlesspoints>9999){
			return true;
		
		}
	}
	//When crossing the finishline
	if(current.theChosenOne==1 ){
	
		//Any%
		if(settings["RunSingleLevels"]==false&&settings["EndlessLevels"]==false){
		
			//When not in Loading screen
			if(vars.loadstop==false){
			
				//Check which Level is being run, then set pause indicator to true + set running indicator to false + set finish indicator for the level to true + split	
				if(vars.doingBrenta==true){
					print("current split Brenta");
					vars.didBrenta=true;
					vars.doingBrenta=false;
					vars.loadstop=true;
				return true;
				}
				if(vars.doingAffori==true){
				print("current split Affori");
					vars.didAffori=true;
					vars.doingAffori=false;
					vars.loadstop=true;
				return true;
				}
				if(vars.doingInganni==true){
				print("current split Inganni");
					vars.didInganni=true;
					vars.doingInganni=false;
					vars.loadstop=true;
				return true;
				}
				if(vars.doingCadorna==true){
				print("current split Cadorna");
					vars.didCadorna=true;
					vars.doingCadorna=false;
					vars.loadstop=true;
				return true;
				}
				if(vars.doingPalestro==true){
				print("current split Palestro");
					vars.didPalestro=true;
					vars.doingPalestro=false;
					vars.loadstop=true;
				return true;
				}
				if(vars.doingBandeNere==true){
				print("current split BandeNere");
					vars.didBandeNere=true;
					vars.doingBandeNere=false;
					vars.loadstop=true;
				return true;
				}
				if(vars.doingMissori==true){
				print("current split Missori");
					vars.didMissori=true;
					vars.doingMissori=false;
					vars.loadstop=true;
				return true;
				}
				if(vars.doingRomolo==true){
				print("current split Romolo");
					vars.didRomolo=true;
					vars.doingRomolo=false;
					vars.loadstop=true;
				return true;
				}
				
			}
			
			
			
		}
		//SingleLevels
		//Check if a Level is being run
		if(settings["RunSingleLevels"]==true&&vars.runninglevel==true){
			print("current split indiv");
			//Split + set the indicator that you are running a level to false + reset the timer which counts the time since the start
			vars.runninglevel=false;
			vars.timesincestart=0;
			return true;
		}
	}
	
}
update
{
	
	
	//Endless mode
	if(settings["EndlessLevels"]==true){
		if(current.Emilia>10&&current.gamestate==1){
			vars.canresetemilia=true;
		
		
		}
	
	}
	//SingleLevel
	if(settings["RunSingleLevels"]==true){
	
		//Check if you are in a Level
		if(current.Emilia>10){
			
			if(current.gamestate==1){
			
				//Increase the time since start indicator
				vars.timesincestart=181;
				
				return true;
			}
		}
	
	}
	//Any%
	if(settings["RunSingleLevels"]==false&&settings["EndlessLevels"]==false){
		
		//When you leave the spawn in brenta set the canreset indicator to true -->when respawning the timer resets
		if(current.Brenta>1&&vars.doingBrenta==true&&vars.canresetBrenta==false){
			vars.canresetBrenta=true;
			print("current can reset Brenta");
		}
		
		//For each Level Check for : Already did Level? at spawn? already doing level? + Set: Stops the pause of the timer (sets both stop indicators to false) + set the running indicator for the level
		if(vars.doingBrenta==false&&current.Brenta==1&&vars.didBrenta==false){
			vars.doingBrenta=true;
			 vars.loadstop=false;
			 vars.loadstopper=false;
			print("current Start Brenta");
		}
		if(vars.doingAffori==false&&current.Emilia ==0&&vars.didBrenta==true&&vars.didAffori==false){
			vars.doingAffori=true;
			  vars.loadstop=false;
			  vars.loadstopper=false;
			  print("current Start Affori"); 
		}
		if(vars.doingInganni==false&&current.Emilia==0&&vars.didAffori==true&&vars.didInganni==false){
			vars.doingInganni=true;
			  vars.loadstop=false;
			  vars.loadstopper=false;
			   print("current Start Inganni");
		}
		if(vars.doingCadorna==false&&current.Emilia==0&&vars.didInganni==true&&vars.didCadorna==false){
			vars.doingCadorna=true;
			  vars.loadstop=false;
			  vars.loadstopper=false;
			print("current Start Cadorna");
		}
		if(vars.doingPalestro==false&&current.Emilia==0&&vars.didCadorna==true&&vars.didPalestro==false){
			vars.doingPalestro=true;
			  vars.loadstop=false;
			  vars.loadstopper=false;
			 print("current Start Palestro");
		}
		if(vars.doingBandeNere==false&&current.Emilia==0&&vars.didPalestro==true&&vars.didBandeNere==false){
			vars.doingBandeNere=true;
			  vars.loadstop=false;
			  vars.loadstopper=false;
			  print("current Start BandeNere");
		}
		if(vars.doingMissori==false&&current.Emilia==0&&vars.didBandeNere==true&&vars.didMissori==false ){
			vars.doingMissori=true;
			vars.loadstop=false;
			vars.loadstopper=false;
			print("current Start Missori");
		}
		if(vars.doingRomolo==false&&current.Emilia==0&&vars.didMissori==true&&vars.didRomolo==false){
			vars.doingRomolo=true;
			vars.loadstop=false;
			vars.loadstopper=false;
			 print("current Start Romolo");
		}
	
	}

 }
 isLoading
 {
	//This is only for Any%
	if(settings["RunSingleLevels"]==false&&settings["EndlessLevels"]==false){
	
		//When crossing the finishline
		if(current.theChosenOne==1 ){
		
				//When not already stopped
				if(vars.loadstop==false){
					// When in a Level set Pause indicator to true
					if(vars.doingBrenta==true){
						print("current pause ");
					vars.loadstopper=true;
					}
					if(vars.doingAffori==true){
					print("current pause ");
					vars.loadstopper=true;
					}
					if(vars.doingInganni==true){
					print("current pause ");
					vars.loadstopper=true;
					}
					if(vars.doingCadorna==true){
					print("current pause ");
					vars.loadstopper=true;
					}
					if(vars.doingPalestro==true){
					print("current pause ");
					vars.loadstopper=true;
					}
					if(vars.doingBandeNere==true){
					print("current pause ");
					vars.loadstopper=true;
					}
					if(vars.doingMissori==true){
					print("current pause ");
					vars.loadstopper=true;
					}
					if(vars.doingRomolo==true){
					print("current pause ");
					vars.loadstopper=true;
					}
					
				}
				
			}
			
			//Pause when loadstopper is true and unpause when loadstopper is false
			return vars.loadstopper;
		}
	
 
	}
 reset{
	//Endless Mode
	if(settings["EndlessLevels"]==true){
		if(vars.canresetemilia==true&&current.Emilia==0){
			vars.canresetemilia=false;
			print("current restart emilia");
			return true;
		}
		if(current.gamestate==0){
			vars.canresetemilia=false;
			print("current restart emilia menu");
			return true;
		}
	}
	//single Levels
	if(settings["RunSingleLevels"]==true){
			
			//When at spawn of a Level
			if(current.Brenta==1||current.Emilia==0){
				
				//When ca.3 seconds are over (180/refreshrate =3) --> Player should have moved out of spawn -->if he still is in spawn he must have respawned 
				if(vars.timesincestart>180){
					print("current indiv restart level");
					
						//Reset + set running indicator to false + reset time since start
						vars.runninglevel=false;
						vars.timesincestart=0;
						return true;
				
				}
		
			}
		//when in menu
		if(current.gamestate==0 ){
			print("current indiv in menu");
			//Reset + set running indicator to false + reset time since start
			vars.runninglevel=false;
			vars.timesincestart=0;
			return true;
		}
	}
	//any%
	if(settings["RunSingleLevels"]==false&&settings["EndlessLevels"]==false){
			
			//When going to menu from Brenta
			if(vars.doingBrenta==true&&current.gamestate==0 ){
					print("current any got to menu from brenta");
					//Reset all Variables + reset
					vars.canresetBrenta=false;
					vars.didBrenta  = false;
					vars.didAffori  = false;
					vars.didInganni  = false;
					vars.didCadorna = false;
					vars.didPalestro  = false;
					vars.didBandeNere = false;
					vars.didMissori  = false;
					vars.didRomolo = false;
					
					vars.doingBrenta  = false;
					vars.doingAffori  = false;
					vars.doingInganni  = false;
					vars.doingCadorna = false;
					vars.doingPalestro  = false;
					vars.doingBandeNere = false;
					vars.doingMissori  = false;
					vars.doingRomolo = false;
					vars.loadstopper=false;
					vars.loadstop=false;
					
					return true;
				
			}
			
			//When respawning in Brenta
			if(vars.doingBrenta==true&&current.Brenta==1&&vars.canresetBrenta==true ){
			print("current any restart brenta");
					//Reset all Variables + reset
					vars.canresetBrenta=false;
					vars.didBrenta  = false;
					vars.didAffori  = false;
					vars.didInganni  = false;
					vars.didCadorna = false;
					vars.didPalestro  = false;
					vars.didBandeNere = false;
					vars.didMissori  = false;
					vars.didRomolo = false;
					
					vars.doingBrenta  = false;
					vars.doingAffori  = false;
					vars.doingInganni  = false;
					vars.doingCadorna = false;
					vars.doingPalestro  = false;
					vars.doingBandeNere = false;
					vars.doingMissori  = false;
					vars.doingRomolo = false;
					
					vars.loadstop=false;
					
					return true;
				
			}
			
			//when spawning in Brenta if you already finished it
			if(vars.doingBrenta  == true||vars.doingAffori  == true||vars.doingInganni  == true||vars.doingCadorna == true||vars.doingPalestro  == true||vars.doingBandeNere == true||vars.doingMissori  == true||vars.doingRomolo == true){
				if(current.gamestate==0 ){
						print("current any go to menu");
						//Reset all Variables + reset
						vars.canresetBrenta=false;
						vars.didBrenta  = false;
						vars.didAffori  = false;
						vars.didInganni  = false;
						vars.didCadorna = false;
						vars.didPalestro  = false;
						vars.didBandeNere = false;
						vars.didMissori  = false;
						vars.didRomolo = false;
						
						vars.doingBrenta  = false;
						vars.doingAffori  = false;
						vars.doingInganni  = false;
						vars.doingCadorna = false;
						vars.doingPalestro  = false;
						vars.doingBandeNere = false;
						vars.doingMissori  = false;
						vars.doingRomolo = false;
						
						vars.loadstop=false;
						return true;
					
				}
			}
		}
			//Any% and Individual Levels
			//When changing difficulty in menu
			if(current.difficulty!=old.difficulty){
			print("current changed difficulty");
					//Reset all Variables + reset
					vars.canresetBrenta=false;
					vars.didBrenta  = false;
					vars.didAffori  = false;
					vars.didInganni  = false;
					vars.didCadorna = false;
					vars.didPalestro  = false;
					vars.didBandeNere = false;
					vars.didMissori  = false;
					vars.didRomolo = false;
					
					vars.doingBrenta  = false;
					vars.doingAffori  = false;
					vars.doingInganni  = false;
					vars.doingCadorna = false;
					vars.doingPalestro  = false;
					vars.doingBandeNere = false;
					vars.doingMissori  = false;
					vars.doingRomolo = false;
					
					vars.loadstop=false;
					return true;
				
			}
		
 }