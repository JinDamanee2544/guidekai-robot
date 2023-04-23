*** Settings ***
Library     SeleniumLibrary
Resource    common.robot
Resource    ../testdata/auth.robot


*** Keywords ***
Login as Guide
    Input Email    ${AUTH_GUIDE_EMAIL}
    Input Password    ${AUTH_GUIDE_PASSWORD}
    Click Login Button
    Sleep    0.5
    Should Be at Dashboard

Login as User
    Input Email    ${AUTH_USER_EMAIL}
    Input Password    ${AUTH_USER_PASSWORD}
    Click Login Button
    Sleep    0.5
    Should Be at Dashboard

Open Browser and Login As Guide and Go to Guide's Create Post Page
    Open Browser at Guide Login
    Login as Guide
    Go To    ${PATH_GUIDE_POST}
    Sleep    0.5
    Should Be at Guide's Create Post

Input Email
    [Arguments]    ${email}
    Input Text    //*[@id="email"]    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}

Click Login Button
    Click Button    //*[@id="__next"]/div/div/form/button
