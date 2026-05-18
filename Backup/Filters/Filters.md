## Filters
### AND_AE_BYOD
#### Configuration
|             setting             |                 value                 |
|---------------------------------|---------------------------------------|
|Display Name                     |AND_AE_BYOD                            |
|Platform                         |androidForWork                         |
|Rule                             |(device.deviceOwnership -eq "Personal")|
|Role Scope Tags                  |Default<br/>                           |
|Assignment Filter Management Type|devices                                |

### AND_AE_CO
#### Configuration
|             setting             |                 value                  |
|---------------------------------|----------------------------------------|
|Display Name                     |AND_AE_CO                               |
|Platform                         |androidForWork                          |
|Rule                             |(device.deviceOwnership -eq "Corporate")|
|Role Scope Tags                  |Default<br/>                            |
|Assignment Filter Management Type|devices                                 |

### AND_AE_CO_Samsung
#### Configuration
|             setting             |                                     value                                      |
|---------------------------------|--------------------------------------------------------------------------------|
|Display Name                     |AND_AE_CO_Samsung                                                               |
|Platform                         |androidForWork                                                                  |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.manufacturer -eq "samsung")|
|Role Scope Tags                  |Default<br/>                                                                    |
|Assignment Filter Management Type|devices                                                                         |

### AND_AE_COBO_DD
#### Configuration
|             setting             |                                           value                                           |
|---------------------------------|-------------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_COBO_DD                                                                             |
|Platform                         |androidForWork                                                                             |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.enrollmentProfileName -contains "_DD")|
|Role Scope Tags                  |Default<br/>                                                                               |
|Assignment Filter Management Type|devices                                                                                    |

### AND_AE_COBO_DS
#### Configuration
|             setting             |                                           value                                            |
|---------------------------------|--------------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_COBO_DS                                                                              |
|Platform                         |androidForWork                                                                              |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.enrollmentProfileName -contains "_DS_")|
|Role Scope Tags                  |Default<br/>                                                                                |
|Assignment Filter Management Type|devices                                                                                     |

### AND_AE_COPE
#### Configuration
|             setting             |                                        value                                        |
|---------------------------------|-------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_COPE                                                                          |
|Platform                         |androidForWork                                                                       |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.enrollmentProfileName -eq $null)|
|Role Scope Tags                  |Default<br/>                                                                         |
|Assignment Filter Management Type|devices                                                                              |

### AND_AE_COPE_OS_14
#### Configuration
|             setting             |                                                        value                                                        |
|---------------------------------|---------------------------------------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_COPE_OS_14                                                                                                    |
|Platform                         |androidForWork                                                                                                       |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.enrollmentProfileName -eq $null) and (device.osVersion -eq "14")|
|Role Scope Tags                  |Default<br/>                                                                                                         |
|Assignment Filter Management Type|devices                                                                                                              |

### AND_AE_COPE_OS_15
#### Configuration
|             setting             |                                                        value                                                        |
|---------------------------------|---------------------------------------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_COPE_OS_15                                                                                                    |
|Platform                         |androidForWork                                                                                                       |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -eq "15") and (device.enrollmentProfileName -eq $null)|
|Role Scope Tags                  |Default<br/>                                                                                                         |
|Assignment Filter Management Type|devices                                                                                                              |

### AND_AE_COPE_OS_16
#### Configuration
|             setting             |                                                        value                                                        |
|---------------------------------|---------------------------------------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_COPE_OS_16                                                                                                    |
|Platform                         |androidForWork                                                                                                       |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.enrollmentProfileName -eq $null) and (device.osVersion -eq "16")|
|Role Scope Tags                  |Default<br/>                                                                                                         |
|Assignment Filter Management Type|devices                                                                                                              |

