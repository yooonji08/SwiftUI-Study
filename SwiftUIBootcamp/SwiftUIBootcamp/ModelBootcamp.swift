//
//  ModelBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by 이윤지 on 2/18/24.
//

import SwiftUI

/// USER 모델
struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

/// #49 How to create custom models in SwiftUI | Bootcamp
struct ModelBootcamp: View {
    /// USER 배열
    @State var users: [UserModel] = [
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Emily", userName: "itsemily1995", followerCount: 55, isVerified: false),
        UserModel(displayName: "Samantha", userName: "ninja", followerCount: 355, isVerified: false),
        UserModel(displayName: "Chris", userName: "chrish2009", followerCount: 88, isVerified: true)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                // USER 배열을 리스트로 보여주기
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        /// 프로필 이미지
                        Circle()
                            .frame(width: 35, height: 35)
                        
                        VStack(alignment: .leading) {
                            /// 이름
                            Text(user.displayName)
                                .font(.headline)
                            
                            /// 아이디
                            Text("@\(user.userName)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        
                        /// 인증 마크 띄우기 여부
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        
                        /// 팔로워 수
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .font(.headline)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            // GroupedListStyle(), .group -> 양쪽 여백X
            // InsetGroupedListStyle(), .insetGrouped -> 양쪽 여백O
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ModelBootcamp()
}
