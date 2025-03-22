*** Settings ***

Resource    ./variables.resource

*** Keywords ***

Abrir o navegador
    Open Browser    ${BASE_URL}    ${BROWSER}    options=add_argument("--headless")
    Maximize Browser Window

Fechar o navegador
    Close Browser

Realizar login
    [Documentation]    Keyword utilizado para realizar login. Precisa passar 2 argumetos (email, senha)
    [Arguments]    ${email}    ${senha}
    
    Abrir o navegador
    Wait Until Element Is Visible    locator=//h3[contains(.,'Login')]
    Input Text         css=${input_email}    ${email}
    Input Text         css=${input_senha}    ${senha}
    Click Button       css=${btn_entrar}
    

Realizar cadastro de Entidade
    [Documentation]    Keyword utilizado para realizar cadastro [Empresa, Cliente, Usuários, Diretorias, Centro de Custo e Departamento]
    [Arguments]    ${entidade}
    Realizar login    email=sysadmin@qacoders.com    senha=1234@Test
    Wait Until Element Is Visible    locator=css=body > div > div > svg
    Wait Until Element Is Visible    css=${btn_cadastro_entidade}
    Sleep    0.5
    Click Element                    css=${btn_cadastro_entidade}
    Wait Until Element Is Visible    xpath=// * [@href="/department"]
    Click Element                    xpath=// * [@href="/${entidade}"]
    Wait Until Element Is Visible    locator=id=Novo Cadastro
    ${current_url}=    Get Location
    Should Be Equal    ${current_url}    ${BASE_URL}/${entidade}
    ${response}    Run Keyword If    
    ...             "${entidade}" == "company"        New register company
    ...  ELSE IF    "${entidade}" == "client"         New register client    
    ...  ELSE IF    "${entidade}" == "user"           New register user
    ...  ELSE IF    "${entidade}" == "board"          New register board
    ...  ELSE IF    "${entidade}" == "costCenter"     New register costCenter
    ...  ELSE IF    "${entidade}" == "department"     New register department
    ...  ELSE    Log    message=${entidade}
    RETURN    ${response}
    

 
       

New register company
    [Documentation]    Keyword utilizado para cadastro de uma nova empresa

    ${company}    Get Fake Company
    Wait Until Element Is Visible    locator=//*[@id='Novo Cadastro']
    Click Button                     locator=${btnNovoCadastro}
    Wait Until Element Is Visible    locator=//*[@class='css-g7173l']
    Input Text                       locator=${locatorCompanyName}                   text=${company}[nome_empresa]
    Input Text                       locator=${locatorCompanyFantasyName}            text=${company}[nome_empresa]
    Input Text                       locator=${locatorCompanyMail}                   text=${company}[email]
    Input Text                       locator=${locatorCompanyCNPJ}                   text=${company}[cnpj]
    Input Text                       locator=${locatorCompanyTelephone}              text=${company}[telefone]
    Input Text                       locator=${locatorCompanyServiceDescription}     text=${company}[descricao]
    Input Text                       locator=${locatorCompanyFullNameResponsible}    text=${company}[responsavel]
    Input Text                       locator=${locatorZipCode}                       text=${company}[zipCode]
    Input Text                       locator=${locatorCountry}                       text=${company}[country]
    Input Text                       locator=${locatorCity}                          text=${company}[city]
    Input Text                       locator=${locatorState}                         text=${company}[state]
    Input Text                       locator=${locatorDistrict}                      text=${company}[district]
    Input Text                       locator=${locatorStreet}                        text=${company}[street]
    Input Text                       locator=${locatorNumber}                        text=${company}[number]
    Input Text                       locator=${locatorComplement}                    text=Qualquer coisa
    
    Click Button    locator=${btnSave}
    