### AND_AE_MNGD
#### Configuration
|             setting             |                                                                                                                                                                              value                                                                                                                                                                              |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_MNGD                                                                                                                                                                                                                                                                                                                                                      |
|Platform                         |androidMobileApplicationManagement                                                                                                                                                                                                                                                                                                                               |
|Rule                             |<details><summary>Click to expand...</summary>(app.deviceManagementType -eq "Corporate-owned dedicated devices without Entra ID Shared mode") or (app.deviceManagementType -eq "Corporate-owned fully managed") or (app.deviceManagementType -eq "Corporate-owned with work profile") or (app.deviceManagementType -eq "Personally-owned work profile")</details>|
|Role Scope Tags                  |Default<br/>                                                                                                                                                                                                                                                                                                                                                     |
|Assignment Filter Management Type|apps                                                                                                                                                                                                                                                                                                                                                             |

### AND_AE_MNGD_BYOD
#### Configuration
|             setting             |                            value                             |
|---------------------------------|--------------------------------------------------------------|
|Display Name                     |AND_AE_MNGD_BYOD                                              |
|Platform                         |androidMobileApplicationManagement                            |
|Rule                             |(app.deviceManagementType -eq "Personally-owned work profile")|
|Role Scope Tags                  |Default<br/>                                                  |
|Assignment Filter Management Type|apps                                                          |

### AND_AE_MNGD_COBO
#### Configuration
|             setting             |                                                                                             value                                                                                             |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_MNGD_COBO                                                                                                                                                                               |
|Platform                         |androidMobileApplicationManagement                                                                                                                                                             |
|Rule                             |(app.deviceManagementType -eq "Corporate-owned dedicated devices with Entra ID Shared mode") or (app.deviceManagementType -eq "Corporate-owned dedicated devices without Entra ID Shared mode")|
|Role Scope Tags                  |Default<br/>                                                                                                                                                                                   |
|Assignment Filter Management Type|apps                                                                                                                                                                                           |

### AND_AE_MNGD_COPE
#### Configuration
|             setting             |                                                               value                                                                |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |AND_AE_MNGD_COPE                                                                                                                    |
|Platform                         |androidMobileApplicationManagement                                                                                                  |
|Rule                             |(app.deviceManagementType -eq "Corporate-owned fully managed") or (app.deviceManagementType -eq "Corporate-owned with work profile")|
|Role Scope Tags                  |Default<br/>                                                                                                                        |
|Assignment Filter Management Type|apps                                                                                                                                |

### AND_AO_CO
#### Configuration
|             setting             |                 value                  |
|---------------------------------|----------------------------------------|
|Display Name                     |AND_AO_CO                               |
|Platform                         |androidAOSP                             |
|Rule                             |(device.deviceOwnership -eq "Corporate")|
|Role Scope Tags                  |Default<br/>                            |
|Assignment Filter Management Type|devices                                 |

### AND_DA_BYOD
#### Configuration
|             setting             |                 value                 |
|---------------------------------|---------------------------------------|
|Display Name                     |AND_DA_BYOD                            |
|Platform                         |android                                |
|Rule                             |(device.deviceOwnership -eq "Personal")|
|Role Scope Tags                  |Default<br/>                           |
|Assignment Filter Management Type|devices                                |

### AND_DA_CO
#### Configuration
|             setting             |                 value                  |
|---------------------------------|----------------------------------------|
|Display Name                     |AND_DA_CO                               |
|Platform                         |android                                 |
|Rule                             |(device.deviceOwnership -eq "Corporate")|
|Role Scope Tags                  |Default<br/>                            |
|Assignment Filter Management Type|devices                                 |

### AND_UMNGD
#### Configuration
|             setting             |                  value                   |
|---------------------------------|------------------------------------------|
|Display Name                     |AND_UMNGD                                 |
|Platform                         |androidMobileApplicationManagement        |
|Rule                             |(app.deviceManagementType -eq "Unmanaged")|
|Role Scope Tags                  |Default<br/>                              |
|Assignment Filter Management Type|apps                                      |

### CPC_CO
#### Configuration
|             setting             |               value               |
|---------------------------------|-----------------------------------|
|Display Name                     |CPC_CO                             |
|Platform                         |windows10AndLater                  |
|Rule                             |(device.model -contains "Cloud PC")|
|Role Scope Tags                  |Default<br/>                       |
|Assignment Filter Management Type|devices                            |

