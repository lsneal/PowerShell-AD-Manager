function CreateUser()
{
    $username = Read-Host "Enter username"
    $userpname = Read-Host "Enter principal username"
    $name = Read-Host "Enter name"
    $firstname = Read-Host "Enter first name"
    $lastname = Read-Host "Enter last name"
    $dname = Read-Host "Enter display name"
    
    while (1) {
        $password = Read-Host "Enter password"
        if ($password -ge (Get-ADDefaultDomainPasswordPolicy).MinPasswordLength) {
            break ;
        }
        Write-Host "Password Policy error"
    }

    New-ADuser  -SamAccountName "$username" `
                -UserPrincipalName "$userpname" `
                -Name "$name" `
                -GivenName "$firstname" `
                -Surname "$lastname" `
                -DisplayName "$dname" `
                -Enabled $true `
                -PasswordNeverExpires $true `
                -AccountPassword (ConvertTo-SecureString -AsPlainText "$password" -Force) ` 
                -PassThru
    Write-Host "User created"
}

function DeleteUser()
{
    $username = Read-Host "Enter username"

    Remove-ADUser -Identity "$username"
    Write-Host "User deleted"
}

function ResetPassword()
{
    # Get info password policy
    Get-ADDefaultDomainPasswordPolicy

    $username = Read-Host "Enter username"
    $newpassword = Read-Host "Enter new password"

    Set-ADAccountPassword   -Identity "$username" `
                            -NewPassword (ConvertTo-SecureString "$newpassword" -AsPlainText
 -Force) `
                            -Reset
    Write-Host "Password Reset"
}

function Userinfo()
{
    $username = Read-Host "Enter username"
    Get-ADUser -Identity "$username" -Properties *
}

function EnableUser()
{
    $username = Read-Host "Enter username"
    Enable-ADAccount -Identity "$username"
}

function DisableUser()
{
    $username = Read-Host "Enter username"
    Disable-ADAccount -Identity "$username"
}

Write-Host "Menu:"
Write-Host "1 - Create new user"
Write-Host "2 - Delete user"
Write-Host "3 - Reset password user"
Write-Host "4 - Get user info"
Write-Host "5 - Enable user account"
Write-Host "6 - Disable user account"

$option = Read-Host "Enter the number"

if ($option -eq "1") {
    CreateUser
}
elseif ($option -eq "2") {
    DeleteUser
}
elseif ($option -eq "3") {
    ResetPassword
}
elseif ($option -eq "4") {
    Userinfo
}
elseif ($option -eq "5") {
    EnableUser
}
elseif ($option -eq "6") {
    DisableUser
}
else {
    Write-Host "Error"
}

