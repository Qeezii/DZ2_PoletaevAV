//
//  NewsList.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 28.12.2021.
//

import SwiftUI
import Networking
import SwiftUINavigator

struct NewsList: View, IItemView {
    
    var listener: INavigationContainer?
    
    @ObservedObject var newsViewModel: NewsViewModel
    @State var newsAbout: String
    
    var body: some View {
        
        List {
            ForEach(newsViewModel.articles) { article in
                Button {
                    self.listener?.push(view: NewsContent(article: article))
                } label: {
                    Text(article.title ?? "")
                        .foregroundColor(.black)
                }
                    .showActivityIndicator(newsViewModel.isPageLoading && newsViewModel.articles.isLast(article))
                    .onAppear {
                        if newsViewModel.articles.isLast(article) {
                            newsViewModel.loadNextPage(newsAbout: newsAbout)
                        }
                    }
            }
        }
        .listStyle(.plain)
    }
}

//struct NewsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsScreen()
//    }
//}
