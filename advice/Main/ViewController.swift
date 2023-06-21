//
//  ViewController.swift
//  advice
//
//  Created by Руслан Дырахов on 22.6.23..
//

import UIKit

class ViewController: UIViewController {
    
    let model = Advices()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel(frame: CGRect(x: 0, y: 60, width: Int(view.frame.width), height: 150))
        text.text = "Вредные советы"
        text.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        text.font = .monospacedDigitSystemFont(ofSize: 24, weight: .heavy)
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()

    // Главный текст
    lazy var adviceLabel: UILabel = {
        let text = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 400))
        text.center = view.center
        text.text = model.generateRandomAdvice()
        text.font = .monospacedDigitSystemFont(ofSize: 20, weight: .medium)
        text.textColor = .white
        text.textAlignment = .center
        text.lineBreakMode = .byTruncatingMiddle
        text.numberOfLines = 0
        return text
    }()

    // Кнопка показать
    lazy var adviceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6967936158, blue: 0.1562505364, alpha: 1)
        button.layer.cornerRadius = 21
        button.setTitle("Показать", for: .normal)
        button.frame = CGRect(x: (view.bounds.width - 200) / 4.2 , y: view.bounds.height - 200, width: 300, height: 50)
        button.addTarget(self, action: #selector(pushAdviceButton), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        return button
    }()
    
    // Кнопка добавить
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.frame = CGRect(x: (view.bounds.width - 200) / 2, y: view.bounds.height - 135, width: 200, height: 50)
        button.addTarget(self, action: #selector(addAdviceButton), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.addTarget(self, action: #selector(addAdviceButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1532291174, green: 0.1532291174, blue: 0.1532291174, alpha: 1) // #ColorLiteral() pipette
        setupViews()
    }
    
    @objc func pushAdviceButton() {
        adviceLabel.text = model.generateRandomAdvice()
    }
    
    @objc func addAdviceButton() {
        
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(adviceLabel)
        view.addSubview(adviceButton)
        view.addSubview(addButton)
    }
}
