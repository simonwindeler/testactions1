param vnetName string
param addressPrefixes array
param subnets array

module vnet 'br/public:avm/res/network/virtual-network:0.6.1' = {
  params: {
    name: vnetName
    addressPrefixes: addressPrefixes
    subnets: subnets
  }
}
