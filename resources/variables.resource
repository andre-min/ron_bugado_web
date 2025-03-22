
*** Settings ***

Library    SeleniumLibrary
Library    ./libs/data_faker.py
Library    ../load_env.py
Library    String


*** Variables ***


${BASE_URL}    https://automacao.qacoders-academy.com.br
${BROWSER}    chrome
${btn_entrar}         button[id=login]
${input_email}        input[id=email]    #//input[contains(@type,'text')]
${input_senha}        input[id=password]
${btn_cadastro_entidade}      div[id=Cadastros]
${msg_error}          div[class*=MuiAlert-standard]
#${link_cadastro}    //a[@class='css-c3vxn9'][contains(.,'Acesse aqui')]
#${btn_cadastro_entidade}    id=Cadastros


${locatorCompanyName}                       id=companyName
${locatorCompanyFantasyName}                id=fantasyName
${locatorCompanyMail}                       id=companyMail
${locatorCompanyCNPJ}                       id=matriz
${locatorCompanyTelephone}                  id=telephone
${locatorCompanyServiceDescription}         id=serviceDescription
${locatorCompanyFullNameResponsible}        id=fullName
${locatorZipCode}                           id=zipCode
${locatorCountry}                           id=country
${locatorCity}                              id=city
${locatorState}                             id=state
${locatorDistrict}                          id=district
${locatorStreet}                            id=street
${locatorNumber}                            id=number
${locatorComplement}                        id=complement
${btnSave}                                  id=save
${btnCancel}                                id=cancel
${btnNovoCadastro}                          id=Novo Cadastro
${locatorFullName}                          id=fullName
${locatorClientBirthDate}                   id=birthDate
${locatorMail}                              id=mail
${locatorClientPhone}                       id=phone
${locatorClientCurrentRole}                 id=currentRole
${locatorClientRG}                          name=rg
${locatorClientCPF}                         name=cpf
${locatorAccessProfile}                     id=accessProfile
${locatorPassword}                          id=password
${locatorConfirmPassword}                   id=confirmPassword
${locatorBoardName}                         id=boardName
${locatorCostCentername}                    id=costCentername
${locatorDepartmentName}                    id=departmentName