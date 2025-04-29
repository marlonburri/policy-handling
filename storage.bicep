var policyToAssign = '/providers/Microsoft.Authorization/policyDefinitions/b2982f36-99f2-4db5-8eff-283140c09693'

module storageAccount 'br/public:avm/res/storage/storage-account:0.19.0' = {
  name: 'storageAccountDeployment'
  params: {
    // Required parameters
    name: 'stmysuperstorageaccount'
    kind: 'BlobStorage'
    location: 'westeurope'
    skuName: 'Standard_LRS'
    allowBlobPublicAccess: true
  }
}

resource policAssignment 'Microsoft.Authorization/policyAssignments@2025-03-01' = {
  name: 'Storage account disable public network access'
  properties: {
    parameters: {
      effect: { value: 'Audit' }
    }
  }
}
