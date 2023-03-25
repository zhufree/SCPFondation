//
//  CategoryView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/21.
//

import SwiftUI

struct EntryCategoryView: View {
    @State var entryType: Int
    @State var title: String = ""
    // Define the list of options
    @State private var selectedOption = 0
    let CategoryTypes = SCPConstants.Category.init()
    
    
    func getSeriesTitle(index: Int) -> String {
        switch index {
            case CategoryTypes.JOKE:
                return "搞笑SCP"
            case CategoryTypes.SCP_EX:
                return "已解明SCP"
            case CategoryTypes.TALES:
                return "基金会故事"
            case CategoryTypes.TALES_CN:
                return "CN原创故事"
            case CategoryTypes.TALES_BY_TIME:
                return "CN原创故事(按发布时间排列)"
            case CategoryTypes.SETTINGS:
                return "设定中心"
            case CategoryTypes.SETTINGS_CN:
                return "CN设定中心"
            case CategoryTypes.STORY_SERIES:
                return "故事系列"
            case CategoryTypes.STORY_SERIES_CN:
                return "CN故事系列"
            case CategoryTypes.CONTEST:
                return "征文竞赛"
            case CategoryTypes.CONTEST_CN:
                return "CN征文竞赛"
            case CategoryTypes.WANDER:
                return "放逐者图书馆"
            case CategoryTypes.WANDER_CN:
                return "CN放逐者图书馆"
            default:
                return "系列\(index)"
        }
    }
    
    // Define the content for each option
    func getSubCategory() -> [String] {
        let EntryTypes = SCPConstants.Entry.init()
        switch entryType {
            case EntryTypes.SCP_DOC:
                return (1...7).map { "系列\($0)" } + ["搞笑SCP", "已解明SCP"]
            case EntryTypes.SCP_CN_DOC:
                return (1...3).map { "系列\($0)" } + ["搞笑SCP", "已解明SCP"]
            case EntryTypes.STORY_DOC:
                return ["基金会故事", "CN原创故事", "CN原创故事(按发布时间排列)", "设定中心", "CN设定中心", "故事系列", "CN故事系列", "征文竞赛", "CN征文竞赛"]
            case EntryTypes.WANDER_DOC:
                return ["放逐者图书馆", "CN放逐者图书馆"]
            default:
                return []
        }
    }
    
    func getNextLevel(index: Int) -> some View {
        let EntryTypes = SCPConstants.Entry.init()
        let CategoryTypes = SCPConstants.Category()
        switch entryType {
            case EntryTypes.SCP_DOC:
            return AnyView(GroupListView(type: CategoryTypes.SERIES, categoryName: "SCP系列", title: getSubCategory()[index], groupIndex: index))
            case EntryTypes.SCP_CN_DOC:
                return AnyView(GroupListView(type: CategoryTypes.SERIES_CN, categoryName: "SCP-CN系列", title: getSubCategory()[index], groupIndex: index))
            case EntryTypes.STORY_DOC:
                return AnyView(SCPListView())
            case EntryTypes.WANDER_DOC:
                return AnyView(SCPListView())
            default:
                return AnyView(SCPListView())
        }
    }

    
    
    var body: some View {
//        NavigationView {
            // Display the list of options on the left
            List(Array(getSubCategory().enumerated()), id: \.element) { index, value in
                NavigationLink(destination: getNextLevel(index: index)) {
                    Text(value)
                }
            }
        #if os(macOS)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Text(categoryName)
                    }
                }
        #elseif os(iOS)
                .navigationBarTitle(Text(title))
        #endif
//        }
//        .padding()

    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryCategoryView(entryType: 1001, title: "SCP系列")
    }
}
