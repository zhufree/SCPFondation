//
//  GroupListView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/25.
//

import SwiftUI

struct GroupListView: View {
    @State var type: Int // Category
    @State var categoryName: String
    @State var title: String
    @State var groupIndex: Int // 100 * 10 each group
    
    
//    func getGroupList() -> [String] {
//        let CategoryTypes = SCPConstants.Category()
//
//        switch type {
//            case CategoryTypes.TALES, CategoryTypes.TALES_CN, CategoryTypes.WANDER, CategoryTypes.WANDER_CN:
//                return ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
//                        "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0-9"]
//            case CategoryTypes.TALES_BY_TIME:
//                return ["2014", "2015", "2016", "2017", "2018"]
//            default:
//            return (0..<1000 / categoryCount).map { it in "\(categoryName)\((it + (index - 1) * 10) * categoryCount)+" }
//        }
//    }
    
    var body: some View {
//        let titles = getGroupList()
        let categoryCount = 100
        // Show another scrollable list on the right depending on the selected option
//        NavigationView {
            List(1...10, id: \.self) { index in
                NavigationLink(destination: SCPListView(dataType: 1, index: 1)) {
                    Text("\(categoryName)\((groupIndex) * 1000 + (index-1) * categoryCount)~\(groupIndex * 1000 + index * categoryCount)")
                }
           }
//        }
#if os(macOS)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Text(title)
            }
        }
#elseif os(iOS)
        .navigationBarTitle(Text(title))
#endif
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        let Category = SCPConstants.Category()
        GroupListView(type: Category.SERIES, categoryName: "SCP系列", title: "系列1", groupIndex: 1)
    }
}
