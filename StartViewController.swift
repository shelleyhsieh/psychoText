//
//  StartViewController.swift
//  psychoText
//
//  Created by shelley on 2022/12/7.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var titleLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        titleContent()
        setupBtn()

        // Do any additional setup after loading the view.
    }
    
    func setupBackground(){
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
        backgroundImageView.image = UIImage(named: "起始頁")
        backgroundImageView.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImageView, at: 0)
    }
    func titleContent(){
        titleLable.text = "喵德勒     心理測驗"
        titleLable.font = UIFont(name: "jf-openhuninn-1.1", size: 48)
        titleLable.textAlignment = .center
        titleLable.textColor = .brown
    }
    
    func setupBtn(){
        startBtn.setTitle("開始進入測驗", for: .normal)
        startBtn.titleLabel?.font = UIFont(name: "jf-openhuninn-1.1", size: 30)
        startBtn.titleLabel?.textAlignment = .center
        startBtn.layer.cornerRadius = 25
        startBtn.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 215/255, blue: 0, alpha: 0.5))
        startBtn.tintColor = .brown
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
