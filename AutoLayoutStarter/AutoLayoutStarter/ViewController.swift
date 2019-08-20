//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let mainView: UIView = {
        let main = UIView()

        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        
        let purpleBox: UIView = {
            let view = UIView(frame: .zero)
            
            view.backgroundColor = .purple
            view.translatesAutoresizingMaskIntoConstraints = false
            
            return view
        }()
        
        main.addSubview(purpleBox)
        purpleBox.trailingAnchor.constraint(equalTo: main.trailingAnchor, constant: -16).isActive = true
        purpleBox.bottomAnchor.constraint(equalTo: main.bottomAnchor, constant: -16).isActive = true
        purpleBox.widthAnchor.constraint(equalTo: main.widthAnchor, multiplier: 0.666).isActive = true
        purpleBox.heightAnchor.constraint(equalToConstant: 50).isActive = true

        return main
    }()

    let squareButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Square", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)

        return button
    }()

    let portraitButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Portrait", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)

        return button
    }()

    let landScapeButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Landscape", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)

        return button
    }()

    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(mainView)

        setupLayout()
    }

    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true

        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true

        let buttonStackView = UIStackView(arrangedSubviews: [squareButton, portraitButton, landScapeButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fillEqually

        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    @objc private func squareTapped() {
        view.layoutIfNeeded()

        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }

    @objc private func portraitTapped() {
        view.layoutIfNeeded()

        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }

    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true

            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

