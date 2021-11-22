//
//  CollectionViewTableViewCell.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, UICollectionViewDataSource{
    
    
      var indexOfPageToRequest = 1
      var presenter: CollectionViewPresenterProtocol!
      let networkService = NetworkService()
    //  var searchPerson: [Articles]?
      
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        }
    }
    
    @IBOutlet weak var view: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      print("####CollectionViewTableViewCll")
        collectionView.delegate = self
      collectionView.dataSource = self
        view.addSubview(collectionView)
        
      collectionView.reloadData()
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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
      let offsetX = scrollView.contentOffset.x
          let contentHeight = scrollView.contentSize.width

          if offsetX > contentHeight - scrollView.frame.size.width {

              // increments the number of the page to request
              indexOfPageToRequest += 1
            print("%%%%% \(offsetX) \(scrollView.frame.size.width) \(contentHeight)")
              // call your API for more data
  //            loadSaved(indexOfPageToRequest)
            presenter.getArticles()
              // tell the table view to reload with the new data
  //            self.tableView.reloadData()
            collectionView.reloadData()
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
//    print("^^^^CollectionViewController \(presenter.articles?.count)")
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
