//
//  Table.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 10.11.2021.
//

import Foundation
import UIKit
class OtherNewsTableViewCell: UITableViewCell{
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var urlLabel: UILabel!
  @IBOutlet weak var mainNewsTextView: UITextView!
  @IBOutlet weak var imageNews: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initialImageView(imageView: imageNews)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func set(object: Articles){
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM d,yyyy"
    let date = dateFormatterGet.date(from: object.publishedAt ?? "2016-02-29 12:24:26") ?? Date(timeIntervalSince1970: 1)
    
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .short
    let time = Date(timeIntervalSince1970: TimeInterval(Date().timeIntervalSince1970))
    
    self.dateLabel.text = formatter.localizedString(for: date, relativeTo: time)
    let tmp = URL(fileURLWithPath: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
    let url = URL(string: object.urlToImage ?? "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg") ?? tmp
    let data = (try? Data(contentsOf: url))
    if(data == nil){
      self.imageNews.image = UIImage(named: "11.png")
    }
    else{
      
      self.imageNews.image = UIImage(data: data!)
    }
    self.urlLabel.text = object.source?.name
    self.mainNewsTextView.text = object.title
  }
}
extension OtherNewsTableViewCell {
  func initialImageView(imageView: UIImageView){
    imageView.layer.cornerRadius = 20
  }
}
