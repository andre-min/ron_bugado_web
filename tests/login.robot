*** Settings ***

Resource    ../resources/keyword.resource

*** Test Cases ***

CT01 - Realizar login com sucesso
    ${variavel}    Carregar Variaveis Ambiente
    Realizar login    email=${variavel["MAIL"]}    senha=${variavel["PASSWORD"]}
    Sleep    0.5
    Wait Until Element Is Visible    css=${btn_cadastro_entidade}
    Element Should Be Visible    css=${btn_cadastro_entidade}
    ${current_url}=    Get Location
    Should Be Equal    ${current_url}    ${BASE_URL}/home
    Capture Element Screenshot    css=${btn_cadastro_entidade}
    Capture Page Screenshot
    Fechar o navegador

CT02 - Realizar login com email invalido e senha valida
    
    ${variavel}    Carregar Variaveis Ambiente
    Realizar login    email=testedorobot.verificando@gmail.com    senha=${variavel["PASSWORD"]}
    Wait Until Element Is Visible    css=${msg_error}
    Element Should Be Visible    css=${msg_error}
    Capture Element Screenshot    css=${msg_error}
    Fechar o navegador

CT03 - Realizar login com email valido e senha invalida
    ${variavel}    Carregar Variaveis Ambiente
    Realizar login    email=${variavel["MAIL"]}    senha=123456@testes
    Wait Until Element Is Visible    css=${msg_error}
    Element Should Be Visible    css=${msg_error}
    Capture Element Screenshot    css=${msg_error}
    Fechar o navegador