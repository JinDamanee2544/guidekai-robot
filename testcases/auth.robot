*** Settings ***
Resource            ../keywords/common.robot
Resource            ../testdata/form.robot
Resource            ../keywords/auth.robot
Resource            ../keywords/post.robot
Library             SeleniumLibrary

Test Setup          Open Browser at Guide Login
Test Teardown       Close All Browsers


*** Test Cases ***
Not Login User cannot access guide create post page
    [Tags]    authorization
    Go To    ${PATH_DASHBOARD}
    Should Be at Login
    Go To    ${PATH_GUIDE_POST}
    Should Be at Login

Login as Guide can access guide create post page
    [Tags]    authorization
    Login as Guide
    Go To    ${PATH_GUIDE_POST}
    Should Be at Guide's Create Post

Login as User cannot access guide create post page
    Login as User
    Go To    ${PATH_DASHBOARD}
    Should Be at Dashboard
    Go To    ${PATH_GUIDE_POST}
    Should Be at Not Allow
