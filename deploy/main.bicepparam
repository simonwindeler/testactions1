using 'main.bicep'

var subscriptionId = 'd0ed4f4a-58e8-4207-ad1d-cfbf8036326a'
var addssubnetResourceId = '/subscriptions/${subscriptionId}/resourceGroups/rg-uks-prod-github/providers/Microsoft.Network/virtualNetworks/${vnetName}/subnets/${subnets[0].name}'

param vnetName = 'vnet-uks-github'
param addressPrefixes = [
  '10.0.0.0/24'
]
param subnets = [
  {
    addressPrefix: '10.0.0.0/28'
    name: 'snet-vm'
  }
]

// vm params 
param vmDeploy = true
param vmName = 'vm-github-01'
param adminUsername = 'azadmin'
param imageReference = {
   offer: 'WindowsServer'
   publisher: 'MicrosoftWindowsServer'
   sku: '2022-datacenter-azure-edition'
   version: 'latest'
}
param nicConfigurations = [
  {        
    name: '${vmName}-nic-01'
    enableAcceleratedNetworking: false
    ipConfigurations: [
      {
        name: 'ipconfig1'
        privateIPAllocationMethod: 'Static'
        privateIPAddress: '10.0.0.4'
        subnetResourceId: addssubnetResourceId
      }
    ]
  }
]
param osDisk = {
  caching: 'ReadWrite'
  deleteOption: 'Detach'
  diskSizeGB: 128
  createOption: 'FromImage'
  managedDisk: {
    storageAccountType: 'StandardSSD_LRS'
  }
  name: '${vmName}-osdisk'
}
param osType = 'Windows'
param vmSize = 'Standard_B2ms'
param zone = 0
param encryptionAtHost = false

param automationAccountName = 'aa-uks-prod-github'
param runbooks = [
  // {
  //   description: 'Test runbook'
  //   name: 'TestRunbook'
  //   type: 'PowerShell'
  //   uri: 'https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.automation/101-automation/scripts/AzureAutomationTutorial.ps1'
  //   version: '1.0.0.0'
  // }
]
param schedules = [
  {
    advancedSchedule: {}
    expiryTime: '9999-12-31T13:00'
    frequency: 'Day'
    interval: 1
    name: 'TestSchedule'
    startTime: '2025-04-10T03:00:00+01:00'
    timeZone: 'Europe/London'
  }
]
