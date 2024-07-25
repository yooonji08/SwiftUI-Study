//
//  FunctionsInter.swift
//  SwiftUI-Intermediate
//
//  Created by 이윤지 on 7/23/24.
//

import SwiftUI

// MARK: - MODEL
struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String // 이름
    let points: Int // 성적
    let isChecked: Bool
}

// MARK: - VIEWMODEL
class UserViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    // 뷰모델이 초기에 실행할 값
    init() {
        getUsers()
        updateFilterArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Yoonji", points: 90, isChecked: true)
        let user2 = UserModel(name: "Chris", points: 99, isChecked: false)
        let user3 = UserModel(name: "Ammanda", points: 75, isChecked: true)
        let user4 = UserModel(name: "Emma", points: 56, isChecked: true)
        let user5 = UserModel(name: "Jason", points: 34, isChecked: false)
        let user6 = UserModel(name: "Sarah", points: 59, isChecked: true)
        let user7 = UserModel(name: "Lisa", points: 100, isChecked: false)
        let user8 = UserModel(name: "John", points: 32, isChecked: true)
        let user9 = UserModel(name: "Steve", points: 45, isChecked: false)
        let user10 = UserModel(name: "Peter", points: 72, isChecked: true)
        
        // 배열에 값 넣기
        dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
    
    func updateFilterArray() {
        // 1. Sort
        // 원본 dataArray를 건들지 않고, 사본을 만들어서 정렬한 수를 return
        /*
        filteredArray = dataArray.sorted(by: { (user1, user2) -> Bool in
            return user1.points < user2.points
        })
        
        // 클로저 축약으로 return 생략.
        // $0 -> user1, $1 -> user2를 가리킴
        filteredArray = dataArray.sorted(by: { $0.points < $1.points })
        */
         
        // 2. Filter
        // array 안의 값들을 하나씩 보면서 조건에 맞는 값들만 나타내는 것
        /*
        filteredArray = dataArray.filter({ (user) -> Bool in
            // 점수가 50점 이상인 사람만 반환
            //return user.points > 50
            
            // 이름에 i가 들어간 사람만 반환
            return user.name.contains("i")
        })
        
        // checked된 사람 중, 점수가 높은 사람 순서대로 보여주기
        filteredArray = dataArray.filter({ $0.isChecked }).sorted(by: { $0.points > $1.points })
        */
        
        // 3. Map
        // 주로 데이터를 변형할 때 사용
        // ex. [UserModel]에서 name의 값만 가져오고 싶을 때 사용
        /*
        mappedArray = dataArray.map({ (user) -> String in
            return user.name
        })
        
        // name값을 반환, 그 중 이름에 i가 있음 사람 반환
        mappedArray = dataArray.map({ $0.name }).filter({ $0.contains("i")})
        
        // name 반환, 내림차순 반환
        mappedArray = dataArray.map({ $0.name }).sorted(by: { $0 < $1 })
         */
        
        // CompactMap
        // 옵셔널 처리를 따로 안 해도 괜찮음. 값이 있는 사람만 반환해줌.
        /*
        mappedArray = dataArray.compactMap({ (user) -> String? in
            return user.name
        })
         */
        
        mappedArray = dataArray.compactMap({ $0.name })
    }
}

// MARK: - VIEW
struct FunctionsInter: View {
    // MARK: - PROPERTY
    @StateObject var vm: UserViewModel = .init()
    //@StateObject var vm: UserViewModel = UserViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    /*
                    ForEach(vm.filteredArray) { user in
                        VStack (alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            HStack {
                                Text("점수: \(user.points)")
                                Spacer()
                                if user.isChecked {
                                    Image(systemName: "checkmark.seal.fill")
                                } //: CONDITION
                            } //: HSTACK
                        } //: VSTACK
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
                        .padding(.horizontal)
                    } //: LOOP
                    */
                    
                    // Map일 때, 반환값이 [String]이므로 Model에 id값이 없음.
                    // id 값을 지정해줘야 함.
                    ForEach(vm.mappedArray, id: \.self) { name in
                        Text(name)
                            .font(.title)
                    }
                } //: VSTACK
            } //:SCROLL
            .navigationTitle("학생 시험 성적표")
        } //: NAVIGATION
    }
    // MARK: - FUNCTION
}

// MARK: - PREVIEW
#Preview {
    FunctionsInter()
}
