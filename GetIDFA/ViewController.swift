//
//  ViewController.swift
//  GetIDFA
//
//  Created by M_Takuma on 2022/03/30.
//

import UIKit
import AppTrackingTransparency
import AdSupport

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status{
            case .notDetermined:
                //statusをアプリが判断できない
                print("判断できません")
            case .restricted:
                //statusが制限されている場合
                print("制限されています")
            case .denied:
                //承認を拒否した場合
                print("拒否されました")
            case .authorized:
                //承認した場合
                print(ASIdentifierManager.shared().advertisingIdentifier)
            @unknown default:
                print("error")
            }
        }
    }


}

