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
    
    private var currentQuestion = 0
    private var amountOfQuestion = 10
    private var cities: [City]!
    
    var isOddImage = true
    
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
        for answerBotton in answerButtons{
            answerBotton.layer.cornerRadius = 7
        }
        
        cityImageView.layer.cornerRadius = 13
        nextCityImageView.layer.cornerRadius = 13
        citiesView.layer.cornerRadius = 13
        
        questionProgressView.isHidden = true
        secondStackView.isHidden = true
        
        amountOfQuestionSlider.value = Float(amountOfQuestion)
        amountOfQuestionLabel.text = String(amountOfQuestion)
        
    }
    
    @IBAction func amountOfQuestionsSliderMoved() {
        amountOfQuestion = Int(amountOfQuestionSlider.value)
        amountOfQuestionLabel.text = String(amountOfQuestion)
    }
    
    @IBAction func startButtonPressed() {
        firstStackView.isHidden = true
        secondStackView.isHidden = false
        questionProgressView.isHidden = false
        cities = City.getCities(amountOfQuestions: amountOfQuestion)
        cityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
        updateButtons(current: currentQuestion)
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if !isAnswerCorrect(button: sender) {
            wrongAnswers.append(cities[currentQuestion])
        }
        
        if currentQuestion < amountOfQuestion - 1 {
            nextCityImageView.image = UIImage(named: "\(cities[currentQuestion + 1].image)")
            flipCityImage(current: currentQuestion)
            currentQuestion += 1
            updateButtons(current: currentQuestion)
            cityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
}

//MARK: - Private functions
extension MainViewController {
    
    private func createCityNameListForButtons(current: Int) -> [String] {
        var cityNames: [String] = []
        cityNames.append(cities[current].name)
        
        while cityNames.count != 4 {
            let randomName = DataManager.shared.cityNamesList.randomElement()!
            if !cityNames.contains(randomName) {
                cityNames.append(randomName)
            }
        }
        
        return cityNames.shuffled()
    }
    
    private func updateButtons(current question: Int) {
        let cityNames = createCityNameListForButtons(current: question)
        var name = 0
        for answerButton in answerButtons {
            answerButton.setTitle(cityNames[name], for: .normal)
            name += 1
        }
        updateProgressView()
    }
    
    private func isAnswerCorrect(button: UIButton) -> Bool {
        cities[currentQuestion].name == button.currentTitle
    }
    
    private func updateProgressView () {
        let progressViewValue = (Float(currentQuestion) + 1) / Float(amountOfQuestion)
        questionProgressView.setProgress(progressViewValue, animated: true)
    }
    
    private func flipCityImage(current question: Int) {
        isOddImage = !isOddImage
        
        let fromImage = isOddImage ? nextCityImageView : cityImageView
        let toImage = isOddImage ? cityImageView : nextCityImageView
        
        UIView.transition(from: fromImage!,
                          to: toImage!,
                          duration: 0.6,
                          options:[.curveEaseOut, .transitionFlipFromLeft, .showHideTransitionViews]
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

