//
//  SCPListView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/21.
//

import SwiftUI

struct SCPListView: View {
    @State var dataType: Int = 0
    @State var groupIndex: Int = 0
    @State var categoryName: String
    let DBTypes = SCPConstants.ScpType()
    var body: some View {
        
        let scpList = getScpList(category: dataType, groupIndex: groupIndex)
        List(scpList, id: \.index) { scp in
            NavigationLink(destination: DetailView(title: scp.title, link: scp.link)) {
                Text(scp.title)
            }
        }
        .navigationBarTitle(Text(categoryName))
    }
    
    func getScpList(category: Int, groupIndex: Int) -> [Scp] {
        if (groupIndex >= 0) {
            return DatabaseReader.readDataFromDatabase(_scpType: dataType, start: groupIndex*100, limit: 100) ?? []
        } else {
            return DatabaseReader.readDataFromDatabase(_scpType: dataType, start: 0, limit: Int.max) ?? []
        }
    }
}

//struct SCPListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SCPListView(dataType: 1, index: 1)
//    }
//}
