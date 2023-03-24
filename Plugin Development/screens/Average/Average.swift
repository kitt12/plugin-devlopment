//'
//  Average.swift
//  Plugin Development
//
//  Created by Theara Kit on 16/3/23.
//

import Foundation
import UIKit


class Average: UIViewController{
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiViewAverage()
    }
    

    
    func uiViewAverage() {
        
        let viewContainer = UIView()
        viewContainer.backgroundColor = .cyan
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewContainer)
        NSLayoutConstraint.activate([
            viewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            viewContainer.heightAnchor.constraint(equalToConstant: 70),
            viewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            viewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12)

        ])
        
        let name = UILabel()
        name.text = "Name: "
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.addSubview(name)
        
        NSLayoutConstraint.activate([
//            name.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
      
        ])
        
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 8
        textField.leftViewMode = .always
        if #available(iOS 13.0, *) {
            textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        } else {
            textField.layer.backgroundColor = UIColor.clear.cgColor
        }
        textField.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.addSubview(textField)
        NSLayoutConstraint.activate([
           
            textField.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.widthAnchor.constraint(equalToConstant: 300),
            
        ])
        
        let viewSubjectAndScore = UIView()
        viewSubjectAndScore.backgroundColor = .brown
        viewSubjectAndScore.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewSubjectAndScore)
        NSLayoutConstraint.activate([
            viewSubjectAndScore.heightAnchor.constraint(equalToConstant: 35),
            viewSubjectAndScore.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            viewSubjectAndScore.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            viewSubjectAndScore.topAnchor.constraint(equalTo: viewContainer.bottomAnchor)
        ])
        
        let textSubject = UILabel()
        textSubject.text = "Subjects"
        textSubject.translatesAutoresizingMaskIntoConstraints = false
        viewSubjectAndScore.addSubview(textSubject)
        NSLayoutConstraint.activate([
            textSubject.leadingAnchor.constraint(equalTo: viewSubjectAndScore.leadingAnchor),
            textSubject.centerXAnchor.constraint(equalTo: viewSubjectAndScore.centerXAnchor)
        ])
        
        let textScores = UILabel()
        textScores.text = "Scores"
        textScores.translatesAutoresizingMaskIntoConstraints = false
        viewSubjectAndScore.addSubview(textScores)
        NSLayoutConstraint.activate([
            textScores.trailingAnchor.constraint(equalTo: viewSubjectAndScore.trailingAnchor),
//            textScores.centerXAnchor.constraint(equalTo: viewSubjectAndScore.centerXAnchor)
        ])
        
        let bodyView = UIView()
        bodyView.backgroundColor = .magenta
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bodyView)
        NSLayoutConstraint.activate([
            bodyView.topAnchor.constraint(equalTo: viewSubjectAndScore.bottomAnchor),
            bodyView.heightAnchor.constraint(equalToConstant: 500),
            bodyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            bodyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        
        ])
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .gray
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        bodyView.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: viewSubjectAndScore.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 300)
        
        ])
        
        
    }
}
