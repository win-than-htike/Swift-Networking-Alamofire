//
//  ViewController.swift
//  Network-Alamofire-SwiftyJson-SDWebImage
//
//  Created by Win Than Htike on 11/10/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    var newsList : [NewsVO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func postNews(title : String, desc : String, apiKey : String) {
        
        
        let parameter = ["title" : title, "description" : desc]
        
        let header = ["api-key" : apiKey]
        
        Alamofire.request("https://newsapi.org/", method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                
                let api = response.result.value
                
                let json = JSON(api!)
                
                let data = json["articles"].array
                
                if let result = data {
                    
                    var newsList : [NewsVO] = []
                    
                    result.forEach({ (news) in
                        newsList.append(NewsVO.parseToNewsVO(news))
                    })
                    
                    self.newsList = newsList
                    self.newsTableView.reloadData()
                    
                }
                
                break
                
            case .failure:
                print("fail call")
                break
                
            }
            
        }
        
    }
    
    func loadNews() {
        
        Alamofire.request("https://newsapi.org/v2/everything?q=bitcoin&from=2018-10-09&sortBy=publishedAt&apiKey=761e3bdff43144e9b74b51734d44a5f3", method: .get).responseJSON { (response) in
            
            switch response.result {
                
                case .success:

                    let api = response.result.value
                    
                    let json = JSON(api!)
                    
                    let data = json["articles"].array
                    
                    if let result = data {
                        
                        var newsList : [NewsVO] = []
                        
                        result.forEach({ (news) in
                            newsList.append(NewsVO.parseToNewsVO(news))
                        })
                        
                        self.newsList = newsList
                        self.newsTableView.reloadData()
                        
                    }
                    
                    break
                
                case .failure:
                    print("fail call")
                break
                
            }
            
        }
        
    }


}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        cell.ivNewsImage.sd_setImage(with: URL(string: "https://www.google.com.mm/imgres?imgurl=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F67636%2Frose-blue-flower-rose-blooms-67636.jpeg%3Fcs%3Dsrgb%26dl%3Dblue-plant-wet-67636.jpg%26fm%3Djpg&imgrefurl=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeauty%2F&docid=pFs_4Fcq5AgpmM&tbnid=A6JJqffgz3xzlM%3A&vet=10ahUKEwik2IWq8MveAhXBT30KHXXWAKgQMwhpKAAwAA..i&w=4928&h=3264&bih=588&biw=1024&q=image&ved=0ahUKEwik2IWq8MveAhXBT30KHXXWAKgQMwhpKAAwAA&iact=mrc&uact=8"), placeholderImage: UIImage(named: "news"))
        
        return cell
        
    }
    
    
}

extension ViewController : UITableViewDelegate {
    
}

