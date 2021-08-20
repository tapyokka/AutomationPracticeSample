*** Settings ***
Suite Setup       HeaderPage.Go To Page - Sign Up
Test Template     Create New Account
Resource          ../resources/common.robot
Resource          ../resources/pageObjects/SignUpPage.robot
Resource          ../resources/pageObjects/HeaderPage.robot
Library           DataDriver    file=../resources/files/new_users.csv

*** Test Cases ***
Sign up with valid new user ${email}

*** Keywords ***
Create New Account
    [Arguments]    ${email}    ${gender}    ${first_name}    ${last_name}    ${password}    ${dateofbirth}    ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    SignUpPage.Register Email    ${email}
    SignUpPage.Create Account Details    ${gender}    ${first_name}    ${last_name}    ${password}    ${dateofbirth}    ${address_firstname}    ${address_lastname}    ${address}    ${city}    ${state}    ${zipcode}    ${country}    ${mobile_phone}    ${address_alias}
    HeaderPage.Verify Currently Signed In User    ${first_name}    ${last_name}
    HeaderPage.Sign Out
