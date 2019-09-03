//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Kohei Asai on 9/3/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}
