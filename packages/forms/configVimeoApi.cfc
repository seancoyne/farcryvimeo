<cfcomponent displayname="Vimeo API Settings" extends="farcry.core.packages.forms.forms" output="false" key="vimeo" hint="Configure Vimeo API">
	
	<cfproperty ftSeq="110" ftFieldset="API" ftLabel="Base URL" name="baseURL" type="nstring" ftType="url" default="https://api.vimeo.com" ftDefault="https://api.vimeo.com" required="true" />
	<cfproperty ftSeq="120" ftFieldset="API" ftLabel="User Agent" name="userAgent" type="nstring" ftType="string" default="FarCry Vimeo Plugin" ftDefault="FarCry Vimeo Plugin" required="true" />
	<cfproperty ftSeq="130" ftFieldset="API" ftLabel="Access Token" name="accessToken" type="nstring" ftType="nstring" default="" ftDefault="" required="true" />
	
	<cffunction name="process" access="public" output="false" returntype="struct">
		<cfargument name="fields" type="struct" required="true" />
		<cfset var result = super.process(argumentCollection = arguments) />
		<cfset application.fc.lib.vimeo.init() />
		<cfreturn result />
	</cffunction>
	
</cfcomponent>