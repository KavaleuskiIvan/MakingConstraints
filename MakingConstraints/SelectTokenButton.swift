//
//  selectCurrencyButton.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 22/10/2022.
//

import UIKit

class SelectTokenButton: UIButton {
    
    let tokenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 16
        return image
    }()
    
    let smallerTokenImageBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.backgroundColor = Resources.Colors.converterBackroundBorderColor
        return view
    }()
    
    let smallerTokenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        return image
    }()
    
    let tokenTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.textColor = Resources.Colors.selectTokenButtonTintColor
        return label
    }()
    
    let tokenSelectArrowImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "tokenSelectArrow")?.withTintColor(Resources.Colors.tokenSelectArrowImageTintColor)
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tokenImage)
        tokenImage.addSubview(smallerTokenImageBorder)
        smallerTokenImageBorder.addSubview(smallerTokenImage)
        addSubview(tokenSelectArrowImage)
        addSubview(tokenTitleLabel)
        
        backgroundColor = Resources.Colors.selectTokenButtonBackgroundColor
        layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(tokenImage: UIImage, smallerTokenImage: UIImage, tokenTitle: String) {
        self.tokenImage.image = tokenImage
        self.smallerTokenImage.image = smallerTokenImage
        self.tokenTitleLabel.text = tokenTitle
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tokenImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        tokenImage.widthAnchor.constraint(equalToConstant: 32).isActive = true
        tokenImage.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        tokenImage.leadingAnchor.constraint(equalTo: super.leadingAnchor).isActive = true
        
        smallerTokenImageBorder.heightAnchor.constraint(equalToConstant: 12).isActive = true
        smallerTokenImageBorder.widthAnchor.constraint(equalToConstant: 12).isActive = true
        smallerTokenImageBorder.topAnchor.constraint(equalTo: tokenImage.topAnchor).isActive = true
        smallerTokenImageBorder.trailingAnchor.constraint(equalTo: tokenImage.trailingAnchor).isActive = true
        
        smallerTokenImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
        smallerTokenImage.widthAnchor.constraint(equalToConstant: 10).isActive = true
        smallerTokenImage.topAnchor.constraint(equalTo: tokenImage.topAnchor, constant: 1).isActive = true
        smallerTokenImage.trailingAnchor.constraint(equalTo: tokenImage.trailingAnchor, constant: -1).isActive = true
        
        tokenSelectArrowImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        tokenSelectArrowImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        tokenSelectArrowImage.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -4).isActive = true
        tokenSelectArrowImage.topAnchor.constraint(equalTo: super.topAnchor, constant: 4).isActive = true
        
        tokenTitleLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        tokenTitleLabel.leadingAnchor.constraint(equalTo: tokenImage.trailingAnchor, constant: 8).isActive = true
        tokenTitleLabel.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        tokenTitleLabel.trailingAnchor.constraint(equalTo: tokenSelectArrowImage.leadingAnchor).isActive = true
    }
}