### CPC_CO_Link
#### Configuration
|             setting             |                value                 |
|---------------------------------|--------------------------------------|
|Display Name                     |CPC_CO_Link                           |
|Platform                         |windows10AndLater                     |
|Rule                             |(device.operatingSystemSKU -eq "WCPC")|
|Role Scope Tags                  |Default<br/>                          |
|Assignment Filter Management Type|devices                               |

### IOS_BYOD
#### Configuration
|             setting             |                 value                 |
|---------------------------------|---------------------------------------|
|Display Name                     |IOS_BYOD                               |
|Platform                         |iOS                                    |
|Rule                             |(device.deviceOwnership -eq "Personal")|
|Role Scope Tags                  |Default<br/>                           |
|Assignment Filter Management Type|devices                                |

### IOS_BYOD_OS_18
#### Configuration
|             setting             |                                     value                                     |
|---------------------------------|-------------------------------------------------------------------------------|
|Display Name                     |IOS_BYOD_OS_18                                                                 |
|Platform                         |iOS                                                                            |
|Rule                             |(device.deviceOwnership -eq "Personal") and (device.osVersion -startsWith "18")|
|Role Scope Tags                  |Default<br/>                                                                   |
|Assignment Filter Management Type|devices                                                                        |

### IOS_BYOD_OS_26
#### Configuration
|             setting             |                                     value                                     |
|---------------------------------|-------------------------------------------------------------------------------|
|Display Name                     |IOS_BYOD_OS_26                                                                 |
|Platform                         |iOS                                                                            |
|Rule                             |(device.deviceOwnership -eq "Personal") and (device.osVersion -startsWith "26")|
|Role Scope Tags                  |Default<br/>                                                                   |
|Assignment Filter Management Type|devices                                                                        |

### IOS_CO
#### Configuration
|             setting             |                 value                  |
|---------------------------------|----------------------------------------|
|Display Name                     |IOS_CO                                  |
|Platform                         |iOS                                     |
|Rule                             |(device.deviceOwnership -eq "Corporate")|
|Role Scope Tags                  |Default<br/>                            |
|Assignment Filter Management Type|devices                                 |

### IOS_CO_ADE
#### Configuration
|             setting             |                                       value                                        |
|---------------------------------|------------------------------------------------------------------------------------|
|Display Name                     |IOS_CO_ADE                                                                          |
|Platform                         |iOS                                                                                 |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.enrollmentProfileName -ne null)|
|Role Scope Tags                  |Default<br/>                                                                        |
|Assignment Filter Management Type|devices                                                                             |

### IOS_CO_OS_18
#### Configuration
|             setting             |                                     value                                      |
|---------------------------------|--------------------------------------------------------------------------------|
|Display Name                     |IOS_CO_OS_18                                                                    |
|Platform                         |iOS                                                                             |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -startsWith "18")|
|Role Scope Tags                  |Default<br/>                                                                    |
|Assignment Filter Management Type|devices                                                                         |

### IOS_CO_OS_26
#### Configuration
|             setting             |                                     value                                      |
|---------------------------------|--------------------------------------------------------------------------------|
|Display Name                     |IOS_CO_OS_26                                                                    |
|Platform                         |iOS                                                                             |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -startsWith "26")|
|Role Scope Tags                  |Default<br/>                                                                    |
|Assignment Filter Management Type|devices                                                                         |

### IOS_MNGD
#### Configuration
|             setting             |                                                                                                                                                                                                                  value                                                                                                                                                                                                                  |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |IOS_MNGD                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|Platform                         |iOSMobileApplicationManagement                                                                                                                                                                                                                                                                                                                                                                                                           |
|Rule                             |<details><summary>Click to expand...</summary>(app.deviceManagementType -eq "Managed") or (app.deviceManagementType -eq "Automated Device Enrollment userless devices") or (app.deviceManagementType -eq "Automated Device Enrollment user-associated devices") or (app.deviceManagementType -eq "Account Driven User Enrollment") or (app.deviceManagementType -eq "Device Enrollment with Company Portal and Web Enrollment")</details>|
|Role Scope Tags                  |Default<br/>                                                                                                                                                                                                                                                                                                                                                                                                                             |
|Assignment Filter Management Type|apps                                                                                                                                                                                                                                                                                                                                                                                                                                     |

