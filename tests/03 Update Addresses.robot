*** Settings ***
Suite Setup       HeaderPage.Go To Page - Sign Up
Test Template     Add New Address For User
Resource    ../resources/common.robot
Resource    ../resources/pageObjects/SignUpPage.robot
Resource    ../resources/pageObjects/HeaderPage.robot
Resource    ../resources/pageObjects/MyAccountPage.robot
Library           DataDriver    file=../resources/files/new_address.csv

*** Test Cases ***
Add New Address for ${email}

*** Keywords ***
Add New Address For User
    [Arguments]    ${email}    ${password}    ${first_name}    ${last_name}    ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    SignUpPage.Log In    ${email}    ${password}    ${first_name}    ${last_name}
    HeaderPage.Verify Currently Signed In User    ${first_name}    ${last_name}
    MyAccountPage.Go to MyAddresses
    MyAccountPage.Add New MyAddress    ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    Sign Out
