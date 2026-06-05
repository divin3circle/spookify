//
//  UsersViews.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import SwiftUI

struct UsersView: View {
    @State private var userViewModel = UsersViewModel(usersService: UserService())
    
    var body: some View {
        VStack {
            ForEach(userViewModel.users.users) { user in
                Text(user.firstName)
                    .font(AppFonts.body())
                    .foregroundStyle(.accent)
            }
        }
        .padding(40)
        .task {
            await userViewModel.loadUsers()
        }
    }
}

#Preview {
    UsersView()
}
