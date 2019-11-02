//
//  TQBaseViewController.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/16.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit
import RxSwift

class TQBaseViewController: UIViewController {

    public var rx_disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
