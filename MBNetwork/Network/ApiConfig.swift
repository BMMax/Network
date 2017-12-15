//
//  ApiConfig.swift
//  MBNetwork
//
//  Created by user on 2017/11/17.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation

/// 自定义打印
func debugPrint<T>(_ message : T, file: String = #file, funcName: String = #function, lineNum: Int = #line) {

    #if DEBUG

        let fileName = (file as NSString).lastPathComponent
        let className = (fileName as NSString).deletingPathExtension

        print("\(fileName):(line:\(lineNum))-[\(className) \(funcName)]-\(message)")

    #endif

}
/// 查看快递信息
/// ps:快递公司编码:申通="shentong" EMS="ems" 顺丰="shunfeng" 圆通="yuantong" 中通="zhongtong" 韵达="yunda" 天天="tiantian" 汇通="huitongkuaidi" 全峰="quanfengkuaidi" 德邦="debangwuliu" 宅急送="zhaijisong"

public enum HostType: String {

    #if DEBUG
        case BaseApi = "http://liaoyann.com/"
    #else
        case BaseApi = "http://liaoyann.com/"
    #endif

    
}
