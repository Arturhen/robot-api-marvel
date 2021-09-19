*Settings*
Documentation    Suite de teste de exclusao de Personagens API Marvel

Resource	${EXECDIR}/resources/Base.robot

Library    	${EXECDIR}/resources/factories/Xmen.py


Suite Setup		Super Setup    teste@hotmail.com


*Test Cases*
Deve remover um personagem pelo ID

	${personagem}	Factory Scott
	${scott}		POST New Character 			${personagem}
	${scott_id}		Set Variable			${scott.json()}[_id]

	${response}		DELETE Character By Id		${scott_id}
	
	Status Should Be 		204					${response}

	${response2}	GET Character By Id  		${scott_id}

	Status Should Be		404					${response2}

Não deve encontrar o personagem pelo ID inexistente

	${personagem_id}		Get Unique Id

	${response}				DELETE Character By Id 		${personagem_id}

	Status Should Be		404							${response}