//
//  CategoryView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/21.
//

import SwiftUI

struct EntryCategoryView: View {
    @State var entryType: Int
    @State var categoryName: String = ""
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
    func getLeftOptions() -> [String] {
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
    
    func getRightList(index: Int) -> [String] {
        let CategoryTypes = SCPConstants.Category.init()
        let categoryCount = 100
        switch index {
            case CategoryTypes.TALES, CategoryTypes.TALES_CN, CategoryTypes.WANDER, CategoryTypes.WANDER_CN:
                return ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
                        "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0-9"]
            case CategoryTypes.TALES_BY_TIME:
                return ["2014", "2015", "2016", "2017", "2018"]
            default:
            return (0..<1000 / categoryCount).map { it in "\(categoryName)\((it + (index - 1) * 10) * categoryCount)+" }
        }
    }
    
    func getScpList(category: String, groupIndex: Int) -> [Scp] {
        DatabaseReader.readDataFromDatabase(_scpType: 1) ?? []
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                NavigationView {
                    // Display the list of options on the left
                    List(Array(getLeftOptions().enumerated()), id: \.element) { index, value in
                        Button(action: {
                            self.selectedOption = index
                        }) {
                            Text(value)
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.4)
#if os(macOS)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Text(categoryName)
                    }
                }
#elseif os(iOS)
                .navigationBarTitle(Text(categoryName))
#endif
                // Show another scrollable list on the right depending on the selected option
                NavigationView {
                    List(getRightList(index: selectedOption), id: \.self) { value in
                        Button(action: {
                            
                        }) {
                            Text(value)
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.6)
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryCategoryView(entryType: 1001, categoryName: "SCP系列")
    }
}
