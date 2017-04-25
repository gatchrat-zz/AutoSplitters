state("simian++")
{

	int level:"simian++.exe",0x00EF83A0,0x654,0x270,0x44,0x6F8,0xC;
}


start
{

	if(current.level==1){
		return true;
		
	}
 
	
}
startup{
	
	settings.Add("any",  true, "isRunningCompleteGame");
}

init { 
 vars.running = 0;
 vars.level = 1;
}
split{
	if (settings["any"]) { 
		
			if(vars.level >6){
			vars.level = 1;
			vars.running  = 0;
				return true;
			}
		
 
	}
	else{
		if(current.level==0){
			return true;
		
		}
	}
}
update{
	if (settings["any"]) { 
		if(current.level==0 && vars.running==1){
			vars.level +=1; 
			vars.running = 0;
			print(vars.level.ToString());
		}
 
	}
}
isLoading{

	if (settings["any"]) { 
	print("levels done"+vars.level.ToString());
print("current level:"+current.level.ToString());
		if(current.level==0&&vars.level<7){
		
			vars.running = 0;
		
			
		}
		else{
			if(current.level!=0){
				vars.running = 1;
			
		
			}
		}
	}
}


