//
//  XTArticleShowVC.swift
//  XebiaTest
//
//  Created by Ahmed Durrani on 28/03/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class XTArticleShowVC: UIViewController {
    @IBOutlet weak var articleTableView: UITableView!
    var responseObj: UserResponse?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleTableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
        getAllArticle()
        // Do any additional setup after loading the view.
    }
    
    func getAllArticle() {
        
        WebServiceManager.get(params: nil, serviceName: BASE_URL , serviceType: "Article", modelType: UserResponse.self, success: {[weak self] (response) in
            
            self!.responseObj = (response as! UserResponse)
            if  self!.responseObj?.status == "OK" {
                self!.articleTableView.delegate = self
                self!.articleTableView.dataSource = self
                self!.articleTableView.reloadData()
                //                self!.postCollectionView.layoutIfNeeded()
                
            }
            else {
                self?.showAlert(title: "Error"  , message: "Some thing Wrong", controller: self)
                
            }
        }) { (error) in
        }
    }

    
}

extension XTArticleShowVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.responseObj?.result?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell

        cell?.lblTitleOfArticle.text = self.responseObj?.result![indexPath.row].title
        cell?.lblAbstraction.text = self.responseObj?.result![indexPath.row].abstract
        cell?.lblTypeOfArticle.text = self.responseObj?.result![indexPath.row].type
        cell?.lblDate.text = self.responseObj?.result![indexPath.row].published_date
        
        guard  let image = self.responseObj?.result![indexPath.row].media![0].mediaMetadata![2].url  else   {
            return cell!
        }
        WAShareHelper.loadImage(urlstring:image , imageView: (cell!.imgOfArticle!), placeHolder: "filldeCircle")
        let cgFloat: CGFloat = cell!.imgOfArticle.frame.size.width/2.0
        let someFloat = Float(cgFloat)
        WAShareHelper.setViewCornerRadius(cell!.imgOfArticle, radius: CGFloat(someFloat))
        

        return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}

