//
//  CollectionViewPresenter.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 16.11.2021.
//

import Foundation
import UIKit

protocol CollectionViewProtocol: class {
  func success()
  func failure(error: Error)
}

protocol CollectionViewPresenterProtocol: class {
    init(view: CollectionViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
  func getArticles()
  var articles: [Articles]? {get set}
    func tabOnTheArticles(articles: Articles?)
}

class CollectionViewPresenter: CollectionViewPresenterProtocol {
  
  var articles: [Articles]? = [
//    Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"),
//    Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"),
//    Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"),
//    Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"),
//    Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago")
]
  var pageNews = 1
weak var view: CollectionViewProtocol?
    var router: RouterProtocol?
let networkService: NetworkServiceProtocol!

required init(view: CollectionViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
  self.view = view
    self.router = router
  self.networkService = networkService
  getArticles()
}

    func tabOnTheArticles(articles: Articles?) {
        router?.showDeteil(articles: articles)
    }
    
func getArticles() {
  
  let urlString = "https://newsapi.org/v2/top-headlines?country=us&pageSize=5&page=\(pageNews)&apiKey=e6ba851586f54334aa3967d780a4738d"
  pageNews+=1
  self.networkService.getArticles(urlString: urlString){
    [weak self] result in guard let self = self else {return}
    DispatchQueue.main.async {
      switch result{
        case .success(let articles):
//            self.articles = articles
          if (articles?.count != 0){
          for newsIndex in 0...(articles?.count ?? 0)-1 {
            
            self.articles?.append(articles?[newsIndex] ?? Articles(source: Source(name: "CNN"), title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"))
          }
          self.view?.success()
        }
        case .failure(let error):
          self.view?.failure(error: error)
      }
    }
    
  }
}
}

