component accessors = true {
	
	property userAgent;
	property accessToken;
	property baseURL;
	
	public any function init() {
		setUserAgent(application.fapi.getConfig(key = 'vimeo', name = 'userAgent', default = "FarCry Vimeo Plugin"));
		setBaseURL(application.fapi.getConfig(key = 'vimeo', name = 'baseURL', default = "https://api.vimeo.com"));
		setAccessToken(application.fapi.getConfig(key = 'vimeo', name = 'accessToken', default = ""));
	}
	
	/* public struct function me(string fields = "") {
		
		var params = [];
		
		if (len(trim(arguments.fields))) {
			arrayAppend(params, {
				type = "url",
				name = "fields",
				value = arguments.fields	
			});
		}
		
		var res = apiRequest(
			endpoint = "/me",
			method = "GET", 
			authenticated = true,
			params = params);
		
		var result = deserializeJson(res.filecontent);
		
		return result;
		
	}
	
	public array function getAlbums(
		numeric page = 1, 
		numeric per_page = 50, 
		string q = "", 
		string fields = "",
		string sort = "alphabetical", 
		string direction = "asc", 
		boolean getall = false, 
		string nextURL = "", 
		array previousResults = []) {
		
		if (!len(trim(arguments.nextURL))) {
			
			if (arguments.per_page lt 1) {
				arguments.per_page = 1;
			}
			
			if (arguments.per_page gt 50) {
				arguments.per_page = 50;
			}
			
			if (arguments.page lt 1) {
				arguments.page = 1;
			}
			
			if (!listFindNoCase("alphabetical,date,videos,duration", arguments.sort)) {
				arguments.sort = "alphabetical";
			}
			
			if (!listFindNoCase("asc,desc", arguments.direction)) {
				arguments.direction = "asc";
			}
			
			var params = [
				{ type = "url", name = "page", value = arguments.page },
				{ type = "url", name = "per_page", value = arguments.per_page },
				{ type = "url", name = "sort", value = arguments.sort },
				{ type = "url", name = "direction", value = arguments.direction }
			];
			
			if (len(trim(arguments.q))) {
				arrayAppend(params, { 
					type = "url", 
					name = "query", 
					value = arguments.q 
				});
			}
			
			if (len(trim(arguments.fields))) {
				arrayAppend(params, { 
					type = "url", 
					name = "fields", 
					value = arguments.fields
				});
			}
			
			var res = apiRequest(
				endpoint = "/me/albums", 
				method = "GET", 
				authenticated = true,
				params = params);
		
		} else {
			
			// we have the next URL, use that instead of params
			var res = apiRequest(
				endpoint = arguments.nextURL,
				method = "GET", 
				authenticated = true);
			
		}
		
		var result = deserializeJson(res.filecontent);
		
		arrayAppend(arguments.previousResults, result.data, true);
		
		// if we are getting all records and there are records left, get them
		if (arguments.getall && !isNull(result.paging.next)) {
			
			var args = {
				nextURL = result.paging.next,
				previousResults = arguments.previousResults,
				getall = true
			};
			
			return getAlbums(argumentCollection = args);
			
		}
		
		return arguments.previousResults;
		
	}
	
	public struct function getAlbum(required string id, string fields = "") {
		
		var params = [];
		
		if (len(trim(arguments.fields))) {
			arrayAppend(params, {
				type = "url",
				name = "fields",
				value = arguments.fields	
			});
		}
		
		var res = apiRequest(
			endpoint = "/me/albums/" & arguments.id,
			method = "GET", 
			authenticated = true,
			params = params);
		
		var result = deserializeJson(res.filecontent);
		
		return result;
		
	}
	
	public array function getVideosByAlbum(
		required string id,
		numeric page = 1, 
		numeric per_page = 50, 
		string q = "", 
		string fields = "",
		string sort = "manual", 
		string direction = "asc", 
		boolean getall = false, 
		string nextURL = "", 
		array previousResults = []) {
		
		if (!len(trim(arguments.nextURL))) {
			
			if (arguments.per_page lt 1) {
				arguments.per_page = 1;
			}
			
			if (arguments.per_page gt 50) {
				arguments.per_page = 50;
			}
			
			if (arguments.page lt 1) {
				arguments.page = 1;
			}
			
			if (!listFindNoCase("manual,date,alphabetical,plays,likes,comments,duration,modified_time", arguments.sort)) {
				arguments.sort = "manual";
			}
			
			if (!listFindNoCase("asc,desc", arguments.direction)) {
				arguments.direction = "asc";
			}
			
			var params = [
				{ type = "url", name = "page", value = arguments.page },
				{ type = "url", name = "per_page", value = arguments.per_page },
				{ type = "url", name = "sort", value = arguments.sort },
				{ type = "url", name = "direction", value = arguments.direction },
				{ type = "url", name = "filter", value = "embeddable" },
				{ type = "url", name = "filter_embeddable", value = "true" }
			];
			
			if (len(trim(arguments.q))) {
				arrayAppend(params, { 
					type = "url", 
					name = "query", 
					value = arguments.q 
				});
			}
			
			if (len(trim(arguments.fields))) {
				arrayAppend(params, { 
					type = "url", 
					name = "fields", 
					value = arguments.fields
				});
			}
			
			var res = apiRequest(
				endpoint = "/me/albums/" & arguments.id & "/videos", 
				method = "GET", 
				authenticated = true,
				params = params);
		
		} else {
			
			// we have the next URL, use that instead of params
			var res = apiRequest(
				endpoint = arguments.nextURL,
				method = "GET", 
				authenticated = true);
			
		}
		
		var result = deserializeJson(res.filecontent);
		
		arrayAppend(arguments.previousResults, result.data, true);
		
		// if we are getting all records and there are records left, get them
		if (arguments.getall && !isNull(result.paging.next)) {
			
			var args = {
				id = arguments.id,
				nextURL = result.paging.next,
				previousResults = arguments.previousResults,
				getall = true
			};
			
			return getVideosByAlbum(argumentCollection = args);
			
		}
		
		return arguments.previousResults;
		
	} */
	
	public array function getOwnVideos(
		numeric page = 1, 
		numeric per_page = 50, 
		string q = "", 
		string fields = "",
		string sort = "default", 
		string direction = "asc", 
		boolean getall = false, 
		string nextURL = "", 
		array previousResults = []) {
		
		if (!len(trim(arguments.nextURL))) {
			
			if (arguments.per_page lt 1) {
				arguments.per_page = 1;
			}
			
			if (arguments.per_page gt 50) {
				arguments.per_page = 50;
			}
			
			if (arguments.page lt 1) {
				arguments.page = 1;
			}
			
			if (!listFindNoCase("date,alphabetical,plays,likes,comments,duration,default,modified_time", arguments.sort)) {
				arguments.sort = "default";
			}
			
			if (!listFindNoCase("asc,desc", arguments.direction)) {
				arguments.direction = "asc";
			}
			
			var params = [
				{ type = "url", name = "page", value = arguments.page },
				{ type = "url", name = "per_page", value = arguments.per_page },
				{ type = "url", name = "sort", value = arguments.sort },
				{ type = "url", name = "direction", value = arguments.direction }
			];
			
			if (len(trim(arguments.q))) {
				arrayAppend(params, { 
					type = "url", 
					name = "query", 
					value = arguments.q 
				});
			}
			
			if (len(trim(arguments.fields))) {
				arrayAppend(params, { 
					type = "url", 
					name = "fields", 
					value = arguments.fields
				});
			}
			
			var res = apiRequest(
				endpoint = "/me/videos", 
				method = "GET", 
				authenticated = true,
				params = params);
		
		} else {
			
			// we have the next URL, use that instead of params
			var res = apiRequest(
				endpoint = arguments.nextURL,
				method = "GET", 
				authenticated = true);
			
		}
		
		var result = deserializeJson(res.filecontent);
		
		arrayAppend(arguments.previousResults, result.data, true);
		
		// if we are getting all records and there are records left, get them
		if (arguments.getall && !isNull(result.paging.next)) {
			
			var args = {
				nextURL = result.paging.next,
				previousResults = arguments.previousResults,
				getall = true
			};
			
			return getOwnVideos(argumentCollection = args);
			
		}
		
		return arguments.previousResults;
		
	}
	
	/* public struct function getVideo(required string id, string fields = "") {
		
		var params = [];
		
		if (len(trim(arguments.fields))) {
			arrayAppend(params, {
				type = "url",
				name = "fields",
				value = arguments.fields	
			});
		}
		
		var res = apiRequest(
			endpoint = "/videos/" & arguments.id,
			method = "GET", 
			authenticated = true,
			params = params);
		
		var result = deserializeJson(res.filecontent);
		
		return result;
		
	} */
	
	public string function parseApiDate(required string str) {
		
		var date = listFirst(arguments.str, "T");
		var time = listFirst(listLast(arguments.str, "T"), "+");
		
		var y = listGetAt(date, 1, "-");
		var m = listGetAt(date, 2, "-");
		var d = listGetAt(date, 3, "-");
		
		var h = listGetAt(time, 1, ":");
		var minute = listGetAt(time, 2, ":");
		var s = listGetAt(time, 3, ":");
		
		var result = createDateTime(y,m,d,h,minute,s);
		
		var tz = getTimeZoneInfo();
		
		return dateAdd('s', tz.utcTotalOffset, result);
		
	}
	
	private any function apiRequest(required string endpoint, string method = "GET", boolean authenticated = true, array params = []) {
		
		var httpService = new http();
		httpService.setUserAgent(getUserAgent());
		httpService.setURL(getBaseURL() & arguments.endpoint);
		httpService.setMethod(arguments.method);
		
		if (arguments.authenticated) {
			httpService.addParam(type = "header", name = "Authorization", value = "bearer " & getAccessToken());
		}
		
		for (var param in arguments.params) {
			httpService.addParam(argumentCollection = param);
		}
		
		return httpService.send().getPrefix();
		
	}
	
}