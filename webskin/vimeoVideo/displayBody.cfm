<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Body --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/container" prefix="con" />

<con:container label="#stobj.objectid#_beforeBody" desc="Before Body" />

<cfoutput>
<div class="embed-responsive embed-responsive-16by9">#stobj.embedhtml#</div>
<cfif len(trim(stobj.teaser))><p>#application.fc.lib.vimeoudf.xhtmlparagraphformat(stobj.teaser)#</p></cfif>
</cfoutput>

<con:container label="#stobj.objectid#_afterBody" desc="After Body" />

<cfsetting enablecfoutputonly="false" />