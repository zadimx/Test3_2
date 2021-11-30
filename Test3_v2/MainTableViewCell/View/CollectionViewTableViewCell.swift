//
//  CollectionViewTableViewCell.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, UICollectionViewDataSource{
  
  // MARK: Var and let
  var presenter: CollectionViewPresenterProtocol!
  let networkService = NetworkService()
  
  @IBOutlet weak var collectionView: UICollectionView!{
    didSet{
      collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }
  }
  
  @IBOutlet weak var view: UIView!
  
  // MARK: awakeFromNib
  override func awakeFromNib() {
    super.awakeFromNib()
    print("####CollectionViewTableViewCell")
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
    
    
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
    cell.configuration(with: presenter.articles?[indexPath.row] ?? Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON2", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON2", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history2", publishedAt: "2 min ago"))
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 300, height: 800)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
    if (indexPath.row == ((presenter.articles?.count ?? 0)-1)){
      //      print("$$$$$willDisplaycollectionView \(indexPath.row) \(presenter.articles?.count)")
      presenter.getArticles()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("####didSelectItemAt \(indexPath.row)")
    let data = presenter.articles?[indexPath.row]
    
    presenter.tabOnTheArticles(articles: data)
  }
}


// MARK: UICollectionViewDataSource
extension CollectionViewTableViewCell: UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.articles?.count ?? 0
  }
}
extension CollectionViewTableViewCell: CollectionViewProtocol{
  func success() {
    collectionView.reloadData()
  }
  
  func failure(error: Error) {
    print("OSHIBKA \(error)")
  }
  
  
}
