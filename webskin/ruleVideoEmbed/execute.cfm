<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Execute --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfscript>
stVideo = application.fapi.getContentObject(typename = "vimeoVideo", objectid = stobj.video);
</cfscript>

<cfoutput>
<cfif stobj.bShowTitle><h2>#stVideo.title#</h2></cfif>
<div class="embed-responsive embed-responsive-16by9">#stVideo.embedhtml#</div>
<cfif stobj.bShowTeaser and len(trim(stVideo.teaser))><p>#application.fc.lib.vimeoudf.xhtmlparagraphformat(stVideo.teaser)#</p></cfif>
</cfoutput>

<cfsetting enablecfoutputonly="false" />