### IOS_MNGD_BYOD
#### Configuration
|             setting             |                                                                           value                                                                            |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |IOS_MNGD_BYOD                                                                                                                                               |
|Platform                         |iOSMobileApplicationManagement                                                                                                                              |
|Rule                             |(app.deviceManagementType -eq "Account Driven User Enrollment") or (app.deviceManagementType -eq "Device Enrollment with Company Portal and Web Enrollment")|
|Role Scope Tags                  |Default<br/>                                                                                                                                                |
|Assignment Filter Management Type|apps                                                                                                                                                        |

### IOS_MNGD_COBO
#### Configuration
|             setting             |                                    value                                    |
|---------------------------------|-----------------------------------------------------------------------------|
|Display Name                     |IOS_MNGD_COBO                                                                |
|Platform                         |iOSMobileApplicationManagement                                               |
|Rule                             |(app.deviceManagementType -eq "Automated Device Enrollment userless devices")|
|Role Scope Tags                  |Default<br/>                                                                 |
|Assignment Filter Management Type|apps                                                                         |

### IOS_MNGD_COPE
#### Configuration
|             setting             |                                       value                                        |
|---------------------------------|------------------------------------------------------------------------------------|
|Display Name                     |IOS_MNGD_COPE                                                                       |
|Platform                         |iOSMobileApplicationManagement                                                      |
|Rule                             |(app.deviceManagementType -eq "Automated Device Enrollment user-associated devices")|
|Role Scope Tags                  |Default<br/>                                                                        |
|Assignment Filter Management Type|apps                                                                                |

### IOS_UMNGD
#### Configuration
|             setting             |                  value                   |
|---------------------------------|------------------------------------------|
|Display Name                     |IOS_UMNGD                                 |
|Platform                         |iOSMobileApplicationManagement            |
|Rule                             |(app.deviceManagementType -eq "Unmanaged")|
|Role Scope Tags                  |Default<br/>                              |
|Assignment Filter Management Type|apps                                      |

### MAC_BYOD
#### Configuration
|             setting             |                 value                 |
|---------------------------------|---------------------------------------|
|Display Name                     |MAC_BYOD                               |
|Platform                         |macOS                                  |
|Rule                             |(device.deviceOwnership -eq "Personal")|
|Role Scope Tags                  |Default<br/>                           |
|Assignment Filter Management Type|devices                                |

### MAC_BYOD_OS_14
#### Configuration
|             setting             |                                     value                                     |
|---------------------------------|-------------------------------------------------------------------------------|
|Display Name                     |MAC_BYOD_OS_14                                                                 |
|Platform                         |macOS                                                                          |
|Rule                             |(device.deviceOwnership -eq "Personal") and (device.osVersion -startsWith "14")|
|Role Scope Tags                  |Default<br/>                                                                   |
|Assignment Filter Management Type|devices                                                                        |

### MAC_BYOD_OS_15
#### Configuration
|             setting             |                                     value                                     |
|---------------------------------|-------------------------------------------------------------------------------|
|Display Name                     |MAC_BYOD_OS_15                                                                 |
|Platform                         |macOS                                                                          |
|Rule                             |(device.deviceOwnership -eq "Personal") and (device.osVersion -startsWith "15")|
|Role Scope Tags                  |Default<br/>                                                                   |
|Assignment Filter Management Type|devices                                                                        |

### MAC_BYOD_OS_26
#### Configuration
|             setting             |                                     value                                     |
|---------------------------------|-------------------------------------------------------------------------------|
|Display Name                     |MAC_BYOD_OS_26                                                                 |
|Platform                         |macOS                                                                          |
|Rule                             |(device.deviceOwnership -eq "Personal") and (device.osVersion -startsWith "26")|
|Role Scope Tags                  |Default<br/>                                                                   |
|Assignment Filter Management Type|devices                                                                        |

### MAC_CO
#### Configuration
|             setting             |                 value                  |
|---------------------------------|----------------------------------------|
|Display Name                     |MAC_CO                                  |
|Platform                         |macOS                                   |
|Rule                             |(device.deviceOwnership -eq "Corporate")|
|Role Scope Tags                  |Default<br/>                            |
|Assignment Filter Management Type|devices                                 |

