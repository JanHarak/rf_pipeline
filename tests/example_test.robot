*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER}    chrome
${URL}    https://www.example.com
${HEADLESS}    ${TRUE}    # Set to ${FALSE} for local headed execution
${TIMEOUT}    120s

*** Keywords ***
*** Test Cases ***

Test
    Log  haha