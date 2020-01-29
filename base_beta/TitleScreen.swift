//
//  TitleScreen.swift
//  base_beta
//
//  Created by 後藤壱成 on 2020/01/30.
//  Copyright © 2020 kaito. All rights reserved.
//

import UIKit

class TitleScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //[Touch To Start]ボタンの点滅アニメーションの開始
        self.startAnimation()
        }
    //[Touch To Start]ボタンを押した時の動作
    @IBAction func LoginScreenSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "Transfer", sender: nil)
    }
    //[Touch To Start]ボタンの点滅
    @IBOutlet weak var Start: UIButton!
    private func startAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.allowUserInteraction, .repeat, .autoreverse], animations: {
            self.Start.alpha = 0.011

        }, completion: nil)
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


