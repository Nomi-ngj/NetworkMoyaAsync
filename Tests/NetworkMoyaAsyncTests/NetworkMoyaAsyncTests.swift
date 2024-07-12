import XCTest
@testable import NetworkMoyaAsync

final class NetworkMoyaAsyncTests: XCTestCase {
    
    func testGetUsers() async throws {
        // Arrange
        let sut = UserClient()
        let request = UserRequest(page: 1)
        let expectedUsersCount = 6 // Adjust based on your response data
        
        // Act
        let users = try await sut.getUsers(request: request)
        // Additional assertions if you want to validate individual user details
        if let users = users.data {
            // Assert
            XCTAssertEqual(users.count, expectedUsersCount, "Number of received users should match expected count")
            
            // Example assertion for the first user's details
            XCTAssertEqual(users[0].id, 1, "First user ID should match expected value")
            XCTAssertEqual(users[0].email, "george.bluth@reqres.in", "First user email should match expected value")
            XCTAssertEqual(users[0].firstName, "George", "First user first name should match expected value")
            XCTAssertEqual(users[0].lastName, "Bluth", "First user last name should match expected value")
            XCTAssertEqual(users[0].avatar, "https://reqres.in/img/faces/1-image.jpg", "First user avatar URL should match expected value")
        } else {
            XCTFail("Pagination data is nil")
        }
    }
}
