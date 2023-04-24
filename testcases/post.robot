*** Settings ***
Resource            ../keywords/common.robot
Resource            ../testdata/form.robot
Resource            ../keywords/auth.robot
Resource            ../keywords/post.robot
Library             SeleniumLibrary

Test Setup          Open Browser and Login As Guide and Go to Guide's Create Post Page
Test Teardown       Close All Browsers


*** Test Cases ***
All fields are provided and valid
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Should Be at Guide Create Success

Post Name is empty
    [Tags]    missing one field
    # Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Should See Error Some Fields Not Provided

Post Content is empty
    [Tags]    missing one field
    Insert Post Name    ${FORM_TRIP_NAME}
    # Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Should See Error Some Fields Not Provided

Post Fee is empty
    [Tags]    missing one field
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    # Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Should See Error Some Fields Not Provided

Post Contact Info is empty
    [Tags]    missing one field
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    # Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Should See Error Some Fields Not Provided

Post Max Participants is empty
    [Tags]    missing one field
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    # Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Should See Error Some Fields Not Provided

Post Location is empty
    [Tags]    missing one field
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Remove Location Tag
    Submit Post Create Form
    Should See Error Some Fields Not Provided

Post Tour Style is empty
    [Tags]    missing one field
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Remove Tour Style Tag
    Submit Post Create Form
    Should See Error Some Fields Not Provided

Post Fee is less than 30
    [Tags]    invalid fee
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    29
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Sleep    1
    Should See Error Fee < 30

Post Fee is string
    [Tags]    invalid fee
    Input Post Fee With String Should Reject    abc

Post Fee is less than 0
    [Tags]    invalid fee
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    -1
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    ${FORM_MAX_PARTICIPANTS}
    Submit Post Create Form
    Sleep    1
    Should See Error Fee < 30

Post Max Participants is less than 0
    [Tags]    invalid max participants
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    -1
    Submit Post Create Form
    Sleep    1
    Should Be at Guide's Create Post

Post Max Participants is float
    [Tags]    invalid max participants
    Insert Post Name    ${FORM_TRIP_NAME}
    Insert Post Content    ${FORM_TRIP_CONTENT}
    Insert Post Fee    ${FORM_TRIP_FEE}
    Insert Post Contact Info    ${FORM_CONTACT_INFO}
    Insert Post Max Participants    1.5
    Submit Post Create Form
    Sleep    1
    Should Be at Guide's Create Post

Post Max Participants is string
    [Tags]    invalid max participants
    Input Post Max Participants With String Should Reject    abc
