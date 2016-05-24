<cfcomponent output="false">

	<cffunction name="XHTMLParagraphFormat" hint="Returns a XHTML compliant string wrapped with properly formatted paragraph tags." output="no">
		<cfargument name="inString" required="yes" type="string" />
		<cfargument name="inAttributeString" required="no" type="string" default="" />
		<cfargument name="bWrapInParentParagraphTag" required="false" type="boolean" default="false" />
		<cfscript>
				/**
				 * Returns a XHTML compliant string wrapped with properly formatted paragraph tags.
				 *
				 * @param string 	 String you want XHTML formatted.
				 * @param attributeString 	 Optional attributes to assign to all opening paragraph tags (i.e. style=""font-family: tahoma"").
				 * @return Returns a string.
				 * @author Jeff Howden (jeff@members.evolt.org)
				 * @version 1.2, March 30, 2005 (modified by Jeff Coughlin jeff@jeffcoughlin.com)
				 */
				  var attributeString = '';
				  var returnValue = '';
				  if(arguments.inAttributeString neq ''){
				    attributeString = ' ' & arguments.inAttributeString;
				  }
				  if(Len(Trim(inString))){
		      returnValue = arguments.inString;
		      if (arguments.bWrapInParentParagraphTag is true){ returnValue = '<p' & attributeString & '>' & returnValue; }
		      returnValue = Replace(returnValue, Chr(13)&Chr(10)&Chr(13)&Chr(10), '</p><p' & attributeString & '>', 'ALL');
		      returnValue = Replace(returnValue, Chr(10)&Chr(10), '</p><p' & attributeString & '>', 'ALL');
		      returnValue = Replace(returnValue, Chr(13)&Chr(13), '</p><p' & attributeString & '>', 'ALL');
		      returnValue = Replace(returnValue, Chr(13)&Chr(10), '<br />', 'ALL');
		      returnValue = Replace(returnValue, Chr(10), '<br />', 'ALL');
		      returnValue = Replace(returnValue, Chr(13), '<br />', 'ALL');
		      if (arguments.bWrapInParentParagraphTag is true){ returnValue = returnValue & '</p>'; }
				  }
		</cfscript>

		<cfreturn returnValue />

	</cffunction>
	
</cfcomponent>