<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Webtop Body --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<ft:objectAdmin
	title="Vimeo Videos"
	typename="vimeoVideo"
	ColumnList="cdnImage,title,id,link,datetimecreated,datetimelastupdated"
	SortableColumns="title,datetimecreated,datetimelastupdated"
	lFilterFields="title,id"
	sqlorderby="datetimecreated desc" />

<cfsetting enablecfoutputonly="false" />