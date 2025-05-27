local t = Def.ActorFrame {}

t[#t+1] = LoadActor(GetBackgroundPath()) .. {
	InitCommand=cmd(show_background_properly)
}

if GAMESTATE:IsSideJoined(PLAYER_1) then
	t[#t+1] = Def.Sprite {
		Texture=THEME:GetPathG("", "ScreenStageInformation/StepArtist"),
		InitCommand=function(self)
			self:xy(58, SCREEN_BOTTOM-21)
			self:zoom(0.67)
		end
	}
	
	t[#t+1] = Def.BitmapText {
		Font="_myriad pro 20px",
		InitCommand=function(self)
			self:xy(58, SCREEN_BOTTOM-16)
			self:zoom(0.6)
			self:horizalign(center)
			self:wrapwidthpixels(130)
			self:vertspacing(-8)
			self:maxheight(30)
			self:maxwidth(130)
		end,
		OnCommand=function(self)
			if GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit() ~= "" then
				self:settext(GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit())
			else
				self:settext("Unknown")
			end
		end
	}


end

if GAMESTATE:IsSideJoined(PLAYER_2) then
	t[#t+1] = Def.Sprite {
		Texture=THEME:GetPathG("", "ScreenStageInformation/StepArtist"),
		InitCommand=function(self)
			self:xy(SCREEN_RIGHT-58, SCREEN_BOTTOM-21)
			self:zoom(0.67)
		end
	}
	
	t[#t+1] = Def.BitmapText {
		Font="_myriad pro 20px",
		InitCommand=function(self)
			self:xy(SCREEN_RIGHT-58, SCREEN_BOTTOM-16)
			self:zoom(0.6)
			self:horizalign(center)
			self:wrapwidthpixels(130)
			self:vertspacing(-8)
			self:maxheight(30)
			self:maxwidth(130)
		end,
		OnCommand=function(self)
			if GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit() ~= "" then
				self:settext(GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit())
			else
				self:settext("Unknown")
			end
		end
	}
	
	
end

return t