### MAC_CO_OS_14
#### Configuration
|             setting             |                                     value                                      |
|---------------------------------|--------------------------------------------------------------------------------|
|Display Name                     |MAC_CO_OS_14                                                                    |
|Platform                         |macOS                                                                           |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -startsWith "14")|
|Role Scope Tags                  |Default<br/>                                                                    |
|Assignment Filter Management Type|devices                                                                         |

### MAC_CO_OS_15
#### Configuration
|             setting             |                                     value                                      |
|---------------------------------|--------------------------------------------------------------------------------|
|Display Name                     |MAC_CO_OS_15                                                                    |
|Platform                         |macOS                                                                           |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -startsWith "15")|
|Role Scope Tags                  |Default<br/>                                                                    |
|Assignment Filter Management Type|devices                                                                         |

### MAC_CO_OS_26
#### Configuration
|             setting             |                                     value                                      |
|---------------------------------|--------------------------------------------------------------------------------|
|Display Name                     |MAC_CO_OS_26                                                                    |
|Platform                         |macOS                                                                           |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -startsWith "26")|
|Role Scope Tags                  |Default<br/>                                                                    |
|Assignment Filter Management Type|devices                                                                         |

### WIN_BYOD
#### Configuration
|             setting             |                 value                 |
|---------------------------------|---------------------------------------|
|Display Name                     |WIN_BYOD                               |
|Platform                         |windows10AndLater                      |
|Rule                             |(device.deviceOwnership -eq "Personal")|
|Role Scope Tags                  |Default<br/>                           |
|Assignment Filter Management Type|devices                                |

### WIN_BYOD_OS_Business
#### Configuration
|             setting             |                                                                                                                                                         value                                                                                                                                                          |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |WIN_BYOD_OS_Business                                                                                                                                                                                                                                                                                                    |
|Platform                         |windows10AndLater                                                                                                                                                                                                                                                                                                       |
|Rule                             |<details><summary>Click to expand...</summary>(device.deviceOwnership -eq "Personal") and (device.operatingSystemSKU -in ["Enterprise","EnterpriseEval","EnterpriseG","EnterpriseGN","EnterpriseS","EnterpriseSEval","EnterpriseSN","EnterpriseN","EnterpriseNEval","IoTEnterprise","Education","EducationN"])</details>|
|Role Scope Tags                  |Default<br/>                                                                                                                                                                                                                                                                                                            |
|Assignment Filter Management Type|devices                                                                                                                                                                                                                                                                                                                 |

### WIN_BYOD_OS_Consumer
#### Configuration
|             setting             |                                                                                                                                                           value                                                                                                                                                            |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |WIN_BYOD_OS_Consumer                                                                                                                                                                                                                                                                                                        |
|Platform                         |windows10AndLater                                                                                                                                                                                                                                                                                                           |
|Rule                             |<details><summary>Click to expand...</summary>(device.deviceOwnership -eq "Personal") and (device.operatingSystemSKU -in ["Core","CoreN","CoreSingleLanguage","Professional","ProfessionalEducation","ProfessionalWorkstation","ProfessionalN","ProfessionalEducationN","BusinessN","ProfessionalSingleLanguage"])</details>|
|Role Scope Tags                  |Default<br/>                                                                                                                                                                                                                                                                                                                |
|Assignment Filter Management Type|devices                                                                                                                                                                                                                                                                                                                     |

### WIN_CO
#### Configuration
|             setting             |                                       value                                       |
|---------------------------------|-----------------------------------------------------------------------------------|
|Display Name                     |WIN_CO                                                                             |
|Platform                         |windows10AndLater                                                                  |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.model -notContains "Cloud PC")|
|Role Scope Tags                  |Default<br/>                                                                       |
|Assignment Filter Management Type|devices                                                                            |

### WIN_CO_AP
#### Configuration
|             setting             |                                                             value                                                              |
|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |WIN_CO_AP                                                                                                                       |
|Platform                         |windows10AndLater                                                                                                               |
|Rule                             |(device.enrollmentProfileName -ne $null) and (device.deviceOwnership -eq "Corporate") and (device.model -notContains "Cloud PC")|
|Role Scope Tags                  |Default<br/>                                                                                                                    |
|Assignment Filter Management Type|devices                                                                                                                         |

