//
//  NewsContent.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 29.12.2021.
//

import SwiftUI
import SwiftUINavigator
import Networking

struct NewsContent: View, IItemView {
    
    @State var article: Article
    
    var listener: INavigationContainer?

    var body: some View {
        
        VStack(alignment: .leading) {
            
            Button {
                self.listener?.pop()
            } label: {
                Text("Back")
                    .foregroundColor(.black)
            }
            .padding(.leading, 15)
            
            Spacer()
            
            Text("Author: \(article.author ?? "")")
                .padding(.bottom, 25)
            
            Text(article.description ?? "")
                .font(.subheadline)

            Divider()
                .padding()
                   
            Button {
                self.listener?.push(view: NewsContent2(article: article))
            } label: {
                Text("More detailed...")
                    .foregroundColor(.gray)
            }

            Spacer()
        }
    }
}

//struct NewsContent_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsContent(title: "Test", description: "Primer")
//    }
//}
