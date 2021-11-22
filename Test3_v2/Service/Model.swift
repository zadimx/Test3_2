//
//  Model.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 02.11.2021.
//
//
//  ViewController.swift
//  Test
//
//  Created by Максим Зиноватный on 9/24/21.
//  Copyright © 2021 Максим Зиноватный. All rights reserved.
//
/*{
 results = (
    {
    cell = "605-702-095";
    dob =       {
                age = 46;
                date = "1975-04-19T12:49:26.071Z";
                };
    email = "alexander.rodriguez@example.com";
    gender = male;
    id =        {
                name = DNI;
                value = "90169029-C";
                };
    location =  {
                city = Alcobendas;
                coordinates =       {
                                    latitude = "-21.0156";
                                    longitude = "-159.7838";
                                    };
                country = Spain;
                postcode = 26835;
                state = "La Rioja";
                street =            {
                                    name = "Calle del Prado";
                                    number = 8367;
                                    };
                timezone =          {
                                    description = "Beijing, Perth, Singapore, Hong Kong";
                                    offset = "+8:00";
                                    };
                };
    login =     {
                md5 = 187d515b0254e04175f64fedd77856fd;
                password = hoops;
                salt = EZFoiwF6;
                sha1 = 713cfb92c72b3a0607ffc20e10b359a5cf31f820;
                sha256 = 3a696f66e048c28ba8ee27449fd0909ff1eb40fdb82569517858340406b811ab;
                username = redladybug206;
                uuid = "1cddd0b2-7d83-4258-a7a7-19bd729d024a";
                };
    name =      {
                first = Alexander;
                last = Rodriguez;
                title = Mr;
                };
    nat = ES;
    phone = "941-580-126";
    picture =   {
                large = "https://randomuser.me/api/portraits/men/86.jpg";
                medium = "https://randomuser.me/api/portraits/med/men/86.jpg";
                thumbnail = "https://randomuser.me/api/portraits/thumb/men/86.jpg";
                };
    registered ={
                age = 7;
                date = "2014-12-11T06:46:27.227Z";
                };
    }
            );
 }*/
import Foundation
struct Root:Decodable{
    var articles: [Articles]
}
struct Articles:Decodable{
    var title: String? // age
    var content: String? // city, cordinate
    var urlToImage: String? // first, last name
    var url: String?
    var publishedAt: String?
}

