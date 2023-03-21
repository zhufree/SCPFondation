//
//  HomePageView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/17.
//

import SwiftUI

struct HomePageView:View {
    var body: some View {
        let entryTypes = SCPConstants.Entry.init()
        NavigationView {
            List {
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.SCP_DOC, categoryName: "SCP系列")) {
                    Text("SCP系列")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.SCP_CN_DOC, categoryName: "SCP-CN系列")) {
                    Text("SCP-CN系列")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.STORY_DOC, categoryName: "故事与设定")) {
                    Text("故事与设定")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.WANDER_DOC, categoryName: "放逐者图书馆")) {
                    Text("放逐者图书馆")
                }
//                ForEach(0..<10) { index in
//                    NavigationLink(destination: DetailView()) {
//                        Text("列表项 \(index+1)")
//                    }
//                }
            }
            #if os(macOS)
                // macOS code
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("SCP基金会")
                }
            }
            #elseif os(iOS)
                // iOS code
            .navigationBarTitle(Text("SCP基金会"))
            #endif
        }
    }
}



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
