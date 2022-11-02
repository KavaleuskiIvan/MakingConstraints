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
    
    var viewModel = SwapCurrencyViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        setupKeyboardHide()
        configureObservers()
    }
    
    override func loadView() {
        view = contentView
    }
    
    // MARK: - Private methods
    
    private func bindViewModel() {
        // topSelectTokenButton
        viewModel.topSelectTokenButtonTitle.bind { (selectTokenButtonTitle) in
            self.contentView.topSelectTokenButton.tokenTitleLabel.text = selectTokenButtonTitle
        }
        viewModel.topSelectTokenButtonImage.bind { (selectTokenButtonImage) in
            self.contentView.topSelectTokenButton.tokenImage.image = selectTokenButtonImage
        }
        viewModel.topSelectTokenButtonSmallerImage.bind { (selectTokenButtonSmallerImage) in
            self.contentView.topSelectTokenButton.smallerTokenImage.image = selectTokenButtonSmallerImage
        }
        // bottomSelectTokenButton
        viewModel.bottomSelectTokenButtonTitle.bind { (selectTokenButtonTitle) in
            self.contentView.bottomSelectTokenButton.tokenTitleLabel.text = selectTokenButtonTitle
        }
        viewModel.bottomSelectTokenButtonImage.bind { (selectTokenButtonImage) in
            self.contentView.bottomSelectTokenButton.tokenImage.image = selectTokenButtonImage
        }
        viewModel.bottomSelectTokenButtonSmallerImage.bind { (selectTokenButtonSmallerImage) in
            self.contentView.bottomSelectTokenButton.smallerTokenImage.image = selectTokenButtonSmallerImage
        }
    }
    
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
//        let emptyModalVC = EmptyModalViewController()
//        present(emptyModalVC, animated: true)
        viewModel.selectTokenButtonPressed()
    }  
}

