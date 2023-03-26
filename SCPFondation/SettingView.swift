//
//  SettingView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/17.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DatabaseView()) {
                    Text("本地数据")
                }
//                NavigationLink(destination: DetailView()) {
//                    Text("App使用说明")
//                }
//                NavigationLink(destination: DetailView()) {
//                    Text("浏览历史")
//                }
            }
//            #if os(macOS)
//                // macOS code
//            .toolbar {
//                ToolbarItem(placement: .navigation) {
//                    Text("列表")
//                }
//            }
//            #elseif os(iOS)
//                // iOS code
//            .navigationBarTitle(Text("列表"))
//            #endif
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseView()
    }
}
