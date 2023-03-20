//
//  HomePageView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/17.
//

import SwiftUI

struct HomePageView:View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
                    NavigationLink(destination: DetailView()) {
                        Text("列表项 \(index+1)")
                    }
                }
            }
            #if os(macOS)
                // macOS code
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("列表")
                }
            }
            #elseif os(iOS)
                // iOS code
            .navigationBarTitle(Text("列表"))
            #endif
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
