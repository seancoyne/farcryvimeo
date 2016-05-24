component extends = "farcry.core.packages.types.types" displayname = "Video" hint = "Manages videos from the Vimeo video hosting service.  These are automatically managed via a scheduled task and the Vimeo API" bFriendly = true fuAlias = "video" {
	
	property ftSeq = 110 ftFieldset = "Details" ftLabel = "Title" name = "title" type = "nstring" ftType = "string" required = true bLabel = true;
	property ftSeq = 120 ftFieldset = "Details" ftLabel = "Teaser" name = "teaser" type = "longchar" ftType = "longchar" required = false;
	property ftSeq = 130 ftFieldset = "Details" ftLabel = "Duration" name = "duration" type = "nstring" ftType = "nstring" required = false;
	
	property ftSeq = 210 ftFieldset = "API Metadata" ftLabel = "ID" name = "id" type = "nstring" ftType = "string" default = "" ftDefault = "" required = false;
	property ftSeq = 220 ftFieldset = "API Metadata" ftLabel = "Link" name = "link" type = "nstring" ftType = "url" default = "" ftDefault = "" required = false;
	property ftSeq = 210 ftFieldset = "API Metadata" ftLabel = "Embed HTML" name = "embedHTML" type = "longchar" ftType = "longchar" default = "" ftDefault = "" required = false;
	
	property ftSeq = 310 ftFieldset = "Images" ftLabel = "CDN Image" name = "cdnImage" type = "nstring" ftType = "imageURL" default = "" ftDefault = "" required = false ftThumbnailSize = 100;
	property ftSeq = 320 ftFieldset = "Images" ftLabel = "CDN Image (w/ Play Button)" name = "cdnImageWithPlayButton" type = "nstring" ftType = "imageURL" default = "" ftDefault = "" required = false ftThumbnailSize = 100;
	
	public struct function saveFromAPI(required struct video) {
		
		var st = findVideo(arguments.video);
		
		return saveVideo(st);
		
	}	
	
	public struct function saveVideo(required struct stobj) {
		
		var st = beforeSave(arguments.stobj, {});
		
		if (structKeyExists(st, "objectid")) {
			return setData(st);
		} else {
			var saveResult = createData(st);
			return afterSave(getData(saveResult.objectid));
		}
		
	}
	
	public struct function findVideo(required struct video) {
		
		// parse out the ID value
		var id = getIdForVideo(arguments.video);
		
		// find matching records
		var q = application.fapi.getContentObjects(typename = "vimeoVideo", lProperties = "objectid", id_eq = id, orderby = "datetimecreated desc");
		
		// if found, return the first match
		if (q.recordcount) {
			return getData(q.objectid[1]);
		}
		
		// we didn't find it, return a populated video
		return populate(arguments.video);
		
	}
	
	public struct function populate(required struct video) {
		
		var images = findIdealImages(arguments.video);
		
		return {
			title = arguments.video.name,
			teaser = ((isnull(arguments.video.description)) ? "" : arguments.video.description),
			duration = ((isnull(arguments.video.duration)) ? "" : arguments.video.duration),
			id = getIdForVideo(arguments.video),
			link = arguments.video.link,
			embedhtml = arguments.video.embed.html,
			label = arguments.video.name,
			datetimecreated = application.fc.lib.vimeo.parseApiDate(arguments.video.created_time),
			datetimelastupdated = application.fc.lib.vimeo.parseApiDate(arguments.video.modified_time),
			cdnImage = images.cdn,
			cdnImageWithPlayButton = images.cdnWithPlayButton
		};		
		
	}
	
	public struct function findIdealImages(required struct video) {
		
		// finds the largest image available from Vimeo's CDN
		
		var images = {
			cdn = "",
			cdnWithPlayButton = ""
		};
		
		var maxWidth = 0;
		
		for (var pic in arguments.video.pictures.sizes) {
			if (pic.width > maxWidth) {
				images.cdn = pic.link;
				images.cdnWithPlayButton = pic.link_with_play_button;
			}
		}
		
		return images;
		
	}
	
	public string function getIdForVideo(required struct video) {
		return listlast(arguments.video.link, "/");
	}
	
}