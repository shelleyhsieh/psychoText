//
//  ResultViewController.swift
//  psychoText
//
//  Created by shelley on 2022/12/7.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var keyQuesLable: UILabel!
    @IBOutlet var answerLable: [UILabel]!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var ansIndex = 0
    var ansDatabase = answerDatebase().getAnswer()
    var restart = ""
    var answers = [String](repeating: "", count: 3)
    
//    init?(coder:NSCoder, answer: [String]){
//        self.answer = answer
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupBtn()
        result()

    }
    //    設定背景圖案
    func setupBackground(){
        let bgImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
        bgImageView.image = UIImage(named: "結果頁")
        bgImageView.contentMode = .scaleAspectFill
        view.insertSubview(bgImageView, at: 0)
    }
    //    設定按鈕樣式
    func setupBtn(){
        previousBtn.setTitle("上一頁", for: .normal)
        previousBtn.setTitleColor(.black, for: .normal)
        previousBtn.backgroundColor = UIColor(cgColor: CGColor(red: 135/255, green: 109/255, blue: 90/255, alpha: 0.8))
        previousBtn.layer.cornerRadius = 20
        nextBtn.setTitle("下一頁", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        nextBtn.backgroundColor = UIColor(cgColor: CGColor(red: 135/255, green: 109/255, blue: 90/255, alpha: 0.8))
        nextBtn.layer.cornerRadius = 20
        
    }
    
//    顯示所有答案
    func resultAnswer() {
        questionLable.text = ansDatabase[ansIndex].description
        questionLable.font = UIFont(name: "jf-openhuninn-1.1", size: 20)
        keyQuesLable.text = ansDatabase[ansIndex].question
        questionLable.font = UIFont(name: "jf-openhuninn-1.1", size: 24)
        //   將答案結果先全部隱藏
        resetAnswerLable()
//    顯示此題答案的內容，並依照答案數量顯示，當答案數量少於本次設定時，則先隱藏
        for totalAns in 0..<ansDatabase[ansIndex].answer.count{
            answerLable[totalAns].isHidden = false
            answerLable[totalAns].text = ansDatabase[ansIndex].answer[totalAns]
        }
    }
//    將答案結果先隱藏
    func resetAnswerLable(){
        for i in 0...4{
            answerLable[i].isHidden = true
        }
    }
    //    顯示所選的答案，並用顏色匡起來
    func showAnswer() {
//        var markAnsColor = answers[ansIndex]
        if answers[ansIndex] == String(answerLable[0].tag){
            answerLable[0].backgroundColor = UIColor(cgColor: CGColor(red: 248/255, green: 235/255, blue: 216/255, alpha: 1))
        }else{
            answerLable[0].backgroundColor = .clear
        }
        print(answerLable[0].tag, answers[ansIndex])
        
        if answers[ansIndex] == String(answerLable[1].tag){
            answerLable[1].backgroundColor = UIColor(cgColor: CGColor(red: 248/255, green: 235/255, blue: 216/255, alpha: 1))
        }else{
            answerLable[1].backgroundColor = .clear
        }
        print(answerLable[1].tag, answers[ansIndex])
        
        if answers[ansIndex] == String(answerLable[2].tag){
            answerLable[2].backgroundColor = UIColor(cgColor: CGColor(red: 248/255, green: 235/255, blue: 216/255, alpha: 1))
        }else{
            answerLable[2].backgroundColor = .clear
        }
        print(answerLable[2].tag, answers[ansIndex])
        
        if answers[ansIndex] == String(answerLable[3].tag){
            answerLable[3].backgroundColor = UIColor(cgColor: CGColor(red: 248/255, green: 235/255, blue: 216/255, alpha: 1))
        }else{
            answerLable[3].backgroundColor = .clear
        }
        print(answerLable[3].tag, answers[ansIndex])
        
        if answers[ansIndex] == String(answerLable[4].tag){
            answerLable[4].backgroundColor = UIColor(cgColor: CGColor(red: 248/255, green: 235/255, blue: 216/255, alpha: 1))
        }else{
            answerLable[4].backgroundColor = .clear
        }
        print(answerLable[4].tag, answers[ansIndex])
        
//        UIColor(cgColor: CGColor(red: 248/255, green: 235/255, blue: 216/255, alpha: 0.8))
    }
    //    當按上一頁觀看答案時，只顯示當頁的結果
    func clearShowAnswerColor() {
        for i in 0..<ansDatabase[ansIndex].answer.count{
            answerLable[i].backgroundColor = .clear
        }
    }
        
    func result() {
        resultAnswer()
        showAnswer()
//    顯示第一題答案時，不顯示上一題的按鈕
        if ansIndex == 0 {
            previousBtn.isHidden = true
//    當顯示玩總題數時，出現在玩一次的提示
        }else if ansIndex == 2 {
            restart = "再玩一次"
        }else{
            previousBtn.isHidden = false
        }
        
    }
        
    @IBAction func previous(_ sender: Any) {
        ansIndex -= 1
        clearShowAnswerColor()
        print("clean")
        result()
    }
    
    //    回到第一頁
    func restartTest() {
        navigationController?.popToRootViewController(animated: true)
    }
        
    @IBAction func next(_ sender: Any) {
        ansIndex += 1
        clearShowAnswerColor()
        result()
        if restart == "再玩一次"{
            let againAlert = UIAlertController(title: "心理測驗結束囉！", message: "是否要再玩一次呢？", preferredStyle: .alert)
            
            let leftAction = UIAlertAction(title: "OK", style: .default) {_ in self.restartTest()}
            
            let rightAction = UIAlertAction(title: "取消", style: .default)
            againAlert.addAction(leftAction)
            againAlert.addAction(rightAction)
            present(againAlert, animated: true)
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
        
    
}

