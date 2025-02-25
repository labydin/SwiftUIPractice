//
//  ContentView.swift
//  MyWheather
//
//  Created by 박준영 on 12/26/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        // 내 위치(위치기반 날씨 정보 가져오기)
        
        // 현재 온도
        // 날씨
        // 체감 온도
        // 최고, 최저 온도
        
        // 풍속
        // 습도
        // 미세먼지
        // 자외선 지수
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MainView()
}
