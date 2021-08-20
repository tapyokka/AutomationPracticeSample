*** Settings ***
Library     SeleniumLibrary
Resource    ../locators.robot

*** Keywords ***
Add Address Details
    [Arguments]    ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    Input Text    ${TEXT_ADDRESS_FIRSTNAME}    ${address_firstname}
    Input Text    ${TEXT_ADDRESS_LASTNAME}    ${address_lastname}
    Input Text    ${TEXT_ADDRESS}    ${address}
    Input Text    ${TEXT_ADDRESS_CITY}    ${city}
    Select From List By Label    ${TEXT_ADDRESS_STATE}    ${state}
    Input Text    ${TEXT_ADDRESS_ZIPCODE}    ${zipcode}
    Select From List By Label    ${TEXT_ADDRESS_COUNTRY}    ${country}
    Input Text    ${TEXT_MOBILEPHONE}    ${mobile_phone}
    Input Text    ${TEXT_ADDRESS_ALIAS}    ${address_alias}