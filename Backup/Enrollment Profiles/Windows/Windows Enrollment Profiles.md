## Windows Enrollment Profiles
### All users and all devices
Description: This is the default enrollment status screen configuration applied with the lowest priority to all users and all devices regardless of group membership\.
#### Assignments
|intent |  target   |filter type|filter name|
|-------|-----------|-----------|-----------|
|Include|All Devices|none       |           |

#### Configuration
|                   setting                   |                                         value                                         |
|---------------------------------------------|---------------------------------------------------------------------------------------|
|Odata type                                   |#microsoft.graph.windows10EnrollmentCompletionPageConfiguration                        |
|Display Name                                 |All users and all devices                                                              |
|Device Enrollment Configuration Type         |windows10EnrollmentCompletionPageConfiguration                                         |
|Show Installation Progress                   |True                                                                                   |
|Block Device Setup Retry By User             |True                                                                                   |
|Allow Device Reset On Install Failure        |False                                                                                  |
|Allow Log Collection On Install Failure      |True                                                                                   |
|Custom Error Message                         |Setup could not be completed. Please try again or contact your support person for help.|
|Install Progress Timeout In Minutes          |                                                                                     60|
|Allow Device Use On Install Failure          |False                                                                                  |
|Allow Non Blocking App Installation          |False                                                                                  |
|Install Quality Updates                      |False                                                                                  |
|Track Install Progress For Autopilot Only    |True                                                                                   |
|Disable User Status Tracking After First User|True                                                                                   |

### POC_WIN_D_CO_ESP_AllDevices
#### Assignments
|intent |  target   |filter type|            filter name             |
|-------|-----------|-----------|------------------------------------|
|Include|All Devices|none       |00000000-0000-0000-0000-000000000000|

#### Configuration
|                   setting                   |                                         value                                         |
|---------------------------------------------|---------------------------------------------------------------------------------------|
|Odata type                                   |#microsoft.graph.windows10EnrollmentCompletionPageConfiguration                        |
|Display Name                                 |POC_WIN_D_CO_ESP_AllDevices                                                            |
|Priority                                     |                                                                                      1|
|Role Scope Tag Ids                           |Default<br/>                                                                           |
|Device Enrollment Configuration Type         |windows10EnrollmentCompletionPageConfiguration                                         |
|Show Installation Progress                   |True                                                                                   |
|Block Device Setup Retry By User             |False                                                                                  |
|Allow Device Reset On Install Failure        |True                                                                                   |
|Allow Log Collection On Install Failure      |True                                                                                   |
|Custom Error Message                         |Setup could not be completed. Please try again or contact your support person for help.|
|Install Progress Timeout In Minutes          |                                                                                     60|
|Allow Device Use On Install Failure          |True                                                                                   |
|Allow Non Blocking App Installation          |True                                                                                   |
|Install Quality Updates                      |False                                                                                  |
|Track Install Progress For Autopilot Only    |True                                                                                   |
|Disable User Status Tracking After First User|True                                                                                   |
|Selected Mobile App Names                    |**name:** Company Portal<br/>**type:** #microsoft.graph.winGetApp<br/><br/>            |

### POC_WIN_D_COBO_ESP_Kiosk
#### Configuration
|                   setting                   |                                         value                                         |
|---------------------------------------------|---------------------------------------------------------------------------------------|
|Odata type                                   |#microsoft.graph.windows10EnrollmentCompletionPageConfiguration                        |
|Display Name                                 |POC_WIN_D_COBO_ESP_Kiosk                                                               |
|Priority                                     |                                                                                      3|
|Role Scope Tag Ids                           |Default<br/>                                                                           |
|Device Enrollment Configuration Type         |windows10EnrollmentCompletionPageConfiguration                                         |
|Show Installation Progress                   |True                                                                                   |
|Block Device Setup Retry By User             |False                                                                                  |
|Allow Device Reset On Install Failure        |False                                                                                  |
|Allow Log Collection On Install Failure      |True                                                                                   |
|Custom Error Message                         |Setup could not be completed. Please try again or contact your support person for help.|
|Install Progress Timeout In Minutes          |                                                                                     60|
|Allow Device Use On Install Failure          |False                                                                                  |
|Allow Non Blocking App Installation          |True                                                                                   |
|Install Quality Updates                      |False                                                                                  |
|Track Install Progress For Autopilot Only    |True                                                                                   |
|Disable User Status Tracking After First User|True                                                                                   |

