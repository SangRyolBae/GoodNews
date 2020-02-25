//
//  Article.swift
//  GoodNews
//
//  Created by 배상렬 on 2020/02/25.
//  Copyright © 2020 배상렬. All rights reserved.
//

import Foundation

struct ArticleList: Decodable
{
    let status: String;
    let totalResults: Int;
    let articles: [Article]
}

struct Article: Decodable
{
    let title: String;
    let description: String;
    
}
