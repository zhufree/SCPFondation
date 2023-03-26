//
//  DatabaseReader.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/20.
//

import Foundation
import SQLite
import SwiftUI

struct DatabaseReader {
    
    static func readDataFromDatabase(_scpType: Int, start: Int, limit: Int) -> [Scp]? {
        if let dbUrl = Bundle.main.url(forResource: "scp_category_ios", withExtension: "db") {
            let dbPath = dbUrl.path
            do {
                let db = try Connection(dbPath)
                let scps = Table("scps")
                let id = scps[Expression<Int>("_id")]
                let index = scps[Expression<Int>("_index")]
                let title = scps[Expression<String>("title")]
                let link = scps[Expression<String>("link")]
                let scpType = scps[Expression<Int>("scp_type")]
                var scpList: [Scp] = []
                let query = scps.select(id, index, title, link, scpType)
                    .filter(scpType==_scpType)
                    .order(index)
                    .limit(limit, offset: start)
                for scp in try db.prepare(query) {
                    scpList.append(Scp(id: scp[id], index: scp[index], title: scp[title], link: scp[link], scpType: scp[scpType]))
                }
                return scpList
                // Process the scpList as needed
            } catch {
                print("Error reading database file: \(error)")
            }
        }
        
        return nil
    }
}
//struct ScpListView: View {
//    let scpList: [Scp]
//
//    var body: some View {
//        NavigationView {
//            List(scpList) { scp in
//                NavigationLink(destination: ScpDetailView(scp: scp)) {
//                    VStack(alignment: .leading) {
//                        Text(scp.name)
//                            .font(.headline)
//                        Text(scp.description)
//                            .font(.subheadline)
//                    }
//                }
//            }
//            .navigationBarTitle("SCP List")
//        }
//    }
//}

//db = try! Connection(dbPath)
struct Scp: Identifiable {
    let id: Int
    let index: Int
    let title: String
    let link: String
    let scpType: Int
//    let author: String?
}
