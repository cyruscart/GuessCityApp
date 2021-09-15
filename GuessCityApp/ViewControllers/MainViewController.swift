//
//  ViewController.swift
//  GuessCityApp
//
//  Created by Кирилл on 11.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var amountOfQuestionLabel: UILabel!
    @IBOutlet weak var amountOfQuestionSlider: UISlider!
    
    @IBOutlet weak var secondStackView: UIStackView!
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var nextCityImageView: UIImageView!
    
    @IBOutlet weak var citiesView: UIView!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    var cities: [City]!
    var isOddImage = true
    
    private var currentQuestion = 0
    private var amountOfQuestion = 10
    
    private var wrongAnswers: [City] = []
    
    private let primaryColor = UIColor(
        red: 255/255,
        green: 255/255,
        blue: 255/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 159/255,
        green: 204/255,
        blue: 231/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        answerButtons.forEach{$0.layer.cornerRadius = 7}
        
        cityImageView.layer.cornerRadius = 13
        nextCityImageView.layer.cornerRadius = 13
        citiesView.layer.cornerRadius = 13
        
        questionProgressView.isHidden = true
        secondStackView.isHidden = true
        
        amountOfQuestionSlider.value = amountOfQuestionSlider.maximumValue / 2
        amountOfQuestionLabel.text = String(lrintf(amountOfQuestionSlider.value))
        
    }
    
    @IBAction func amountOfQuestionsSliderMoved() {
        amountOfQuestion = lrintf(amountOfQuestionSlider.value)
        amountOfQuestionLabel.text = String(amountOfQuestion)
    }
    
    @IBAction func startButtonPressed() {
        for view in [firstStackView, secondStackView, questionProgressView] {
            view?.isHidden.toggle()
        }
        
        cityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
        updateButtons(cityNamesList: createCityNameListForButtons())
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if !isAnswerCorrect(button: sender) {
            wrongAnswers.append(cities[currentQuestion])
            sender.backgroundColor = .systemRed
        } else {
            sender.backgroundColor = .systemGreen
        }
        
        if currentQuestion < amountOfQuestion - 1 {
            flipCityImage(current: currentQuestion)
            
            UIView.animate(withDuration: 0,delay: 0.5, animations: {sender.backgroundColor = .gray})
            
            updateProgressView()
            
            currentQuestion += 1
            
            nextCityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
            
            cityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
}

//MARK: - Private functions
extension MainViewController {
    
    private func updateButtons(cityNamesList: [String]) {
        let cityNames = cityNamesList
        
        for (answerButton, cityName) in zip(answerButtons, cityNames) {
            answerButton.setTitle(cityName, for: .normal)
        }
    }
    
    private func createCityNameListForButtons() -> [String] {
        var cityNames: [String] = []
        
        cityNames.append(cities[currentQuestion].name)
        let cityNamesForAnswers = DataManager.shared.cityNamesList.shuffled()
        
        for index in 0..<cityNamesForAnswers.count {
            if cityNames[0] != cityNamesForAnswers[index] && cityNames.count != 4 {
                cityNames.append(cityNamesForAnswers[index])
            }
        }
        
        return cityNames.shuffled()
    }
    
    private func isAnswerCorrect(button: UIButton) -> Bool {
        cities[currentQuestion].name == button.currentTitle
    }
    
    private func updateProgressView () {
        let progressViewValue = Float(currentQuestion + 1) / Float(amountOfQuestion)
        questionProgressView.setProgress(progressViewValue, animated: true)
    }
    
    private func flipCityImage(current question: Int) {
        isOddImage = !isOddImage
        
        let fromImage = isOddImage ? nextCityImageView : cityImageView
        let toImage = isOddImage ? cityImageView : nextCityImageView
        
        UIView.transition(from: fromImage!,
                          to: toImage!,
                          duration: 0.7,
                          options:[.curveEaseOut, .transitionFlipFromLeft, .showHideTransitionViews], completion: {
                            _ in self.updateButtons(cityNamesList: self.createCityNameListForButtons())}
        )
    }
}

// MARK: - Set background color

extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

