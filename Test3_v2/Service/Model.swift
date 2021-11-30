//
//  Model.swift
//  Test
//
//  Created by Максим Зиноватный on 9/24/21.
//  Copyright © 2021 Максим Зиноватный. All rights reserved.

import Foundation
struct Root:Decodable{
  var articles: [Articles]
}
struct Articles:Decodable{
  var source: Source?
  var title: String?
  var content: String?
  var urlToImage: String?
  var url: String?
  var publishedAt: String?
}
struct Source:Decodable{
  var name: String?
}

