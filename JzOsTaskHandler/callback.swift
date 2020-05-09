//
//  callback.swift
//  JzOsTaskHandler
//
//  Created by Jianzhi.wang on 2020/5/7.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
public protocol callback{
       //取得碼表
       func clock()->JzClock
       //執行任務處理，並且同時間只能處理一次任務，必須等任務處理完才能進行下次的執行
       func runTaskOnce(_ tag:String,_ runner:()->Void)
       //執行任務處理，並且必須大於時間間隔才可以再次執行
       func runTaskTimer(_ tag:String,_ time:Double,_ runner:()->Void)
       //執行任務處理，並且限制可同時執行數量
       func runTaskMultiple(_ tag:String,_ count:Int,_ runner:()->Void)
}
