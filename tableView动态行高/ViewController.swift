//
//  ViewController.swift
//  tableView动态行高
//
//  Created by 戴维保 on 2017/4/19.
//  Copyright © 2017年 daiweibao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "自适应高度"
        
        //swift
        let buttonSwift:UIButton = UIButton(type: .custom)
        buttonSwift.frame = CGRect(x:0,y:100,width:self.view.frame.width,height:44)
        buttonSwift.setTitle("Swift版本（点击进入）", for: .normal)
        buttonSwift.setTitleColor(UIColor.black, for: .normal)
        buttonSwift.addTarget(self,action:#selector(ActionButtonSwift),for:.touchUpInside)
        self.view.addSubview(buttonSwift);
        
        //OC
        let buttonOC:UIButton = UIButton(type: .custom)
        buttonOC.frame = CGRect(x:0,y:200,width:self.view.frame.width,height:44)
        buttonOC.setTitle("OC版本（点击进入", for: .normal)
        buttonOC.setTitleColor(UIColor.black, for: .normal)
        buttonOC.addTarget(self,action:#selector(ActionButtonOC),for:.touchUpInside)
        self.view.addSubview(buttonOC);
        
    }
        //跳转到swift
        func ActionButtonSwift(button:UIButton){
            let swiftVC = SwiftViewController()
            self.navigationController?.pushViewController(swiftVC, animated:true)
        }
       //跳转到OC
        func ActionButtonOC(button:UIButton){
            let ocVC = OCViewController()
            self.navigationController?.pushViewController(ocVC, animated:true)
        }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

