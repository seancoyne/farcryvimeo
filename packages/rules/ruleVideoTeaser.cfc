component extends = "farcry.core.packages.rules.rules" displayname = "Vimeo Videos: Video Teaser" hint = "Displays a video teaser on the page" {
	
	property ftSeq = 110 ftFieldset = "Video Teaser" ftLabel = "Video" name = "video" type = "uuid" ftType = "uuid" ftJoin = "vimeoVideo" ftAllowCreate = false ftAllowEdit = false;
	
}