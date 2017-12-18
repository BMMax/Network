//
//  UIView+Extension.swift
//  ScrollTableView
//
//  Created by user on 2017/11/14.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit

public struct UILayout<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol LayoutCompatible {
    associatedtype LayoutType
    var mb: UILayout<LayoutType> {get}
}

extension LayoutCompatible {
    
    public var mb: UILayout<Self> {
        return UILayout(self)
    }
}

/// snp布局
protocol Layoutable {
    //func layoutMaker() ->(ConstraintMaker) -> Void
}


extension UILayout where Base: UIView {
    @discardableResult
    func added(into superView: UIView) -> UILayout {
        superView.addSubview(base)
        return self
    }
    
    @discardableResult
    func then(_ config: (Base) -> Void) -> UILayout {
        config(base)
        return self
    }
    
    @discardableResult
    func makeLayout(_ layout: Layoutable) -> UILayout {
        return self
    }
    
    @discardableResult
    func frame(_ layout: CGRect) -> UILayout {
        base.frame = layout
        return self
    }
    
    //@discardableResult
//    func layout(snapKitMaker: (ConstraintMaker) -> Void) -> UILayout {
//        self.snp.makeConstraints { (make) in
//            snapKitMaker(make)
//        }
//        return self
//    }
    
    
}

extension NSObject: LayoutCompatible { }
