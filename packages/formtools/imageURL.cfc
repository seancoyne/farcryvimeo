<cfcomponent name="Image URL" extends="farcry.core.packages.formtools.URL" displayname="Image URL" hint="Field component to liase with all URLs for Image assets"> 
	
	<cffunction name="display" access="public" output="false" returntype="string" hint="This will return a string of formatted HTML text to display. Activates URL if recognised.">
		<cfargument name="typename" required="true" type="string" hint="The name of the type that this field is part of.">
		<cfargument name="stObject" required="true" type="struct" hint="The object of the record that this field is part of.">
		<cfargument name="stMetadata" required="true" type="struct" hint="This is the metadata that is either setup as part of the type.cfc or overridden when calling ft:object by using the stMetadata argument.">
		<cfargument name="fieldname" required="true" type="string" hint="This is the name that will be used for the form field. It includes the prefix that will be used by ft:processform.">

		<cfset var html = "" />
		
		<cfparam name="arguments.stMetadata.ftThumbnailSize" default="100" />
		
		<cfsavecontent variable="html">
			<cfoutput>
			<img src="#arguments.stMetadata.value#" alt="#arguments.stMetadata.value#" style="max-width: #arguments.stMetadata.ftThumbnailSize#px">
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn html>
	</cffunction>

</cfcomponent>