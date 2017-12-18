//
//  View.swift
//  router
//
//  Created by user on 2017/12/5.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit

class View: UIView, ViewProtocol {
    var viewModel: ViewModelProtocol?

    var operation: ViewOpetation?

    override init(frame: CGRect) {
        super.init(frame: frame)
        let btn = UIButton(type: .custom)
        btn.mb
            .added(into: self)
            .then {
                $0.backgroundColor = UIColor.black
                $0.addTarget(self, action: #selector(btnPush), for: .touchUpInside)
                $0.setTitle("push", for: .normal)
            }
            .frame(CGRect(x: mb.midX, y: mb.midY, width: 100, height: 50))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func btnPush() {
        operation?.pushTo()
    }
}
