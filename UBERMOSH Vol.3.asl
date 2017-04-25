state("UBERMOSH vol3")
{
	int kills: "UBERMOSH vol3.exe",0x00015E68,0xC,0x60C,0x164,0x4,0x414;
	int menu: "UBERMOSH vol3.exe",0x385F70;
}



start{
	if(current.menu!=0){
		vars.s1=0;
		vars.s2=0;
		vars.s3=0;
		vars.s4=0;
		vars.s5=0;
		vars.s6=0;
		return true;
	}
}
split{
	if(current.kills>=1079574528){
		if(vars.s1==0){
			vars.s1=1;
			return true;
		}
		
	}
	if(current.kills>=1081032704){
		if(vars.s2==0){
			vars.s2=1;
			return true;
		}
		
	}
	if(current.kills>=1082081280){
		if(vars.s3==0){
			vars.s3=1;
			return true;
		}
		
	}
	if(current.kills>=1083129856){
		if(vars.s4==0){
			vars.s4=1;
			return true;
		}
		
	}
	if(current.kills>=1083666432){
		if(vars.s5==0){
			vars.s5=1;
			return true;
		}
		
	}
	if(current.kills>=1083973632){
		if(vars.s6==0){
			vars.s6=1;
			return true;
		}
		
	}

}
init{
	vars.s1=0;
	vars.s2=0;
	vars.s3=0;
	vars.s4=0;
	vars.s5=0;
	vars.s6=0;
}