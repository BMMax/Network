//
//  ViewModel.swift
//  router
//
//  Created by user on 2017/12/5.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation

struct ViewModel: ViewModelProtocol {

    var model: Model?
}

struct HomeRequest: Request {

   // typealias Response = ViewModel

    var path: String {
        return "mo"
    }
}


extension ViewModel {

    static func parse(encodedData: Data) -> ViewModel? {

        do {
            let decodedData = try JSONDecoder().decode(Model.self, from: encodedData)
            return ViewModel(model: decodedData)
        } catch  {
            print("序列化失败----error\(error)")
            return nil
        }
    }


    func dynamicBinding(callBack: @escaping () -> ()) {
//        AlamofireClient().request(HomeRequest()).load(LoadType.none).respond(warn: nil) {
//            guard let dict = $0["data"] as? [String: Any],
//                let data = self.jsonToData(jsonDic: dict) else{ return }
//            let viewModel = ViewModel.parse(encodedData: data)
//            print("-------------模型打印")
//            print(viewModel?.model?.city ?? "没值")
//        }

        AlamofireClient().request(HomeRequest()).load(LoadType.none).respondData(warn: nil) {
            let viewModel = ViewModel.parse(encodedData: $0)
            print("-------------模型打印")
            print(viewModel?.model?.data?.city ?? "没值")
            callBack()
        }

    }
    func jsonToData(jsonDic: [String: Any]) ->Data?{

        if(!JSONSerialization.isValidJSONObject(jsonDic)) {

            print("is not a valid json object")

            return nil

        }

        //利用自带的json库转换成Data

        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读

        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])

        //Data转换成String打印输出

        if let data = data {
            let str = String(data:data, encoding: String.Encoding.utf8) ?? "json错误"
            print("------dataString---\(str)")
        }


        //输出json字符串

        return data

    }
}
