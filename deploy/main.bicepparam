using 'main.bicep'

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

