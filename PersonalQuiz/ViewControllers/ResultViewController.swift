//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultdiscptLabel: UILabel!
    @IBOutlet var resultpicLabel: UILabel!
    
    var answers: [Answer]!
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным

    override func viewDidLoad() {
        super.viewDidLoad()
        resultpicLabel.text = "Вы - \(String(getAnswer(from: unpackAnswers()).1))"
        resultdiscptLabel.text = "Вы - \(getAnswer(from: unpackAnswers()).0)"
        
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

extension ResultViewController {
    private func unpackAnswers() -> [Character] {
        var unpackedAnswers: [Character] = []
        for answer in answers{
            unpackedAnswers.append(answer.animal.rawValue)
        }
        return unpackedAnswers
    }
    
    private func getAnswer(from answers: [Character]) -> (String, Character) {
        var getAnswer: (String, Character)!
        
        var dogCounter = 0
        var catCounter = 0
        var rabbitCounter = 0
        var turtleCounter = 0
        
        for answer in answers {
            switch answer {
            case "🐶":
                dogCounter += 1
            case "🐱":
                catCounter += 1
            case "🐰":
                rabbitCounter += 1
            default:
                turtleCounter += 1
            }
        }
        
        var iMTiredSorry = max(dogCounter, catCounter, rabbitCounter, turtleCounter)
        if dogCounter == iMTiredSorry {
            getAnswer = ("Собака", "🐶")
        } else if catCounter == iMTiredSorry {
            getAnswer = ("Кошка", "🐱")
        } else if rabbitCounter == iMTiredSorry {
            getAnswer = ("Кролик", "🐰")
        } else if turtleCounter == iMTiredSorry {
            getAnswer = ("Черепаха", "🐢")
        }
        return getAnswer
    }
}
