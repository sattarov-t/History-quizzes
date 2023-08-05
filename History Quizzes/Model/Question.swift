//
//  Question.swift
//  History Quizzes
//
//  Created by Тимур on 05.08.2023.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String, rightAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
        self.rightAnswer = rightAnswer
    }
}
