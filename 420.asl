state("GAME OF THE YEAR 420 BLAZE IT") {
int Ammo:"GAME OF THE YEAR 420 BLAZE IT.exe",0x00A1EF20,0x6C,0x7F8,0x7F8,0x44,0xB0;
}
init{
vars.gun = 0;
vars.pistolammo = 10;
vars.Shotgunammo = 7;
}
split{
	if(settings["ZeroAmmoSplit"]==false){
		return (current.Ammo==1);
	}
	else{
		return (current.Ammo==0);
	}
}
startup{
	//Adds the setting of Running Individual Levels
	settings.Add("ZeroAmmoSplit", false, "ZeroAmmoSplit");

}