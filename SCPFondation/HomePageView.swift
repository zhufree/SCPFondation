//
//  HomePageView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/17.
//

import SwiftUI

struct HomePageView:View {
    // HomePageView->EntryCategoryView->GroupListView/SCPListView->SCPListView->DetailView
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
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.WANDER_DOC, title: "图书馆")) {
                    Text("图书馆")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.WANDER_DOC, title: "SCP国际版")) {
                    Text("SCP国际版")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.WANDER_DOC, title: "GOI格式")) {
                    Text("GOI格式")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.WANDER_DOC, title: "艺术作品")) {
                    Text("艺术作品")
                }
                NavigationLink(destination: EntryCategoryView(entryType: entryTypes.WANDER_DOC, title: "背景资料与指导")) {
                    Text("背景资料与指导")
                }
            }
            .navigationBarTitle(Text("SCP基金会"))
        }
    }
}



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
