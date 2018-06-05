state("GAME OF THE YEAR 420 BLAZE IT") {
int Ammo:"GAME OF THE YEAR 420 BLAZE IT.exe",0x00A1EF20,0x6C,0x7F8,0x7F8,0x44,0xB0;
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
	settings.Add("ZeroAmmoSplit", false, "ZeroAmmoSplit");

}
start{
return current.Ammo ==10;

}