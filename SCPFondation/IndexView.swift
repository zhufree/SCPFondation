//
//  IndexView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/12/21.
//

import SwiftUI

struct IndexView: View {
    var body: some View {
        let entryTypes = SCPConstants.Entry.init()
            VStack {
                Text("SCP基金会")
                Text("Here is Notice")
                HStack {
                    NavigationLink(destination: EntryCategoryView(entryType: entryTypes.SCP_DOC, title: "SCP系列")) {
                        VStack {
                            Image("scp_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("SCP系列")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    NavigationLink(destination: EntryCategoryView(entryType: entryTypes.SCP_CN_DOC, title: "SCP-CN系列")) {
                        VStack {
                            Image("img_logo_cn")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("SCP-CN系列")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    NavigationLink(destination: EntryCategoryView(entryType: entryTypes.STORY_DOC, title: "故事与设定")) {
                        VStack {
                            Image("img_break_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("故事与设定")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    NavigationLink(destination: EntryCategoryView(entryType: entryTypes.WANDER_DOC, title: "放逐者图书馆")) {
                        VStack {
                            Image("wander_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("放逐者图书馆")
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
