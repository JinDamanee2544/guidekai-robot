*** Settings ***
Library     SeleniumLibrary
Resource    ../testdata/form.robot


*** Keywords ***
Should See Create Post Header
    Wait Until Element Contains    //*[@id="__next"]/div/div[2]/div/div/h5    ${FORM_HEADER_NAME}

Should See Error
    Wait Until Element Contains
    ...    //*[@id="__next"]/div/div[2]/div/div/form/div[5]/div/div[2]/p
    ...    ${FORM_ERROR_FIELD_NOT_PROVIDED}

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
    Input Text    //*[@id="fee"]    ${args1}

Insert Post Max Participants
    [Arguments]    ${args1}
    # Only Integer
    # Must more than 1
    Input Text    //*[@id="maxParticipant"]    ${args1}

Insert Post Contact Info
    [Arguments]    ${args1}
    Input Text    //*[@id="contactInfo"]    ${args1}

Submit Post Create Form
    Click Button    //*[@id="__next"]/div/div[2]/div/div/form/button
