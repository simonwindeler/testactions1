using 'main.bicep'

param vnetName = 'vnet-uks-github'
param addressPrefixes = [
  '10.0.0.1/24'
]
param subnets = [
  {
    addressPrefix: '10.0.0.1/28'
    name: 'snet-vm'
  }
]

