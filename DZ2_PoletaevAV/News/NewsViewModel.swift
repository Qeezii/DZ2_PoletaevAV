//
//  NewsViewModel.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 19.12.2021.
//

import SwiftUI
import Networking

final class NewsViewModel: ObservableObject {
    
    var page: Int = 0
    var totalResults: Int = Int.max
    
    @Published var articles: [Article] = []
    @Published var isPageLoading: Bool = false
    @Published var showedRussiaNews: Bool = true
    @Published var showedMoscowNews: Bool = false
    @Published var showedAppleNews: Bool = false
    @Published var newsAbout: String = "Russia"
    
    init() {
        loadNextPage(newsAbout: newsAbout)
    }
    
    func loadNextPage(newsAbout: String) {
        guard isPageLoading == false && totalResults > articles.count else {
            print("Nothing to load \(self.articles.count)/\(self.totalResults)")
            return
        }
        isPageLoading = true
        page += 1
        DispatchQueue.global(qos: .background).async {
            ArticlesAPI.everythingGet(q: newsAbout,
                                      from: "2021-12-25",
                                      sortBy: "publishedAt",
                                      language: "en",
                                      apiKey: "e1f3d543e908450db6c85c45d66ac37f",
                                      page: self.page) { list, error in
                self.totalResults = list?.totalResults ?? Int.max
                self.articles.append(contentsOf: list?.articles ?? [])
                self.isPageLoading = false
            }
        }
    }
    
    func newsRussiaButtonPressed() {
        showedRussiaNews = true
        showedMoscowNews = false
        showedAppleNews = false
        articles = []
        page = 0
        newsAbout = "Russia"
        loadNextPage(newsAbout: "Russia")
    }
    
    func newsMoscowButtonPressed() {
        showedRussiaNews = false
        showedMoscowNews = true
        showedAppleNews = false
        articles = []
        page = 0
        newsAbout = "Moscow"
        loadNextPage(newsAbout: "Moscow")
    }
    
    func newsAppleButtonPressed() {
        showedRussiaNews = false
        showedMoscowNews = false
        showedAppleNews = true
        articles = []
        page = 0
        newsAbout = "Apple"
        loadNextPage(newsAbout: "Apple")
    }
}
