//
//  HomePageView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/17.
//

import SwiftUI

struct HomePageView:View {
    // HomePageView->EntryCategoryView->GroupListView/SCPListView->SCPListView->DetailView
    @State private var selectedTab = 0
    let DBTypes = SCPConstants.ScpType()
    let entryTypes = SCPConstants.Entry.init()
    let tabs = ["首页", "图书馆", "SCP国际版", "GIO格式", "艺术作品", "背景资料与指导"]
    var body: some View {
        VStack {
            // 可滚动的顶部标签
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tabs.indices, id: \.self) { index in
                            Text(self.tabs[index])
                                .padding()
                                .background(selectedTab == index ? Color.blue : Color.clear)
                                .foregroundColor(selectedTab == index ? .white : .black)
                                .cornerRadius(10)
                                .onTapGesture {
                                    self.selectedTab = index
                                    withAnimation {
                                        scrollProxy.scrollTo(index, anchor: .center)
                                    }
                                }
                                .id(index)
                        }
                    }
                }
                .onChange(of: selectedTab) { newIndex in
                    withAnimation {
                        scrollProxy.scrollTo(newIndex, anchor: .center)
                    }
                }
            
            // 创建TabView与选择器同步
                TabView(selection: $selectedTab) {
                    IndexView()
                        .tabItem {
                            Label("首页", systemImage: "1.square.fill")
                        }
                        .tag(0)
                    SCPListView(dataType: DBTypes.SAVE_LIBRARY_PAGE, groupIndex: -1, categoryName: "图书馆")
                        .tabItem {
                            Label("图书馆", systemImage: "2.square.fill")
                        }
                        .tag(1) // 确保标签匹配
                    EntryCategoryView(entryType: entryTypes.INTERNATIONAL_DOC, title: "SCP国际版")
                        .tag(2) // 确保标签匹配
                        .tabItem {
                            Label("SCP国际版", systemImage: "3.square.fill")
                        }
                    EntryCategoryView(entryType: entryTypes.GOI_DOC, title: "GOI格式")
                        .tag(3) // 确保标签匹配
                        .tabItem {
                            Label("GOI格式", systemImage: "3.square.fill")
                        }
                    EntryCategoryView(entryType: entryTypes.ART_DOC, title: "艺术作品")
                        .tag(4) // 确保标签匹配
                        .tabItem {
                            Label("艺术作品", systemImage: "3.square.fill")
                        }
                    SCPListView(dataType: DBTypes.SAVE_INFO_PAGE, groupIndex: -1, categoryName: "背景资料与指导")
                        .tag(5) // 确保标签匹配
                        .tabItem {
                            Label("背景资料与指导", systemImage: "2.square.fill")
                        }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
        }
    }
}



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