### POC_WIN_U_CO_ESP_FinanceUsers
#### Configuration
|                   setting                   |                             value                             |
|---------------------------------------------|---------------------------------------------------------------|
|Odata type                                   |#microsoft.graph.windows10EnrollmentCompletionPageConfiguration|
|Display Name                                 |POC_WIN_U_CO_ESP_FinanceUsers                                  |
|Priority                                     |                                                              2|
|Role Scope Tag Ids                           |Default<br/>                                                   |
|Device Enrollment Configuration Type         |windows10EnrollmentCompletionPageConfiguration                 |
|Show Installation Progress                   |False                                                          |
|Block Device Setup Retry By User             |True                                                           |
|Allow Device Reset On Install Failure        |False                                                          |
|Allow Log Collection On Install Failure      |False                                                          |
|Custom Error Message                         |<details><summary>Click to expand...</summary></details>       |
|Install Progress Timeout In Minutes          |                                                             60|
|Allow Device Use On Install Failure          |False                                                          |
|Allow Non Blocking App Installation          |True                                                           |
|Install Quality Updates                      |False                                                          |
|Track Install Progress For Autopilot Only    |False                                                          |
|Disable User Status Tracking After First User|False                                                          |

### POC_WIN_D_COBO_ENT_Kiosk
#### Configuration
|            setting             |                                                                                              value                                                                                               |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                      |#microsoft.graph.azureADWindowsAutopilotDeploymentProfile                                                                                                                                         |
|Display Name                    |POC_WIN_D_COBO_ENT_Kiosk                                                                                                                                                                          |
|Language                        |os-default                                                                                                                                                                                        |
|Locale                          |os-default                                                                                                                                                                                        |
|Extract Hardware Hash           |False                                                                                                                                                                                             |
|Hardware Hash Extraction Enabled|False                                                                                                                                                                                             |
|Device Name Template            |KIOSK-%SERIAL%                                                                                                                                                                                    |
|Device Type                     |windowsPc                                                                                                                                                                                         |
|Enable White Glove              |False                                                                                                                                                                                             |
|Preprovisioning Allowed         |False                                                                                                                                                                                             |
|Role Scope Tag Ids              |Default<br/>                                                                                                                                                                                      |
|Out Of Box Experience Settings  |**hidePrivacySettings:** True<br/>**hideEULA:** True<br/>**userType:** standard<br/>**deviceUsageType:** shared<br/>**skipKeyboardSelectionPage:** True<br/>**hideEscapeLink:** True<br/>         |
|Out Of Box Experience Setting   |**privacySettingsHidden:** True<br/>**eulaHidden:** True<br/>**userType:** standard<br/>**deviceUsageType:** shared<br/>**keyboardSelectionPageSkipped:** True<br/>**escapeLinkHidden:** True<br/>|

### POC_WIN_D_COPE_ENT_All
#### Configuration
|            setting             |                                                                                                value                                                                                                 |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                      |#microsoft.graph.azureADWindowsAutopilotDeploymentProfile                                                                                                                                             |
|Display Name                    |POC_WIN_D_COPE_ENT_All                                                                                                                                                                                |
|Language                        |os-default                                                                                                                                                                                            |
|Locale                          |os-default                                                                                                                                                                                            |
|Extract Hardware Hash           |False                                                                                                                                                                                                 |
|Hardware Hash Extraction Enabled|False                                                                                                                                                                                                 |
|Device Name Template            |<details><summary>Click to expand...</summary></details>                                                                                                                                              |
|Device Type                     |windowsPc                                                                                                                                                                                             |
|Enable White Glove              |False                                                                                                                                                                                                 |
|Preprovisioning Allowed         |False                                                                                                                                                                                                 |
|Role Scope Tag Ids              |Default<br/>                                                                                                                                                                                          |
|Out Of Box Experience Settings  |**hidePrivacySettings:** True<br/>**hideEULA:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**skipKeyboardSelectionPage:** True<br/>**hideEscapeLink:** True<br/>         |
|Out Of Box Experience Setting   |**privacySettingsHidden:** True<br/>**eulaHidden:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**keyboardSelectionPageSkipped:** True<br/>**escapeLinkHidden:** True<br/>|

