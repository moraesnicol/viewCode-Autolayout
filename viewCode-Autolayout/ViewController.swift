//
//  ViewController.swift
//  viewCode-Autolayout
//
//  Created by Gabriel on 07/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let symptomsTextView = UITextView()
    let covidButton = UIButton()
    let checkmarkImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 179/255, green: 27/255, blue: 27/255, alpha: 1)
        setupBackgroundView()
        setupTitleLabel()
        setupCheckMarkImage()
        setupTextView()
        setupCovidButton()
        setupConstranints()
        
    }
    
    func setupConstranints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 27),
            backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -27),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            symptomsTextView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            symptomsTextView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            symptomsTextView.widthAnchor.constraint(equalToConstant: 338),
            symptomsTextView.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        NSLayoutConstraint.activate([
            covidButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            covidButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 70),
            covidButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -70),
            covidButton.heightAnchor.constraint(equalToConstant: 46)
            
        ])
        
        NSLayoutConstraint.activate([
            checkmarkImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            checkmarkImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 25),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 25)
            
            
        ])
    }
    
    func setupBackgroundView() {
        backgroundView.backgroundColor = .white
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 25
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Check In"
        titleLabel.font = UIFont.systemFont(ofSize: 48)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
    }
    
    func setupTextView() {
        view.addSubview(symptomsTextView)
        symptomsTextView.translatesAutoresizingMaskIntoConstraints = false
        symptomsTextView.text = "People with these symptoms may have COVID-19: Fever or chills, Cough, Shortness of breath or difficulty breathing, Fatigue, Muscle or body aches, Sore throat, Congestion or runny nose, Nausea or vomiting, Diarrhea."
        symptomsTextView.font = UIFont.systemFont(ofSize: 16)
        symptomsTextView.textAlignment = .justified
        symptomsTextView.isEditable = false
        symptomsTextView.isScrollEnabled = false
        symptomsTextView.backgroundColor = .clear
    }
    
    func setupCovidButton() {
        covidButton.backgroundColor = UIColor.init(red: 59/255, green: 102/255, blue: 139/255, alpha: 1)
        covidButton.translatesAutoresizingMaskIntoConstraints = false
        covidButton.layer.cornerRadius = 25
        covidButton.setTitle("Press if you don't have COVID", for: .normal)
        covidButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(covidButton)
        
        covidButton.addTarget(self, action: #selector(turnOnGreenMode), for: .touchUpInside)
    }
    
    @objc func turnOnGreenMode(_ sender: UIButton) {
        checkmarkImageView.isHidden = !checkmarkImageView.isHidden
        if checkmarkImageView.isHidden {
            covidButton.setTitle("Press if you don't have COVID", for: .normal)
            backgroundView.backgroundColor = .white
            
        } else {
            covidButton.setTitle("Show my room", for: .normal)
            backgroundView.backgroundColor = UIColor.init(red: 244/255, green: 250/255, blue: 240/255, alpha: 1)
        }
    }
    
    
    func setupCheckMarkImage() {
        checkmarkImageView.isHidden = true
        
        let checkMarkImage = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        view.addSubview(checkmarkImageView)
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.image = checkMarkImage
    }
    
}


