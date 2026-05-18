## Enrollment Configurations
### All users and all devices
Description: This is the default Device Limit Restriction applied with the lowest priority to all users regardless of group membership\.
#### Assignments
|intent |  target   |filter type|filter name|
|-------|-----------|-----------|-----------|
|Include|All Devices|none       |           |

#### Configuration
|              setting               |                       value                       |
|------------------------------------|---------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentLimitConfiguration|
|Display Name                        |All users and all devices                          |
|Device Enrollment Configuration Type|limit                                              |
|Limit                               |                                                 15|

### All users and all devices
Description: This is the default Device Type Restriction applied with the lowest priority to all users regardless of group membership\.
#### Assignments
|intent |  target   |filter type|filter name|
|-------|-----------|-----------|-----------|
|Include|All Devices|none       |           |

#### Configuration
|              setting               |                                                                                                  value                                                                                                  |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentPlatformRestrictionsConfiguration                                                                                                                                       |
|Display Name                        |All users and all devices                                                                                                                                                                                |
|Device Enrollment Configuration Type|platformRestrictions                                                                                                                                                                                     |
|Ios Restriction                     |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** True<br/>**osMinimumVersion:** <br/>**osMaximumVersion:** <br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>         |
|Windows Restriction                 |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** True<br/>**osMinimumVersion:** <br/>**osMaximumVersion:** <br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>         |
|Windows Home Sku Restriction        |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** True<br/>**osMinimumVersion:** None<br/>**osMaximumVersion:** None<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul> |
|Windows Mobile Restriction          |**platformBlocked:** True<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** <br/>**osMaximumVersion:** <br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>         |
|Android Restriction                 |**platformBlocked:** True<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** <br/>**osMaximumVersion:** <br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>         |
|Android For Work Restriction        |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** True<br/>**osMinimumVersion:** <br/>**osMaximumVersion:** <br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>         |
|Mac Restriction                     |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** True<br/>**osMinimumVersion:** None<br/>**osMaximumVersion:** None<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul> |
|Mac O S Restriction                 |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** True<br/>**osMinimumVersion:** None<br/>**osMaximumVersion:** None<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul> |
|Vision O S Restriction              |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** None<br/>**osMaximumVersion:** None<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>|
|Tvos Restriction                    |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** None<br/>**osMaximumVersion:** None<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>|

### All users and all devices
Description: This is the default Windows Hello for Business configuration applied with the lowest priority to all users regardless of group membership\.
#### Assignments
|intent |  target   |filter type|filter name|
|-------|-----------|-----------|-----------|
|Include|All Devices|none       |           |

#### Configuration
|              setting               |                                value                                |
|------------------------------------|---------------------------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentWindowsHelloForBusinessConfiguration|
|Display Name                        |All users and all devices                                            |
|Device Enrollment Configuration Type|windowsHelloForBusiness                                              |
|Pin Minimum Length                  |                                                                    6|
|Pin Maximum Length                  |                                                                  127|
|Pin Uppercase Characters Usage      |disallowed                                                           |
|Pin Lowercase Characters Usage      |disallowed                                                           |
|Pin Special Characters Usage        |disallowed                                                           |
|State                               |disabled                                                             |
|Security Device Required            |False                                                                |
|Unlock With Biometrics Enabled      |True                                                                 |
|Remote Passport Enabled             |True                                                                 |
|Enhanced Biometrics State           |notConfigured                                                        |
|Security Key For Sign In            |disabled                                                             |

### All users and all devices
Description: This is the default Windows Restore configuration applied with the lowest priority to all users and all devices regardless of group membership\.
#### Assignments
|intent |  target   |filter type|filter name|
|-------|-----------|-----------|-----------|
|Include|All Devices|none       |           |

#### Configuration
|              setting               |                           value                            |
|------------------------------------|------------------------------------------------------------|
|Odata type                          |#microsoft.graph.windowsRestoreDeviceEnrollmentConfiguration|
|Display Name                        |All users and all devices                                   |
|Device Enrollment Configuration Type|windowsRestore                                              |
|State                               |enabled                                                     |

### POC_AND_AE_U_BYOD_Allow_AllUsers
#### Assignments
|intent |      target      |filter type|            filter name             |
|-------|------------------|-----------|------------------------------------|
|Include|TEST_SG_MDM_U_NCSC|none       |00000000-0000-0000-0000-000000000000|
|Include|                  |none       |00000000-0000-0000-0000-000000000000|
|Include|TEST_SG_MDM_U_CIS |none       |00000000-0000-0000-0000-000000000000|
|Include|TEST_SG_MDM_U_CE+ |none       |00000000-0000-0000-0000-000000000000|

#### Configuration
|              setting               |                                                                                                     value                                                                                                     |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentPlatformRestrictionConfiguration                                                                                                                                              |
|Display Name                        |POC_AND_AE_U_BYOD_Allow_AllUsers                                                                                                                                                                               |
|Priority                            |                                                                                                                                                                                                              2|
|Role Scope Tag Ids                  |Default<br/>                                                                                                                                                                                                   |
|Device Enrollment Configuration Type|singlePlatformRestriction                                                                                                                                                                                      |
|Platform Type                       |androidForWork                                                                                                                                                                                                 |
|Platform Restriction                |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** 13.0.0<br/>**osMaximumVersion:** 16.99.99<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>|

