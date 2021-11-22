//
//  MainBuilder.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import Foundation
import UIKit

protocol MainBuilder {
  static func createMainModule() -> UIViewController
}

class ModelBuilder: MainBuilder {
  static func createMainModule() -> UIViewController {
    let view = TableViewController()
    let mainPresenter = TableViewPresenter(view: view)
    view.mainPresenter = mainPresenter
    return view
  }

}
