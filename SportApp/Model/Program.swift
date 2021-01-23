//
//  Program.swift
//  SportApp
//
//  Created by Max Khizhniakov on 19.01.2021.
//

import Foundation

struct Program {
    var name: String
    var description: String
    var imageUrl: String
    var cal: Int
    var time: Int
    var exercises: [Exercise]
}

struct Exercise {
    var name: String
    var description: String
    var lenght: Int
    
    var videoUrl: String
    var previewUrl: String
}
