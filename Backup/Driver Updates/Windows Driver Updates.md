## Windows Driver Updates
### POC_WIN_D_CO_Updates_Drivers_Dell_Phase_2
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Dell                         |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_3                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_5                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_4                      |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |

#### Configuration
|     setting      |                  value                  |
|------------------|-----------------------------------------|
|Display Name      |POC_WIN_D_CO_Updates_Drivers_Dell_Phase_2|
|Approval Type     |manual                                   |
|Role Scope Tag Ids|Default<br/>                             |

### POC_WIN_D_CO_Updates_Drivers_Dell_Phase_3
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Dell                         |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_4                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_2                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_5                      |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |

#### Configuration
|     setting      |                  value                  |
|------------------|-----------------------------------------|
|Display Name      |POC_WIN_D_CO_Updates_Drivers_Dell_Phase_3|
|Approval Type     |manual                                   |
|Role Scope Tag Ids|Default<br/>                             |

### POC_WIN_D_CO_Updates_Drivers_Dell_Phase_4
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Dell                         |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_5                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_2                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_3                      |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |

#### Configuration
|     setting      |                  value                  |
|------------------|-----------------------------------------|
|Display Name      |POC_WIN_D_CO_Updates_Drivers_Dell_Phase_4|
|Approval Type     |manual                                   |
|Role Scope Tag Ids|Default<br/>                             |

### POC_WIN_D_CO_Updates_Drivers_Dell_Phase_5
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Dell                         |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_4                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_2                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_3                      |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |

#### Configuration
|     setting      |                  value                  |
|------------------|-----------------------------------------|
|Display Name      |POC_WIN_D_CO_Updates_Drivers_Dell_Phase_5|
|Approval Type     |manual                                   |
|Role Scope Tag Ids|Default<br/>                             |

### POC_WIN_D_CO_Updates_Drivers_Phase_1
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|SG_MDM_D_CPC_CO                              |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |

#### Configuration
|     setting      |               value                |
|------------------|------------------------------------|
|Display Name      |POC_WIN_D_CO_Updates_Drivers_Phase_1|
|Approval Type     |automatic                           |
|Role Scope Tag Ids|Default<br/>                        |

### POC_WIN_D_CO_Updates_Drivers_Phase_2
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Phase_2                      |none       |           |
|Exclude|SG_MDM_D_CPC_CO                              |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |

#### Configuration
|          setting          |               value                |
|---------------------------|------------------------------------|
|Display Name               |POC_WIN_D_CO_Updates_Drivers_Phase_2|
|Approval Type              |automatic                           |
|Deployment Deferral In Days|                                   3|
|Role Scope Tag Ids         |Default<br/>                        |

### POC_WIN_D_CO_Updates_Drivers_Phase_3
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Phase_3                      |none       |           |
|Exclude|SG_MDM_D_CPC_CO                              |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |

#### Configuration
|          setting          |               value                |
|---------------------------|------------------------------------|
|Display Name               |POC_WIN_D_CO_Updates_Drivers_Phase_3|
|Approval Type              |automatic                           |
|Deployment Deferral In Days|                                   6|
|Role Scope Tag Ids         |Default<br/>                        |

### POC_WIN_D_CO_Updates_Drivers_Phase_4
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Phase_4                      |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|SG_MDM_D_CPC_CO                              |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |

#### Configuration
|          setting          |               value                |
|---------------------------|------------------------------------|
|Display Name               |POC_WIN_D_CO_Updates_Drivers_Phase_4|
|Approval Type              |automatic                           |
|Deployment Deferral In Days|                                   9|
|Role Scope Tag Ids         |Default<br/>                        |

### POC_WIN_D_CO_Updates_Drivers_Phase_5
#### Assignments
|intent |                   target                    |filter type|filter name|
|-------|---------------------------------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_Phase_5                      |none       |           |
|Exclude|POC_WIN_D_CO_Updates_Autopatch - Parent Group|none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1                      |none       |           |
|Exclude|SG_MDM_D_CPC_CO                              |none       |           |

#### Configuration
|          setting          |               value                |
|---------------------------|------------------------------------|
|Display Name               |POC_WIN_D_CO_Updates_Drivers_Phase_5|
|Approval Type              |automatic                           |
|Deployment Deferral In Days|                                  10|
|Role Scope Tag Ids         |Default<br/>                        |

### Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Last
Description: Driver update policy, created by Windows Autopatch
#### Assignments
|intent |               target                |filter type|filter name|
|-------|-------------------------------------|-----------|-----------|
|Include|POC_WIN_D_CO_Updates_Autopatch - Last|none       |           |

#### Configuration
|          setting          |                                    value                                     |
|---------------------------|------------------------------------------------------------------------------|
|Display Name               |Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Last|
|Approval Type              |automatic                                                                     |
|Deployment Deferral In Days|                                                                            11|
|Role Scope Tag Ids         |Default<br/>                                                                  |

### Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Ring1
Description: Driver update policy, created by Windows Autopatch
#### Assignments
|intent |                target                |filter type|filter name|
|-------|--------------------------------------|-----------|-----------|
|Include|POC_WIN_D_CO_Updates_Autopatch - Ring1|none       |           |

#### Configuration
|          setting          |                                     value                                     |
|---------------------------|-------------------------------------------------------------------------------|
|Display Name               |Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Ring1|
|Approval Type              |automatic                                                                      |
|Deployment Deferral In Days|                                                                              1|
|Role Scope Tag Ids         |Default<br/>                                                                   |

### Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Ring2
Description: Driver update policy, created by Windows Autopatch
#### Assignments
|intent |                target                |filter type|filter name|
|-------|--------------------------------------|-----------|-----------|
|Include|POC_WIN_D_CO_Updates_Autopatch - Ring2|none       |           |

#### Configuration
|          setting          |                                     value                                     |
|---------------------------|-------------------------------------------------------------------------------|
|Display Name               |Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Ring2|
|Approval Type              |automatic                                                                      |
|Deployment Deferral In Days|                                                                              6|
|Role Scope Tag Ids         |Default<br/>                                                                   |

### Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Ring3
Description: Driver update policy, created by Windows Autopatch
#### Assignments
|intent |                target                |filter type|filter name|
|-------|--------------------------------------|-----------|-----------|
|Include|POC_WIN_D_CO_Updates_Autopatch - Ring3|none       |           |

#### Configuration
|          setting          |                                     value                                     |
|---------------------------|-------------------------------------------------------------------------------|
|Display Name               |Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Ring3|
|Approval Type              |automatic                                                                      |
|Deployment Deferral In Days|                                                                              9|
|Role Scope Tag Ids         |Default<br/>                                                                   |

### Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Test
Description: Driver update policy, created by Windows Autopatch
#### Assignments
|intent |               target                |filter type|filter name|
|-------|-------------------------------------|-----------|-----------|
|Include|POC_WIN_D_CO_Updates_Autopatch - Test|none       |           |

#### Configuration
|     setting      |                                    value                                     |
|------------------|------------------------------------------------------------------------------|
|Display Name      |Windows Autopatch Driver Update Policy - POC_WIN_D_CO_Updates_Autopatch - Test|
|Approval Type     |automatic                                                                     |
|Role Scope Tag Ids|Default<br/>                                                                  |

