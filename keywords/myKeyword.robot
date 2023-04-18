*** Settings ***
Library     SeleniumLibrary
Resource    ../testdata/env.robot
Resource    ../testdata/auth.robot


*** Keywords ***
Open Browser at Guide Post
    Open Browser    ${ENV_GUIDE_POST_URL}    ${ENV_BROWSER}
    Maximize Browser Window
    Sleep    0.5

Open Browser at Guide Login
    Open Browser    ${ENV_LOGIN_URL}    ${ENV_BROWSER}
    Maximize Browser Window
    Sleep    0.5

Open Browser at Guide Dashboard
    Open Browser    ${ENV_DASHBOARD_URL}    ${ENV_BROWSER}
    Maximize Browser Window
    Sleep    0.5

Login as Guide
    Input Text    //*[@id="email"]    ${AUTH_GUIDE_EMAIL}
    Input Text    //*[@id="password"]    ${AUTH_GUIDE_PASSWORD}
    Click Button    //*[@id="__next"]/div/div/form/button
    Sleep    0.5
    ${CURRENT_URL}=    Get Location
    Should Be Equal    ${CURRENT_URL}    ${ENV_DASHBOARD_URL}

Clear Cookies
    Delete All Cookies