New register client    
    [Documentation]    Keyword utilizado para cadastro de um novo cliente
    ${person}    Get Fake Person
    ${company}    Get Fake Company
    Wait Until Element Is Visible    locator=//*[@id='Novo Cadastro']
    Click Button                     locator=${btnNovoCadastro}
    Input Text                       locator=${locatorFullName}                text=${person}[name]
    Input Text                       locator=${locatorClientBirthDate}         text=20/02/99
    Input Text                       locator=${locatorMail}                    text=${person}[email]
    Input Text                       locator=${locatorClientPhone}             text=${company}[telefone]
    Input Text                       locator=${locatorClientCurrentRole}       text=${company}[descricao]
    Input Text                       locator=${locatorClientRG}                text=${person}[rg]
    Input Text                       locator=${locatorClientCPF}               text=${person}[cpf]
    Input Text                       locator=${locatorClientCPF}               text=${person}[cpf]
    Input Text                       locator=${locatorZipCode}                 text=${company}[zipCode]
    Scroll Element Into View         locator=${btnCancel}
    Input Text                       locator=${locatorCountry}                 text=${company}[country]
    Input Text                       locator=${locatorCity}                    text=${company}[city]
    Input Text                       locator=${locatorState}                   text=${company}[state]
    Input Text                       locator=${locatorDistrict}                text=${company}[district]
    Input Text                       locator=${locatorStreet}                  text=${company}[street]
    Input Text                       locator=${locatorNumber}                  text=${company}[number]
    Input Text                       locator=${locatorComplement}              text=Qualquer coisa
    Click Button                     locator=${btnSave}
    
New register user
    [Documentation]    Keyword utilizado para cadastro de um novo Usuários
    ${person}    Get Fake Person
    ${company}    Get Fake Company
    Wait Until Element Is Visible    locator=//*[@id='Novo Cadastro']
    Click Button                     locator=${btnNovoCadastro}
    Input Text                       locator=${locatorFullName}           text=${person}[name]
    Input Text                       locator=${locatorMail}               text=${company}[email]
    Input Text                       locator=${locatorAccessProfile}      text=ADMIN
    Input Text                       locator=${locatorClientCPF}          text=${person}[cpf]
    Input Text                       locator=${locatorPassword}           text=1234@Test
    Input Text                       locator=${locatorConfirmPassword}    text=1234@Test
    Click Button                     locator=${btnSave}
   
New register board
    [Documentation]    Keyword utilizado para cadastro de um nova Diretorias
    ${letras}    Generate Random String    length=2    chars=[LETTERS]
    ${letras_minusculas}    Convert To Lower Case    ${letras}
    Wait Until Element Is Visible    locator=//*[@id='Novo Cadastro']
    Click Button                     locator=${btnNovoCadastro}
    Input Text                       locator=${locatorBoardName}    text=Ron & Bugado${letras_minusculas}

    Click Button                     locator=${btnSave}
   

New register costCenter
    [Documentation]    Keyword utilizado para cadastro de um novo centro de Custo
    ${costCenter}    Centro De Custo
    ${valorDiretoria}    Diretoria
    Wait Until Element Is Visible    locator=//*[@id='Novo Cadastro']
    Click Button                     locator=${btnNovoCadastro}
    Input Text                       locator=${locatorCostCentername}    text=${costCenter}
    Wait Until Element Is Visible    locator=//*[@class='css-rlxyip']
    Sleep    time_=1
    Select From List By Label        id=Diretoria    ${valorDiretoria}
    Sleep    time_=1
    Click Button                     locator=${btnSave}
    

New register department
    [Documentation]    Keyword utilizado para cadastro de um novo Departamento
    ${centroDeCusto}    Centro De Custo
    ${departamento}    Departamento
    Sleep    time_=2
    Wait Until Element Is Visible    locator=//*[@id='Novo Cadastro']
    Click Button                     locator=${btnNovoCadastro}

    Sleep    time_=1
    Input Text                       locator=${locatorDepartmentName}    text=${departamento}
    Sleep    time_=1
    Select From List By Label        xpath=//*[@class='css-rlxyip']    ${centroDeCusto}
    
    Click Button                     locator=${btnSave}
    
   