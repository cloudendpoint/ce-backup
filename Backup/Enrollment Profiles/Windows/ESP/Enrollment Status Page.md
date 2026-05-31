## Enrollment Status Page
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

