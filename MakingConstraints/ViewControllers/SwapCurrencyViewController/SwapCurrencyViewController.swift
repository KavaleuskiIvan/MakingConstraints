//
//  ViewController.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 22/10/2022.
//

import UIKit
import SnapKit

class SwapCurrencyViewController: UIViewController {
    
    // MARK: - Private properties
    
    let contentView: SwapCurrencyView = .init()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKeyboardHide()
        configureObservers()
    }
    
    override func loadView() {
        view = contentView
    }
    
    // MARK: - Private methods
    
    private func setupKeyboardHide() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc func dismissKeyboard(gesture: UIGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func configureObservers() {
        contentView.topSelectTokenButton.addTarget(self, action: #selector(selectTokenButtonPressed), for: .touchUpInside)
        contentView.bottomSelectTokenButton.addTarget(self, action: #selector(selectTokenButtonPressed), for: .touchUpInside)
    }
    
    @objc func selectTokenButtonPressed() {
        let emptyModalVC = EmptyModalViewController()
        present(emptyModalVC, animated: true)
    }  
}