### WIN_D_COPE_ENT_CE
Description: Used for Blueprint testing of Cyber Essentials baselines\.
#### Assignments
|intent |         target          |filter type|filter name|
|-------|-------------------------|-----------|-----------|
|Include|TEST_SG_MDM_D_WIN_CE_COPE|none       |           |

#### Configuration
|            setting             |                                                                                                value                                                                                                 |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                      |#microsoft.graph.azureADWindowsAutopilotDeploymentProfile                                                                                                                                             |
|Display Name                    |WIN_D_COPE_ENT_CE                                                                                                                                                                                     |
|Language                        |os-default                                                                                                                                                                                            |
|Locale                          |os-default                                                                                                                                                                                            |
|Extract Hardware Hash           |False                                                                                                                                                                                                 |
|Hardware Hash Extraction Enabled|False                                                                                                                                                                                                 |
|Device Name Template            |CE-%SERIAL%                                                                                                                                                                                           |
|Device Type                     |windowsPc                                                                                                                                                                                             |
|Enable White Glove              |False                                                                                                                                                                                                 |
|Preprovisioning Allowed         |False                                                                                                                                                                                                 |
|Role Scope Tag Ids              |Default<br/>                                                                                                                                                                                          |
|Out Of Box Experience Settings  |**hidePrivacySettings:** True<br/>**hideEULA:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**skipKeyboardSelectionPage:** True<br/>**hideEscapeLink:** True<br/>         |
|Out Of Box Experience Setting   |**privacySettingsHidden:** True<br/>**eulaHidden:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**keyboardSelectionPageSkipped:** True<br/>**escapeLinkHidden:** True<br/>|

### WIN_D_COPE_ENT_CIS
Description: Used for Blueprint testing of Center for Internet Security baselines\.
#### Assignments
|intent |           target            |filter type|filter name|
|-------|-----------------------------|-----------|-----------|
|Include|TEST_SG_MDM_D_WIN_CIS_MS_COPE|none       |           |

#### Configuration
|            setting             |                                                                                                value                                                                                                 |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                      |#microsoft.graph.azureADWindowsAutopilotDeploymentProfile                                                                                                                                             |
|Display Name                    |WIN_D_COPE_ENT_CIS                                                                                                                                                                                    |
|Language                        |en-GB                                                                                                                                                                                                 |
|Locale                          |en-GB                                                                                                                                                                                                 |
|Extract Hardware Hash           |False                                                                                                                                                                                                 |
|Hardware Hash Extraction Enabled|False                                                                                                                                                                                                 |
|Device Name Template            |CIS-%SERIAL%                                                                                                                                                                                          |
|Device Type                     |windowsPc                                                                                                                                                                                             |
|Enable White Glove              |False                                                                                                                                                                                                 |
|Preprovisioning Allowed         |False                                                                                                                                                                                                 |
|Role Scope Tag Ids              |Default<br/>                                                                                                                                                                                          |
|Out Of Box Experience Settings  |**hidePrivacySettings:** True<br/>**hideEULA:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**skipKeyboardSelectionPage:** True<br/>**hideEscapeLink:** True<br/>         |
|Out Of Box Experience Setting   |**privacySettingsHidden:** True<br/>**eulaHidden:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**keyboardSelectionPageSkipped:** True<br/>**escapeLinkHidden:** True<br/>|

### WIN_D_COPE_ENT_MSZT
Description: Used for Blueprint testing of Microsoft Zero Trust baselines\.
#### Assignments
|intent |          target           |filter type|filter name|
|-------|---------------------------|-----------|-----------|
|Include|TEST_SG_MDM_D_WIN_MSZT_COPE|none       |           |

