//
//  Extension.swift
//  StarWars
//
//  Created by Afsal's Macbook Pro on 26/09/2019.
//  Copyright © 2019 Afsal. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, top: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let left = left {
            anchors.append(self.leftAnchor.constraint(equalTo: left, constant: padding.left))
        }
        
        if let bottom = bottom {
            anchors.append(self.bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom))
        }
        
        if let right = right {
            anchors.append(self.rightAnchor.constraint(equalTo: right, constant: -padding.right))
        }
        
        if let top = top {
            anchors.append(self.topAnchor.constraint(equalTo: top, constant: padding.top))
        }
        
        if size.width != 0 {
            anchors.append(self.widthAnchor.constraint(equalToConstant: size.width))
        }
        
        if size.height != 0 {
            anchors.append(self.heightAnchor.constraint(equalToConstant: size.height))
        }
        
        anchors.forEach{ $0.isActive = true }
    }
}

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

public extension Array {
    func flatten() -> [Element] {
        return Array.flatten(0, self)
    }
    
    static func flatten<Element>(_ index: Int, _ toFlat: [Element]) -> [Element] {
        guard index < toFlat.count else { return [] }
        
        var flatten: [Element] = []
        
        if let itemArr = toFlat[index] as? [Element] {
            flatten = flatten + itemArr.flatten()
        } else {
            flatten.append(toFlat[index])
        }
        
        return flatten + Array.flatten(index + 1, toFlat)
    }
}

extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font!], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}
