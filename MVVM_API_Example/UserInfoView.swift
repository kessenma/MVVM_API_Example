//
//  UserInfoView.swift
//  MVVM_API_Example
//
//  Created by Kyle Essenmacher on 7/29/22.
//

import Foundation
import SwiftUI

struct UserInfoView: View {
    let name: String
    var body: some View {
        VStack {
            
            Text (name)
                .bold()
        }
        .frame (maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.gray.opacity(0.1),
                    in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .listRowSeparator(.hidden)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(name: "Tunds")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
