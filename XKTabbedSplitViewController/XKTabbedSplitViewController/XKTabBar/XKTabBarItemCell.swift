//
//  XKTabBarItemCell.swift
//  XKTabbedSplitViewController
//
//  Created by DengYikai on 12/5/15.
//  Copyright © 2015 Safaride. All rights reserved.
//

import UIKit

class XKTabBarItemCell: UITableViewCell {
    
    var titleLabel:UILabel?
    var iconView:UIImageView?
    var viewController:UIViewController?
    var aImage:UIImage?
    var aSelectedImage:UIImage?
    var aSelectedColor:UIColor?
    var isFirstCell:Bool = false {
        didSet(newIsFirstCell) {
            if (newIsFirstCell) {
                topSeparator = UIView(frame: CGRectMake(0, 0, self.bounds.size.width, 1))
                topSeparator!.backgroundColor = UIColor.clearColor()
                self.addSubview(topSeparator!)
            }
        }
    }
    
    private var topSeparator:UIView?
    private var separator:UIView?
    private var viewBackground:UIView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        
        iconView = UIImageView()
        iconView!.contentMode = UIViewContentMode.Center
        self.addSubview(iconView!)
        
        titleLabel = UILabel()
        titleLabel!.textAlignment = NSTextAlignment.Center
        titleLabel!.backgroundColor = UIColor.clearColor()
        titleLabel!.font = UIFont.boldSystemFontOfSize(17)
        titleLabel!.textColor = UIColor.whiteColor()
        self.addSubview(titleLabel!)
        
        aSelectedColor = UIColor(white: 0.85, alpha: 1.0)
        aSelectedImage = UIImage()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconView!.frame = CGRectMake((self.bounds.size.width + 48) / 2, 20, 48, 48);
        titleLabel!.frame = CGRectMake(0, self.bounds.size.height - 30, self.bounds.size.width, 16)
        
        if (separator != nil) {
            separator!.frame = CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 1)
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        //设置TabBarButton高亮时的字体颜色
        titleLabel!.textColor = highlighted ? UIColor.whiteColor() : UIColor.blackColor()
        
        viewBackground = UIView(frame: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 1))
        viewBackground!.backgroundColor = highlighted ? aSelectedColor : UIColor.clearColor()
        
        if (isFirstCell) {
            topSeparator?.hidden = highlighted ? true : false
        }
        
        iconView!.image = highlighted ? aSelectedImage : aImage
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        //设置TabBarButton被选中的字体颜色
        textLabel!.textColor = selected ? UIColor.whiteColor() : UIColor.blackColor()
        
        self.backgroundColor = selected ? UIColor(red: randomColorValue(), green: randomColorValue(), blue: randomColorValue(), alpha: 1) : UIColor.clearColor()
        
        if (isFirstCell) {
            
            topSeparator?.hidden = selected ? true : false
        }
    
        iconView!.image = selected ? aSelectedImage : aImage
    }
    
    func randomColorValue() -> CGFloat {
        
        return CGFloat(Double(arc4random_uniform(255)) / 255)
    }
}