//
//  Dynamic.swift
//  MakingConstraints
//
//  Created by Kavaleuski Ivan on 02/11/2022.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> ()
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
