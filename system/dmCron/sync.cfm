<cfsetting enablecfoutputonly="true" requesttimeout="600" />
<!--- @@displayname: Sync Vimeo Videos from API --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfscript>
ownvideos = application.fc.lib.vimeo.getOwnVideos(getall = true);
o = application.fapi.getContentType("vimeoVideo");
for (video in ownvideos) {
	o.saveFromAPI(video);
}
</cfscript>

<cfoutput><h1>Complete!</h1></cfoutput>

<cfsetting enablecfoutputonly="false" />