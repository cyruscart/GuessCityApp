//
//  ViewController.swift
//  GuessCityApp
//
//  Created by Кирилл on 11.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var firstStackView: UIStackView!
    
    @IBOutlet weak var secondStackView: UIStackView!
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var nextCityImageView: UIImageView!
    
    @IBOutlet weak var citiesView: UIView!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    private var wrongAnswers: [City] = []
    
    private let primaryColor = UIColor(
        red: 255/255,
        green: 255/255,
        blue: 255/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 25/255,
        green: 33/255,
        blue: 78/255,
        alpha: 1
    )
    
    private var cities: [City]!
    
    private var isOddImage = true
    
    private var isNavBarNeedShow = true
    
    private var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        answerButtons.forEach{$0.layer.cornerRadius = 7}
        
        clearButtonsText()
        
        cityImageView.layer.cornerRadius = 13
        nextCityImageView.layer.cornerRadius = 13
        citiesView.layer.cornerRadius = 13
        
        questionProgressView.isHidden = true
        secondStackView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        isNavBarNeedShow ?
            navigationController?.setNavigationBarHidden(false, animated: false):
            navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultTableViewController else { return }
        
        resultVC.resultCity = wrongAnswers
    }
    
    @IBAction func startButtonPressed() {
        
        cities = City.getCities()
        
        changeShowingStackView()
        
        updateButtons(cityNamesList: createCityNameListForButtons())
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        isNavBarNeedShow = !isNavBarNeedShow
        
        cityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
        
        nextCityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if !isAnswerCorrect(button: sender) {
            wrongAnswers.append(cities[currentQuestion])
            sender.backgroundColor = .systemRed
        } else {
            sender.backgroundColor = .systemGreen
        }
        
        if currentQuestion < lrintf(Settings.shared.amountOfQuestion) - 1 {
            
            updateProgressView()
            
            currentQuestion += 1
            
            flipCityImage(current: currentQuestion)
            
            UIView.animate(withDuration: 0.3,delay: 0.3, animations: {sender.backgroundColor = .darkGray})
            
            nextCityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
            
            cityImageView.image = UIImage(named: "\(cities[currentQuestion].image)")
            
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
            
            navigationController?.setNavigationBarHidden(false, animated: false)
            
            isNavBarNeedShow = !isNavBarNeedShow
            
            changeShowingStackView()
            
            answerButtons.forEach{$0.setTitle("", for: .normal)}
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        updateValuesForNewGame()
    }
}

//MARK: - Private methods

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
        
        let cityNamesForAnswers = City.getCityList(type: cities[currentQuestion].type)
        
        for index in 0..<cityNamesForAnswers.count {
            if cityNames.first != cityNamesForAnswers[index] && cityNames.count != 4 {
                cityNames.append(cityNamesForAnswers[index])
            } else if cityNames.count == 4 {
                break
            }
        }
        return cityNames.shuffled()
    }
    
    private func isAnswerCorrect(button: UIButton) -> Bool {
        cities[currentQuestion].name == button.currentTitle
    }
    
    private func updateProgressView () {
        let progressViewValue = Float(currentQuestion + 1) / Float(Settings.shared.amountOfQuestion)
        questionProgressView.setProgress(progressViewValue, animated: true)
    }
    
    private func flipCityImage(current question: Int) {
        isOddImage = !isOddImage
        
        let fromImage = isOddImage ? nextCityImageView : cityImageView
        let toImage = isOddImage ? cityImageView : nextCityImageView
        
        UIView.transition(from: fromImage!,
                          to: toImage!,
                          duration: 0.7,
                          options:[.curveEaseOut, .transitionFlipFromLeft, .showHideTransitionViews])
        
        updateButtons(cityNamesList: createCityNameListForButtons())
    }
    
    private func changeShowingStackView() {
        
        for view in [firstStackView, secondStackView, questionProgressView] {
            view?.isHidden.toggle()
        }
    }
    
    private func updateValuesForNewGame() {
        wrongAnswers = []
        currentQuestion = 0
        answerButtons.forEach {$0.backgroundColor = .darkGray}
        questionProgressView.setProgress(0, animated: false)
    }
    
    private func clearButtonsText() {
        answerButtons.forEach{$0.setTitle("", for: .normal)}
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

