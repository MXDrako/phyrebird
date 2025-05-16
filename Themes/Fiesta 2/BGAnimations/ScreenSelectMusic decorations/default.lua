local t = Def.ActorFrame {
	OnCommand=cmd(stoptweening;SetDrawByZPosition,true;vanishpoint,SCREEN_CENTER_X,174;fov,60);
}

collectgarbage();


t[#t+1] = LoadActor("_musicwheel")..{}

-------------------------------------GENERAL------------------------------------------------------
--------------------------------------------------------------------------------------------------
cx = SCREEN_CENTER_X;
cy = SCREEN_CENTER_Y;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--PREVIEW

t[#t+1] = LoadActor("_preview")..{
	InitCommand=cmd(x,cx;draworder,6);
	OnCommand=cmd(stoptweening;y,145;sleep,.1;linear,.2;y,175);
	StartSelectingSongMessageCommand=cmd(stoptweening;y,145;diffusealpha,0;sleep,.25;linear,.1;y,175;diffusealpha,1);
	GoBackSelectingGroupMessageCommand=cmd(stoptweening;y,175;diffusealpha,1;sleep,.2;linear,.1;y,145;diffusealpha,0);
	OffCommand=cmd(stoptweening;y,175;diffusealpha,1;sleep,.2;linear,.1;y,145;diffusealpha,0);
	TimerOutSelectingSongCommand=cmd(playcommand,'Off');
}

if GAMESTATE:IsSideJoined( PLAYER_1 ) then
	t[#t+1] = GetHighScoresFrame( PLAYER_1, false )..{
		InitCommand=cmd(x,cx-270;y,SCREEN_BOTTOM-105);
	}
--	t[#t+1] = GetPHighScoresFrame( PLAYER_1, false )..{
--		InitCommand=cmd(x,cx-320;y,SCREEN_BOTTOM-85);
--	}

	t[#t+1] = LoadFont("SongTitle")..{
		UpdateVisibilityCommand=function(self)
			local stepartist = GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit();
			local bytext = "";
			if string.len(stepartist) >= 1 then bytext = "by" end;
			(cmd(settext,bytext;x,cx-90;y,SCREEN_BOTTOM-22;zoom,.5;visible,true))(self);
		end;
		StartSelectingStepsMessageCommand=cmd(stoptweening;playcommand,'UpdateVisibility');
		ChangeStepsMessageCommand=cmd(stoptweening;playcommand,'UpdateVisibility');
		GoBackSelectingSongMessageCommand=cmd(stoptweening;visible,false);
		OffCommand=cmd(stoptweening;visible,false);
	};
	t[#t+1] = LoadFont("SongTitle")..{
		StartSelectingStepsMessageCommand=cmd(stoptweening;playcommand,'FetchAuthor');
		FetchAuthorCommand=function(self)
			local stepartist = GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit();
			if string.len(stepartist) >= 38 then
				stepartist = string.sub(text,1,35);
				stepartist = sterpartist .. "...";
			end;
			self:settext( stepartist );
			self:maxwidth(216);
			(cmd(x,cx-90;y,SCREEN_BOTTOM-12;zoom,.5;visible,true))(self);
		end;
		ChangeStepsMessageCommand=cmd(stoptweening;playcommand,'FetchAuthor');
		GoBackSelectingSongMessageCommand=cmd(stoptweening;visible,false);
		OffCommand=cmd(stoptweening;visible,false);
	};
end;

if GAMESTATE:IsSideJoined( PLAYER_2 ) then
	t[#t+1] = GetHighScoresFrame( PLAYER_2, false )..{
		InitCommand=cmd(x,cx+270;y,SCREEN_BOTTOM-105);
	}
--	t[#t+1] = GetPHighScoresFrame( PLAYER_2, false )..{
--		InitCommand=cmd(x,cx+320;y,SCREEN_BOTTOM-85);
--	}
	t[#t+1] = LoadFont("SongTitle")..{
		UpdateVisibilityCommand=function(self)
			local stepartist = GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit();
			local bytext = "";
			if string.len(stepartist) >= 1 then bytext = "by" end;
			(cmd(settext,bytext;x,cx+90;y,SCREEN_BOTTOM-22;zoom,.5;visible,true))(self);
		end;
		StartSelectingStepsMessageCommand=cmd(stoptweening;playcommand,'UpdateVisibility');
		ChangeStepsMessageCommand=cmd(stoptweening;playcommand,'UpdateVisibility');
		GoBackSelectingSongMessageCommand=cmd(stoptweening;visible,false);
		OffCommand=cmd(stoptweening;visible,false);
	};
	t[#t+1] = LoadFont("SongTitle")..{
		StartSelectingStepsMessageCommand=cmd(stoptweening;playcommand,'FetchAuthor');
		FetchAuthorCommand=function(self)
			local stepartist = GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit();
			if string.len(stepartist) >= 38 then
				stepartist = string.sub(text,1,35);
				stepartist = sterpartist .. "...";
			end;
			self:settext( stepartist );
			self:maxwidth(216);
			(cmd(x,cx+90;y,SCREEN_BOTTOM-12;zoom,.5;visible,true))(self);
		end;
		ChangeStepsMessageCommand=cmd(stoptweening;playcommand,'FetchAuthor');
		GoBackSelectingSongMessageCommand=cmd(stoptweening;visible,false);
		OffCommand=cmd(stoptweening;visible,false);
	};
end;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--GROUP WHEEL
t[#t+1] = LoadActor("_groupwheel")..{
	OnCommand=cmd(stoptweening;draworder,10;visible,true);
	GoBackSelectingGroupMessageCommand=cmd(stoptweening;visible,true);
	StartSelectingSongMessageCommand=cmd(stoptweening;sleep,.6;queuecommand,'Hide');
	HideCommand=cmd(visible,false);
	TimerOutSelectingSongCommand=cmd(visible,false);
	TimerOutSelectingGroupCommand=cmd(playcommand,'StartSelectingSong');
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--FULL MODE THINGS

t[#t+1] = LoadActor("_diff_FM1P.lua")..{
	OnCommand=cmd(draworder,15;stoptweening;x,cx-500;y,386);
	StartSelectingStepsMessageCommand=cmd(stoptweening;playcommand,"ShowUp";x,cx-500;linear,.3;x,cx-124;queuecommand,'HideOffCommand'); 	
	GoBackSelectingSongMessageCommand=cmd(stoptweening;playcommand,"Hide";x,cx-124;sleep,.2;linear,.1;x,cx-500;queuecommand,'HideOnCommand');
	OffCommand=cmd(stoptweening;diffusealpha,0);
	GoFullModeMessageCommand=cmd(stoptweening;x,cx-124);
	HideOffCommand=cmd(visible,false);
	HideOnCommand=cmd(visible,true);
}

t[#t+1] = LoadActor("_diff_FM2P.lua")..{
	OnCommand=cmd(draworder,15;stoptweening;x,cx+500;y,386);
	StartSelectingStepsMessageCommand=cmd(stoptweening;playcommand,"ShowUp";x,cx+500;linear,.3;x,cx+124;queuecommand,'HideOffCommand'); 	
	GoBackSelectingSongMessageCommand=cmd(stoptweening;playcommand,"Hide";x,cx+124;sleep,.2;linear,.1;x,cx+500;queuecommand,'HideOnCommand');
	OffCommand=cmd(stoptweening;diffusealpha,0);
	GoFullModeMessageCommand=cmd(stoptweening;x,cx+124);
	HideOffCommand=cmd(visible,false);
	HideOnCommand=cmd(visible,true);
}

t[#t+1] = LoadActor("_diffbar_full")..{
	InitCommand=cmd(draworder,16;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-58;zoom,.48); --> Quando inicia a cena
	OnCommand=cmd(stoptweening;diffusealpha,0;x,cx-800;sleep,.45;linear,.15;x,cx;diffusealpha,1); --> Animação inicial
	StartSelectingSongMessageCommand=cmd(stoptweening;diffusealpha,0;x,cx-800;sleep,.25;linear,.15;diffusealpha,1;x,cx); --> Ao voltar do GroupWheel
	GoBackSelectingGroupMessageCommand=cmd(stoptweening;linear,.15;x,cx-800;diffusealpha,0); --> Ao entrar no GroupWheel
	StartSelectingStepsMessageCommand=cmd(stoptweening;diffusealpha,1;y,SCREEN_BOTTOM-58;sleep,.1;linear,.2;y,305;zoom,.53); --> Ao selecionar a música
	GoBackSelectingSongMessageCommand=cmd(stoptweening;sleep,.1;linear,.2;y,SCREEN_BOTTOM-58;zoom,.48); --> Ao cancelar a seleção da música
	OffCommand=cmd(stoptweening;diffusealpha,1;sleep,.05;linear,.15;x,cx-800;diffusealpha,0);
	TimerOutSelectingSongCommand=cmd(stoptweening;diffusealpha,1;sleep,.05;linear,.25;y,305;diffusealpha,0);
}

--SCORE GRADES
t[#t+1] = LoadActor("_grades") .. {}

--SCORE PLATES
t[#t+1] = LoadActor("_plates") .. {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--PRESS CENTER STEP
t[#t+1] = SimplePlatPiu(cx,cy+80)..{ 
	OnCommand=cmd(visible,false;draworder,100);
	StepsChosenMessageCommand=function(self,params)
		if GAMESTATE:GetNumSidesJoined() == 1 then
			(cmd(stoptweening;visible,true))(self);
		else
			local screen = SCREENMAN:GetTopScreen();
			if screen:IsPlayerReady(PLAYER_1) and screen:IsPlayerReady(PLAYER_2) then
				(cmd(stoptweening;visible,true))(self);
			else
				(cmd(stoptweening;visible,false))(self);
			end;
		end;
		
	end;
	StepsPreselectedCancelledMessageCommand=cmd(stoptweening;visible,false);
	GoBackSelectingSongMessageCommand=cmd(stoptweening;visible,false);
	OffCommand=cmd(stoptweening;visible,false);
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--CHANNEL, CATEGORY
-- t[#t+1] = LoadActor("_stages")..{
-- 	TimerOutSelectingSongCommand=cmd(playcommand,'Off');
-- 	TimerOutSelectingGroupCommand=cmd(playcommand,'Off');
-- }

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--ARROWS
t[#t+1] = LoadActor("_arrows")..{
	TimerOutSelectingSongCommand=cmd(playcommand,'Off');
	TimerOutSelectingGroupCommand=cmd(playcommand,'Off');
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--JOIN MESSAGES
--[[
if not GAMESTATE:IsSideJoined(PLAYER_1) then
t[#t+1] = LoadActor( THEME:GetPathG("","Messages/"..GetLanguageText().."_join.png") )..{
	InitCommand=cmd(draworder,20;x,SCREEN_LEFT+100;y,SCREEN_BOTTOM-120;diffusealpha,0;decelerate,.2;x,SCREEN_LEFT+160;diffusealpha,1;sleep,6;decelerate,.2;x,SCREEN_LEFT-50;diffusealpha,0);
	TimerOutSelectingSongCommand=cmd(playcommand,'Off');
}
end;

if not GAMESTATE:IsSideJoined(PLAYER_2) then
t[#t+1] = LoadActor( THEME:GetPathG("","Messages/"..GetLanguageText().."_join.png") )..{
	InitCommand=cmd(draworder,20;x,SCREEN_RIGHT-100;y,SCREEN_BOTTOM-120;diffusealpha,0;decelerate,.2;x,SCREEN_RIGHT-160;diffusealpha,1;sleep,6;decelerate,.2;x,SCREEN_RIGHT+50;diffusealpha,0);
	TimerOutSelectingSongCommand=cmd(playcommand,'Off');
}
end;
]]
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--TIMER
-- DrawOrder = 1
--[[t[#t+1] = LoadActor("_timer")..{
	OnCommand=cmd(x,cx;y,-10;decelerate,.1;y,10;decelerate,.1;y,2);
	OffCommand=cmd(x,cx;y,0;decelerate,.1;y,10;decelerate,.1;y,-58);
	TimerOutSelectingSongCommand=cmd(playcommand,'Off');
	TimerOutSelectingGroupCommand=cmd(playcommand,'Off');
};--]]

t[#t+1] = LoadActor(THEME:GetPathG("","Common Resources/TIMER_MASK.png") )..{
	OnCommand=cmd(zoom,0.05;x,cx;y,22;play;MaskSource);
};

t[#t+1] = LoadActor(THEME:GetPathG("","Common Resources/TIMER_FRAME.mpg") )..{
	OnCommand=cmd(zoom,0.05;x,cx;y,22;play;MaskDest);
};

--loading twice to speed up the animation (exploiting an ffmpeg bug)
t[#t+1] = LoadActor(THEME:GetPathG("","Common Resources/TIMER_FRAME.mpg") )..{
	OnCommand=cmd(zoom,0.05;x,cx;y,22;play;MaskDest);
};


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+90;diffusealpha,0;zoom,.7);
	GoBackSelectingGroupMessageCommand=cmd(stoptweening;diffusealpha,0;sleep,.3;linear,.2;diffusealpha,1;sleep,2;linear,.2;diffusealpha,0);
	StartSelectingSongMessageCommand=cmd(stoptweening;linear,.2;diffusealpha,0);
	children = {
		LoadActor(THEME:GetPathG("","Messages/back.png"));
		LoadActor(THEME:GetPathG("","Messages/back_glow.png"))..{
			InitCommand=cmd(blend,"BlendMode_Add");
			OnCommand=cmd(diffusealpha,.2);
		};
		LoadActor(THEME:GetPathG("","Messages/goback_"..GetLanguageText()..".png"))..{
			OnCommand=cmd(zoom,.47);
		};
	};
};

t[#t+1] = LoadActor( THEME:GetPathS("","Sounds/ST_BGM (loop)") )..{
	OnCommand=cmd(stop);
	GoBackSelectingGroupMessageCommand=cmd(stoptweening;play);
	StartSelectingSongMessageCommand=cmd(stoptweening;stop);
	PlayerJoinedMessageCommand=cmd(stoptweening;stop);
	OffCommand=cmd(stoptweening;stop);
}

return t
--code by xMAx