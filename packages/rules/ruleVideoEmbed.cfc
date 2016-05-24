component extends = "farcry.core.packages.rules.rules" displayname = "Vimeo Videos: Video Embed" hint = "Embeds a video on the page" {
	
	property ftSeq = 110 ftFieldset = "Video Embed" ftLabel = "Video" name = "video" type = "uuid" ftType = "uuid" ftJoin = "vimeoVideo" ftAllowCreate = false ftAllowEdit = false;
	property ftSeq = 120 ftFieldset = "Video Embed" ftLabel = "Show Title?" name = "bShowTitle" type = "boolean" ftType = "boolean" default = 0 ftDefault = 0 ftHint = "Show the title above the embedded video?";
	property ftSeq = 130 ftFieldset = "Video Embed" ftLabel = "Show Teaser?" name = "bShowTeaser" type = "boolean" ftType = "boolean" default = 0 ftDefault = 0 ftHint = "Show the teaser below the embedded video?";
	
}