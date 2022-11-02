//
//  selectCurrencyButton.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 22/10/2022.
//

import UIKit
import SnapKit

class SelectTokenButton: UIButton {
    
    private let tokenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = Constants.TokenImage.cornerRadius
        return image
    }()
    
    private let smallerTokenImageBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Constants.SmallerTokenImageBorder.cornerRadius
        view.backgroundColor = Resources.Colors.converterBackroundBorderColor
        return view
    }()
    
    private let smallerTokenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = Constants.SmallerTokenImage.cornerRadius
        return image
    }()
    
    private let tokenTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: Constants.TokenTitleLabel.fontName, size: Constants.TokenTitleLabel.fontSize)
        label.textColor = Resources.Colors.selectTokenButtonTintColor
        return label
    }()
    
    private let tokenSelectArrowImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Constants.TokenSelectArrowImage.image?.withTintColor(Resources.Colors.tokenSelectArrowImageTintColor)
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(tokenImage: UIImage, smallerTokenImage: UIImage, tokenTitle: String) {
        self.tokenImage.image = tokenImage
        self.smallerTokenImage.image = smallerTokenImage
        self.tokenTitleLabel.text = tokenTitle
    }
    
    private func configureUI() {
        backgroundColor = Resources.Colors.selectTokenButtonBackgroundColor
        layer.cornerRadius = 16
        
        configureTokenImage()
        configureSmallerTokenImage()
        configureTokenSelectArrowImage()
        configureTokenTitleLabel()
    }
    
    private func configureTokenImage() {
        addSubview(tokenImage)
        tokenImage.snp.makeConstraints { make in
            make.height.equalTo(Constants.TokenImage.height)
            make.width.equalTo(Constants.TokenImage.width)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    private func configureSmallerTokenImage() {
        tokenImage.addSubview(smallerTokenImageBorder)
        smallerTokenImageBorder.snp.makeConstraints { make in
            make.height.equalTo(Constants.SmallerTokenImageBorder.height)
            make.width.equalTo(Constants.SmallerTokenImageBorder.width)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        smallerTokenImageBorder.addSubview(smallerTokenImage)
        smallerTokenImage.snp.makeConstraints { make in
            make.height.equalTo(Constants.SmallerTokenImage.height)
            make.width.equalTo(Constants.SmallerTokenImage.width)
            make.top.equalToSuperview().offset(Constants.SmallerTokenImage.topOffset)
            make.trailing.equalToSuperview().inset(Constants.SmallerTokenImage.trailingOffset)
        }
    }
    
    private func configureTokenSelectArrowImage() {
        addSubview(tokenSelectArrowImage)
        tokenSelectArrowImage.snp.makeConstraints { make in
            make.height.equalTo(Constants.TokenSelectArrowImage.height)
            make.width.equalTo(Constants.TokenSelectArrowImage.width)
            make.top.equalToSuperview().offset(Constants.TokenSelectArrowImage.topOffset)
            make.trailing.equalToSuperview().inset(Constants.TokenSelectArrowImage.trailingOffset)
        }
    }
    
    private func configureTokenTitleLabel() {
        addSubview(tokenTitleLabel)
        tokenTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(Constants.TokenTitleLabel.height)
            make.leading.equalTo(tokenImage.snp.trailing).offset(Constants.TokenTitleLabel.leadingOffset)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(tokenSelectArrowImage.snp.leading)
        }
    }
    
    private enum Constants {
        struct TokenImage {
            static let height = 32
            static let width = 32
            static let cornerRadius: CGFloat = 16
        }
        struct SmallerTokenImageBorder {
            static let height = 12
            static let width = 12
            static let cornerRadius: CGFloat = 6
        }
        struct SmallerTokenImage {
            static let height = 10
            static let width = 10
            static let topOffset = 1
            static let trailingOffset = 1
            static let cornerRadius: CGFloat = 6
        }
        struct TokenTitleLabel {
            static let height = 24
            static let leadingOffset = 8
            static let fontName = "Inter-Regular"
            static let fontSize: CGFloat = 16
        }
        struct TokenSelectArrowImage {
            static let height = 24
            static let width = 24
            static let topOffset = 4
            static let trailingOffset = 4
            static let image = UIImage(named: "tokenSelectArrow")
        }
    }
}
