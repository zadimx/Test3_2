//
//  TableViewController.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import UIKit

class TableViewController: UIViewController{
  var indexOfPageToRequest = 1
//  let networkService = NetworkService()
  
    var mainPresenter: TableViewPresenterProtocol!

  @IBOutlet weak var tableView: UITableView!{
    didSet{
      tableView.register(UINib(nibName: "OtherNewsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TableViewCell")
      tableView.register(UINib(nibName: "CollectionViewTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CollectionView")
    }
  }
  override func viewDidLoad() {
      super.viewDidLoad()
//      mainPresenter.getArticles()
      tableView.dataSource = self
      tableView.delegate = self
//    mainPresenter.getArticles()
      view.addSubview(tableView)
    tableView.reloadData()
    }
  
}
extension TableViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let x = mainPresenter.articles?.count
    print("####numberOfRowsInSection \(x)")
    return x ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
        
        let cell = self.mainPresenter.router.assemblyBuilder?.createMainMainModule(router: self.mainPresenter.router, tableView: tableView, indexPath: indexPath)
      return cell!
    }else{
      let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? OtherNewsTableViewCell
//      let object = objectOtherTableViewCellModel[indexPath.row]
//      let object1 = mainPresenter.articles?[indexPath.row]
//      let object = Other(dateLabel: object1?.publishedAt ?? "", historyLabel: object1?.url ?? "", descriptionNewsTextView: object1?.content ?? "", imageNews: object1?.urlToImage ?? "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
      cell!.set(object: mainPresenter.articles?[indexPath.row] ?? Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"))

      return cell!
    }
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    print("$$$$$tableViewdidSelectRowAt \(mainPresenter.articles?.count) \(indexPath.row)")
    let data = mainPresenter.articles?[indexPath.row]
//    let data = Articles(title: objectOtherTableViewCellModel[indexPath.row].descriptionNewsTextView, content: objectOtherTableViewCellModel[indexPath.row].descriptionNewsTextView, urlToImage: objectOtherTableViewCellModel[indexPath.row].imageNews, url: objectOtherTableViewCellModel[indexPath.row].historyLabel, publishedAt: objectOtherTableViewCellModel[indexPath.row].dateLabel)
    mainPresenter.tabOnTheArticles(articles: data)
  }
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height {

            // increments the number of the page to request
            indexOfPageToRequest += 1
          print("%%%%% \(offsetY) \(scrollView.frame.size.height) \(contentHeight)")
            // call your API for more data
//            loadSaved(indexOfPageToRequest)
//          mainPresenter.getArticles()
            // tell the table view to reload with the new data
//            self.tableView.reloadData()
//          tableView.reloadData()
        }
  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    if (indexPath.row == ((mainPresenter.articles?.count ?? 0)-1)){
      print("$$$$$willDisplay \(indexPath.row) \(mainPresenter.articles?.count)")
      mainPresenter.getArticles()
  //      let object = objectOtherTableViewCellModel[indexPath.row]
  }
  
}
}
extension TableViewController: UITableViewDelegate{
  
  }
extension TableViewController: TableViewProtocol{
  func success() {
    tableView.reloadData()
  }
  
  func failure(error: Error) {
    print("OSHIBKA \(error)")
  }
  
  
}
