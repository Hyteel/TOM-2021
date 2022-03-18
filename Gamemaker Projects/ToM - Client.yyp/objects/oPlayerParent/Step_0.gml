#macro GetFrame CurrentAnimation[3][CurrentFrame]

#region Oldcode
/*
//NEW MOVEMENT
if (CurrentFrame >= CurrentAnimation[|0]) 
	{ 
	if (CurrentAnimation[|0] == ActiveCommand)
		{
		if (ActiveCommand != 0) 
			{
			CurrentFrame = 0;
			}
		}
	else
		{
		ds_list_copy(CurrentAnimation, scGetAnimProp(ActiveCommand)); 
		CurrentFrame = 0;
		if (CurrentAnimation[|4]) 
			{ 
			if ((x > Id.x) && !(CurrentAnimation[|10]) || (x < Id.x) && (CurrentAnimation[|10])) { CurrentAnimationFrame = CurrentAnimation[|11]; }
			else { CurrentAnimationFrame = CurrentAnimation[|7]; }
			}
		else 
			{ 
			if ((x < Id.x) && (CurrentAnimation[|13])) || ((x > Id.x) && !(CurrentAnimation[|13])) {CurrentAnimationFrame = CurrentAnimation[|14]; }
			else { CurrentAnimationFrame = CurrentAnimation[|11];}
			}
		}
	}


var Timer = get_timer();

if (Timer > SlowDownVar + 100000)
	{
	SlowDownVar = Timer
	if (CurrentAnimation[|1] != 0)
		{
		if (CurrentAnimation[|3]) //Simplified
			{
			if !(CurrentAnimation[|4]) //Combat
				{
				show_debug_message("COMBAT");
				if (CurrentAnimation[|12]) //If directional attack
					{
					if ((x > Id.x) && !(CurrentAnimation[|13])) //Right of OtP moving right
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|15]) {CurrentAnimationFrame = CurrentAnimation[|14]; }
						else 
							{ 
							CurrentAnimationFrame += 1; 
							scHitscan(CurrentAnimation, 0); 
							} 
						}
					else if ((x < Id.x) && (CurrentAnimation[|13])) //Left of OtP moving left
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|15]) {CurrentAnimationFrame = CurrentAnimation[|14]; }
						else 
							{ 
							CurrentAnimationFrame += 1;
							scHitscan(CurrentAnimation, 1); 
							} 
						}
					else //Moving in destined direction
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|12]) {CurrentAnimationFrame = CurrentAnimation[|11]; }
						else { CurrentAnimationFrame += 1; }
						if (CurrentAnimation[|13]) { scHitscan(CurrentAnimation, 0); }
						else { scHitscan(CurrentAnimation, 1); }
						}
					}
				else
					{
					if (CurrentAnimationFrame >= CurrentAnimation[|12]) {CurrentAnimationFrame = CurrentAnimation[|11]; }
					else { CurrentAnimationFrame += 1; } 
					if (CurrentAnimation[|13]) { scHitscan(CurrentAnimation, 0); }
					else { scHitscan(CurrentAnimation, 1); }
					}
				}
			else
				{
				var Xval = CurrentAnimation[|5]/CurrentAnimation[|0];
				var Yval = CurrentAnimation[|6]/CurrentAnimation[|0];
		
				if !(scCollisionCheck("X", Xval)) { x += Xval; }
				if !(scCollisionCheck("Y", Yval)) { y += Yval; }
		
				if (CurrentAnimation[|9])
					{
					if ((x > Id.x) && !(CurrentAnimation[|10])) //Right of OtP moving right
						{
						if ((CurrentAnimationFrame >= CurrentAnimation[|12]) || (CurrentAnimationFrame == undefined)) {CurrentAnimationFrame = CurrentAnimation[|11]; }
						else 
							{ 
							CurrentAnimationFrame += 1; 
							} 
						}
					else if ((x < Id.x) && (CurrentAnimation[|10])) //Left of OtP moving left
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|12]) {CurrentAnimationFrame = CurrentAnimation[|11]; }
						else 
							{ 
							CurrentAnimationFrame += 1; 
							} 
						}
					else //Moving in destined direction
						{
						if (CurrentAnimationFrame >= CurrentAnimation[|8]) {CurrentAnimationFrame = CurrentAnimation[|7]; }
						else { CurrentAnimationFrame += 1; } 
						}
					}
				else
					{
					if (CurrentAnimationFrame >= CurrentAnimation[|8]) {CurrentAnimationFrame = CurrentAnimation[|7]; }
					else { CurrentAnimationFrame += 1; } 
					}
				}
			}
		
		image_index = CurrentAnimationFrame;
		CurrentFrame += 1;
		}
	else
		{
		image_index = 0;
		}
	}

*/
#endregion

