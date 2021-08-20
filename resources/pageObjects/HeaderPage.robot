*** Settings ***
Library           SeleniumLibrary
Resource          ../locators.robot

*** Keywords ***
Go To Page - Sign Up
    Go To    ${URL_HOMEPAGE}
    Wait Until Location Contains    ${URL_HOMEPAGE}
    Wait Until Page Contains Element    ${LOCATOR_SIGNUP}    30
    #Wait Until Element Is Enabled    ${LOCATOR_SIGNIN}
    Click Element    ${LOCATOR_SIGNUP}
    Wait Until Location Contains    ${URL_AUTHENTICATION_PAGE}    30
    Location Should Contain    ${URL_AUTHENTICATION_PAGE}
    Wait Until Page Contains Element    ${SIGNUP_FORM}
    Element Should Be Enabled    ${BUTTON_CREATE_ACCOUNT}
    Element Should Be Enabled    ${LOCATOR_LOGIN}

Sign Out
    Wait Until Element Is Enabled    ${LOCATOR_SIGNOUT}
    Click Element    ${LOCATOR_SIGNOUT}
    Location Should Contain    ${URL_AUTHENTICATION_PAGE}
    Wait Until Element Is Enabled    ${LOCATOR_SIGNUP}

Verify Currently Signed In User
    [Arguments]    ${first_name}    ${last_name}
    Wait Until Element Is Visible    ${CURRENT_USER}
    ${USER_FULLNAME}=    Set Variable    ${first_name} ${last_name}
    Element Text Should Be    ${CURRENT_USER}    ${USER_FULLNAME}
