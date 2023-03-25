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
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.SCP_DOC, title: "SCP系列")) {
                    Text("SCP系列")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.SCP_CN_DOC, title: "SCP-CN系列")) {
                    Text("SCP-CN系列")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.STORY_DOC, title: "故事与设定")) {
                    Text("故事与设定")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.WANDER_DOC, title: "放逐者图书馆")) {
                    Text("放逐者图书馆")
                }
            }
            #if os(macOS)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("SCP基金会")
                }
            }
            #elseif os(iOS)
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
