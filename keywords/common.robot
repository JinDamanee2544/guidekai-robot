*** Settings ***
Library     SeleniumLibrary
Resource    ../testdata/path.robot
Resource    ../testdata/auth.robot
Resource    ../testdata/form.robot


*** Variables ***
${BROWSER}      chrome


*** Keywords ***
Open Browser at Guide Post
    Open Browser    ${PATH_GUIDE_POST}    ${BROWSER}
    Maximize Browser Window
    Sleep    0.5

Open Browser at Guide Login
    Open Browser    ${PATH_LOGIN}    ${BROWSER}
    Maximize Browser Window
    Sleep    0.5

Open Browser at Guide Dashboard
    Open Browser    ${PATH_DASHBOARD}    ${BROWSER}
    Maximize Browser Window
    Sleep    0.5

Clear Cookies
    Delete All Cookies

Should Be at Login
    Wait Until Location Contains    ${PATH_LOGIN}

Should Be at Not Allow
    Wait Until Location Contains    ${PATH_NOT_ALLOWED}
    # ${CURRENT_URL}=    Get Location
    # Should Be Equal    ${CURRENT_URL}    ${PATH_NOT_ALLOWED}

Should Be at Dashboard
    Wait Until Location Contains    ${PATH_DASHBOARD}
    # ${CURRENT_URL}=    Get Location
    # Should Be Equal    ${CURRENT_URL}    ${PATH_DASHBOARD}

Should Be at Guide's Create Post
    Wait Until Location Contains    ${PATH_GUIDE_POST}
    # ${CURRENT_URL}=    Get Location
    # Should Be Equal    ${CURRENT_URL}    ${PATH_GUIDE_POST}

Should Be at Guide Create Success
    Wait Until Location Contains    ${PATH_POST_SUCCESS}
    # ${CURRENT_URL}=    Get Location
    # Should Be Equal    ${CURRENT_URL}    ${PATH_POST_SUCCESS}

Clear Text Field
    [Arguments]    ${locator}
    Press Keys    ${locator}    A+BACKSPACE
