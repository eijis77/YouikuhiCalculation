import UIKit
import Cartography


class SubmitButton : UIView {
    
    class func create() -> SubmitButton {
        let btn = SubmitButton()
        btn.setup()
        return btn
    }
    
    public var btnNext : UIButton?
    
    private func setup(){
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.hex(string: "#ffffff", alpha: 1)
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 0
        self.addSubview(backgroundView)
        
        let labelView = UILabel()
        labelView.text = "養育費を計算する"
        labelView.textColor = UIColor.white
        labelView.backgroundColor = UIColor.hex(string: "#f1819d", alpha: 1)
        labelView.layer.cornerRadius = 10
        labelView.clipsToBounds = true
        labelView.textAlignment = NSTextAlignment.center
        labelView.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(labelView)
        
        constrain(backgroundView, self) { bg, view in
            bg.size == view.size
            bg.center == view.center
        }
        
        constrain(labelView, self) { label, view in
            label.top == label.superview!.top + 20
            label.centerX == label.superview!.centerX
            label.width  == UIScreen.main.bounds.size.width - 180
            label.height >= 80
        }
        
        let btn = UIButton()
        self.addSubview(btn)
        constrain(btn, labelView) { bg, view in
            bg.size == view.size
            bg.center == view.center
        }
        
        self.btnNext = btn
        
    }
    
    
}
class CancelButton : UIView {
    
    class func create() -> CancelButton {
        let btn = CancelButton()
        btn.setup()
        return btn
    }
    
    public var btnNext : UIButton?
    
    private func setup(){
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.hex(string: "#ffffff", alpha: 1)
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 0
        self.addSubview(backgroundView)
        
        let labelView = UILabel()
        labelView.text = "入力をリセットする"
        labelView.textColor = UIColor.hex(string: "#f1819d", alpha: 1)
        labelView.backgroundColor = UIColor.hex(string: "#ffffff", alpha: 1)
        labelView.layer.cornerRadius = 10
        labelView.layer.borderWidth = 3
        labelView.layer.borderColor = UIColor.hex(string: "#f1819d", alpha: 1).cgColor
        labelView.clipsToBounds = true
        labelView.textAlignment = NSTextAlignment.center
        labelView.font = UIFont.boldSystemFont(ofSize: 18)
        self.addSubview(labelView)
        
        constrain(backgroundView, self) { bg, view in
            bg.size == view.size
            bg.center == view.center
        }
        
        constrain(labelView, self) { label, view in
            label.top == label.superview!.top + 20
            label.centerX == label.superview!.centerX
            label.width  == UIScreen.main.bounds.size.width - 180
            label.height >= 60
        }
        
        let btn = UIButton()
        self.addSubview(btn)
        constrain(btn, labelView) { bg, view in
            bg.size == view.size
            bg.center == view.center
        }
        
        self.btnNext = btn
        
    }
    
    
}


