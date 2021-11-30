//
//  SceneDelegate.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//
import Foundation
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: scene.coordinateSpace.bounds)
    window?.windowScene = scene
    let navigationController = UINavigationController()
    let splitViewController = UISplitViewController()
    let assemblyBuilder = AssemblyModelBuilder()
    let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder, splitViewController: splitViewController)
    router.initialViewController()
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()

  }


}

