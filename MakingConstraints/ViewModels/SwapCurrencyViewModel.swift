//
//  SwapCurrencyViewModel.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 02/11/2022.
//

import Foundation
import UIKit.UIImage

class SwapCurrencyViewModel {
    var topSelectTokenButtonTitle = Dynamic("")
    var topSelectTokenButtonImage = Dynamic(UIImage())
    var topSelectTokenButtonSmallerImage = Dynamic(UIImage())
    
    var bottomSelectTokenButtonTitle = Dynamic("")
    var bottomSelectTokenButtonImage = Dynamic(UIImage())
    var bottomSelectTokenButtonSmallerImage = Dynamic(UIImage())
    
    func selectTokenButtonPressed() {
        if topSelectTokenButtonTitle.value == "" {
            topSelectTokenButtonTitle.value = "EVER"
            topSelectTokenButtonImage.value = UIImage(named: "iconEverToken") ?? UIImage()
            topSelectTokenButtonSmallerImage.value = UIImage(named: "iconEverToken") ?? UIImage()
            
            bottomSelectTokenButtonTitle.value = "USDT"
            bottomSelectTokenButtonImage.value = UIImage(named: "iconTetherToken") ?? UIImage()
            bottomSelectTokenButtonSmallerImage.value = UIImage(named: "iconEthToken") ?? UIImage()
            
        } else if topSelectTokenButtonTitle.value == "EVER" {
            topSelectTokenButtonTitle.value = "USDT"
            topSelectTokenButtonImage.value = UIImage(named: "iconTetherToken") ?? UIImage()
            topSelectTokenButtonSmallerImage.value = UIImage(named: "iconEthToken") ?? UIImage()
            
            bottomSelectTokenButtonTitle.value = "EVER"
            bottomSelectTokenButtonImage.value = UIImage(named: "iconEverToken") ?? UIImage()
            bottomSelectTokenButtonSmallerImage.value = UIImage(named: "iconEverToken") ?? UIImage()
        } else {
            topSelectTokenButtonTitle.value = "EVER"
            topSelectTokenButtonImage.value = UIImage(named: "iconEverToken") ?? UIImage()
            topSelectTokenButtonSmallerImage.value = UIImage(named: "iconEverToken") ?? UIImage()
            
            bottomSelectTokenButtonTitle.value = "USDT"
            bottomSelectTokenButtonImage.value = UIImage(named: "iconTetherToken") ?? UIImage()
            bottomSelectTokenButtonSmallerImage.value = UIImage(named: "iconEthToken") ?? UIImage()
        }
    }
}
