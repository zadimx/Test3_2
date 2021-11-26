//
//  MyCollectionViewCell.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 01.11.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

  @IBOutlet var myLabel: UILabel!
  @IBOutlet var myLabelHistory: UILabel!
  @IBOutlet var myTextView: UITextView!
  @IBOutlet var myImageView: UIImageView!
  
  @IBOutlet weak var viewContent: UIView!
  static let identifier = "MyCollectionViewCell"
  static func nib() -> UINib {
    return UINib(nibName: "MyCollectionViewCell", bundle: nil)
  }
    override func awakeFromNib() {
        super.awakeFromNib()
      viewContent.layer.cornerRadius = 20
        initialImageView(imageView: myImageView)
        // Initialization code
    }

  public func configuration(with mainObject: Articles){
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM d,yyyy"

    let date = dateFormatterGet.date(from: mainObject.publishedAt ?? "2016-02-29 12:24:26") ?? Date(timeIntervalSince1970: 1)
    myLabel.text = dateFormatterPrint.string(from: date as Date)
    myLabelHistory.text = mainObject.source?.name
    myTextView.text = mainObject.title
//    print("#####configuration \(mainObject.urlToImage)")
    let tmpUrl = URL(fileURLWithPath: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
    let url = URL(string: mainObject.urlToImage ?? "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg") ?? tmpUrl
    let data = try? Data(contentsOf: url)
    if(data == nil){
        myImageView.image = UIImage(named: "11.png")
    }
    else{
    myImageView.image = UIImage(data: data!)
    }
  }
    
    
//  func set() -> Other{
//    return Other(dateLabel: myLabel.text ?? <#default value#>, historyLabel: myLabelHistory.text, descriptionNewsTextView: myTextView.text, imageNews: myImageView.image)
//  }
}
extension MyCollectionViewCell{
  func initialImageView(imageView: UIImageView){
      imageView.layer.cornerRadius = 20
    }
}
