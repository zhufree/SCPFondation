//
//  DetailView.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/17.
//

import SwiftUI
import WebKit

struct DetailView: View {
    @State var title: String
    @State var link: String
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                Text(title)
                Text("loading")
            } else if let data = viewModel.data {
                HTMLView(htmlString: data["data"] as? String ?? "").padding()
            } else {
                Text(title)
                Text("Failed to load data")
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchData(url: "https://api.zhufree.fun/scp/get-scp-detail" + link)
            }
        }
    }
}

struct HTMLView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    let htmlString: String
    let nightTextStyle = "<style>body{background-color:#222;}p {font-size:" +
    "24px;}* {color:#aaa;}</style>"
    let dayTextStyle = "<style>p {font-size:48px}" +
    ";}* {color:#000;}</style>"
    let siteCssURL = Bundle.main.url(forResource: "style", withExtension: "css")!
    let jqScriptURL = Bundle.main.url(forResource: "jquery-ui.min", withExtension: "js")!
    let initScriptURL = Bundle.main.url(forResource: "init.combined", withExtension: "js")!
    let tabScriptURL = Bundle.main.url(forResource: "tabview-min", withExtension: "js")!
    let wikiScriptURL = Bundle.main.url(forResource: "WIKIDOT.combined", withExtension: "js")!
    
    
    var minimumZoomScale: CGFloat = 1.0
    var maximumZoomScale: CGFloat = 1.0
    var zoomScale: CGFloat = 2.0
    
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        webView.scrollView.minimumZoomScale = minimumZoomScale
        webView.scrollView.maximumZoomScale = maximumZoomScale
        webView.scrollView.zoomScale = zoomScale
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let siteStyle = "<link rel=\"stylesheet\" type=\"text/css\" href=\"\(siteCssURL.absoluteString)\" />" + dayTextStyle
        uiView.loadHTMLString(siteStyle, baseURL: nil)
    }
    func makeCoordinator() -> DetailWebViewController {
        DetailWebViewController(self)
    }
    
    class DetailWebViewController: NSObject, WKNavigationDelegate {
        let jqScriptURL = Bundle.main.url(forResource: "jquery-ui.min", withExtension: "js")!
        let initScriptURL = Bundle.main.url(forResource: "init.combined", withExtension: "js")!
        let tabScriptURL = Bundle.main.url(forResource: "tabview-min", withExtension: "js")!
        let wikiScriptURL = Bundle.main.url(forResource: "WIKIDOT.combined", withExtension: "js")!
        var parent: HTMLView
                
        init(_ parent: HTMLView) {
            self.parent = parent
        }
        var htmlString: String = ""
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("Started to load")
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Page loaded")
            do {
                let jsString = try String(contentsOf: wikiScriptURL, encoding: .utf8)
                webView.evaluateJavaScript(jsString) { (result, error) in
                    if let error = error {
                        print("Error running JavaScript: \(error)")
                    } else {
                        print("JavaScript ran successfully")
                    }
                }
            } catch {
                print("Failed to read JavaScript file: \(error)")
            }
            
        }
        
//        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            
//        }
    }

}


class ViewModel: ObservableObject {
   @Published var data: [String: Any]?
   @Published var isLoading = false
   
    func fetchData(url: String) async {
        print(url)
        isLoading = true
        do {
            let url = URL(string: url)!
         
            let request = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: request)
         
            if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 {
                   let json = try JSONSerialization.jsonObject(with: data, options: [])
                   guard let dictionary = json as? [String: Any] else {
                      throw NSError(domain: "jsonError", code: -1, userInfo: nil)
                   }
                   DispatchQueue.main.async {
                      self.data = dictionary
                      self.isLoading = false
                   }
            } else {
                throwError()
            }
        } catch {
            throwError()
        }
   }
    private func throwError() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }

//   func fetchData(from url: URL) async throws -> [String: Any] {
//      let data = try await URLSession.shared.fetchData(from: url)
//      let json = try JSONSerialization.jsonObject(with: data, options: [])
//      guard let dictionary = json as? [String: Any] else {
//         throw NSError(domain: "jsonError", code: -1, userInfo: nil)
//      }
//      return dictionary
//   }
}

extension URLSession {
   func fetchData(from url: URL) async throws -> Data {
      let (data, _) = try await self.data(from: url)
      return data
   }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "test", link: "/scp-002")
    }
}
