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
  
  @IBOutlet weak var viewContent: UIView!
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.setData()
    initialImageView(imageView: newsDetailsImageView, view: viewContent)
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
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM d,yyyy"
    
    let date = dateFormatterGet.date(from: data?.publishedAt ?? "2016-02-29 12:24:26") ?? Date(timeIntervalSince1970: 1)
    newsDetailsDateLabel.text = dateFormatterPrint.string(from: date as Date)
    newsDetailsHistoryLabel.text = data?.source?.name
    newsDetailsTopicTextView.text = data?.title
    newsDetailsDesriptionTextView.text = data?.content
  }
  
}
extension DetailCollectionView{
  func initialImageView(imageView: UIImageView, view: UIView){
    imageView.layer.cornerRadius = 20
    view.layer.cornerRadius = 20
  }
}
