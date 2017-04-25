state("IWBTO")
{
	//0 in menu 1 in game
	int menu: "IWBTO.exe",0x002D2FA8,0x558;
	//1 playing 2 won
	int win: "IWBTO.exe",0x0018F140,0x668,0x14,0x0,0x5ec,0x7f8;
}


start
{
	if(current.menu==1){
		return true;
	}
}

split{
	if(current.win==2){
		return true;
	}
}
reset {
	if(current.menu==0){
		return true;
		
	}
 }