//
//  TableViewController.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import UIKit

class TableViewController: UIViewController{
  var flagRunGetArticle = true
  
  var mainPresenter: TableViewPresenterProtocol!
  
  @IBOutlet weak var tableView: UITableView!{
    didSet{
      tableView.register(UINib(nibName: "OtherNewsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TableViewCell")
      tableView.register(UINib(nibName: "CollectionViewTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CollectionView")
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
  }
  
}
extension TableViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mainPresenter.articles?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = self.mainPresenter.router.assemblyBuilder?.createMainMainModule(router: self.mainPresenter.router, tableView: tableView, indexPath: indexPath)
      return cell!
    }else{
      let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? OtherNewsTableViewCell
      cell!.set(object: mainPresenter.articles?[indexPath.row] ?? Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"))
      
      return cell!
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let data = mainPresenter.articles?[indexPath.row]
    mainPresenter.tabOnTheArticles(articles: data)
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    
    if (offsetY > contentHeight - scrollView.frame.size.height && flagRunGetArticle) {
      
      flagRunGetArticle = false
      print("%%%%%scrollViewDidScroll \(offsetY) \(scrollView.frame.size.height) \(contentHeight)")
      
      mainPresenter.getArticles()
    }
  }
  
  //  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
  //
  //    if (indexPath.row == ((mainPresenter.articles?.count ?? 0)-1)){
  //      print("$$$$$willDisplay \(indexPath.row) \(mainPresenter.articles?.count)")
  //  }
  //
  //}
}
extension TableViewController: UITableViewDelegate{
  
}
extension TableViewController: TableViewProtocol{
  func success() {
    tableView.reloadData()
    flagRunGetArticle = true
  }
  
  func failure(error: Error) {
    print("OSHIBKA \(error)")
  }
  
  
}
