//
//  ContentView.swift
//  MVVM_API_Example
//
//  Created by Kyle Essenmacher on 7/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = UsersViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            } else {
                NavigationView {
                    List {
                        ForEach(vm.users, id: \.id) { user in
                            
                            VStack {
                                
                                Text(user.name)
                                    .bold()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(.gray.opacity(0.1),
                                        in: RoundedRectangle (cornerRadius: 10, style: .continuous))
                            .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Users")
                }
            }
        }
        .task {
            
            do {
                try await vm.fetchUsers()
            } catch {
                print (error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previows: some View {
        ContentView()
    }
}

private extension ContentView {

    func fetchUsors () async throws -> [User] {
        
    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        let decoder = JSONDecoder()
        return try decoder.decode([User].self, from: data)
    }
}

