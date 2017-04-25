state("TheGraveyard")
{
	//1 in menu 0 in game
	byte menu: "TheGraveyard.exe",0x403EC4;
	int running: "TheGraveyard.exe",0x00402C88,0x18,0x0,0xb8,0x70;
}

split{
	if(current.menu==1){
		return true;
	}
}
start{
	if(current.running!=0){
		return true;
	}
	}
init{
	refreshRate = 60;
}
