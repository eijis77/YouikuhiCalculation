//
//  DoKeisan.swift
//  YouikuhiCalculation
//
//  Created by 柴英嗣 on 2021/04/15.
//

import Foundation

struct CaluculationRepository {

    var errorCallback : ((Error) -> Void)?
    
    func calculation(YoungNum : Float, OldNum : Float, RecieveType : CalculationController.Recieve_IncomeType, PayType : CalculationController.Pay_IncomeType, RecieveIncome : Float, PayIncome : Float) -> String{
        var Result_num : Float?
        
        var kyuyo_rate : Float?
        var jigyo_rate : Float?
        
        var recieve_kiso : Float?
        var pay_kiso : Float?
        
        var kids_life : Float?
        var kids_rate = YoungNum * 62 + OldNum * 85
        
        var income_kyuyo = [
            -1,
            75,
            100,
            125,
            175,
            275,
            525,
            725,
            1325,
            1475,
            2000,
            9999999999
        ]
        var rates_kyuyo = [
            54,
            54,
            50,
            46,
            44,
            43,
            42,
            41,
            40,
            39,
            38,
            38
        ]
        var income_jigyo = [
            -1,
            66,
            82,
            98,
            256,
            349,
            392,
            496,
            563,
            784,
            942,
            1046,
            1179,
            1482,
            1567,
            9999999999
        ]
        var rates_jigyo = [
            61,
            61,
            60,
            59,
            58,
            57,
            56,
            55,
            54,
            53,
            52,
            51,
            50,
            49,
            48,
            48
        ]
        
        func last(){
            kids_life = Float(pay_kiso!) * Float((kids_rate / (kids_rate + 100)))
            Result_num = Float(Float(Int(kids_life!)) * pay_kiso! / (recieve_kiso! + pay_kiso!))
            Result_num = Result_num! / 12
        }
                
                //受取人の基礎収入（給与所得）
                if RecieveType == .kyuuyo0 {
                    for i in 0...10 {
                        if income_kyuyo[i] < Int(RecieveIncome) && Int(RecieveIncome) <= income_kyuyo[i + 1]{
                            kyuyo_rate = Float(rates_kyuyo[i + 1])
                            print("aaaa\(kyuyo_rate)")
                            recieve_kiso = RecieveIncome * kyuyo_rate! / 100
                            print("sss\(recieve_kiso)")
                        }
                    }
                    //支払人の基礎収入（給与所得）
                    if PayType == .kyuuyo1 {
                        for i in 0...10 {
                            if income_kyuyo[i] < Int(PayIncome) && Int(PayIncome) <= income_kyuyo[i + 1]{
                                kyuyo_rate = Float(rates_kyuyo[i + 1])
                                print("aaccca\(kyuyo_rate)")
                                pay_kiso = PayIncome * kyuyo_rate! / 100
                                print("ggrgr\(pay_kiso)")
                                last()
                            }
                        }
                    }
                    //支払人の基礎収入（事業所得）
                    if PayType == .jiei1 {
                        for i in 0...15 {
                            if income_jigyo[i] < Int(PayIncome) && Int(PayIncome) <= income_jigyo[i + 1]{
                                jigyo_rate = Float(rates_jigyo[i + 1])
                                print(jigyo_rate)
                                pay_kiso = PayIncome * jigyo_rate! / 100
                                print(pay_kiso)
                                last()
                            }
                        }
                    }
                }
                //受取人の基礎収入（事業所得）
                if RecieveType == .jiei0 {
                    for i in 0...15 {
                        if income_jigyo[i] < Int(RecieveIncome) && Int(RecieveIncome) <= income_jigyo[i + 1]{
                            jigyo_rate = Float(rates_jigyo[i + 1])
                            print(jigyo_rate)
                            recieve_kiso = RecieveIncome * jigyo_rate! / 100
                            print(recieve_kiso)
                        }
                    }
                    //支払人の基礎収入（給与所得）
                    if PayType == .kyuuyo1 {
                        for i in 0...9 {
                            if income_kyuyo[i] < Int(PayIncome) && Int(PayIncome) <= income_kyuyo[i + 1]{
                                kyuyo_rate = Float(rates_kyuyo[i + 1])
                                print(kyuyo_rate)
                                pay_kiso = PayIncome * kyuyo_rate! / 100
                                print(pay_kiso)
                                last()
                            }
                        }
                    }
                    //支払人の基礎収入（事業所得）
                    if PayType == .jiei1 {
                        for i in 0...14 {
                            if income_jigyo[i] < Int(PayIncome) && Int(PayIncome) <= income_jigyo[i + 1]{
                                jigyo_rate = Float(rates_jigyo[i + 1])
                                print(jigyo_rate)
                                pay_kiso = PayIncome * jigyo_rate! / 100
                                print(pay_kiso)
                                last()
                            }
                        }
                    }
                }

        let result_string = "\(Int(floor( Result_num! * 1 ) / 1))〜\(Int(floor( Result_num! * 1 + 2 ) / 1))"
        
        return result_string
    }

}

