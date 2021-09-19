*Settings*
Documentation			Aqui é onde começa

Library		RequestsLibrary
Library		Helpers.py

Resource	routes/Characters.robot

*Variables*
${API_URL}			http://marvel.qaninja.academy

*Keywords*
Super Setup
	[Arguments]		${email}
	
	Set Client key	${email}
	Back To The Past


*Keywords*
Set Client key
	[Arguments]		${email}

	&{usuario}		Create Dictionary	email=${email}

	${response}		POST
	...				${API_URL}/accounts
	...				json=${usuario}

	${client_key}	Set Variable	${response.json()}[client_key]

	&{HEADERS}		Create Dictionary	client_key=${client_key}

	Set Suite Variable		${HEADERS}

Back To The Past
	DELETE		${API_URL}/delorean		headers=${HEADERS}