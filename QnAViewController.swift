//
//  QnAViewController.swift
//  psychoText
//
//  Created by shelley on 2022/12/7.
//

import UIKit

class QnAViewController: UIViewController {

    @IBOutlet weak var noOfQuestiounLable: UILabel!
    @IBOutlet var answerBtn: [UIButton]!
    @IBOutlet weak var questionLable: UILabel!
//    題目排序
    var questionIndex = 0
//    題目
    var questions = [Question]()
    var database = QuestionDataBase()
//    答案
    var yourAnswer = ["","",""]
//    答案排序
    var ansIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputQuestion()
        setupBtn()
        setupBackgroundImage()
        play()

        // Do any additional setup after loading the view.
    }
//    匯入題目，遇到答案不滿五個選項時，把按鈕隱藏起來
    func inputQuestion(){
//    讓總題數維持在3題
        if questionIndex == 3{
            questionIndex = 2
        }
        questions.append(contentsOf: database.getQuestion())
        questionLable.font = UIFont(name: "jf-openhuninn-1.1", size: 20)
        for option in 0...4{
            answerBtn[option].setTitle(questions[questionIndex].answer[option], for: .normal)
            if questions[questionIndex].answer[option] == "" {
                answerBtn[option].isHidden = true
            }else{
                answerBtn[option].isHidden = false
            }
        }
    }
//    設定按鈕外觀
    func setupBtn(){
        for ansBtn in 0...4 {
            answerBtn[ansBtn].titleLabel?.font = UIFont(name: "jf-openhuninn-1.1", size: 20)
            answerBtn[ansBtn].layer.cornerRadius = 15
            answerBtn[ansBtn].backgroundColor = UIColor(cgColor: CGColor(red: 205/255, green: 165/255, blue: 169/255, alpha: 0.7))
            answerBtn[ansBtn].tintColor = .black
        }
    }
//    設定背景圖案
    func setupBackgroundImage(){
        let bgImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
        bgImageView.image = UIImage(named: "問題頁")
        bgImageView.contentMode = .scaleAspectFill
        view.insertSubview(bgImageView, at: 0)
        
    }
//    顯示題目和答案
    func play(){
        if questionIndex < 3 {
            questionLable.text = questions[questionIndex].description
//    第幾題
            noOfQuestiounLable.text = "\(questionIndex+1)"
        }
        for btnText in 0...4 {
            answerBtn[btnText].setTitle(questions[questionIndex].answer[btnText], for: .normal)
        }
    }
    
    
//    選擇答案，把答案array存成index
    @IBAction func selecAnswer(_ sender: UIButton) {
        questionIndex += 1
        inputQuestion()
        play()
    
//    設定btn的tag,以辨識選到哪一個
        let button = sender
        let index = button.tag
        switch index {
        case 0:
            yourAnswer[ansIndex] = String(index)
        case 1:
            yourAnswer[ansIndex] = String(index)
        case 2:
            yourAnswer[ansIndex] = String(index)
        case 3:
            yourAnswer[ansIndex] = String(index)
        case 4:
            yourAnswer[ansIndex] = String(index)
        default:
            break
        }
//        yourAnswer[ansIndex] = (sender.titleLabel?.text)!
        print(yourAnswer, index)
    
        ansIndex += 1
//    答完3題，將答案傳入下一頁
        if ansIndex == 3 {
            
            performSegue(withIdentifier: "showResult", sender: sender)
        }
    }
    
//    將答案傳到下一頁
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
            controller?.answers = yourAnswer
            print(yourAnswer)
        return controller
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showResult" {
//            if let showViewController = segue.destination as? ResultViewController {
//                showViewController.answers = yourAnswer
//            }
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
