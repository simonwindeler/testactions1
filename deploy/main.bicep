// vNet params
param vnetName string
param addressPrefixes array
param subnets array

// vm params
param vmName string
param adminUsername string
param imageReference object
param nicConfigurations array
param osDisk object
param osType string
param vmSize string
param zone int
param encryptionAtHost bool

module vnet 'br/public:avm/res/network/virtual-network:0.6.1' = {
  params: {
    name: vnetName
    addressPrefixes: addressPrefixes
    subnets: subnets
  }
}

module vm 'br/public:avm/res/compute/virtual-machine:0.12.3' = {
  params: {
    name: vmName
    adminUsername: adminUsername 
    imageReference: imageReference
    nicConfigurations: nicConfigurations
    osDisk: osDisk
    osType: osType
    vmSize: vmSize
    zone: zone
    encryptionAtHost: encryptionAtHost
  }
}
