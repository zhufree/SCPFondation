//
//  SCPListView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/21.
//

import SwiftUI

struct SCPListView: View {
    @State var dataType: Int = 0
    @State var index: Int = 0
    var body: some View {
        Text("scp.title")
        let scpList = getScpList(category: dataType, groupIndex: 1)
        List(scpList, id: \.index) { scp in
            Text(scp.title)
        }
    }
    
    
    func getScpList(category: Int, groupIndex: Int) -> [Scp] {
        DatabaseReader.readDataFromDatabase(_scpType: 1) ?? []
    }
}

//struct SCPListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SCPListView(dataType: 1, index: 1)
//    }
//}
