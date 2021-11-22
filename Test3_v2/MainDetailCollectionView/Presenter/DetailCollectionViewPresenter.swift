//
//  DetailCollectionViewPresenter.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import Foundation
import UIKit

protocol DetailCollectionViewProtocol: class {
  func setData(data: Articles?)
}

protocol DetailCollectionViewPresenterProtocol: class {
    init(view: DetailCollectionViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, data: Articles?)
  func setData()
    func tap()
}

class DetailCollectionViewPresenter: DetailCollectionViewPresenterProtocol {
    
    
  weak var view: DetailCollectionViewProtocol?
    var router: RouterProtocol?
  let networkService: NetworkServiceProtocol!
  let data: Articles?
  
    required init(view: DetailCollectionViewProtocol, networkService: NetworkServiceProtocol,router: RouterProtocol, data: Articles?) {
    self.view = view
        self.router = router
    self.networkService = networkService
    self.data = data
  }
  
    func tap() {
        router?.popToRoot()
    }
  func setData() {
    self.view?.setData(data: data)
  }
}
