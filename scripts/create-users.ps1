# Cr�er une Unit� d'Organisation (OU)
New-ADOrganizationalUnit -Name "Informatique" -Path "DC=monreseau,DC=local"

# Cr�er un groupe dans cette OU
New-ADGroup -Name "admins" -GroupScope Global -GroupCategory Security -Path "OU=Informatique,DC=monreseau,DC=local"

# Cr�er le premier utilisateur : Figuiguii.Miloudd
New-ADUser `
  -Name "Figuiguii Miloudd" `
  -GivenName "Figuiguii" `
  -Surname "Miloudd" `
  -SamAccountName "Figuiguii.Miloudd" `
  -UserPrincipalName "Figuiguii.Miloudd@monreseau.local" `
  -AccountPassword (ConvertTo-SecureString "Modpass@123" -AsPlainText -Force) `
  -ChangePasswordAtLogon $true `
  -Enabled $true `
  -Path "OU=Informatique,DC=monreseau,DC=local"

# Ajouter Figuiguii.Miloudd au groupe Admins
Add-ADGroupMember -Identity "Admins" -Members "Figuiguii.Miloudd"

# Cr�er le deuxi�me utilisateur : Valentin.Phillips
New-ADUser `
  -Name "Valentin Phillips" `
  -GivenName "Valentin" `
  -Surname "Phillips" `
  -SamAccountName "Valentin.Phillips" `
  -UserPrincipalName "Valentin.Phillips@monreseau.local" `
  -AccountPassword (ConvertTo-SecureString "Password@123" -AsPlainText -Force) `
  -ChangePasswordAtLogon $true 
  -Enabled $true `
  -Path "OU=Informatique,DC=monreseau,DC=local"
