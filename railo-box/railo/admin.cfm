<cfsetting requestTimeout=500>
<cftry>
<cfadmin
	action="updatePassword"
	type="server"
	newPassword="myboxadmin">
Password Set
<cfcatch>Error in Password Set: <cfoutput>#cfcatch.message#</cfoutput></cfcatch></cftry>

<cftry>
<cfadmin
	action="updateDatasource"
	type="server"
	password="myboxadmin"
	dsn="jdbc:mysql://localhost:3306/CB203"
	classname="org.gjt.mm.mysql.Driver"
	name="CB203"
	newName="CB203"
	host="localhost"
	database="CB203"
	port="3306"
	dbusername="root"
	dbpassword="myboxadmin">
DSNs Created
<cfcatch>Error in DSNs Created: <cfoutput>#cfcatch.message#</cfoutput></cfcatch></cftry>

<cftry>
<cfadmin
	action="UpdateUpdate"
	type="server"
	password="myboxadmin"
	updatetype="manual"
	updateLocation="http://dev.getrailo.org">
<cfadmin
	action="getUpdate"
	type="server"
	password="myboxadmin"
	returnvariable="update">
 <cfadmin
	action="runUpdate"
	type="server"
	password="myboxadmin">
Railo Update to latest
<cfcatch>Error in Railo Update to latest: <cfoutput>#cfcatch.message#</cfoutput></cfcatch></cftry>

<cftry>
<cfadmin
	action="updateApplicationSetting"
	type="server"
	password="myboxadmin"
	scriptProtect="none"
	requestTimeout="#CreateTimeSpan(0,0,3,0)#"
	allowURLRequestTimeout=true />
Updated timeouts
<cfcatch>Error in Updated timeouts: <cfoutput>#cfcatch.message#</cfoutput></cfcatch></cftry>

<cftry>
<cfadmin
    action="updateMailServer"
    type="server"
    password="myboxadmin"
    hostname="mailtrap.io"
    dbusername="curtsdevstuff"
    dbpassword="idontthinksopunk"
    port="2525">
Added Mailserver
<cfcatch>Error in Adding Mailserver: <cfoutput>#cfcatch.message#</cfoutput></cfcatch></cftry>
