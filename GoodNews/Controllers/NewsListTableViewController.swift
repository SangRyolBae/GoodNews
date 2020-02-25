//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by 배상렬 on 2020/02/25.
//  Copyright © 2020 배상렬. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController
{
    
    private var articleListVM: ArticleListViewModel!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        setup();
    }
    
    private func setup()
    {
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-01-25&sortBy=publishedAt&apiKey=4d4f96941e7146548fb3be6a41a10804")!;
        
        WebService().getArticles(url: url) { (articles) in
            
            if let articles = articles
            {
                self.articleListVM = ArticleListViewModel(articles: articles);
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData();
                    
                }
                
            }
        }
    }
 
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        if self.articleListVM == nil
        {
            return 0;
        }
        
        return self.articleListVM.numberOfSections;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return self.articleListVM.numberOfRowsInSection(section);
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else
        {
            fatalError("Article Table View Cell not FOUND!");
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row);
        
        cell.titleLabel.text = articleVM.title;
        cell.descriptionLabel.text = articleVM.description;
        
        return cell;
    }
    
}
