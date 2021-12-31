//
//  NewsContent2.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 31.12.2021.
//

import SwiftUI
import SwiftUINavigator
import Networking

struct NewsContent2: View, IItemView {
    
    var listener: INavigationContainer?

    @State var article: Article
    
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
            
            Text(article.content ?? "")
                .padding(.bottom, 25)
            
            Button {
                UIApplication.shared.open(
                    URL(string: article.url)!,
                    options: [:],
                    completionHandler: nil)
            } label: {
                Text("Showed more")
            }


            Spacer()
            
            Button {
                self.listener?.popToRoot()
            } label: {
                Text("To main screen")
                    .foregroundColor(.yellow)
            }
            .padding()

        }
    }
}

//struct NewsContent2_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsContent2()
//    }
//}
