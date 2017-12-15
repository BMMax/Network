//
//  Presenter.swift
//  router
//
//  Created by user on 2017/12/5.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
protocol ModelProtocol {

}

protocol ViewModelProtocol {

    func dynamicBinding(callBack: ()->())
}

protocol ViewOpetation {
    func pushTo()
}

protocol ViewProtocol {
    var viewModel: ViewModelProtocol? {get set}
    var operation: ViewOpetation? {get set}
}

class Presenter {
    var view: ViewProtocol?
    var viewModel: ViewModelProtocol?
}


extension Presenter {

     func adapter<VM: ViewModelProtocol,V: ViewProtocol>(viewModel: VM,  view: V) {
        self.viewModel = viewModel
        self.view = view
        self.viewModel?.dynamicBinding {[weak self] in
            guard let `self` = self else {return}
            self.view?.viewModel = viewModel
            self.view?.operation = self
        }
    }

}

extension Presenter: ViewOpetation {

    func pushTo() {
        currentController?.navigationController?.pushViewController(NewViewController(), animated: true)
    }
}
