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
          // Initialization code
    initialImageView(imageView: imageNews)
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
  func set(object: Articles){
    self.dateLabel.text = object.publishedAt
    let url = URL(string: object.urlToImage ?? "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
    let data = (try? Data(contentsOf: url!))
    if(data == nil){
        self.imageNews.image = UIImage(named: "11.png")
    }
    else{
        
        self.imageNews.image = UIImage(data: data!)
    }
    self.urlLabel.text = object.url
    self.mainNewsTextView.text = object.title
  }
}
extension OtherNewsTableViewCell {
  func initialImageView(imageView: UIImageView){
    imageView.layer.cornerRadius = 20
  }
}
