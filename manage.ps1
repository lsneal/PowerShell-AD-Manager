function CreateUser()
{
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
