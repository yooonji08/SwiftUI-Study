//
//  BindingBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by 이윤지 on 2/16/24.
//

import SwiftUI

/// #22 How to use @Binding property wrapper in SwiftUI
/// 부모 뷰
struct BindingBootcamp: View {
    
    @State var backgroundColor: Color = Color.green
    @State var title: String = "title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                Text(title)
                    .foregroundStyle(.white)
                
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

/// 자식 뷰
struct ButtonView: View {
    @Binding var backgroundColor: Color
    @State var buttonColor: Color = Color.blue
    @Binding var title: String
    
    var body: some View {
        Button {
            backgroundColor = Color.orange
            buttonColor = Color.pink
            title = "NEW TITLE~~~~~!"
        } label: {
            Text("Button")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    BindingBootcamp()
}
