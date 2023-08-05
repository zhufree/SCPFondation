//
//  GroupListView.swift
//  SCPFondation
//
//
//  Created by zhufree on 2023/3/25.
//

import SwiftUI

struct GroupListView: View {
    // 根据categoryType和groupIndex查询
    @State var categoryType: Int // Category
    @State var categoryName: String
    @State var title: String
    @State var groupIndex: Int // 100 * 10 each group 1...7
    let DBTypes = SCPConstants.ScpType()
    
    func getDataTypeByCategoryType() {
        
    }

    
    var body: some View {
//        let titles = getGroupList()
        let categoryCount = 100
        // Show another scrollable list on the right depending on the selected option
//        NavigationView {
            List(1...10, id: \.self) { index in
                NavigationLink(destination: SCPListView(dataType: DBTypes.SAVE_SERIES, groupIndex: groupIndex*10+index-1, categoryName: categoryName)) {
                    Text("\(categoryName)\((groupIndex) * 1000 + (index-1) * categoryCount+1)~\(groupIndex * 1000 + index * categoryCount)")
                }
           }
//        }
        .navigationBarTitle(Text(title))
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        let Category = SCPConstants.Category()
        GroupListView(categoryType: Category.JOKE, categoryName: "搞笑SCP", title: "搞笑SCP", groupIndex: 8)
    }
}
