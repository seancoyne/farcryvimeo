<cfsetting enablecfoutputonly="true" requesttimeout="600" />
<!--- @@displayname: Webtop Body --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<cfif structKeyExists(form, "doit")>
<cfscript>
ownvideos = application.fc.lib.vimeo.getOwnVideos(getall = true);
o = application.fapi.getContentType("vimeoVideo");
for (video in ownvideos) {
	if (video.status eq "available") {
		o.saveFromAPI(video);
	}
}
</cfscript>

<cfoutput><h3>Sync Complete!</h3></cfoutput>
</cfif>

<cfoutput>
<p>Syncing from the API will take a while</p>
<form action="" method="post">
	<input type="hidden" value="1" name="doit" />
	<button type="submit" class="btn btn-primary">Sync Videos</button>
</form>
</cfoutput>

<cfsetting enablecfoutputonly="false" />