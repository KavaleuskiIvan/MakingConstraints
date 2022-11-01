//
//  ExchangeSelectorLabel.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 22/10/2022.
//

import UIKit
import SnapKit

class ExchangeSelectorLabel: UILabel {

    private let leftTokenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 8
        return image
    }()
    
    private let leftTokenValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textColor = Resources.Colors.exchangeSelectorLabelTintColor
        label.text = "Swap"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let equalSignLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Resources.Colors.exchangeSelectorLabelTintColor
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.text = "="
        return label
    }()
    
    private let rightTokenImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 8
        return image
    }()
    
    private let rightTokenValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textColor = Resources.Colors.exchangeSelectorLabelTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = Resources.Colors.exchangeSelectorLabelBackroundColor
        clipsToBounds = true
        layer.cornerRadius = 13
        
        configureLeftTokenImage()
        configureLeftTokenValueLabel()
        configureEqualSignLabel()
        configureRightTokenImage()
        configureRightTokenValueLabel()
    }
    
    func configure(leftTokenImage: UIImage, rightTokenImage: UIImage, leftTokenValue: String, rightTokenValue: String) {
        self.leftTokenImage.image = leftTokenImage
        self.rightTokenImage.image = rightTokenImage
        self.leftTokenValueLabel.text = leftTokenValue
        self.rightTokenValueLabel.text = rightTokenValue
    }
    
    private func configureLeftTokenImage() {
        addSubview(leftTokenImage)
        leftTokenImage.snp.makeConstraints { make in
            make.height.equalTo(Constants.LeftTokenImage.height)
            make.width.equalTo(Constants.LeftTokenImage.width)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Constants.LeftTokenImage.leadingOffset)
        }
    }
    
    private func configureLeftTokenValueLabel() {
        addSubview(leftTokenValueLabel)
        leftTokenValueLabel.snp.makeConstraints { make in
            make.height.equalTo(Constants.LeftTokenValueLabel.height)
            make.width.equalTo(Constants.LeftTokenValueLabel.width)
            make.centerY.equalToSuperview()
            make.leading.equalTo(leftTokenImage.snp.trailing).offset(Constants.LeftTokenValueLabel.leadingOffset)
        }
    }
    
    private func configureEqualSignLabel() {
        addSubview(equalSignLabel)
        equalSignLabel.snp.makeConstraints { make in
            make.height.equalTo(Constants.EqualSignLabel.height)
            make.centerY.equalToSuperview()
            make.leading.equalTo(leftTokenValueLabel.snp.trailing).offset(Constants.EqualSignLabel.leadingOffset)
        }
    }
    
    private func configureRightTokenImage() {
        addSubview(rightTokenImage)
        rightTokenImage.snp.makeConstraints { make in
            make.height.equalTo(Constants.RightTokenImage.height)
            make.width.equalTo(Constants.RightTokenImage.width)
            make.centerY.equalToSuperview()
            make.leading.equalTo(equalSignLabel.snp.trailing).offset(Constants.RightTokenImage.leadingOffset)
        }
    }
    
    private func configureRightTokenValueLabel() {
        addSubview(rightTokenValueLabel)
        rightTokenValueLabel.snp.makeConstraints { make in
            make.height.equalTo(Constants.RightTokenValueLabel.height)
            make.width.equalTo(Constants.RightTokenValueLabel.width)
            make.centerY.equalToSuperview()
            make.leading.equalTo(rightTokenImage.snp.trailing).offset(Constants.RightTokenValueLabel.leadingOffset)
        }
    }
    
    private enum Constants {
        struct LeftTokenImage {
            static let height = 12
            static let width = 12
            static let leadingOffset = 8
        }
        struct LeftTokenValueLabel {
            static let height = 19
            static let width = 6
            static let leadingOffset = 4
        }
        struct EqualSignLabel {
            static let height = 19
            static let leadingOffset = 4
        }
        struct RightTokenImage {
            static let height = 12
            static let width = 12
            static let leadingOffset = 4
        }
        struct RightTokenValueLabel {
            static let height = 19
            static let width = 46
            static let leadingOffset = 4
        }
    }
}
