//
//  ViewController.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 22/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let headerBackroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerBackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "headerBack") ?? UIImage(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.text = "Swap"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headerFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "headerFilter") ?? UIImage(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let converterBackroundViewBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = Resources.Colors.converterBackroundBorderColor
        return view
    }()
    
    let converterBackroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Resources.Colors.converterBackgroundColor
        view.layer.cornerRadius = 30
        return view
    }()
    
    let converterBackroundViewSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.converterBackroundBorderColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let maxButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.secondaryButtonBackgroundColor
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 12)
        button.setTitle("MAX", for: .normal)
        button.setTitleColor(Resources.Colors.secondaryButtonTintColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let convertButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.secondaryButtonBackgroundColor
        button.layer.cornerRadius = 16
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let image = UIImage(named: "convertArrow") ?? UIImage()
        button.setImage(image.withTintColor(Resources.Colors.secondaryButtonTintColor), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let topInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "Inter-Regular", size: 24)
        textField.placeholder = "0.0"
        return textField
    }()
    
    let topSelectTokenButton: SelectTokenButton = {
        let button = SelectTokenButton()
        button.configure(tokenImage: UIImage(named: "iconEverToken") ?? UIImage(),
                         smallerTokenImage: UIImage(named: "iconEverToken") ?? UIImage(),
                         tokenTitle: "EVER")
        button.addTarget(self, action: #selector(selectTokenButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let bottomInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "Inter-Regular", size: 24)
        textField.placeholder = "0.0"
        return textField
    }()
    
    let bottomSelectTokenButton: SelectTokenButton = {
        let button = SelectTokenButton()
        button.configure(tokenImage: UIImage(named: "iconTetherToken") ?? UIImage(),
                         smallerTokenImage: UIImage(named: "iconEthToken") ?? UIImage(),
                         tokenTitle: "USDT")
        button.addTarget(self, action: #selector(selectTokenButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let exchangeSelectorLabel: ExchangeSelectorLabel = {
        let label = ExchangeSelectorLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(leftTokenImage: UIImage(named: "iconEverToken") ?? UIImage(),
                        rightTokenImage: UIImage(named: "iconBtcToken") ?? UIImage(),
                        leftTokenValue: "1", rightTokenValue: "0.03411")
        return label
    }()
    
    let swapButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.swapButtonBackgroundColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 16)
        button.setTitle("Swap", for: .normal)
        button.setTitleColor(Resources.Colors.swapButtonTintColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resources.Colors.converterBackgroundColor
        
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        view.addSubview(headerBackroundView)
        headerBackroundView.addSubview(headerBackButton)
        headerBackroundView.addSubview(headerTitleLabel)
        headerBackroundView.addSubview(headerFilterButton)
        
        view.addSubview(converterBackroundViewBorder)
        converterBackroundViewBorder.addSubview(converterBackroundView)
        
        converterBackroundView.addSubview(converterBackroundViewSeparator)
        converterBackroundView.addSubview(maxButton)
        converterBackroundView.addSubview(convertButton)
        converterBackroundView.addSubview(topInputTextField)
        converterBackroundView.addSubview(topSelectTokenButton)
        converterBackroundView.addSubview(bottomInputTextField)
        converterBackroundView.addSubview(bottomSelectTokenButton)
        
        view.addSubview(exchangeSelectorLabel)
        view.addSubview(swapButton)
    }

    func setupConstraints() {
        headerBackroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        headerBackroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        headerBackroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        headerBackroundView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        headerBackButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        headerBackButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        headerBackButton.centerYAnchor.constraint(equalTo: headerBackroundView.centerYAnchor).isActive = true
        headerBackButton.leadingAnchor.constraint(equalTo: headerBackroundView.leadingAnchor).isActive = true
        
        headerTitleLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        headerTitleLabel.trailingAnchor.constraint(equalTo: headerBackroundView.trailingAnchor, constant: -40).isActive = true
        headerTitleLabel.leadingAnchor.constraint(equalTo: headerBackroundView.leadingAnchor, constant: 40).isActive = true
        headerTitleLabel.centerYAnchor.constraint(equalTo: headerBackroundView.centerYAnchor).isActive = true
        
        headerFilterButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        headerFilterButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        headerFilterButton.centerYAnchor.constraint(equalTo: headerBackroundView.centerYAnchor).isActive = true
        headerFilterButton.trailingAnchor.constraint(equalTo: headerBackroundView.trailingAnchor).isActive = true
        
        converterBackroundViewBorder.topAnchor.constraint(equalTo: view.topAnchor, constant: 116).isActive = true
        converterBackroundViewBorder.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        converterBackroundViewBorder.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        converterBackroundViewBorder.heightAnchor.constraint(equalToConstant: 176).isActive = true
        
        converterBackroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 117).isActive = true
        converterBackroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 17).isActive = true
        converterBackroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -17).isActive = true
        converterBackroundView.heightAnchor.constraint(equalToConstant: 174).isActive = true
        
        converterBackroundViewSeparator.leadingAnchor.constraint(equalTo: converterBackroundView.leadingAnchor).isActive = true
        converterBackroundViewSeparator.trailingAnchor.constraint(equalTo: converterBackroundView.trailingAnchor).isActive = true
        converterBackroundViewSeparator.centerYAnchor.constraint(equalTo: converterBackroundView.centerYAnchor).isActive = true
        converterBackroundViewSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        maxButton.leadingAnchor.constraint(equalTo: converterBackroundView.leadingAnchor, constant: 16).isActive = true
        maxButton.widthAnchor.constraint(equalToConstant: 59).isActive = true
        maxButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        maxButton.centerYAnchor.constraint(equalTo: converterBackroundView.centerYAnchor).isActive = true
        
        convertButton.leadingAnchor.constraint(equalTo: converterBackroundView.leadingAnchor, constant: 295).isActive = true
        convertButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        convertButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        convertButton.centerYAnchor.constraint(equalTo: converterBackroundView.centerYAnchor).isActive = true
        
        topInputTextField.leadingAnchor.constraint(equalTo: converterBackroundView.leadingAnchor, constant: 16).isActive = true
        topInputTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        topInputTextField.topAnchor.constraint(equalTo: converterBackroundView.topAnchor, constant: 16).isActive = true
        topInputTextField.trailingAnchor.constraint(equalTo: topSelectTokenButton.leadingAnchor, constant: -16).isActive = true
        
        topSelectTokenButton.topAnchor.constraint(equalTo: converterBackroundView.topAnchor, constant: 16).isActive = true
        topSelectTokenButton.widthAnchor.constraint(equalToConstant: 117).isActive = true
        topSelectTokenButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        topSelectTokenButton.trailingAnchor.constraint(equalTo: converterBackroundView.trailingAnchor, constant: -16).isActive = true
        
        bottomInputTextField.leadingAnchor.constraint(equalTo: converterBackroundView.leadingAnchor, constant: 16).isActive = true
        bottomInputTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        bottomInputTextField.topAnchor.constraint(equalTo: converterBackroundView.topAnchor, constant: 126).isActive = true
        bottomInputTextField.trailingAnchor.constraint(equalTo: bottomSelectTokenButton.leadingAnchor, constant: -16).isActive = true
        
        bottomSelectTokenButton.bottomAnchor.constraint(equalTo: converterBackroundView.bottomAnchor, constant: -16).isActive = true
        bottomSelectTokenButton.widthAnchor.constraint(equalToConstant: 117).isActive = true
        bottomSelectTokenButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        bottomSelectTokenButton.trailingAnchor.constraint(equalTo: converterBackroundView.trailingAnchor, constant: -16).isActive = true
        
        exchangeSelectorLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        exchangeSelectorLabel.widthAnchor.constraint(equalToConstant: 116).isActive = true
        exchangeSelectorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 308).isActive = true
        exchangeSelectorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        swapButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        swapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        swapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        swapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    @objc func selectTokenButtonPressed() {
        let emptyModalVC = EmptyModalViewController()
        present(emptyModalVC, animated: true)
    }
}

