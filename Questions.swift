//
//  Questions.swift
//  psychoText
//
//  Created by shelley on 2022/12/7.
//

import Foundation

struct Question {
//     題目內容、選項
    var description: String
    var answer: [String]
}


struct QuestionDataBase {
    let question1 = Question(description: "如果你是貓，你想穿什麼顏色的襪子呢？", answer: ["紅", "藍", "黃", "綠", "紫"])
    let question2 = Question(description: "一隻貓爬到樹幹上，你覺得發生了什麼事呢?", answer: ["突然有蛇爬出來", "爬樹爬到一半，開始覺得害怕", "想要登高望遠", "正在磨爪子當中",""])
    let question3 = Question(description: "要餵貓吃飯時，一下子就有這麼多貓圍過來。如果你是這群貓裡的貓班長，你會對大家說什麼呢？", answer: ["好了好了，大家要好好排隊哦", "哎唷～快點啦～我們早就想要吃飯了", "反正一定會餵我不如悠哉地等他餵吧", "", ""])
    
    func getQuestion() -> [Question] {
        return[question1, question2, question3 ]
    }
}

//    題目內容、題目所代表的意義、答案
struct Answer {
    var description: String
    var question: String
    var answer: [String]
}

struct answerDatebase {
    let question1 = Answer(description: "如果你是貓，你想穿什麼顏色的襪子呢？", question: "你目前最想增加什麼能力？", answer: ["A. 精力, 生活千篇一律的流程，讓你逐漸失去動力。試著挑戰以往從未嘗試過的新事物。","B. 專注力, 一心多用讓你專注力無法集中。請先放棄『一次做好幾種事』的習慣吧。","C. 好奇心, 無論做任何事都讓你提不起勁。試著用不一樣的方法做每天都得做的事吧，讓自己產生新奇的感覺。","D. 療癒, 你的身心已經開始陷入疲態了。請安排一天的時間作為自己的完全修養日。","E. 直覺, 你被常識給束縛，難以產生獨特的創意的點子。建議想挑選些什麼時，不將他人眼光作為自己的標準。"])
    let question2 = Answer(description: "一隻貓爬到樹幹上，你覺得發生了什麼事呢?", question: "找出你的戀愛體質", answer: ["A. 重蹈覆轍型, 你無法在過去失敗經驗中記取教訓。即使每次感到後悔，還是會不停重蹈覆轍。", "B. 半途而廢型, 在戀愛中因猶豫心態容易緊急剎車，讓好不容易遇到的愛情變得半生不熟。若你堅定地走下去，會變得更有自信。", "C. 照本宣科型, 有豐富知識卻沒有實戰經驗，一旦發現戀愛許多變化時會感到疑惑。", "D. 尋求真愛型, 你的浪漫情懷傾向將戀愛理想化。若戀情不順遂，或許是對方疲於扮演你的理想情人了。", ""])
    let question3 = Answer(description: "要餵貓吃飯時，一下子就有這麼多貓圍過來。如果你是這群貓裡的貓班長，你會對大家說什麼呢？", question: "了解你在別人眼中的樣子", answer: ["A. 自我表現慾望強烈的人，會在無意間將『好了好了』掛在嘴上。周遭的人很可能認為你『看起來能幹，做什麼都面面俱到的人啊！", "B. 不易沉迷於現況，無意間將『哎唷』掛在嘴邊。周遭的人很可能認為你『行事上能打破常規的人』", "C. 會確實計較話語的人，無意中將『反正』掛在嘴上。周遭的人很可能認為你願意仔細聆聽，擅長聽取意見。", "", ""])
    
    func getAnswer() -> [Answer]{
        return[question1, question2, question3]
    }
}
