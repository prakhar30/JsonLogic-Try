//
//  ViewController.swift
//  JsonLogic-Try
//
//  Created by Prakhar Tripathi on 15/12/19.
//  Copyright © 2019 None. All rights reserved.
//

import UIKit
import jsonlogic

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        evaluateSampleRules()
    }
    
    func evaluateSampleRules() {
        let rule = """
          {"and" : [
            { ">" : [3,1] },
            { "<" : [1,3] }
          ] }
        """
        
        let rule2 = """
        { "and" : [
          {"<" : [ { "var" : "temp" }, 110 ]},
          {"==" : [ { "var" : "pie.filling" }, "apple" ] },
          {"==" : [ { "var" : "pie.color" }, "red" ] }
        ] }
        """
        let data = """
          { "temp" : 100, "pie" : { "filling" : "apple", "color" : "red" } }
        """
        
        let rule3 = """
        { "and" : [
          {"<" : [ { "var" : "temp" }, 110 ]},
          {"==" : [ { "var" : "pie.filling" }, "apple" ] },
          {"or" : [ {"==" : [ {"var" : "pie.color"}, "red" ] },
                    {"==" : [ {"var" : "pie.color"}, "yellow" ] }
                  ] }
        ] }
        """
        let data2 = """
          { "temp" : 100, "pie" : { "filling" : "apple", "color" : "red" } }
        """
        
        do {
            let result: Bool = try applyRule(rule)
            let result2: Bool = try applyRule(rule2, to: data)
            let result3: Bool = try applyRule(rule3, to: data2)
            
            print(result)
            print(result2)
            print(result3)
        } catch (let error as NSError) {
            print(error)
        }
    }
}
