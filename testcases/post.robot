*** Settings ***
Resource            ../keywords/common.robot
Resource            ../testdata/form.robot
Resource            ../keywords/auth.robot
Resource            ../keywords/post.robot
Library             SeleniumLibrary

Test Setup          Open Browser and Login As Guide and Go to Guide's Create Post Page
Test Teardown       Close All Browsers


*** Test Cases ***
All field are provided
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Sleep    4
    Should Be at Guide Create Success

One field are missing
    # Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Sleep    4
    Should See Error
