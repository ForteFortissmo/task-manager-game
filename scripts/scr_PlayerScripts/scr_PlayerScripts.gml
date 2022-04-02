function VirusFreeMovement(){
	GetInput();
	xspdActual = 0;
	yspdActual = 0;
	xspdInput = ((rKeyHold) - (lKeyHold)) * walkspd;
	yspdInput = ((dKeyHold) - (uKeyHold)) * walkspd;
	//check for if player's touching an object that moves them here
	xspdActual += xspdInput;
	yspdActual += yspdInput;
	MoveVirusObject();
}


function VirusLockedMovement(){
	
}

function MoveVirusObject(){
	//collide horizontal?
	if place_meeting(x+xspdActual,y,oWall){
		while !place_meeting(x+sign(xspdActual),y,oWall){
			x += sign(xspdActual);
		}
		xspdInput = 0;
		xspdActual = 0;
	}
	//update horizontal
	x += xspdActual;
	
	//collide vertical?
	if place_meeting(x,y+yspdActual,oWall){
		while !place_meeting(x,y+sign(yspdActual),oWall){
			y += sign(yspdActual);
		}
		yspdInput = 0;
		yspdActual = 0;
	}
	//update vertical
	y += yspdActual;
}
