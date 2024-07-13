# Network Moya Async (Concurrency)
NetworkMoyaAsync is a `Swift package` that provides a network layer using Moya, fully integrated with Swift's async/await concurrency model. This library simplifies network requests and enhances code readability by leveraging the modern Swift concurrency features.

## Features
**Asynchronous Network Requests:** *Utilizes Swift's async/await to handle network requests asynchronously.  <br>*
**Integration with Moya:** *Provides the robustness of Moya for network abstraction. <br>*
**Error Handling:** *Simplifies error handling with Swift's Result type and withCheckedThrowingContinuation. <br>*

## Requirements
iOS 13.0+ <br>
Swift 5+ <br>
Xcode 13.0+ <br>

## Installation

To integrate NetworkMoyaAsync into your project using Swift Package Manager, add the following dependency to your Package.swift file:

```ruby
dependencies: [
    .package(url: "https://github.com/Nomi-ngj/NetworkMoyaAsync.git", branch: "main")
]
```

## Usage
### Setting Up
First, import the necessary modules:
```ruby
import NetworkMoyaAsync
```

### Integrating with SwiftUI
Follow these steps to integrate NetworkMoyaAsync with SwiftUI:

Create a ViewModel:

Define a `UserViewModel` class that conforms to `ObservableObject` This class will handle fetching and storing user data.

```ruby

class UserViewModel: ObservableObject {
    
    @Published var users = [User]() // Published property to update the view when users change
    private var currentPage: Int = 1 // Track the current page for pagination
    private var userClient: UserClient // Unowned reference to the user client
    private var fetchUsersTask: Task<Void, Never>? = nil // Task to manage ongoing fetch user requests
    
    init(userClient: UserClient) {
        self.userClient = userClient
    }
    
    // Fetch users with pagination support
    func fetchUsers(page: Int) {
        // Cancel any ongoing task to avoid multiple network calls
        fetchUsersTask?.cancel()
        
        // Create a new task for fetching users
        fetchUsersTask = Task {
            do {
                // Update the current page
                self.currentPage = page
                // Make the network request to fetch users
                let usersResponse = try await userClient.getUsers(request: .init(page: page))
                // If it's the first page, replace the users array, else append to it
                if page == 1 {
                    self.users = usersResponse.data ?? []
                } else {
                    self.users.append(contentsOf: usersResponse.data ?? [])
                }
            } catch {
                // Handle errors appropriately
                debugPrint(error.localizedDescription)
            }
        }
    }
}

```

### Use the ViewModel in Your SwiftUI View:

Create a SwiftUI view that uses the `UserViewModel` to display and fetch user data.

```ruby
import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserViewModel(userClient: .init())

    var body: some View {
        List(viewModel.users, id: \.id) { user in
            Text(user.name)
        }
        .onAppear {
            viewModel.fetchUsers(page: 1)
        }
    }
}
```

## Contributing<br>
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.<br>

## Contact<br>
For any questions or suggestions, feel free to contact me at Noumanguljunejo@gmail.com.<br>
