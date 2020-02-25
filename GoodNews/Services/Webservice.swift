//
//  Webservices.swift
//  GoodNews
//
//  Created by 배상렬 on 2020/02/25.
//  Copyright © 2020 배상렬. All rights reserved.
//

import Foundation

class WebService
{
    
    func getArticles(url: URL, completion: @escaping([Article]?) -> () )
    {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error
            {
                print( error.localizedDescription );
                completion(nil);
            }else if let data = data
            {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data);
                
                if let articleList = articleList
                {
                    completion(articleList.articles);
                }
                
                print(articleList?.articles);
                
            }
        }.resume();
    }
}
