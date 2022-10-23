//
//  ExchangeSelectorLabel.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 22/10/2022.
//

import UIKit

class ExchangeSelectorLabel: UILabel {

    let leftTokenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 8
        return image
    }()
    
    let leftTokenValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textColor = Resources.Colors.exchangeSelectorLabelTintColor
        label.text = "Swap"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let equalSignLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Resources.Colors.exchangeSelectorLabelTintColor
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.text = "="
        return label
    }()
    
    let rightTokenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 8
        return image
    }()
    
    let rightTokenValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textColor = Resources.Colors.exchangeSelectorLabelTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(leftTokenImage)
        addSubview(leftTokenValueLabel)
        addSubview(equalSignLabel)
        addSubview(rightTokenImage)
        addSubview(rightTokenValueLabel)
        
        backgroundColor = Resources.Colors.exchangeSelectorLabelBackroundColor
        clipsToBounds = true
        layer.cornerRadius = 13
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(leftTokenImage: UIImage, rightTokenImage: UIImage, leftTokenValue: String, rightTokenValue: String) {
        self.leftTokenImage.image = leftTokenImage
        self.rightTokenImage.image = rightTokenImage
        self.leftTokenValueLabel.text = leftTokenValue
        self.rightTokenValueLabel.text = rightTokenValue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftTokenImage.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        leftTokenImage.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 8).isActive = true
        leftTokenImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        leftTokenImage.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        leftTokenValueLabel.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        leftTokenValueLabel.leadingAnchor.constraint(equalTo: leftTokenImage.trailingAnchor, constant: 4).isActive = true
        leftTokenValueLabel.widthAnchor.constraint(equalToConstant: 6).isActive = true
        leftTokenValueLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        equalSignLabel.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        equalSignLabel.leadingAnchor.constraint(equalTo: leftTokenValueLabel.trailingAnchor, constant: 4).isActive = true
        equalSignLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        rightTokenImage.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        rightTokenImage.leadingAnchor.constraint(equalTo: equalSignLabel.trailingAnchor, constant: 4).isActive = true
        rightTokenImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        rightTokenImage.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        rightTokenValueLabel.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        rightTokenValueLabel.leadingAnchor.constraint(equalTo: rightTokenImage.trailingAnchor, constant: 4).isActive = true
        rightTokenValueLabel.widthAnchor.constraint(equalToConstant: 46).isActive = true
        rightTokenValueLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }
}
