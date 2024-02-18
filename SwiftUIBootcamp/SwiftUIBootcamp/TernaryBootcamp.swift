//
//  TernaryBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by 이윤지 on 2/18/24.
//

import SwiftUI

/// #24 How to use Ternary Operators in SwiftUI | Bootcamp
struct TernaryBootcamp: View {
    @State var  isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button: \(isStartingState.description)") {
                isStartingState.toggle()
            }
            
            // 삼항 연산자를 사용하여 각 컴포넌트의 값 제어하기
            Text(isStartingState ? "STARTING STATE" : "ENDING STATE")
            
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? Color.mint : Color.purple)
                .frame(
                    width: isStartingState ? 200 : 50,
                    height: isStartingState ? 400 : 50)
            
            Spacer()
        }
    }
}

#Preview {
    TernaryBootcamp()
}
