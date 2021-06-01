import Foundation
import UIKit

class AppColor {
    // 薄ピンクを返す
    class var primary: UIColor {
        return rgbColor(rgbValue: 0xf1819d)
    }

    // 薄い水色を返す
    class var secondary: UIColor{
        return rgbColor(rgbValue: 0xeeeeee)
    }

    // 白っぽい灰色を返す
    class var background: UIColor{
        return rgbColor(rgbValue: 0x707070)
    }

    // #FFFFFFのように色を指定できるようにするメソッド！色が使いやすくなる。
    // ここでしか使わないので privateメソッドにする。
    private class func rgbColor(rgbValue: UInt) -> UIColor{
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:  CGFloat( rgbValue & 0x0000FF)        / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UIColor {
    class func hex ( string : String, alpha : CGFloat) -> UIColor {
        let string_ = string.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: string_ as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            return UIColor.white;
        }
    }
}
class CustomTextField: UITextField {
    // 入力カーソル非表示
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    // 範囲選択カーソル非表示
//    override func selectionRects(for range: UITextRange) -> [Any] {
//        return []
//    }

    // コピー・ペースト・選択等のメニュー非表示
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
