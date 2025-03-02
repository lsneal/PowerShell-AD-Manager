function CreateUser()
{
    $username = Read-Host "Enter username: "
    $userpname = Read-Host "Enter principal username: "
    $name = Read-Host "Enter name: "
    $firstname = Read-Host "Enter first name: "
    $lastname = Read-Host "Enter last name: "
    $dname = Read-Host "Enter display name: "
    $password = Read-Host "Enter password: "

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
    Write-Host "User deleted"
}

function ResetPassword()
{
    Write-Host "Password Reset"        
}

Write-Host "Menu:"
Write-Host "1 - Create new user"       
Write-Host "2 - Delete user"
Write-Host "3 - Reset password user"   

$option = Read-Host "Enter the number" 

if ($option == 1)

$username = Read-Host "Enter name: "
$password = Read-Host "Enter password: "

Write-Host "User $username created with password: $password"
