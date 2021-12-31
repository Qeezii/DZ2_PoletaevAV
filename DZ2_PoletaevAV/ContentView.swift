//
//  ContentView.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 19.12.2021.
//

import SwiftUI
import SwiftUINavigator

struct ContentView: View, IItemView {
    
    var listener: INavigationContainer?
    
    @StateObject var newsVM: NewsViewModel = .init()
    
    var body: some View {
        
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    Button { newsVM.newsRussiaButtonPressed() } label: { Text("Russia news") }
                    .modifier(TitleButtonModifier(showed: newsVM.showedRussiaNews))
                    
                    Button { newsVM.newsMoscowButtonPressed() } label: { Text("Moscow news") }
                    .modifier(TitleButtonModifier(showed: newsVM.showedMoscowNews))
                    
                    Button { newsVM.newsAppleButtonPressed() } label: { Text("Apple news") }
                    .modifier(TitleButtonModifier(showed: newsVM.showedAppleNews))
                }
                .padding()
            }
            
            Divider()
            
            ZStack {
                ProgressView("Loading")
                    .opacity(newsVM.articles.isEmpty ? 1.0 : 0.0)

                NewsList(listener: listener, newsViewModel: newsVM, newsAbout: newsVM.newsAbout)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
