//
//  propic.swift
//  Test1
//
//  Created by CC on 6/7/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

@IBDesignable class propic: UIImageView {
    @IBInspectable var corRad : CGFloat = 0{
        didSet{
        
        layer.cornerRadius = corRad
        
        }
    }
  

}
