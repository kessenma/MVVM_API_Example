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
                            
                            UserInfoView(name: user.name)
                                .background(
                                    NavigationLink("", destination: UserDetailView(user: user))
//                                    takes out the carrot if you want, but i like the carrot
//                                        .opacity(0)
                                )
                        }
                        .listRowSeparator(.hidden)
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
    static var previews: some View {
        ContentView()
    }
}
