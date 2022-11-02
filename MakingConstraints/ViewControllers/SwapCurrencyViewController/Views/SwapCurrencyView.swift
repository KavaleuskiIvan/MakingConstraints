//
//  SwapCurrencyView.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 01/11/2022.
//

import UIKit

class SwapCurrencyView: UIView {
    
    // MARK: - Private properties
    
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
        button.setImage(Constants.HeaderBackButton.image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: Constants.HeaderTitleLabel.fontName, size: Constants.HeaderTitleLabel.fontSize)
        label.text = Constants.HeaderTitleLabel.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let headerFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.HeaderFilterButton.image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let converterBackroundViewBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Constants.ConverterBackroundViewBorder.cornerRadius
        view.backgroundColor = Resources.Colors.converterBackroundBorderColor
        return view
    }()
    
    private let converterBackroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Resources.Colors.converterBackgroundColor
        view.layer.cornerRadius = Constants.ConverterBackroundView.cornerRadius
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
        button.layer.cornerRadius = Constants.MaxButton.cornerRadius
        button.titleLabel?.font = UIFont(name: Constants.MaxButton.fontName, size: Constants.MaxButton.fontSize)
        button.setTitle(Constants.MaxButton.title, for: .normal)
        button.setTitleColor(Resources.Colors.secondaryButtonTintColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let convertButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.secondaryButtonBackgroundColor
        button.layer.cornerRadius = Constants.ConvertButton.cornerRadius
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        let image = Constants.ConvertButton.image
        button.setImage(image.withTintColor(Resources.Colors.secondaryButtonTintColor), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let topInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: Constants.TopInputTextField.fontName, size: Constants.TopInputTextField.fontSize)
        textField.placeholder = "0.0"
        return textField
    }()
    
    private(set) lazy var topSelectTokenButton: SelectTokenButton = {
        let button = SelectTokenButton()
//        button.configure(tokenImage: UIImage(named: "iconEverToken") ?? UIImage(),
//                         smallerTokenImage: UIImage(named: "iconEverToken") ?? UIImage(),
//                         tokenTitle: "EVER")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bottomInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: Constants.BottomInputTextField.fontName, size: Constants.BottomInputTextField.fontSize)
        textField.placeholder = "0.0"
        return textField
    }()
    
    private(set) lazy var bottomSelectTokenButton: SelectTokenButton = {
        let button = SelectTokenButton()
//        button.configure(tokenImage: UIImage(named: "iconTetherToken") ?? UIImage(),
//                         smallerTokenImage: UIImage(named: "iconEthToken") ?? UIImage(),
//                         tokenTitle: "USDT")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let exchangeSelectorLabel: ExchangeSelectorLabel = {
        let label = ExchangeSelectorLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(leftTokenImage: Constants.ExchangeSelectorLabel.leftTokenImage,
                        rightTokenImage: Constants.ExchangeSelectorLabel.rightTokenImage,
                        leftTokenValue: "1", rightTokenValue: "0.03411")
        return label
    }()
    
    private let swapButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resources.Colors.swapButtonBackgroundColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = Constants.SwapButton.cornerRadius
        button.titleLabel?.font = UIFont(name: Constants.SwapButton.fontName, size: Constants.SwapButton.fontSize)
        button.setTitle(Constants.SwapButton.title, for: .normal)
        button.setTitleColor(Resources.Colors.swapButtonTintColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func configureUI() {
        self.backgroundColor = Resources.Colors.converterBackgroundColor
        
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
        self.addSubview(backgroundScrollView)
        backgroundScrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        backgroundScrollView.addSubview(backgroundContentView)
        backgroundContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.snp.width)
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
            static let image = UIImage(named: "headerBack")
        }
        struct HeaderTitleLabel {
            static let height = 24
            static let horizontalOffset = 40
            static let title = "Swap"
            static let fontName = "Inter-Regular"
            static let fontSize: CGFloat = 16
        }
        struct HeaderFilterButton {
            static let height = 24
            static let image = UIImage(named: "headerFilter")
        }
        struct ConverterBackroundViewBorder {
            static let height = 176
            static let horizontalOffset = 16
            static let cornerRadius: CGFloat = 30
        }
        struct ConverterBackroundView {
            static let offset = 1
            static let cornerRadius: CGFloat = 30
        }
        struct ConverterBackroundViewSeparator {
            static let height = 1
        }
        struct MaxButton {
            static let height = 32
            static let width = 59
            static let leadingOffset = 16
            static let title = "MAX"
            static let cornerRadius: CGFloat = 16
            static let fontName = "Inter-Regular"
            static let fontSize: CGFloat = 12
        }
        struct ConvertButton {
            static let height = 32
            static let trailingOffset = -16
            static let image = UIImage(named: "convertArrow") ?? UIImage()
            static let cornerRadius: CGFloat = 16
        }
        struct TopInputTextField {
            static let height = 34
            static let leadingOffset = 16
            static let trailingOffset = 16 + TopSelectTokenButton.width + TopSelectTokenButton.trailingOffset
            static let topOffset = 16
            static let fontName = "Inter-Regular"
            static let fontSize: CGFloat = 24
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
            static let fontName = "Inter-Regular"
            static let fontSize: CGFloat = 24
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
            static let leftTokenImage = UIImage(named: "iconEverToken") ?? UIImage()
            static let rightTokenImage = UIImage(named: "iconBtcToken") ?? UIImage()
        }
        struct SwapButton {
            static let height = 50
            static let horizontalOffset = 16
            static let topOffset = 16
            static let bottomOffset = -50
            static let title = "Swap"
            static let cornerRadius: CGFloat = 16
            static let fontName = "Inter-Regular"
            static let fontSize: CGFloat = 16
        }
    }
}
