//
//  Controller.swift
//  router
//
//  Created by user on 2017/12/5.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit
class Controller: ViewController {
    private lazy var viewModel: ViewModel = ViewModel()
    private lazy var presenter: Presenter = Presenter()
    private lazy var baseView: View = View(frame: UIScreen.main.bounds)

    override func viewDidLoad() {

        super.viewDidLoad()
        self.setupView()
        self.adapterView()
    }

    private func setupView() {
        view.addSubview(baseView)
    }

    private func adapterView() {
        presenter.adapter(viewModel: viewModel, view: baseView)
    }
}
