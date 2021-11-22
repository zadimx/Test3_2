//
//  MainBuilder.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import Foundation
import UIKit

protocol AssemblyMainBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDateilCollectionViewModule(data: Articles?, router: RouterProtocol) -> UIViewController
    func createMainMainModule(router: RouterProtocol, tableView: UITableView, indexPath: IndexPath) -> CollectionViewTableViewCell
}

class AssemblyModelBuilder: AssemblyMainBuilderProtocol {
    func createDateilCollectionViewModule(data: Articles?, router: RouterProtocol) -> UIViewController {
        let view = DetailCollectionView()
        let networkService = NetworkService()
        
        let presenter = DetailCollectionViewPresenter(view: view, networkService: networkService,router: router, data: data)
        view.presenter = presenter
        return view
    }
    
    func createMainMainModule(router: RouterProtocol, tableView: UITableView, indexPath: IndexPath) -> CollectionViewTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionView", for: indexPath) as? CollectionViewTableViewCell
        let networkService = NetworkService()
        let presenter = CollectionViewPresenter(view: cell!,networkService: networkService, router: router)
        cell?.presenter = presenter
        return cell!
    }
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
//        createMainMainModule(router: router)
        let view = TableViewController()
        let networkService = NetworkService()
        
        let mainPresenter = TableViewPresenter(view: view, networkService: networkService, router: router)
        view.mainPresenter = mainPresenter
        return view
    }

}
