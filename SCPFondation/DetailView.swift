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
        Text(title)
        VStack {
            if viewModel.isLoading {
                ProgressView()
                Text("loading")
            } else if let data = viewModel.data {
                HTMLView(htmlString: data["data"] as? String ?? "").padding()
            } else {
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
    let htmlString: String
    var minimumZoomScale: CGFloat = 1.0
    var maximumZoomScale: CGFloat = 1.0
    var zoomScale: CGFloat = 1.0
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.minimumZoomScale = minimumZoomScale
        webView.scrollView.maximumZoomScale = maximumZoomScale
        webView.scrollView.zoomScale = zoomScale
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
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
