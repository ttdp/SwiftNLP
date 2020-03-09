//
//  Expression.swift
//  SwiftNLP
//
//  Created by Tian Tong on 2020/3/9.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
import NaturalLanguage

class Expression {
    
    func emojiForExpression(_ text: String) -> Emotion? {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text
        
        guard let sentiment = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore).0 else {
            return nil
        }
        
        guard let score = Double(sentiment.rawValue) else {
            return nil
        }
        
        return Emotion(score: score)
    }
    
}
