//
//  Router.swift
//  Test3_v2
//
//  Created by Максим Зиноватный on 21.11.2021.
//

import Foundation
import UIKit
protocol RouterMain {
  var navigationController: UINavigationController? { get set }
  var splitViewController: UISplitViewController? { get set }
  var assemblyBuilder: AssemblyMainBuilderProtocol? { get set }
}
protocol RouterProtocol: RouterMain {
  func initialViewController()
  func showDeteil(articles: Articles?)
}
class Router: RouterProtocol {
  var splitViewController: UISplitViewController?
  
  var navigationController: UINavigationController?
  var assemblyBuilder: AssemblyMainBuilderProtocol?
  init(navigationController: UINavigationController, assemblyBuilder: AssemblyMainBuilderProtocol, splitViewController: UISplitViewController) {
    self.navigationController = navigationController
    self.assemblyBuilder = assemblyBuilder
  }
  func initialViewController() {
    if let navigationController = navigationController{
      guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
      
      navigationController.viewControllers = [mainViewController]
    }
  }
  
  func showDeteil(articles: Articles?) {
    if let navigationController = navigationController{
      guard let detailViewController = assemblyBuilder?.createDateilCollectionViewModule(data: articles, router: self) else { return }
      navigationController.pushViewController(detailViewController, animated: true)
    }
  }
  
  
  
}
