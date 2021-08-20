*** Settings ***
Library           SeleniumLibrary
Library           DateTime
Resource          ../locators.robot
Resource          AddressForm.robot

*** Variables ***
${GENDER_1}       1
${GENDER_2}       2

*** Keywords ***
Create Account Details
    [Arguments]    ${gender}    ${first_name}    ${last_name}    ${password}    ${dateofbirth}    ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    ${gender} =    Set Variable If    "${gender}"=="Male"    ${GENDER_1}    "${gender}"=="Female"    ${GENDER_2}
    Select Radio Button    id_gender    ${gender}
    Input Text    ${TEXT_FIRSTNAME}    ${first_name}
    Input Text    ${TEXT_LASTNAME}    ${last_name}
    Input Password    ${TEXT_PASSWORD}    ${password}
    ${dob_day} =    Convert Date    ${dateofbirth}    result_format=%#d
    ${dob_month} =    Convert Date    ${dateofbirth}    result_format=%#m
    ${dob_year} =    Convert Date    ${dateofbirth}    result_format=%Y
    Select From List By Value    ${TEXT_DOB_DAY}    ${dob_day}
    Select From List By Value    ${TEXT_DOB_MONTH}    ${dob_month}
    Select From List By Value    ${TEXT_DOB_YEAR}    ${dob_year}
    AddressForm.Add Address Details    ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    Wait Until Element Is Visible   ${BUTTON_REGISTER}
    Click Element    ${BUTTON_REGISTER}
    Wait Until Location Is    ${URL_MYACCOUNT}    60
    Wait Until Element Is Visible    ${CURRENT_USER}    60

Register Email
    [Arguments]    ${email}
    Element Should Be Visible    ${TEXT_EMAIL}
    Input Text    ${TEXT_EMAIL}    ${email}
    Click Element    ${BUTTON_CREATE_ACCOUNT}
    Wait Until Location Is    ${URL_CREATEACCOUNT}    30
    Location Should Be    ${URL_CREATEACCOUNT}
    Wait Until Element Is Visible    ${SIGNUP_FORM}
    Element Should Be Visible    ${SIGNUP_FORM}

Log In
    [Arguments]    ${email}    ${password}    ${first_name}    ${last_name}
    Element Should Be Enabled    ${LOGIN_EMAIL}
    Element Should Be Enabled    ${LOGIN_PASSWORD}
    Input Text    ${LOGIN_EMAIL}    ${email}
    Input Password    ${LOGIN_PASSWORD}    ${password}
    Click Button    ${BUTTON_LOGIN}
    Wait Until Location Contains    ${URL_MYACCOUNT}
    Location Should Contain    ${URL_MYACCOUNT}
