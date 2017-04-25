state("it's always monday")
{
	
	int playing: "it's always monday.exe",0xFA8021;
	float test:"it's always monday.exe",0x00F9A3B8,0x348,0xF0,0x0,0x8C,0x28C;
}

startup{
	settings.Add("NoSkip", true, "Run the No Skip Category");
}
start
{
	if(current.playing==1){
		if(settings["NoSkip"]){
	
			return true;
		}
	}
	if(current.test>1.7 &&current.test<1.8){
		if(!settings["NoSkip"]){
	
			return true;
		}
	}
}

split{
	if(current.playing==0){
		if(settings["NoSkip"]){
	
			return true;
		}
	}
	if(current.test<-10){
		if(!settings["NoSkip"]){
	
			return true;
		}
	}
}

