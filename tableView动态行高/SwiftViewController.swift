//
//  SwiftViewController.swift
//  tableView动态行高
//
//  Created by 戴维保 on 2017/4/19.
//  Copyright © 2017年 daiweibao. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    //懒加载tableview
    private lazy var tableViewMain :UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.plain)
    
    //懒加载数据源-可变数组用Var，类型自动推导,数组字典都用[]
    private lazy var dataSouce :[String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //数据
        self.dataSouce += ["我就两个字","中新网4月17日电  据韩联社报道，韩国海洋水产部(简称“海水部”)“世越号”现场处理本部和负责世越号船体清理工作的韩国打捞局(Korea Salvage)为方便搜寻失踪者遗体的工作人员开展工作已于17日完成护栏安装，预计失踪者遗体搜寻工作有望于18日正式启动","这是第三个","3月28日，在将“世越”号船体运往木浦新港前，工作人员也同样在半潜船甲板上发现过动物尸骨。本月2日，工作人员曾在半潜船甲板上发现9块动物尸骨、“世越”号船长李某的护照及手提包、信用卡、圆珠笔等物品，但截至目前仍未发现9名失踪者的遗体。","","2014年4月16日，“世越”号在全罗南道珍岛郡附近水域沉没，共致295人遇难，迄今仍有9人下落不明，遇难者大多是学生。"]
        
        //创建UI
        self.createUI()
        
    }
    func createUI(){
        //标题
        self.title = "Swift自动布局"
        //tableview
        self.view.addSubview(tableViewMain)
        //去分割线
        //        tableViewMain.separatorStyle = UITableViewCellSeparatorStyle.none
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        //注册cell重用
        tableViewMain.register(SwiftTableViewCell.self , forCellReuseIdentifier: "ID")
        
        
        //开启自动计算高度
        //【重点】注意千万不要实现行高的代理方法，否则无效：heightForRowAt
        tableViewMain.estimatedRowHeight = 44//预估高度，随便设置
        tableViewMain.rowHeight = UITableViewAutomaticDimension
    }
    
    
    //代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSouce.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"ID") as! SwiftTableViewCell
        //cell样式，取消选中
        cell.selectionStyle = .none
        //传值
        cell.getTitle(contain: dataSouce[indexPath.row])
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
