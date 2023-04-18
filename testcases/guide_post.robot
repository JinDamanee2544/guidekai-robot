*** Settings ***
Resource            ../keywords/myKeyword.robot
Library             SeleniumLibrary

Test Setup          Open Browser at Guide Login
Test Teardown       Close All Browsers


*** Test Cases ***
CASE_1
    Login as Guide
    Go To    ${ENV_GUIDE_POST_URL}
    Sleep    0.5
    Wait Until Element Contains    //*[@id="__next"]/div/div[2]/div/div/h5    Create Post

AUTH
    Login as Guide
