//
//  ViewController.swift
//  YouikuhiCalculation
//
//  Created by 柴英嗣 on 2021/04/11.
//

import UIKit
import Cartography
import SCLAlertView
import SafariServices

class CalculationController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    var pickerView0: UIPickerView = UIPickerView()
    var pickerView1: UIPickerView = UIPickerView()
    let ChildList0 = ["0" , "1", "2", "3","4","5","6","7","8","9","10"]
    let ChildList1 = ["0" , "1", "2", "3","4","5","6","7","8","9","10"]
    
    let ChildTextField0 = CustomTextField()
    let ChildTextField1 = CustomTextField()
    
    let IncomeTextField0 = UITextField()
    let IncomeTextField1 = UITextField()

    let screenWidth = Int( UIScreen.main.bounds.size.width)
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    let scrollView = UIScrollView()
    
    let items = ["給与所得","自営業"]
    var segmentControl = UISegmentedControl()
    var segmentControl1 = UISegmentedControl()
    
    var young_num : String = "0"
    var old_num : String = "0"
    
    var recieve_income : String = "0"
    var pay_income : String = "0"
    
    //var textView: UITextView!
    
    enum Recieve_IncomeType {
        case kyuuyo0
        case jiei0
    }
    var recieve_incometype : Recieve_IncomeType?
    enum Pay_IncomeType {
        case kyuuyo1
        case jiei1
    }
    var pay_incometype : Pay_IncomeType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recieve_incometype = .kyuuyo0
        self.pay_incometype = .kyuuyo1
        
        self.navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
                
        scrollView.frame = self.view.frame
        if UIScreen.main.nativeBounds.height > 2208 || UIScreen.main.nativeBounds.height == 1792{
            scrollView.contentSize = CGSize(width:screenWidth, height: 1190)
        }
        else{
            scrollView.contentSize = CGSize(width:screenWidth, height: 1200)
        }
        
        self.view.addSubview(scrollView)
        
        let title1 = UILabel()
        title1.text = "1. 子供の情報を選択"
        title1.textColor = UIColor.hex(string: "#f1819d", alpha: 1.0)
        title1.numberOfLines = 0
        title1.font = UIFont.boldSystemFont(ofSize: 30)
        scrollView.addSubview(title1)
        constrain(title1) { label in
            label.width  == UIScreen.main.bounds.size.width - 60
            label.height >= 0
            label.left == label.superview!.left + 30
            label.top == label.superview!.top + 50
        }
        
        let ChildLabel0 = UILabel()
        ChildLabel0.text = "0~14歳の子供の人数"
        ChildLabel0.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        ChildLabel0.numberOfLines = 1
        ChildLabel0.textAlignment = .center
        ChildLabel0.font = UIFont.boldSystemFont(ofSize: 16)
        scrollView.addSubview(ChildLabel0)
        constrain(ChildLabel0, title1) { label, last in
            label.width  == UIScreen.main.bounds.size.width * 0.5
            label.height == 20
            label.centerX == label.superview!.left + UIScreen.main.bounds.size.width * 0.275
            label.top == last.bottom + 20
        }
        
        let ChildLabel1 = UILabel()
        ChildLabel1.text = "15歳以上の子供の人数"
        ChildLabel1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        ChildLabel1.numberOfLines = 1
        ChildLabel1.textAlignment = .center
        ChildLabel1.font = UIFont.boldSystemFont(ofSize: 16)
        scrollView.addSubview(ChildLabel1)
        constrain(ChildLabel1, title1) { label, last in
            label.width  == UIScreen.main.bounds.size.width * 0.5
            label.height == 20
            label.centerX == label.superview!.left + UIScreen.main.bounds.size.width * 0.725
            label.top == last.bottom + 20
        }
        
        
        pickerView0.delegate = self
        pickerView0.dataSource = self
        pickerView0.showsSelectionIndicator = true
        
        pickerView1.delegate = self
        pickerView1.dataSource = self
        pickerView1.showsSelectionIndicator = true

        let toolbar0 = UIToolbar(frame: CGRectMake(0, 0, 0, 45))
        let doneItem0 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculationController.done0))
        let cancelItem0 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CalculationController.cancel0))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar0.setItems([cancelItem0, flexibleSpace, doneItem0], animated: true)
        
        let toolbar1 = UIToolbar(frame: CGRectMake(0, 0, 0, 45))
        let doneItem1 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculationController.done1))
        let cancelItem1 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CalculationController.cancel1))
        toolbar1.setItems([cancelItem1, flexibleSpace, doneItem1], animated: true)
        
        let toolbar2 = UIToolbar(frame: CGRectMake(0, 0, 0, 45))
        let doneItem2 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculationController.done2))
        let cancelItem2 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CalculationController.cancel2))
        toolbar2.setItems([cancelItem2, flexibleSpace, doneItem2], animated: true)
        
        let toolbar3 = UIToolbar(frame: CGRectMake(0, 0, 0, 45))
        let doneItem3 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(CalculationController.done3))
        let cancelItem3 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CalculationController.cancel3))
        toolbar3.setItems([cancelItem3, flexibleSpace, doneItem3], animated: true)
        
        //0~14のtextfield
        self.ChildTextField0.inputView = pickerView0
        self.ChildTextField0.inputAccessoryView = toolbar0
        self.ChildTextField0.textColor = UIColor.black
        self.ChildTextField0.textAlignment = .center
        self.ChildTextField0.font = UIFont.systemFont(ofSize: 30)
        self.ChildTextField0.layer.borderWidth = 3
        self.ChildTextField0.layer.cornerRadius = 10
        self.ChildTextField0.text = "0"
        self.ChildTextField0.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        self.ChildTextField0.layer.borderColor = UIColor.hex(string: "#cccccc", alpha: 1.0).cgColor
        scrollView.addSubview(ChildTextField0)
        constrain(ChildTextField0, ChildLabel0) { label, last in
            label.width  == UIScreen.main.bounds.size.width * 0.28
            label.height >= 50
            label.centerX == label.superview!.left + UIScreen.main.bounds.size.width * 0.275 - 10
            label.top == last.bottom + 15
        }
        let ninn_Label0 = UILabel()
        ninn_Label0.text = "人"
        ninn_Label0.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        ninn_Label0.numberOfLines = 1
        ninn_Label0.textAlignment = .center
        ninn_Label0.font = UIFont.boldSystemFont(ofSize: 16)
        scrollView.addSubview(ninn_Label0)
        constrain(ninn_Label0, ChildTextField0) { label, last in
            label.width  == 20
            label.height == 20
            label.left == last.right + 2
            label.bottom == last.bottom
        }
        
        
        //15~のtextfield
        self.ChildTextField1.inputView = pickerView1
        self.ChildTextField1.inputAccessoryView = toolbar1
        self.ChildTextField1.textColor = UIColor.black
        self.ChildTextField1.textAlignment = .center
        self.ChildTextField1.font = UIFont.systemFont(ofSize: 30)
        self.ChildTextField1.layer.borderWidth = 3
        self.ChildTextField1.layer.cornerRadius = 10
        self.ChildTextField1.text = "0"
        self.ChildTextField1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        self.ChildTextField1.layer.borderColor = UIColor.hex(string: "#cccccc", alpha: 1.0).cgColor
        scrollView.addSubview(ChildTextField1)
        constrain(ChildTextField1, ChildLabel1) { label, last in
            label.width  == UIScreen.main.bounds.size.width * 0.28
            label.height >= 50
            label.centerX == label.superview!.left + UIScreen.main.bounds.size.width * 0.725 - 10
            label.top == last.bottom + 15
        }
        let ninn_Label1 = UILabel()
        ninn_Label1.text = "人"
        ninn_Label1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        ninn_Label1.numberOfLines = 1
        ninn_Label1.textAlignment = .center
        ninn_Label1.font = UIFont.boldSystemFont(ofSize: 16)
        scrollView.addSubview(ninn_Label1)
        constrain(ninn_Label1, ChildTextField1) { label, last in
            label.width  == 20
            label.height == 20
            label.left == last.right + 2
            label.bottom == last.bottom
        }
        
        let nextImage0 : UIImage = UIImage(named:"down_arrow")!
        let imageView0 = UIImageView(image:nextImage0)
        scrollView.addSubview(imageView0)
        constrain(imageView0, ChildTextField1) { image , last in
            image.width  == 60
            image.height == 50
            image.centerX == image.superview!.centerX
            image.top == last.bottom + 30
        }
        
        let title2 = UILabel()
        title2.text = "2. 受取人の情報を入力"
        title2.textColor = UIColor.hex(string: "#f1819d", alpha: 1.0)
        title2.numberOfLines = 0
        title2.font = UIFont.boldSystemFont(ofSize: 30)
        scrollView.addSubview(title2)
        constrain(title2, imageView0) { label , last in
            label.width  == UIScreen.main.bounds.size.width - 60
            label.height >= 0
            label.left == label.superview!.left + 30
            label.top == last.bottom + 30
        }
        
        segmentControl = UISegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)], for: .normal)
        segmentControl.backgroundColor = UIColor.hex(string: "#f1819d", alpha: 0.8)
        segmentControl.addTarget(self, action: #selector(self.segmentChanged(_:)), for: .valueChanged)
        scrollView.addSubview(segmentControl)
        constrain(segmentControl, title2) { label, last in
            label.width  == UIScreen.main.bounds.size.width - 60
            label.height == 40
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 30
        }
        
        
        self.IncomeTextField0.inputAccessoryView = toolbar2
        self.IncomeTextField0.keyboardType = .numberPad
        self.IncomeTextField0.textColor = UIColor.black
        self.IncomeTextField0.textAlignment = .center
        self.IncomeTextField0.font = UIFont.systemFont(ofSize: 40)
        self.IncomeTextField0.layer.borderWidth = 4
        self.IncomeTextField0.layer.cornerRadius = 10
        self.IncomeTextField0.placeholder = "100"
        self.IncomeTextField0.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        self.IncomeTextField0.layer.borderColor = UIColor.hex(string: "#cccccc", alpha: 1.0).cgColor
        scrollView.addSubview(IncomeTextField0)
        constrain(IncomeTextField0, segmentControl) { label, last in
            label.width  == UIScreen.main.bounds.size.width - 180
            label.height >= 80
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 30
        }
        let Yen_Label0 = UILabel()
        Yen_Label0.text = "万円"
        Yen_Label0.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        Yen_Label0.numberOfLines = 1
        Yen_Label0.textAlignment = .center
        Yen_Label0.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(Yen_Label0)
        constrain(Yen_Label0, IncomeTextField0) { label, last in
            label.width  >= 20
            label.height == 20
            label.left == last.right + 10
            label.bottom == last.bottom - 7
        }
        let Nen_Label0 = UILabel()
        Nen_Label0.text = "年収"
        Nen_Label0.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        Nen_Label0.numberOfLines = 1
        Nen_Label0.textAlignment = .center
        Nen_Label0.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(Nen_Label0)
        constrain(Nen_Label0, IncomeTextField0) { label, last in
            label.width  >= 20
            label.height == 20
            label.right == last.left - 10
            label.bottom == last.bottom - 7
        }
        
        let imageView1 = UIImageView(image:nextImage0)
        scrollView.addSubview(imageView1)
        constrain(imageView1, IncomeTextField0) { image , last in
            image.width  == 60
            image.height == 50
            image.centerX == image.superview!.centerX
            image.top == last.bottom + 30
        }
        
        let title3 = UILabel()
        title3.text = "3. 支払人の情報を入力"
        title3.textColor = UIColor.hex(string: "#f1819d", alpha: 1.0)
        title3.numberOfLines = 0
        title3.font = UIFont.boldSystemFont(ofSize: 30)
        scrollView.addSubview(title3)
        constrain(title3, imageView1) { label , last in
            label.width  == UIScreen.main.bounds.size.width - 60
            label.height >= 0
            label.left == label.superview!.left + 30
            label.top == last.bottom + 30
        }
        
        segmentControl1 = UISegmentedControl(items: items)
        segmentControl1.selectedSegmentIndex = 0
        segmentControl1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)], for: .normal)
        segmentControl1.backgroundColor = UIColor.hex(string: "#f1819d", alpha: 0.8)
        segmentControl1.addTarget(self, action: #selector(self.segmentChanged1(_:)), for: .valueChanged)
        scrollView.addSubview(segmentControl1)
        constrain(segmentControl1, title3) { label, last in
            label.width  == UIScreen.main.bounds.size.width - 60
            label.height == 40
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 30
        }
        
        self.IncomeTextField1.inputAccessoryView = toolbar3
        self.IncomeTextField1.keyboardType = .numberPad
        self.IncomeTextField1.textColor = UIColor.black
        self.IncomeTextField1.textAlignment = .center
        self.IncomeTextField1.font = UIFont.systemFont(ofSize: 40)
        self.IncomeTextField1.layer.borderWidth = 4
        self.IncomeTextField1.layer.cornerRadius = 10
        self.IncomeTextField1.placeholder = "100"
        self.IncomeTextField1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        self.IncomeTextField1.layer.borderColor = UIColor.hex(string: "#cccccc", alpha: 1.0).cgColor
        scrollView.addSubview(IncomeTextField1)
        constrain(IncomeTextField1, segmentControl1) { label, last in
            label.width  == UIScreen.main.bounds.size.width - 180
            label.height >= 80
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 30
        }
        let Yen_Label1 = UILabel()
        Yen_Label1.text = "万円"
        Yen_Label1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        Yen_Label1.numberOfLines = 1
        Yen_Label1.textAlignment = .center
        Yen_Label1.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(Yen_Label1)
        constrain(Yen_Label1, IncomeTextField1) { label, last in
            label.width  >= 20
            label.height == 20
            label.left == last.right + 10
            label.bottom == last.bottom - 7
        }
        let Nen_Label1 = UILabel()
        Nen_Label1.text = "年収"
        Nen_Label1.textColor = UIColor.hex(string: "#444444", alpha: 1.0)
        Nen_Label1.numberOfLines = 1
        Nen_Label1.textAlignment = .center
        Nen_Label1.font = UIFont.boldSystemFont(ofSize: 24)
        scrollView.addSubview(Nen_Label1)
        constrain(Nen_Label1, IncomeTextField1) { label, last in
            label.width  >= 20
            label.height == 20
            label.right == last.left - 10
            label.bottom == last.bottom - 7
        }

        
        let submit = SubmitButton.create()
        scrollView.addSubview(submit)
        let cancel = CancelButton.create()
        scrollView.addSubview(cancel)
        
        
        constrain(cancel, IncomeTextField1) { label, last in
            label.width  >= UIScreen.main.bounds.size.width - 180
            label.height == 60
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 30
        }
        
        constrain(submit, cancel) { label, last in
            label.width  >= UIScreen.main.bounds.size.width - 180
            label.height == 80
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 25
        }
        cancel.btnNext?.addTarget(self, action: #selector(onPressCancel(_:)), for: .touchUpInside)
        submit.btnNext?.addTarget(self, action: #selector(onPressSubmit(_:)), for: .touchUpInside)
        
        
        
        let baseString = "利用規約とプライバシーポリシーに同意してから利用してください。\n公式サイトとお問い合せフォームについてもリンクをタップしてください。"
        let attributedString = NSMutableAttributedString(string: baseString)
        attributedString.addAttribute(.link,
                                      value: "TermOfUseLink",
                                      range: NSString(string: baseString).range(of: "利用規約"))

        attributedString.addAttribute(.link,
                                      value: "PrivacyPolicyLink",
                                      range: NSString(string: baseString).range(of: "プライバシーポリシー"))
        attributedString.addAttribute(.link,
                                      value: "TopLink",
                                      range: NSString(string: baseString).range(of: "公式サイト"))
        attributedString.addAttribute(.link,
                                      value: "ContactLink",
                                      range: NSString(string: baseString).range(of: "お問い合せフォーム"))
        let textView = UITextView()
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.hex(string: "#eeeeee", alpha: 1.0)
        textView.attributedText = attributedString
        textView.isSelectable = true
        textView.isEditable = false
        textView.delegate = self
        scrollView.addSubview(textView)
        constrain(textView, submit) { label, last in
            label.width  >= UIScreen.main.bounds.size.width - 60
            label.height >= 70
            label.centerX == label.superview!.centerX
            label.top == last.bottom + 60
        }
        
    }
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

        let urlString = URL.absoluteString
        if urlString == "TermOfUseLink" {
            print("ffff")
            let termsUrl = NSURL(string: "https://youikuhicalculation.xyz/terms/")
            if let termsUrl = termsUrl {
                let safariViewController = SFSafariViewController(url: termsUrl as URL)
                present(safariViewController, animated: false, completion: nil)
            }
        }

        if urlString == "PrivacyPolicyLink" {
            print("ffff")
            let privacypolicyUrl = NSURL(string: "https://youikuhicalculation.xyz/privacy-policy/")
            if let privacypolicyUrl = privacypolicyUrl {
                let safariViewController = SFSafariViewController(url: privacypolicyUrl as URL)
                present(safariViewController, animated: false, completion: nil)
            }
        }
        
        if urlString == "TopLink" {
            print("ffff")
            let top = NSURL(string: "https://youikuhicalculation.xyz/")
            if let topurl = top {
                let safariViewController = SFSafariViewController(url: topurl as URL)
                present(safariViewController, animated: false, completion: nil)
            }
        }
        
        if urlString == "ContactLink" {
            print("ffff")
            let contact = NSURL(string: "https://youikuhicalculation.xyz/contact/")
            if let contacturl = contact {
                let safariViewController = SFSafariViewController(url: contacturl as URL)
                present(safariViewController, animated: false, completion: nil)
            }
        }

        return false
    }

    @objc func onPressCancel(_ sender : Any){
        print("cancel")
        //見た目のデータをリセット
        self.ChildTextField0.text = "0"
        self.ChildTextField1.text = "0"
        segmentControl.selectedSegmentIndex = 0
        segmentControl1.selectedSegmentIndex = 0
        self.IncomeTextField0.text = nil
        self.IncomeTextField1.text = nil
        
        //計算用のデータをリセット
        self.young_num = "0"
        self.old_num = "0"
        self.recieve_incometype = .kyuuyo0
        self.pay_incometype = .kyuuyo1
        self.recieve_income = "0"
        self.pay_income = "0"
        
    }
    @objc func onPressSubmit(_ sender : Any){
        print("submit")
        self.young_num = self.ChildTextField0.text ?? "0"
        self.old_num = self.ChildTextField1.text ?? "0"
        self.pay_income = self.IncomeTextField1.text ?? "0"
        self.recieve_income = self.IncomeTextField0.text ?? "0"

        if self.young_num == "0" &&
            self.old_num == "0" || self.pay_income == "0" &&
            self.recieve_income == "0" || Int(self.recieve_income) ?? 10000000000 >= 9999999999 || Int(self.pay_income) ?? 10000000000 >= 9999999999 || self.recieve_income[recieve_income.startIndex] == "0" && self.recieve_income.count > 1 || self.pay_income[pay_income.startIndex] == "0" && self.pay_income.count > 1{
            let appearance = SCLAlertView.SCLAppearance(
                showCloseButton: true
            )
            let alert = SCLAlertView(appearance: appearance)
            alert.showInfo("注意", subTitle: "すべての正しい項目を入力してください", closeButtonTitle: "OK")
        }
        else{
            let Result_num = CaluculationRepository().calculation(YoungNum: Float(self.young_num)!, OldNum: Float(self.old_num)!, RecieveType: self.recieve_incometype!, PayType: self.pay_incometype!, RecieveIncome: Float(self.recieve_income)!, PayIncome: Float(self.pay_income)!)
            
            let appearance = SCLAlertView.SCLAppearance(
                showCloseButton: true
            )
            let alert = SCLAlertView(appearance: appearance)
            alert.showSuccess("計算完了！", subTitle: "養育費の相場は「\(Result_num)」万円です！", closeButtonTitle: "OK")
        }
    }

    
    // 受取人の職業形態
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("First")
            self.recieve_incometype = .kyuuyo0
            print(self.recieve_incometype)
            break
        case 1:
            print("Second")
            self.recieve_incometype = .jiei0
            print(self.recieve_incometype)
            break
        default:
            print("Error")
            break
        }
    }
    //支払人の職業形態
    @objc func segmentChanged1(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("First")
            self.pay_incometype = .kyuuyo1
            print(self.pay_incometype)
            break
        case 1:
            print("Second")
            self.pay_incometype = .jiei1
            print(self.pay_incometype)
            break
        default:
            print("Error")
            break
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var num = 3
        if pickerView == self.pickerView0 {
            num = ChildList0.count
        }
        if pickerView == self.pickerView1 {
            num = ChildList1.count
        }
        return num
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var picker_text = ""
        if pickerView == self.pickerView0 {
            picker_text = ChildList0[row]
        }
        if pickerView == self.pickerView1 {
            picker_text = ChildList1[row]
        }
        return picker_text
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.pickerView0 {
            self.ChildTextField0.text = ChildList0[row]
        }
        if pickerView == self.pickerView1 {
            self.ChildTextField1.text = ChildList1[row]
        }
    }
    //0~14の子供の人数
    @objc func cancel0() {
        self.ChildTextField0.text = "0"
        self.young_num = "0"
        print(self.young_num)
        self.ChildTextField0.endEditing(true)
    }
    @objc func done0() {
        self.young_num = self.ChildTextField0.text ?? "0"
        print(self.young_num)
        self.ChildTextField0.endEditing(true)
    }
    //15歳以上の子供の人数
    @objc func cancel1() {
        self.ChildTextField1.text = "0"
        self.old_num = "0"
        print(self.old_num)
        self.ChildTextField1.endEditing(true)
    }
    @objc func done1() {
        self.old_num = self.ChildTextField1.text ?? "0"
        print(self.old_num)
        self.ChildTextField1.endEditing(true)
    }
    //受取人の年収
    @objc func cancel2() {
        self.IncomeTextField0.text = "0"
        self.recieve_income = "0"
        print(self.recieve_income)
        self.IncomeTextField0.endEditing(true)
    }

    @objc func done2() {
        self.recieve_income = self.IncomeTextField0.text ?? "0"
        print(self.recieve_income)
        self.IncomeTextField0.endEditing(true)
    }
    //支払人の年収
    @objc func cancel3() {
        self.IncomeTextField1.text = "0"
        self.pay_income = "0"
        print(self.pay_income)
        self.IncomeTextField1.endEditing(true)
    }

    @objc func done3() {
        self.pay_income = self.IncomeTextField1.text ?? "0"
        print(self.pay_income)
        self.IncomeTextField1.endEditing(true)
    }

    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

