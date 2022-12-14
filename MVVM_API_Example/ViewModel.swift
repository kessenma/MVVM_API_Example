//
//  ViewModel.swift
//  MVVM_API_Example
//
//  Created by Kyle Essenmacher on 7/29/22.
//

import Foundation

final class UsersViewModel: ObservableObject {
    
    @Published private(set) var users: [User] = []
    @Published private(set) var isLoading = false

    func fetchUsers() async throws {

        isLoading = true
        defer { isLoading = false }
        
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        
        let decoder = JSONDecoder()
        self.users = try decoder.decode([User].self, from: data)
    }
}
