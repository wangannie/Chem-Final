//
//  Formula.swift
//  Chem Final
//
//  Created by Annie Wang on 5/22/18.
//  Copyright © 2018 Annie Wang. All rights reserved.
//

import UIKit

class Formula{
    var name : String
    var vars : [Variable]
    
    init(){
        self.name = ""
        self.vars = [Variable]()
    }
    
    init(name : String){
        self.name = name
        self.vars = [Variable]()
    }
    init(name : String, vars : [Variable]){
        self.name = name
        self.vars = [Variable]()
        for vari in vars {
            self.addVar(vari)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addVar (_ variable : Variable) {
        self.vars.append(variable)
    }
    
    func isComplete () -> Bool {
        var count = varCount()
        for variable in getVarsOnly(){
            if (variable.hasValue()) {
                count -= 1
            }
        }
        if count == 1{
            return true
        } else { return false }
    }
    
    func getAllNames () -> [String]{
        var names = [String]()
        for v in vars{
            names.append(v.name)
        }
        return names
    }
    func getVarNames () -> [String]{
        var names = [String]()
        for v in vars{
            if !v.const {
                names.append(v.name)
            }
        }
        return names
    }
    
    func varNamed (_ name : String) -> Variable{
        for v in self.vars{
            if v.name == name {
                return v
            }
        }
        return Variable(name : "DNE")
    }
    func varCount () -> Int {
        var count = 0
        for variable in vars{
            if (!variable.const) {
                count += 1
            }
        }
        return count
    }
    func firstVar () -> Variable{
        for v in vars{
            if !v.const{
                return v
            }
        }
        return Variable()
    }
    func hasConstant () -> Bool {
        for variable in vars{
            if (variable.const) {
                return true
            }
        }
        return false
    }
    func getConstOnly() -> [Variable]{
        var consts = [Variable]()
        for variable in vars{
            if variable.const {
                consts.append(variable)
            }
        }
        return consts
    }
    func getVarsOnly () -> [Variable]{
        var variables = [Variable]()
        for variable in vars{
            if !variable.const {
                variables.append(variable)
            }
        }
        return variables
    }
    func clearData() {
        for v in getVarsOnly(){
            v.clearValue()
        }
    }
}