### WIN_CO_ARM
#### Configuration
|             setting             |               value                |
|---------------------------------|------------------------------------|
|Display Name                     |WIN_CO_ARM                          |
|Platform                         |windows10AndLater                   |
|Rule                             |(device.cpuArchitecture -eq "arm64")|
|Role Scope Tags                  |Default<br/>                        |
|Assignment Filter Management Type|devices                             |

### WIN_CO_OS_10
#### Configuration
|             setting             |                                                             value                                                             |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |WIN_CO_OS_10                                                                                                                   |
|Platform                         |windows10AndLater                                                                                                              |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -startsWith "10.0.1") and (device.model -notContains "Cloud PC")|
|Role Scope Tags                  |Default<br/>                                                                                                                   |
|Assignment Filter Management Type|devices                                                                                                                        |

### WIN_CO_OS_11
#### Configuration
|             setting             |                                                             value                                                             |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |WIN_CO_OS_11                                                                                                                   |
|Platform                         |windows10AndLater                                                                                                              |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -startsWith "10.0.2") and (device.model -notContains "Cloud PC")|
|Role Scope Tags                  |Default<br/>                                                                                                                   |
|Assignment Filter Management Type|devices                                                                                                                        |

### WIN_CO_OS_11_24H2
#### Configuration
|             setting             |                                                               value                                                               |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |WIN_CO_OS_11_24H2                                                                                                                  |
|Platform                         |windows10AndLater                                                                                                                  |
|Rule                             |(device.deviceOwnership -eq "Corporate") and (device.osVersion -startsWith "10.0.26100") and (device.model -notContains "Cloud PC")|
|Role Scope Tags                  |Default<br/>                                                                                                                       |
|Assignment Filter Management Type|devices                                                                                                                            |

### WIN_CO_OS_Business
#### Configuration
|             setting             |                                                                                                                                                          value                                                                                                                                                          |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |WIN_CO_OS_Business                                                                                                                                                                                                                                                                                                       |
|Platform                         |windows10AndLater                                                                                                                                                                                                                                                                                                        |
|Rule                             |<details><summary>Click to expand...</summary>(device.deviceOwnership -eq "Corporate") and (device.operatingSystemSKU -in ["Enterprise","EnterpriseEval","EnterpriseG","EnterpriseGN","EnterpriseS","EnterpriseSEval","EnterpriseSN","EnterpriseN","EnterpriseNEval","IoTEnterprise","Education","EducationN"])</details>|
|Role Scope Tags                  |Default<br/>                                                                                                                                                                                                                                                                                                             |
|Assignment Filter Management Type|devices                                                                                                                                                                                                                                                                                                                  |

### WIN_CO_OS_Consumer
#### Configuration
|             setting             |                                                                                                                                                            value                                                                                                                                                            |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                     |WIN_CO_OS_Consumer                                                                                                                                                                                                                                                                                                           |
|Platform                         |windows10AndLater                                                                                                                                                                                                                                                                                                            |
|Rule                             |<details><summary>Click to expand...</summary>(device.deviceOwnership -eq "Corporate") and (device.operatingSystemSKU -in ["Core","CoreN","CoreSingleLanguage","Professional","ProfessionalEducation","ProfessionalWorkstation","ProfessionalN","ProfessionalEducationN","BusinessN","ProfessionalSingleLanguage"])</details>|
|Role Scope Tags                  |Default<br/>                                                                                                                                                                                                                                                                                                                 |
|Assignment Filter Management Type|devices                                                                                                                                                                                                                                                                                                                      |

### WIN_OS_NotHome
#### Configuration
|             setting             |                     value                     |
|---------------------------------|-----------------------------------------------|
|Display Name                     |WIN_OS_NotHome                                 |
|Platform                         |windows10AndLater                              |
|Rule                             |(device.operatingSystemSKU -notContains "Core")|
|Role Scope Tags                  |Default<br/>                                   |
|Assignment Filter Management Type|devices                                        |

