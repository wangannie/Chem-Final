//
//  Variable.swift
//  Chem Final
//
//  Created by Annie Wang on 5/22/18.
//  Copyright © 2018 Annie Wang. All rights reserved.
//

import UIKit

class Variable{
    var symbol : String
    var name : String
    var orient : String
    var negative : Bool
    var const : Bool
    
    var value : Double

    init () {
        self.symbol = ""
        self.name = ""
        self.orient = ""
        self.negative = false
        self.const = false
        self.value = Double.nan
    }
    convenience init (name : String) {
        self.init()
        self.name = name
    }
    
    //init var
    init (symbol : String, name : String, orient : String, negative : Bool) {
        self.symbol = symbol
        self.name = name
        self.orient = orient
        self.negative = negative
        self.const = false
        self.value = Double.nan
    }
    //init const
    init (symbol : String, name : String, orient : String, negative : Bool, value : Double) {
        self.symbol = symbol
        self.name = name
        self.orient = orient
        self.negative = negative
        self.const = true
        self.value = value
    }
    
    //init all
    init (symbol : String, name : String, orient : String, negative : Bool, const : Bool, value : Double) {
        self.symbol = symbol
        self.name = name
        self.orient = orient
        self.negative = negative
        self.const = const
        self.value = value
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue (_ val : Double){
        self.value = val
    }
    func clearValue (){
        self.value = Double.nan
    }
    func hasValue() -> Bool {
        return !(value.isNaN)
    }
    
}
