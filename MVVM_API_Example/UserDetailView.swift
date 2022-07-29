//
//  UserDetailView.swift
//  MVVM_API_Example
//
//  Created by Kyle Essenmacher on 7/29/22.
//
import Foundation
import SwiftUI

struct UserDetailView: View {
    
    let user: User
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                info
                
                Divider()
                
                contact
                
                Divider()
                
                company
                
                Divider()
                
                address
                
            }
            .frame (maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.gray.opacity(0.1), in: RoundedRectangle (cornerRadius: 10,
                                                                  style: .continuous))
            .padding()
            .navigationTitle( "User Detail")
        }
    }
}

private extension UserDetailView {
    
    var info: some View {
        VStack(alignment: .leading,
               spacing: 12) {
            Text("Info")
                .bold()
            Text(user.name)
            Text(user.username)
        }
    }
    
    var contact: some View {
        VStack(alignment: .leading,
              spacing: 12) {
            Text ("Contact")
                .bold()
            Text(user.website)
            Text(user.phone)
            Text(user.email)
            
        }
    }
    var company: some View {
        VStack(alignment: .leading,
               spacing: 12) {
            Text ( "Address")
                .bold()
            Text(user.company.name)
        }
    }
    var address: some View {
        VStack(alignment:.leading,
               spacing: 12) {
            Text ( "Address")
                .bold()
            Text(user.address.street)
            Text(user.address.suite)
            Text(user.address.city)
            Text(user.address.zipcode)
        }
    }

}
struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View{
    UserDetailView(user: User)
    }
}