### POC_AND_DA_U_BYOD_Allow_ResourceAccounts
Description: Users for Teams Room Systems and Phones
#### Configuration
|              setting               |                                                                                                           value                                                                                                           |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentPlatformRestrictionConfiguration                                                                                                                                                          |
|Display Name                        |POC_AND_DA_U_BYOD_Allow_ResourceAccounts                                                                                                                                                                                   |
|Priority                            |                                                                                                                                                                                                                          1|
|Role Scope Tag Ids                  |Default<br/>                                                                                                                                                                                                               |
|Device Enrollment Configuration Type|singlePlatformRestriction                                                                                                                                                                                                  |
|Platform Type                       |android                                                                                                                                                                                                                    |
|Platform Restriction                |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** None<br/>**osMaximumVersion:** None<br/>**blockedManufacturers:** <ul><li> Yealink </li></ul>**blockedSkus:** <ul></ul>|

### POC_IOS_U_BYOD_Allow
#### Assignments
|intent |      target      |filter type|            filter name             |
|-------|------------------|-----------|------------------------------------|
|Include|TEST_SG_MDM_U_NCSC|none       |00000000-0000-0000-0000-000000000000|
|Include|TEST_SG_MDM_U_CIS |none       |00000000-0000-0000-0000-000000000000|
|Include|                  |none       |00000000-0000-0000-0000-000000000000|
|Include|TEST_SG_MDM_U_CE+ |none       |00000000-0000-0000-0000-000000000000|

#### Configuration
|              setting               |                                                                                                     value                                                                                                     |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentPlatformRestrictionConfiguration                                                                                                                                              |
|Display Name                        |POC_IOS_U_BYOD_Allow                                                                                                                                                                                           |
|Priority                            |                                                                                                                                                                                                              1|
|Role Scope Tag Ids                  |Default<br/>                                                                                                                                                                                                   |
|Device Enrollment Configuration Type|singlePlatformRestriction                                                                                                                                                                                      |
|Platform Type                       |ios                                                                                                                                                                                                            |
|Platform Restriction                |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** 18.0.0<br/>**osMaximumVersion:** 26.99.99<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>|

### POC_MAC_U_BYOD_Allow_AllUsers
#### Assignments
|intent | target  |filter type|            filter name             |
|-------|---------|-----------|------------------------------------|
|Include|All Users|none       |00000000-0000-0000-0000-000000000000|

#### Configuration
|              setting               |                                                                                                  value                                                                                                  |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentPlatformRestrictionConfiguration                                                                                                                                        |
|Display Name                        |POC_MAC_U_BYOD_Allow_AllUsers                                                                                                                                                                            |
|Priority                            |                                                                                                                                                                                                        1|
|Role Scope Tag Ids                  |Default<br/>                                                                                                                                                                                             |
|Device Enrollment Configuration Type|singlePlatformRestriction                                                                                                                                                                                |
|Platform Type                       |mac                                                                                                                                                                                                      |
|Platform Restriction                |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** None<br/>**osMaximumVersion:** None<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>|

### POC_WIN_D_CO_Intune_AllUsers
#### Configuration
|                     setting                     |                                                             value                                                             |
|-------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
|Odata type                                       |#microsoft.graph.deviceComanagementAuthorityConfiguration                                                                      |
|Display Name                                     |POC_WIN_D_CO_Intune_AllUsers                                                                                                   |
|Priority                                         |                                                                                                                              1|
|Role Scope Tag Ids                               |Default<br/>                                                                                                                   |
|Device Enrollment Configuration Type             |deviceComanagementAuthorityConfiguration                                                                                       |
|Managed Device Authority                         |                                                                                                                              1|
|Install Configuration Manager Agent              |True                                                                                                                           |
|Configuration Manager Agent Command Line Argument|/mp:<CloudManagementGatewayURL> /nocrlcheck CCMHOSTNAME=<CloudManagementGateway> SMSSiteCode=<SiteCode> SMSMP=<ManagementPoint>|

### POC_WIN_U_BYOD_Allow_AllUsers
#### Assignments
|intent | target  |filter type|            filter name             |
|-------|---------|-----------|------------------------------------|
|Include|All Users|none       |00000000-0000-0000-0000-000000000000|

#### Configuration
|              setting               |                                                                                                             value                                                                                                             |
|------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentPlatformRestrictionConfiguration                                                                                                                                                              |
|Display Name                        |POC_WIN_U_BYOD_Allow_AllUsers                                                                                                                                                                                                  |
|Priority                            |                                                                                                                                                                                                                              2|
|Role Scope Tag Ids                  |Default<br/>                                                                                                                                                                                                                   |
|Device Enrollment Configuration Type|singlePlatformRestriction                                                                                                                                                                                                      |
|Platform Type                       |windows                                                                                                                                                                                                                        |
|Platform Restriction                |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** 10.0.19045.0000<br/>**osMaximumVersion:** 10.0.26200.9999<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>|

### POC_WIN_U_BYOD_Allow_AllUsers_NotHome
#### Assignments
|intent | target  |filter type| filter name  |
|-------|---------|-----------|--------------|
|Include|All Users|include    |WIN_OS_NotHome|

#### Configuration
|              setting               |                                                                                                  value                                                                                                  |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Odata type                          |#microsoft.graph.deviceEnrollmentPlatformRestrictionConfiguration                                                                                                                                        |
|Display Name                        |POC_WIN_U_BYOD_Allow_AllUsers_NotHome                                                                                                                                                                    |
|Priority                            |                                                                                                                                                                                                        1|
|Role Scope Tag Ids                  |Default<br/>                                                                                                                                                                                             |
|Device Enrollment Configuration Type|singlePlatformRestriction                                                                                                                                                                                |
|Platform Type                       |windows                                                                                                                                                                                                  |
|Platform Restriction                |**platformBlocked:** False<br/>**personalDeviceEnrollmentBlocked:** False<br/>**osMinimumVersion:** None<br/>**osMaximumVersion:** None<br/>**blockedManufacturers:** <ul></ul>**blockedSkus:** <ul></ul>|

