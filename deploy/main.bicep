var adminPassword = 'P@ssword1234!!'

// vNet params
param vnetName string
param addressPrefixes array
param subnets array

// vm params
param vmDeploy bool
param vmName string
param adminUsername string
param imageReference object
param nicConfigurations array
param osDisk object
param osType string
param vmSize string
param zone int
param encryptionAtHost bool

// automation account params
param automationAccountName string


module vnet 'br/public:avm/res/network/virtual-network:0.6.1' = {
  name: 'deploy-${vnetName}'
  params: {
    name: vnetName
    addressPrefixes: addressPrefixes
    subnets: subnets
  }
}

module vm 'br/public:avm/res/compute/virtual-machine:0.12.3' = if (vmDeploy) {
  name: 'deploy-${vmName}'
  params: {
    name: vmName
    adminUsername: adminUsername
    adminPassword: adminPassword
    imageReference: imageReference
    nicConfigurations: nicConfigurations
    osDisk: osDisk
    osType: osType
    vmSize: vmSize
    zone: zone
    encryptionAtHost: encryptionAtHost
  }
}

module automationaccount 'br/public:avm/res/automation/automation-account:0.1.0' = {
  name: 'deploy-${automationAccountName}'
  params: {
    name: automationAccountName
    location: resourceGroup().location
    skuName: 'Basic'    
    managedIdentities: {
      systemAssigned: true
    }
  }
}
