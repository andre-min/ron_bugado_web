*** Settings ***

Resource    ../resources/keyword.resource

*** Test Cases ***
CT01 - Cadastro de empresa
    ${response}    Realizar cadastro de Entidade    company
    Fechar o navegador


CT02 - Cadastro de cliente
    ${response}    Realizar cadastro de Entidade    client
    Fechar o navegador


CT03 - Cadastro de usuario
    ${response}    Realizar cadastro de Entidade    user
    Fechar o navegador


CT04 - Cadastro de diretoria
    ${response}    Realizar cadastro de Entidade    board
    Fechar o navegador


CT05 - Cadastro centro de custo
    ${response}    Realizar cadastro de Entidade    costCenter
    Fechar o navegador


CT06 - Cadastro de departamento
    ${response}    Realizar cadastro de Entidade    department
    Fechar o navegador


