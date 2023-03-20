//
//  ContentView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/17.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection){
            HomePageView()
                .tabItem {
                    VStack {
                        Image(systemName: "book.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("Read")
                    }
                }
                .tag(0)
            SettingView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("Setting")
                    }
                }
                .tag(1)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
