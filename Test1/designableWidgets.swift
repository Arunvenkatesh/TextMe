import UIKit



@IBDesignable class RoundyShape: UILabel {
    
    
    
    
    
    
    
    @IBInspectable var cradius : CGFloat = 0 {
        
        didSet{
            
            layer.cornerRadius = cradius
            
        }
        
    }
    
    @IBInspectable var bwidth : CGFloat = 0 {
        
        didSet{
            
            layer.borderWidth = bwidth
            
        }
        
    }
    
    @IBInspectable var colr : UIColor? {
        
        didSet{
            
            layer.borderColor = colr?.cgColor
            
        }
        
    }
    
    @IBInspectable var bg : UIColor? {
        
        didSet{
            
            layer.backgroundColor = bg?.cgColor
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
}

@IBDesignable class ViewShape: UIView {
    
    
    
    
    
    
    
    @IBInspectable var cradius : CGFloat = 0 {
        
        didSet{
            
            layer.cornerRadius = cradius
            
        }
        
    }
    
    @IBInspectable var bwidth : CGFloat = 0 {
        
        didSet{
            
            layer.borderWidth = bwidth
            
        }
        
    }
    
    @IBInspectable var borderColr : UIColor? {
        
        didSet{
            
            layer.borderColor = borderColr?.cgColor
            
        }
        
    }
    
    @IBInspectable var bg : UIColor? {
        
        didSet{
            
            layer.backgroundColor = bg?.cgColor
            
            
            
            
            
        }
        
    }
    
}

@IBDesignable class textViewShape: UITextView {
    
    
    
    
    
    
    
    @IBInspectable var cradius : CGFloat = 0 {
        
        didSet{
            
            layer.cornerRadius = cradius
            
        }
        
    }
    
    @IBInspectable var bwidth : CGFloat = 0 {
        
        didSet{
            
            layer.borderWidth = bwidth
            
        }
        
    }
    
    @IBInspectable var borderColr : UIColor? {
        
        didSet{
            
            layer.borderColor = borderColr?.cgColor
            
        }
        
    }
    
    @IBInspectable var bg : UIColor? {
        
        didSet{
            
            layer.backgroundColor = bg?.cgColor
            
            
            
            
            
        }
        
    }
    
}



@IBDesignable class RoundyButton: UIButton{
    
    
    
    
    
    
    
    @IBInspectable var cradius : CGFloat = 0 {
        
        didSet{
            
            layer.cornerRadius = cradius
            
        }
        
    }
    
    @IBInspectable var bwidth : CGFloat = 0 {
        
        didSet{
            
            layer.borderWidth = bwidth
            
        }
        
    }
    
    @IBInspectable var borderColr : UIColor? {
        
        didSet{
            
            layer.borderColor = borderColr?.cgColor
            
        }
        
    }
    
    @IBInspectable var bg : UIColor? {
        
        didSet{
            
            layer.backgroundColor = bg?.cgColor
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    
}