//New Movement #2
var TimerAtStart = get_timer();

//Animation Start
//show_debug_message(string(CurrentFrame) + " : " + string(CurrentAnimation[1]));
/*var File = file_text_open_append(working_directory + "\Inputs" + string(BasicId) + string(global.InstMain.Identification) + "CombinedInfo" + ".txt");
var StringToWrite = string(get_timer() +  global.InstMain.ConnectedTimeDifference) + " : " + string(CurrentFrame) + " : " + string(CurrentAnimation[1]) + " : " + string(ActiveCommand) + " : " + string(CurrentAnimation[0]) + "\n";
file_text_write_string(File, StringToWrite);
file_text_close(File);*/

//show_debug_message(string(CurrentFrame) + " " + string(CurrentAnimation[1]));
//if (CurrentFrame >= CurrentAnimation[1])
if (TimerAtStart > AnimTime)
	{ 
	NoGrav = false;
	AttackHit = false;
	
	if (CurrentAnimation[0] == ActiveCommand)
		{	
		CurrentFrame = 0;	
		}
	else
		{
		CurrentFrame = 0;
		if (CurrentAnimation[0] != 0) 
			{ 
				LastAnim = CurrentAnimation[0];
			}
		CurrentAnimation = scGetAnimProp(ActiveCommand); 
		}
		
	if !(HasSentRequest)
		{
		buffer_seek(global.ClientBuffer, buffer_seek_start, 0);
		buffer_write(global.ClientBuffer, buffer_u8, Network.SendRequestInput);
		buffer_write(global.ClientBuffer, buffer_u8, BasicId);
		network_send_packet(global.ClientSocket, global.ClientBuffer, buffer_tell(global.ClientBuffer));
		HasSentRequest = true;
		}
		
	if (CurrentAnimation[0] != 0)
		{
			AnimTime = NextAnimTime + 250000;
			NextAnimTime = AnimTime;
			//var AnimTimeDifference = AnimTime - TimerAtStart;
			//x = PosAtEndOfAnimX;
			
			//if !(scCollisionCheck("X", PosAtEndOfAnimX)) { x += PosAtEndOfAnimX; }
			//if !(scCollisionCheck("Y", CombinedYval)) { y += CombinedYval; }
			
			//PosAtEndOfAnimX = (AnimTimeDifference*CurrentAnimation[4])/1000000;
		}
	}


//Animation
//show_debug_message(NextFrameTime);
if (TimerAtStart > NextFrameTime) 
	{
	if (CurrentAnimation[0] == 0)
		{
		image_index = 0;
		}
	else
		{
		if (x < oOtPlayer.x) { image_index = GetFrame[1]; }
		else { image_index = GetFrame[0]; }	
		
		if ((CurrentAnimation[2] == 1) && !(AttackHit)) //Combat
			{
			if (x < oOtPlayer.x) { if (GetFrame[4]) { scHitscan(1, GetFrame[5], GetFrame[6], GetFrame[7], GetFrame[8], GetFrame[9], GetFrame[10]); }} //Attacking Right
			else { if (GetFrame[4]) { scHitscan(-1, GetFrame[5], GetFrame[6], GetFrame[7], GetFrame[8], GetFrame[9], GetFrame[10]); }}
			}
		}
	if (CurrentFrame + 1 > CurrentAnimation[1] - 1) {CurrentFrame = 0}
	else { CurrentFrame += 1;}
	NextFrameTime = TimerAtStart + TimeBetweenFrames;
	}
	

//Movement
if !((CurrentAnimation[4] == 0) && (CurrentAnimation[5] == 0))
	{
	var FrameSize = array_length(CurrentAnimation[3]);
	if (CurrentFrame <= FrameSize)
		{
		var Xval = CurrentAnimation[4];
		var Yval = CurrentAnimation[5];
		
		var DT = delta_time/1000000;
		var CombinedXval = Xval*DT;
		var CombinedYval = Yval*DT;
		
		if !(scCollisionCheck("X", CombinedXval)) { x += CombinedXval; }
		if !(scCollisionCheck("Y", CombinedYval)) { y += CombinedYval; }
		}
	}

//Gravity
if (!(scCollisionCheck("Y", Gravity)) && !(NoGrav))
	{ 
	y += Gravity; 
	if (Gravity < MaxGravity) { Gravity += GravityAcceleration; }
	}
else
	{
	Gravity = BaseGravity;
	}


