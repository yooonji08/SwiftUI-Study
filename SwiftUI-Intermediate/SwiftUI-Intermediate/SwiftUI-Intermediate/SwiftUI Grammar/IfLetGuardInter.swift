//
//  IfLetGuardInter.swift
//  SwiftUI-Intermediate
//
//  Created by 이윤지 on 7/20/24.
//

import SwiftUI

struct IfLetGuardInter: View {
    
    // MARK: - PROPERTY
    @State var displayText: String? = nil
    @State var currentUserID: String?
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                Text("Safe Code 연습하기")
                if let text = displayText { // displayText 값이 true인 경우, String값이 있음
                    Text(text)
                        .font(.title2)
                    
                } else { // displayText 값이 false인 경우, String = nil
                    ProgressView()
                }
                Spacer()
            } //: VSTACK
            .navigationTitle("Optional 처리하기")
            .onAppear { // View가 초기화 될 때 실행
                loadData()
            }
        } //: NAVIGATION
    }
    // MARK: - FUNCTION
    // If let 사용
    func loadData() {
        // currentUserID 값 체크
        if let userID = currentUserID { // 값이 있는 경우
            // 3초 뒤 실행
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "데이터를 성공적으로 가져왔습니다.\n당신의 이름은\(userID)"
            }
        } else { // nil인 경우
            displayText = "Error, 로그인이 되지 않았습니다."
        }
    }
    
    // Guard let 사용
    func loadData2() {
        
    }
}

// MARK: - PREVIEW
#Preview("if-let, Guard-let 사용법") {
    IfLetGuardInter()
}
