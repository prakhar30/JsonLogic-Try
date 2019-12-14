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
          {"==" : [ { "var" : "pie.filling" }, "apple" ] }
        ] }
        """
        let data = """
          { "temp" : 100, "pie" : { "filling" : "apple" } }
        """
        
        do {
            let result: Bool = try applyRule(rule)
            let result2: Bool = try applyRule(rule2, to: data)
            
            print(result)
            print(result2)
        } catch (let error as NSError) {
            print(error)
        }
    }
}
