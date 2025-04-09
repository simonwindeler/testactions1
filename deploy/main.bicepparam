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
param vmDeploy = false
param vmName = 'vm-github-test-01'
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
