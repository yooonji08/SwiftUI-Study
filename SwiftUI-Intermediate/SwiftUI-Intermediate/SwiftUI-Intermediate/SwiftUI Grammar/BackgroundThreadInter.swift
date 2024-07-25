//
//  BackgroundThreadInter.swift
//  SwiftUI-Intermediate
//
//  Created by 이윤지 on 7/25/24.
//

import SwiftUI

// MARK: - VIEWMODEL
class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        // 데이터 다운로드 => 비동기 처리 = background 스레드에서 작동
        DispatchQueue.global().async {
            let newData = self.downloadData()
            // 작동하고 있는 thread 정보 출력
            print("Check 1: \(Thread.isMainThread)")
            print("Check 1: \(Thread.current)")
            
            // ui처리 => main 스레드에서 작동
            DispatchQueue.main.sync {
                self.dataArray = newData
                
                // 작동하고 있는 thread 정보 출력
                print("Check 2: \(Thread.isMainThread)")
                print("Check 2: \(Thread.current)")
            }
        }
    }
    
    func downloadData() -> [String] {
        // sample Data 생성
        var data: [String] = []
        
        // 0부터 999까지
        for x in 0..<1000 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadInter: View {
    @StateObject var vm: BackgroundThreadViewModel = .init()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                Text("데이터 로드")
                    .font(.title)
                    .fontWeight(.bold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            } //: VStack
        } //: SCROLL
    }
}

#Preview {
    BackgroundThreadInter()
}
