//
//  MenuView.swift
//  DZMenu
//
//  Created by duzhe on 15/10/8.
//  Copyright © 2015年 duzhe. All rights reserved.
//

import UIKit

protocol MenuViewDelegate{
      func clickButton(button: UIButton)
}

class MenuView: UIScrollView {

    let titleArray = ["热门", "最新", "生活家", "世间事","@IT","七嘴八舌","电影","经典","连载","读图","视频","市集","七日热门","三十日热门"]
    let padding:CGFloat = 15
    var buttonWidth:CGFloat = 0
    //var buttonWidth =
    var blueLine : UIView?
    var menudDelegate:MenuViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.groupTableViewBackgroundColor()
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        addSubViewFrame(frame)
    }

    
    func addSubViewFrame(frame: CGRect) {
        
        buttonWidth = frame.width/5
        
        self.contentSize = CGSizeMake(CGFloat(titleArray.count)*buttonWidth, frame.height)
        
        for i in 0..<titleArray.count {
            let button = UIButton(frame: CGRectMake((CGFloat(Float(i)))*buttonWidth, 0, buttonWidth, frame.height))
            button.titleLabel?.font = UIFont.systemFontOfSize(12)
            button.setTitle(titleArray[i], forState: UIControlState.Normal)
            button.tag = 100 + i
            button.setTitleColor(UIColor(red: 52/255, green: 61/255, blue: 0x6B/255, alpha: 1.0) , forState: UIControlState.Normal)
            
            if i == 0{
                button.setTitleColor(UIColor(red: 0xF5/255, green: 91/255, blue: 59/255, alpha: 1.0) , forState: UIControlState.Normal)
            }
            button.addTarget(self, action: "clickButton:", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(button)
        }
        
        let lineView = UIView(frame: CGRectMake(0, frame.height - 0.5, self.contentSize.width, 0.5))
        lineView.backgroundColor = UIColor(red: 0xC6/255, green: 0xC5/255, blue: 0xB3/255, alpha: 1.0)
        self.addSubview(lineView)
        
        let blueView = UIView(frame: CGRectMake(5, frame.height - 1, buttonWidth - 10, 1))
        blueView.backgroundColor = UIColor(red: 0xF5/255, green: 91/255, blue: 59/255, alpha: 1.0)
        self.blueLine = blueView
        self.addSubview(blueView)
    }
    
    func clickButton(sender: UIButton) {
        let index = sender.tag - 100
        for subView in (self.subviews) {
            if subView.isKindOfClass(UIButton) {
                let button : UIButton = (subView as? UIButton)!
                    button.setTitleColor(UIColor(red: 52/255, green: 61/255, blue: 0x6B/255, alpha: 1.0) , forState: UIControlState.Normal)
            }
        }

        UIView.animateWithDuration(0.2) { () -> Void in
            self.blueLine?.frame = CGRectMake(5 + ((self.blueLine?.frame.width)! + 10) * CGFloat(Float(index)), (self.blueLine?.frame.origin.y)!, (self.blueLine?.frame.width)!, (self.blueLine?.frame.height)!)
            
            sender.setTitleColor(UIColor(red: 0xF5/255, green: 91/255, blue: 59/255, alpha: 1.0) , forState: UIControlState.Normal)
        }
        self.menudDelegate?.clickButton(sender)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
