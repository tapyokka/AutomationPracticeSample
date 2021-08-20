*** Settings ***
Library           SeleniumLibrary
Library           Process
Resource          locators.robot

*** Variables ***
${SCRIPT_GENERATE_USERS}    resources/scripts/generate_users.py

*** Keywords ***
Close Browser
    Close Window

Generate User Files
    ${result} =    Run Process    python    ${SCRIPT_GENERATE_USERS}
    Should Be Equal As Integers    ${result.rc}    0

Go To Website
    Open Browser    ${URL_HOMEPAGE}    firefox
