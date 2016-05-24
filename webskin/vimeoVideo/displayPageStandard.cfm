<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Standard Page --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<skin:view stobject="#stobj#" webskin="displayHeaderStandard" />

<cfoutput>
<h1>#stobj.title#</h1>
</cfoutput>

<skin:view stobject="#stobj#" webskin="displayBody" />

<skin:view stobject="#stobj#" webskin="displayFooterStandard" />

<cfsetting enablecfoutputonly="false" />