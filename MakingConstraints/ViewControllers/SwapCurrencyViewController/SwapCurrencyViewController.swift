//
//  ViewController.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 22/10/2022.
//

import UIKit
import SnapKit

class SwapCurrencyViewController: UIViewController {
    
    private let backgroundScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backgroundContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerBackroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerBackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "headerBack") ?? UIImage(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.text = "Swap"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let headerFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "headerFilter") ?? UIImage(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let converterBackroundViewBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = Resources.Colors.converterBackroundBorderColor
        return view
    }()
    
    private let converterBackroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Resources.Colors.converterBackgroundColor
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let converterBackroundViewSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.converterBackroundBorderColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let maxButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.secondaryButtonBackgroundColor
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 12)
        button.setTitle("MAX", for: .normal)
        button.setTitleColor(Resources.Colors.secondaryButtonTintColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let convertButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.secondaryButtonBackgroundColor
        button.layer.cornerRadius = 16
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let image = UIImage(named: "convertArrow") ?? UIImage()
        button.setImage(image.withTintColor(Resources.Colors.secondaryButtonTintColor), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let topInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "Inter-Regular", size: 24)
        textField.placeholder = "0.0"
        return textField
    }()
    
    private lazy var topSelectTokenButton: SelectTokenButton = {
        let button = SelectTokenButton()
        button.configure(tokenImage: UIImage(named: "iconEverToken") ?? UIImage(),
                         smallerTokenImage: UIImage(named: "iconEverToken") ?? UIImage(),
                         tokenTitle: "EVER")
        button.addTarget(self, action: #selector(selectTokenButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bottomInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "Inter-Regular", size: 24)
        textField.placeholder = "0.0"
        return textField
    }()
    
    private lazy var bottomSelectTokenButton: SelectTokenButton = {
        let button = SelectTokenButton()
        button.configure(tokenImage: UIImage(named: "iconTetherToken") ?? UIImage(),
                         smallerTokenImage: UIImage(named: "iconEthToken") ?? UIImage(),
                         tokenTitle: "USDT")
        button.addTarget(self, action: #selector(selectTokenButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let exchangeSelectorLabel: ExchangeSelectorLabel = {
        let label = ExchangeSelectorLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(leftTokenImage: UIImage(named: "iconEverToken") ?? UIImage(),
                        rightTokenImage: UIImage(named: "iconBtcToken") ?? UIImage(),
                        leftTokenValue: "1", rightTokenValue: "0.03411")
        return label
    }()
    
    private let swapButton: UIButton = {
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
        
        configureUI()
        
        setupKeyboardHide()
    }
    
    func setupKeyboardHide() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc func dismissKeyboard(gesture: UIGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func selectTokenButtonPressed() {
        let emptyModalVC = EmptyModalViewController()
        present(emptyModalVC, animated: true)
    }
    
    private func configureUI() {
        view.backgroundColor = Resources.Colors.converterBackgroundColor
        
        configureContentView()
        
        configureHeaderBackroundView()
        configureHeaderBackButton()
        configureHeaderTitleLabel()
        configureHeaderFilterButton()
        
        configureConverterBackroundView()
        configureConverterBackroundViewSeparator()
        configureMaxButton()
        configureConvertButton()
        configureTopInputTextField()
        configureTopSelectTokenButton()
        configureBottomInputTextField()
        configureBottomSelectTokenButton()
        
        configureExchangeSelectorLabel()
        
        configureSwapButton()
    }
    
    private func configureContentView() {
        view.addSubview(backgroundScrollView)
        backgroundScrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        backgroundScrollView.addSubview(backgroundContentView)
        backgroundContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.snp.width)
        }
    }
    
    private func configureHeaderBackroundView() {
        backgroundContentView.addSubview(headerBackroundView)
        headerBackroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.HeaderBackroundView.topOffset)
            make.leading.equalToSuperview().offset(Constants.HeaderBackroundView.horizontalOffset)
            make.trailing.equalToSuperview().inset(Constants.HeaderBackroundView.horizontalOffset)
            make.height.equalTo(Constants.HeaderBackroundView.height)
        }
    }
    
    private func configureHeaderBackButton() {
        headerBackroundView.addSubview(headerBackButton)
        headerBackButton.snp.makeConstraints { make in
            make.height.width.equalTo(Constants.HeaderBackButton.height)
            make.centerY.leading.equalTo(headerBackroundView)
        }
    }
    
    private func configureHeaderTitleLabel() {
        headerBackroundView.addSubview(headerTitleLabel)
        headerTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(Constants.HeaderTitleLabel.height)
            make.leading.equalToSuperview().offset(Constants.HeaderTitleLabel.horizontalOffset)
            make.trailing.equalToSuperview().inset(Constants.HeaderTitleLabel.horizontalOffset)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configureHeaderFilterButton() {
        headerBackroundView.addSubview(headerFilterButton)
        headerFilterButton.snp.makeConstraints { make in
            make.height.width.equalTo(Constants.HeaderFilterButton.height)
            make.centerY.trailing.equalToSuperview()
        }
    }
    
    private func configureConverterBackroundView() {
        backgroundContentView.addSubview(converterBackroundViewBorder)
        converterBackroundViewBorder.snp.makeConstraints { make in
            make.top.equalTo(headerBackroundView.snp.bottom)
            make.leading.equalToSuperview().offset(Constants.ConverterBackroundViewBorder.horizontalOffset)
            make.trailing.equalToSuperview().inset(Constants.ConverterBackroundViewBorder.horizontalOffset)
            make.height.equalTo(Constants.ConverterBackroundViewBorder.height)
        }
        
        converterBackroundViewBorder.addSubview(converterBackroundView)
        converterBackroundView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(Constants.ConverterBackroundView.offset)
            make.bottom.trailing.equalToSuperview().inset(Constants.ConverterBackroundView.offset)
        }
    }
    
    private func configureConverterBackroundViewSeparator() {
        converterBackroundView.addSubview(converterBackroundViewSeparator)
        converterBackroundViewSeparator.snp.makeConstraints { make in
            make.leading.trailing.centerY.equalToSuperview()
            make.height.equalTo(Constants.ConverterBackroundViewSeparator.height)
        }
    }
    
    private func configureMaxButton() {
        converterBackroundView.addSubview(maxButton)
        maxButton.snp.makeConstraints { make in
            make.height.equalTo(Constants.MaxButton.height)
            make.width.equalTo(Constants.MaxButton.width)
            make.leading.equalToSuperview().offset(Constants.MaxButton.leadingOffset)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configureConvertButton() {
        converterBackroundView.addSubview(convertButton)
        convertButton.snp.makeConstraints { make in
            make.height.width.equalTo(Constants.ConvertButton.height)
            make.trailing.equalToSuperview().offset(Constants.ConvertButton.trailingOffset)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configureTopInputTextField() {
        converterBackroundView.addSubview(topInputTextField)
        topInputTextField.snp.makeConstraints { make in
            make.height.equalTo(Constants.TopInputTextField.height)
            make.top.equalToSuperview().offset(Constants.TopInputTextField.topOffset)
            make.leading.equalToSuperview().offset(Constants.TopInputTextField.leadingOffset)
            make.trailing.equalToSuperview().inset(Constants.TopInputTextField.trailingOffset)
        }
    }
    
    private func configureTopSelectTokenButton() {
        converterBackroundView.addSubview(topSelectTokenButton)
        topSelectTokenButton.snp.makeConstraints { make in
            make.height.equalTo(Constants.TopSelectTokenButton.height)
            make.width.equalTo(Constants.TopSelectTokenButton.width)
            make.top.equalToSuperview().offset(Constants.TopSelectTokenButton.topOffset)
            make.trailing.equalToSuperview().inset(Constants.TopSelectTokenButton.trailingOffset)
        }
    }
    
    private func configureBottomInputTextField() {
        converterBackroundView.addSubview(bottomInputTextField)
        bottomInputTextField.snp.makeConstraints { make in
            make.height.equalTo(Constants.BottomInputTextField.height)
            make.leading.equalToSuperview().offset(Constants.BottomInputTextField.leadingOffset)
            make.trailing.equalToSuperview().inset(Constants.BottomInputTextField.trailingOffset)
            make.bottom.equalToSuperview().inset(Constants.BottomInputTextField.bottomOffset)
        }
    }
    
    private func configureBottomSelectTokenButton() {
        converterBackroundView.addSubview(bottomSelectTokenButton)
        bottomSelectTokenButton.snp.makeConstraints { make in
            make.height.equalTo(Constants.BottomSelectTokenButton.height)
            make.width.equalTo(Constants.BottomSelectTokenButton.width)
            make.bottom.equalToSuperview().inset(Constants.BottomSelectTokenButton.bottomOffset)
            make.trailing.equalToSuperview().inset(Constants.BottomSelectTokenButton.trailingOffset)
        }
    }
    
    private func configureExchangeSelectorLabel() {
        backgroundContentView.addSubview(exchangeSelectorLabel)
        exchangeSelectorLabel.snp.makeConstraints { make in
            make.height.equalTo(Constants.ExchangeSelectorLabel.height)
            make.width.equalTo(Constants.ExchangeSelectorLabel.width)
            make.top.equalTo(converterBackroundView.snp.bottom).offset(Constants.ExchangeSelectorLabel.topOffset)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureSwapButton() {
        backgroundContentView.addSubview(swapButton)
        swapButton.snp.makeConstraints { make in
            make.height.equalTo(Constants.SwapButton.height)
            make.leading.equalToSuperview().offset(Constants.SwapButton.horizontalOffset)
            make.trailing.equalToSuperview().inset(Constants.SwapButton.horizontalOffset)
            make.top.equalTo(exchangeSelectorLabel.snp.bottom).offset(Constants.SwapButton.topOffset)
            make.bottom.equalToSuperview().offset(Constants.SwapButton.bottomOffset)
        }
    }
    
    private enum Constants {
        struct HeaderBackroundView {
            static let height = 72
            static let topOffset = 44
            static let horizontalOffset = 16
        }
        struct HeaderBackButton {
            static let height = 24
        }
        struct HeaderTitleLabel {
            static let height = 24
            static let horizontalOffset = 40
        }
        struct HeaderFilterButton {
            static let height = 24
        }
        struct ConverterBackroundViewBorder {
            static let height = 176
            static let horizontalOffset = 16
        }
        struct ConverterBackroundView {
            static let offset = 1
        }
        struct ConverterBackroundViewSeparator {
            static let height = 1
        }
        struct MaxButton {
            static let height = 32
            static let width = 59
            static let leadingOffset = 16
        }
        struct ConvertButton {
            static let height = 32
            static let trailingOffset = -16
        }
        struct TopInputTextField {
            static let height = 34
            static let leadingOffset = 16
            static let trailingOffset = 16 + TopSelectTokenButton.width + TopSelectTokenButton.trailingOffset
            static let topOffset = 16
        }
        struct TopSelectTokenButton {
            static let height = 32
            static let width = 117
            static let topOffset = 16
            static let trailingOffset = 16
        }
        struct BottomInputTextField {
            static let height = 34
            static let leadingOffset = 16
            static let trailingOffset = 16 + BottomSelectTokenButton.width + BottomSelectTokenButton.trailingOffset
            static let bottomOffset = 16
        }
        struct BottomSelectTokenButton {
            static let height = 32
            static let width = 117
            static let bottomOffset = 16
            static let trailingOffset = 16
        }
        struct ExchangeSelectorLabel {
            static let height = 27
            static let width = 116
            static let topOffset = 16
        }
        struct SwapButton {
            static let height = 50
            static let horizontalOffset = 16
            static let topOffset = 16
            static let bottomOffset = -50
        }
    }
}

