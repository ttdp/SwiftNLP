//
//  Emotion.swift
//  SwiftNLP
//
//  Created by Tian Tong on 2020/3/9.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

enum Emotion: String {
    
    case superSad = "😭"
    case sad = "😥"
    case unhappy = "🙁"
    case ok = "🙂"
    case happy = "😀"
    case awesome = "🤗"
    
    init?(score: Double) {
        if score < -0.8 {
            self = .superSad
        } else if score < -0.4 {
            self = .sad
        } else if score < 0 {
            self = .unhappy
        } else if score < 0.4 {
            self = .ok
        } else if score < 0.8 {
            self = .happy
        } else if score <= 1 {
            self = .awesome
        } else {
            return nil
        }
    }
    
}
