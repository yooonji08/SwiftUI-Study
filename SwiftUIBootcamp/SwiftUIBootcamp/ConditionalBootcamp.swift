//
//  ConditionalBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by 이윤지 on 2/18/24.
//

import SwiftUI

/// #23 How to use if-else and conditional statements in SwiftUI | Bootcamp
struct ConditionalBootcamp: View {
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // description -> boolean값(true 또는 false)을 가져올 수 있음
            Button("IS LOADING: \(isLoading.description)") {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
            else {
                Button("Circle Button: \(showCircle.description)") {
                    // 버튼을 누르면, bool값이 true -> false, flase -> true로 바뀜
                    showCircle.toggle()
                }
                Button("Rectangle Button: \(showRectangle.description)") {
                    showRectangle.toggle()
                }
                
                // 값이 true라면
                if showCircle {
                    Circle()
                        .frame(width: 100, height: 100)
                }
                
                // 값이 true라면
                if showRectangle {
                    Rectangle()
                        .frame(width: 100, height: 100)
                }
                
                // 두 개의 값 모두 false라면
                if !showCircle && !showRectangle {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 100, height: 100)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ConditionalBootcamp()
}
