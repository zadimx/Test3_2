//
//  DetailCollectionView.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class DetailCollectionView: UIViewController {

  var presenter: DetailCollectionViewPresenterProtocol!
  var detailsObject = Articles(title: "", content: "", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "", publishedAt: "")
  @IBOutlet weak var newsDetailsDateLabel: UILabel!
  @IBOutlet weak var newsDetailsHistoryLabel: UILabel!
  @IBOutlet weak var newsDetailsTopicTextView: UITextView!
  @IBOutlet weak var newsDetailsDesriptionTextView: UITextView!
  @IBOutlet weak var newsDetailsImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.setData()
    
    // Do any additional setup after loading the view.
  }
}
extension DetailCollectionView: DetailCollectionViewProtocol{
  func setData(data: Articles?) {
    let url = URL(string: data?.urlToImage ?? "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
    let data1 = try? Data(contentsOf: url!)
    if (data == nil) {
        newsDetailsImageView.image = UIImage(named: "11.png")
    }
    else{
        newsDetailsImageView.image = UIImage(data: data1!)
    }
    
    newsDetailsDateLabel.text = data?.publishedAt
    newsDetailsHistoryLabel.text = data?.url
    newsDetailsTopicTextView.text = data?.title
    newsDetailsDesriptionTextView.text = data?.content
  }
  
  
}
