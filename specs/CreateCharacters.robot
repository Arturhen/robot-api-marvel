*Settings*
Documentation    Suite de teste do cadastro de Personagens API Marvel

Resource	${EXECDIR}/resources/Base.robot

Library    	${EXECDIR}/resources/factories/Guardians.py


Suite Setup		Super Setup    teste@gmail.com


*Test Cases*
Deve cadastrar um personagem

	&{personagem}	Factory Star Lord
	${response}		POST New Character    ${personagem}

	Status Should Be    200

Não deve ser cadastrado com o mesmo nome
	[Tags]			dup

	${personagem}         Factory Groot
	POST New Character    ${personagem}

	${response}    POST New Character    ${personagem}

	Status Should Be	409    ${response}
	Should Be Equal         ${response.json()}[error]    Character already exists :(