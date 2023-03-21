//
//  DatabaseView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/17.
//

import SwiftUI
//from SQLite import Connection
#if canImport(MobileCoreServices)
import MobileCoreServices
#endif
import UniformTypeIdentifiers

struct DatabaseView: View {
    @State var isShowingPopup = false
    @State private var showingDocumentPicker = false
    @State var filename = "Filename"
    @State var showFileChooser = false
//    @State private var sqliteDB: Connection?
    var body: some View {
        // 居中对齐并从上到下排列的文字和按钮
        VStack {
            Spacer()
            Text("离线文档").font(.title).padding()
            Text("离线文档后，无需联网即可加载文档内容，且支持全文搜索功能。\n\n要离线文档，首先点击左侧按钮前往面包多下载数据库文件。下载完成后，点击右侧按钮，找到并选择刚刚下载的“scp_detail_v2.db”以将数据库文件加载至APP内。\n\n注：数据库文件不包括最近更新页面、最高评分页面。数据库文件总大小约300MB，请在确实需要的情况下自由下载。").padding()
            #if os(macOS)
            HStack {
                Text("1.")
                Button("前往下载数据库") {
                    isShowingPopup = true
                }
                Text("2.")
                Button("选择数据库文件") {
                    showFileChooser = true
//                    let panel = NSOpenPanel()
//                    panel.allowsMultipleSelection = false
//                    panel.canChooseDirectories = false
//                    if panel.runModal() == .OK {
//                        self.filename = panel.url?.lastPathComponent ?? "<none>"
//                    }
                }
                .fileImporter(isPresented: $showFileChooser, allowedContentTypes: [.database]) {(res) in
                                print("!!!\(res)")
                            }
            }.padding()
            #elseif os(iOS)
            VStack{
                Button(action: {
                    isShowingPopup = true
                }, label: {
                    Text("前往下载数据库")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(40)
                        .frame(maxWidth: .infinity)
                })
                Button(action: {
                    showFileChooser = true
                }, label: {
                    Text("选择数据库文件")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(40)
                        .frame(maxWidth: .infinity)
                })
                .fileImporter(isPresented: $showFileChooser, allowedContentTypes: [.database]) {(res) in
                                print("!!!\(res)")
                            }
            }.padding()
            #endif
//            Text("备份个性化数据")
            Spacer()
        }
        .sheet(isPresented: $isShowingPopup) {
            PopupView(isShowingPopup: $isShowingPopup)
        }
//#if os(iOS)
//        .sheet(isPresented: $showingDocumentPicker) {
//            DocumentPicker(sqliteDB: $sqliteDB)
//        }
//        #endif

        .padding()
        #if os(iOS)
        .navigationBarTitle(Text("文档缓存/本地数据"), displayMode: .inline)
        #elseif os(macOS)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Text("列表")
            }
        }
        #endif
    }
}
struct PopupView: View {
    @Binding var isShowingPopup: Bool

    var body: some View {
            ZStack {
                // 点击空白区域关闭弹窗
                Color.black.opacity(0.1)
                
                // 弹窗内容
                VStack {
#if os(macOS)
                    Button("飞书") {
                        openUrl(urlString: "https://gj5i5wsqre.feishu.cn/drive/folder/fldcnpvwVcYN4iCrUQBCPTgF25e")
                    }
                    Button("Google Drive") {
                        openUrl(urlString: "https://drive.google.com/drive/folders/1iGSW2u_-RuAS8HxebBzV-oCOgAZnVUr5?usp=sharing")
                    }
                    Button("取消") {
                        isShowingPopup = false
                    }
#elseif os(iOS)
                    Button(action: {
                        openUrl(urlString: "https://gj5i5wsqre.feishu.cn/drive/folder/fldcnpvwVcYN4iCrUQBCPTgF25e")
                    }, label: {
                        Text("飞书")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity)
                    })
                    Button(action: {
                        openUrl(urlString: "https://drive.google.com/drive/folders/1iGSW2u_-RuAS8HxebBzV-oCOgAZnVUr5?usp=sharing")
                    }, label: {
                        Text("Google Drive")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity)
                    })
                    Button(action: {
                        isShowingPopup = false
                    }, label: {
                        Text("取消")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity)
                    })
#endif
                }
            }
            
            .frame(width: .infinity, height: .infinity)
            .cornerRadius(40)
            .padding()
            .onTapGesture {
                isShowingPopup = false
            }
        }
    
}

func openUrl(urlString: String) {
    if let url = URL(string: urlString) {
        #if os(macOS)
        NSWorkspace.shared.open(url)
        #elseif os(iOS)
        UIApplication.shared.open(url)
        #endif
    }
}

struct DatabaseView_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseView()
    }
}
