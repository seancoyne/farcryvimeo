<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Library Selected --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfoutput>
<img src="#stobj.cdnImage#" style="max-width:100px;" class="pull-right" alt="#encodeForHtmlAttribute(stobj.title)#">
<h5>#stobj.title#</h5>
<p>#application.fc.lib.vimeoudf.xhtmlparagraphformat(stobj.teaser)#</p>
</cfoutput>

<cfsetting enablecfoutputonly="false" />