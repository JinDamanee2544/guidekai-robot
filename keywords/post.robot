*** Settings ***
Library     SeleniumLibrary
Resource    ../testdata/form.robot
Resource    common.robot


*** Keywords ***
Should See Create Post Header
    Wait Until Element Contains    //*[@id="__next"]/div/div[2]/div/div/h5    ${FORM_HEADER_NAME}

Should See Error Some Fields Not Provided
    Wait Until Element Contains
    ...    //*[@id="__next"]/div/div[2]/div/div/form/div[5]/div/div[2]/p
    ...    ${FORM_ERROR_FIELD_NOT_PROVIDED}

Should See Error Fee < 30
    Wait Until Element Contains
    ...    //*[@id="__next"]/div/div[2]/div/div/form/div[5]/div/div[2]/p
    ...    ${FORM_ERROR_FEE_LESS_THAN_30}

Insert Post Name
    [Arguments]    ${args1}
    Input Text    //*[@id="title"]    ${args1}

Insert Post Content
    [Arguments]    ${args1}
    Input Text    //*[@id="content"]    ${args1}

Insert Post Fee
    [Arguments]    ${args1}
    # Must more than 30
    # Not a minus number
    # Can be float
    Clear Text Field    //*[@id="fee"]
    Input Text    //*[@id="fee"]    ${args1}

Input Post Fee With String Should Reject
    [Arguments]    ${args1}
    # Must more than 30
    # Not a minus number
    # Can be float
    Clear Text Field    //*[@id="fee"]
    Input Text    //*[@id="fee"]    ${args1}
    ${Get Value}    Get Value    //*[@id="fee"]
    Should Be Empty    ${Get Value}

Insert Post Max Participants
    [Arguments]    ${args1}
    # Only Integer
    # Must more than 1
    Clear Text Field    //*[@id="maxParticipant"]
    Input Text    //*[@id="maxParticipant"]    ${args1}

Input Post Max Participants With String Should Reject
    [Arguments]    ${args1}
    # Only Integer
    # Must more than 1
    Clear Text Field    //*[@id="maxParticipant"]
    Input Text    //*[@id="maxParticipant"]    ${args1}
    ${Get Value}    Get Value    //*[@id="maxParticipant"]
    Should Be Empty    ${Get Value}

Insert Post Contact Info
    [Arguments]    ${args1}
    Input Text    //*[@id="contactInfo"]    ${args1}

Submit Post Create Form
    Click Button    //*[@id="__next"]/div/div[2]/div/div/form/button

Remove Location Tag
    Click Element At Coordinates    //*[@id="locations"]    26    0

Remove Tour Style Tag
    Click Element At Coordinates    //*[@id="locations"]    26    0
