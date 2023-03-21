////
////  DocumentPicker.swift
////  SCPFondation
////
////  Created by zhufree on 2023/3/20.
////
//
//import SwiftUI
//#if canImport(MobileCoreServices)
//import MobileCoreServices
//#endif
////import SQLite
//import UniformTypeIdentifiers
//
////struct DocumentPicker: UIViewControllerRepresentable {
//    @Environment(\.presentationMode) var presentationMode
////    @State var sqliteDB: Connection?
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
//        let supportedTypes: [UTType] = [UTType.database]
//        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
//        documentPicker.delegate = context.coordinator
//        return documentPicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
//
//    class Coordinator: NSObject, UIDocumentPickerDelegate {
//        var parent: DocumentPicker
//
//        init(_ parent: DocumentPicker) {
//            self.parent = parent
//        }
//
//        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
//            let fileURL = urls[0]
//
//            // 读取 .db 文件
//            do {
////                let db = try Connection(fileURL.path)
////                parent.sqliteDB = db
//
//                // 在这里执行查询和读取操作
//
//            } catch {
//                print("Cannot read the .db file: \(error)")
//            }
//
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//
//        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//    }
//}
//
