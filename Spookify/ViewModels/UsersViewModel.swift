//
//  UsersViewModel.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import Foundation

@MainActor
@Observable
final class UsersViewModel {
    var users: Users
    var currentUser: User?
    var errorMessage: String?
    var isLoading = false
    
    private let usersService: UserServiceProtocol
    
    init(usersService: UserServiceProtocol) {
        self.users = .empty
        self.usersService = usersService
    }
    
    func loadUsers() async {
        do {
            isLoading = true
            self.users = try await self.usersService.getUsers()
            isLoading = false
        } catch {
            print("DEBUG: failed to get users -> \(error)")
            errorMessage = error.localizedDescription
        }
    }
    
    func getCurrentUser() async {
        do {
            let user = try await usersService.getCurrentUser(1)
            self.currentUser = user
        } catch {
            print("DEBUG: failed to get user -> \(error)")
        }
    }
}
