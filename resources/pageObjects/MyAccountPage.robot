*** Settings ***
Library           SeleniumLibrary
Library           DateTime
Resource          ../locators.robot
Resource          AddressForm.robot

*** Keywords ***
Go to MyAddresses
    Element Should Be Visible    ${BUTTON_MYADDRESSES}
    Click Element    ${BUTTON_MYADDRESSES}
    Wait Until Location Contains    ${URL_ADDRESSES}
    Element Should Be Visible    ${ADD_ADDRESS}

Add New MyAddress
    [Arguments]    ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    Click Element    ${ADD_ADDRESS}
    Wait Until Element Is Visible    ${ADDRESS_FORM}
    Element Should Be Visible    ${ADDRESS_FORM}
    Element Should Be Visible    ${SAVE_ADDRESS}
    AddressForm.Add Address Details     ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    Click Element    ${SAVE_ADDRESS}
    Wait Until Element Is Visible    ${LIST_MYADDRESSES}
