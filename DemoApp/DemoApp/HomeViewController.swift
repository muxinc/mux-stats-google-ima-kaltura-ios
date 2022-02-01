//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Stephanie Zuñiga on 26/1/22.
//  Copyright © 2022 Mux, Inc. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private let padding = UIScreen.main.bounds.width * 0.10
    private let buttonHeight = UIDevice.current.userInterfaceIdiom == .tv ? UIScreen.main.bounds.height * 0.1 : 44.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
    }
    
    func setupLayout() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        let containerStack = UIStackView()
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerStack.axis = .vertical
        containerStack.spacing = self.padding
        self.view.addSubview(containerStack)
        
        NSLayoutConstraint.activate([
            containerStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.padding),
            containerStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.padding),
            containerStack.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: self.padding),
            containerStack.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -self.padding),
            containerStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        let adsExampleButton = UIButton()
        adsExampleButton.translatesAutoresizingMaskIntoConstraints = false
        adsExampleButton.backgroundColor = .lightGray
        adsExampleButton.layer.cornerRadius = 4.0
        adsExampleButton.setTitleColor(.label, for: .normal)
        adsExampleButton.setTitle("IMA Ads Example", for: .normal)
        adsExampleButton.addTarget(self, action: #selector(self.openPlayerViewControllerWithIMA), for: .primaryActionTriggered)

        containerStack.addArrangedSubview(UIView()) // Add spacer view
        containerStack.addArrangedSubview(adsExampleButton)
        containerStack.addArrangedSubview(UIView()) // Add spacer view
        
        NSLayoutConstraint.activate([
            adsExampleButton.heightAnchor.constraint(greaterThanOrEqualToConstant: self.buttonHeight)
        ])
    }
    
    @objc
    func openPlayerViewControllerWithIMA() {
        self.navigationController?.pushViewController(PlayerViewController(), animated: true)
    }
}