#### Configuration
|            setting             |                                                                                                value                                                                                                 |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                      |#microsoft.graph.azureADWindowsAutopilotDeploymentProfile                                                                                                                                             |
|Display Name                    |WIN_D_COPE_ENT_MSZT                                                                                                                                                                                   |
|Language                        |os-default                                                                                                                                                                                            |
|Locale                          |os-default                                                                                                                                                                                            |
|Extract Hardware Hash           |False                                                                                                                                                                                                 |
|Hardware Hash Extraction Enabled|False                                                                                                                                                                                                 |
|Device Name Template            |MSZT-%SERIAL%                                                                                                                                                                                         |
|Device Type                     |windowsPc                                                                                                                                                                                             |
|Enable White Glove              |False                                                                                                                                                                                                 |
|Preprovisioning Allowed         |False                                                                                                                                                                                                 |
|Role Scope Tag Ids              |Default<br/>                                                                                                                                                                                          |
|Out Of Box Experience Settings  |**hidePrivacySettings:** True<br/>**hideEULA:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**skipKeyboardSelectionPage:** True<br/>**hideEscapeLink:** True<br/>         |
|Out Of Box Experience Setting   |**privacySettingsHidden:** True<br/>**eulaHidden:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**keyboardSelectionPageSkipped:** True<br/>**escapeLinkHidden:** True<br/>|

### WIN_D_COPE_ENT_NCSC
Description: Used for Blueprint testing of National Cyber Security Centre baselines\.
#### Assignments
|intent |            target            |filter type|filter name|
|-------|------------------------------|-----------|-----------|
|Include|TEST_SG_MDM_D_WIN_NCSC_MS_COPE|none       |           |

#### Configuration
|            setting             |                                                                                                value                                                                                                 |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                      |#microsoft.graph.azureADWindowsAutopilotDeploymentProfile                                                                                                                                             |
|Display Name                    |WIN_D_COPE_ENT_NCSC                                                                                                                                                                                   |
|Language                        |en-GB                                                                                                                                                                                                 |
|Locale                          |en-GB                                                                                                                                                                                                 |
|Extract Hardware Hash           |False                                                                                                                                                                                                 |
|Hardware Hash Extraction Enabled|False                                                                                                                                                                                                 |
|Device Name Template            |NCSC-%SERIAL%                                                                                                                                                                                         |
|Device Type                     |windowsPc                                                                                                                                                                                             |
|Enable White Glove              |False                                                                                                                                                                                                 |
|Preprovisioning Allowed         |False                                                                                                                                                                                                 |
|Role Scope Tag Ids              |Default<br/>                                                                                                                                                                                          |
|Out Of Box Experience Settings  |**hidePrivacySettings:** True<br/>**hideEULA:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**skipKeyboardSelectionPage:** True<br/>**hideEscapeLink:** True<br/>         |
|Out Of Box Experience Setting   |**privacySettingsHidden:** True<br/>**eulaHidden:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**keyboardSelectionPageSkipped:** True<br/>**escapeLinkHidden:** True<br/>|

### ZZZ_WIN_D_COPE_HYB_All
#### Configuration
|                   setting                   |                                                                                                value                                                                                                 |
|---------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                                   |#microsoft.graph.activeDirectoryWindowsAutopilotDeploymentProfile                                                                                                                                     |
|Display Name                                 |ZZZ_WIN_D_COPE_HYB_All                                                                                                                                                                                |
|Language                                     |os-default                                                                                                                                                                                            |
|Locale                                       |os-default                                                                                                                                                                                            |
|Extract Hardware Hash                        |False                                                                                                                                                                                                 |
|Hardware Hash Extraction Enabled             |False                                                                                                                                                                                                 |
|Device Name Template                         |<details><summary>Click to expand...</summary></details>                                                                                                                                              |
|Device Type                                  |windowsPc                                                                                                                                                                                             |
|Enable White Glove                           |True                                                                                                                                                                                                  |
|Preprovisioning Allowed                      |True                                                                                                                                                                                                  |
|Role Scope Tag Ids                           |Default<br/>                                                                                                                                                                                          |
|Hybrid Azure A D Join Skip Connectivity Check|True                                                                                                                                                                                                  |
|Out Of Box Experience Settings               |**hidePrivacySettings:** True<br/>**hideEULA:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**skipKeyboardSelectionPage:** True<br/>**hideEscapeLink:** True<br/>         |
|Out Of Box Experience Setting                |**privacySettingsHidden:** True<br/>**eulaHidden:** True<br/>**userType:** standard<br/>**deviceUsageType:** singleUser<br/>**keyboardSelectionPageSkipped:** True<br/>**escapeLinkHidden:** True<br/>|

