# PowerShell-AD-Manager

This PowerShell script lets you manage users in an Active Directory (AD) domain. It offers several functions for creating, deleting, resetting user passwords and displaying information about a specific user. This script is designed to facilitate user administration in an Active Directory environment. For learning powershell.

The script includes the following functions:

1. **Create a new user**: Creates a new user in Active Directory with a username, password and other information.
2. **Delete User**: Removes an existing user from Active Directory.
3. **Reset Password**: Resets a user's password.
4. **Get user information**: Retrieves and displays detailed information on a specific user.

And more soon 
### Example

```powershell
PS C:\> .\AD-UserManagement.ps1
Menu:
1 - Create new user
2 - Delete user
3 - Reset password user
4 - Get user info
Enter the number: 1
Enter username: johndoe
Enter principal username: johndoe@domain.com
Enter name: John Doe
Enter first name: John
Enter last name: Doe
Enter display name: John Doe
Enter password: ********
User created
```