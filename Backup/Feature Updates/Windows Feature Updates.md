## Windows Feature Updates
### POC_WIN_D_CO_Updates_Feature_11_23H2_Anchor
#### Assignments
|intent |        target         |filter type|filter name|
|-------|-----------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_11_23H2|none       |           |
|Exclude|SG_MDM_D_CPC_CO        |none       |           |

#### Configuration
|                        setting                        |                                                   value                                                    |
|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
|Display Name                                           |POC_WIN_D_CO_Updates_Feature_11_23H2_Anchor                                                                 |
|Feature Update Version                                 |Windows 11, version 23H2                                                                                    |
|Role Scope Tag Ids                                     |Default<br/>                                                                                                |
|End Of Support Date                                    |2026-11-10T00:00:00Z                                                                                        |
|Install Latest Windows10 On Windows11 Ineligible Device|False                                                                                                       |
|Install Feature Updates Optional                       |False                                                                                                       |
|Rollout Settings                                       |**offerStartDateTimeInUTC:** None<br/>**offerEndDateTimeInUTC:** None<br/>**offerIntervalInDays:** None<br/>|

### POC_WIN_D_CO_Updates_Feature_11_24H2_Anchor
#### Assignments
|intent |        target         |filter type|filter name|
|-------|-----------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_11_24H2|none       |           |
|Exclude|SG_MDM_D_CPC_CO        |none       |           |

#### Configuration
|                        setting                        |                                                   value                                                    |
|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
|Display Name                                           |POC_WIN_D_CO_Updates_Feature_11_24H2_Anchor                                                                 |
|Feature Update Version                                 |Windows 11, version 24H2                                                                                    |
|Role Scope Tag Ids                                     |Default<br/>                                                                                                |
|End Of Support Date                                    |2027-10-12T00:00:00Z                                                                                        |
|Install Latest Windows10 On Windows11 Ineligible Device|False                                                                                                       |
|Install Feature Updates Optional                       |False                                                                                                       |
|Rollout Settings                                       |**offerStartDateTimeInUTC:** None<br/>**offerEndDateTimeInUTC:** None<br/>**offerIntervalInDays:** None<br/>|

### POC_WIN_D_CO_Updates_Feature_11_25H2_Anchor
#### Assignments
|intent |        target         |filter type|filter name|
|-------|-----------------------|-----------|-----------|
|Include|SG_MDM_D_WIN_CO_11_25H2|none       |           |

#### Configuration
|                        setting                        |                                                   value                                                    |
|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
|Display Name                                           |POC_WIN_D_CO_Updates_Feature_11_25H2_Anchor                                                                 |
|Feature Update Version                                 |Windows 11, version 25H2                                                                                    |
|Role Scope Tag Ids                                     |Default<br/>                                                                                                |
|End Of Support Date                                    |2028-10-10T00:00:00Z                                                                                        |
|Install Latest Windows10 On Windows11 Ineligible Device|False                                                                                                       |
|Install Feature Updates Optional                       |False                                                                                                       |
|Rollout Settings                                       |**offerStartDateTimeInUTC:** None<br/>**offerEndDateTimeInUTC:** None<br/>**offerIntervalInDays:** None<br/>|

### POC_WIN_D_CO_Updates_Feature_11_25H2_Phase_1
#### Configuration
|                        setting                        |                                                                      value                                                                      |
|-------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                                           |POC_WIN_D_CO_Updates_Feature_11_25H2_Phase_1                                                                                                     |
|Feature Update Version                                 |Windows 11, version 25H2                                                                                                                         |
|Role Scope Tag Ids                                     |Default<br/>                                                                                                                                     |
|End Of Support Date                                    |2028-10-10T00:00:00Z                                                                                                                             |
|Install Latest Windows10 On Windows11 Ineligible Device|False                                                                                                                                            |
|Install Feature Updates Optional                       |False                                                                                                                                            |
|Rollout Settings                                       |**offerStartDateTimeInUTC:** 2025-10-05T10:51:53.586Z<br/>**offerEndDateTimeInUTC:** 2025-10-14T10:51:53.586Z<br/>**offerIntervalInDays:** 7<br/>|

### POC_WIN_D_CO_Updates_Feature_11_25H2_Phase_2
#### Assignments
|intent |        target         |filter type|filter name|
|-------|-----------------------|-----------|-----------|
|Include|                       |none       |           |
|Exclude|SG_MDM_D_CPC_CO        |none       |           |
|Exclude|SG_MDM_D_WIN_CO_Phase_1|none       |           |

#### Configuration
|                        setting                        |                                                                      value                                                                      |
|-------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
|Display Name                                           |POC_WIN_D_CO_Updates_Feature_11_25H2_Phase_2                                                                                                     |
|Feature Update Version                                 |Windows 11, version 25H2                                                                                                                         |
|Role Scope Tag Ids                                     |Default<br/>                                                                                                                                     |
|End Of Support Date                                    |2028-10-10T00:00:00Z                                                                                                                             |
|Install Latest Windows10 On Windows11 Ineligible Device|False                                                                                                                                            |
|Install Feature Updates Optional                       |False                                                                                                                                            |
|Rollout Settings                                       |**offerStartDateTimeInUTC:** 2026-03-01T11:53:10.973Z<br/>**offerEndDateTimeInUTC:** 2026-05-01T10:53:10.973Z<br/>**offerIntervalInDays:** 7<br/>|

### Windows Autopatch - Feature Update Anchor Policy - POC_WIN_D_CO_Updates_Autopatch
#### Assignments
|intent |                target                |filter type|filter name|
|-------|--------------------------------------|-----------|-----------|
|Include|POC_WIN_D_CO_Updates_Autopatch - Ring3|none       |           |
|Include|POC_WIN_D_CO_Updates_Autopatch - Ring2|none       |           |
|Include|POC_WIN_D_CO_Updates_Autopatch - Last |none       |           |
|Include|POC_WIN_D_CO_Updates_Autopatch - Ring1|none       |           |
|Include|POC_WIN_D_CO_Updates_Autopatch - Test |none       |           |

#### Configuration
|                        setting                        |                                                   value                                                    |
|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
|Display Name                                           |Windows Autopatch - Feature Update Anchor Policy - POC_WIN_D_CO_Updates_Autopatch                           |
|Feature Update Version                                 |Windows 11, version 25H2                                                                                    |
|Role Scope Tag Ids                                     |Default<br/>                                                                                                |
|End Of Support Date                                    |2028-10-10T00:00:00Z                                                                                        |
|Install Latest Windows10 On Windows11 Ineligible Device|False                                                                                                       |
|Install Feature Updates Optional                       |False                                                                                                       |
|Rollout Settings                                       |**offerStartDateTimeInUTC:** None<br/>**offerEndDateTimeInUTC:** None<br/>**offerIntervalInDays:** None<br/>|

