<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Teaser --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfoutput>
<img src="#stobj.cdnImage#" class="img-responsive pull-right" alt="#encodeForHtmlAttribute(stobj.title)#">
<h3>#stobj.title#</h3>
<p>#application.fc.lib.vimeoudf.xhtmlparagraphformat(stobj.teaser)#</p>
</cfoutput>


<cfsetting enablecfoutputonly="false" />