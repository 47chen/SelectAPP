//
//  ViewController.swift
//  hw2
//
//  Created by User21 on 2018/12/1.
//  Copyright © 2018 User21. All rights reserved.
//

import UIKit
struct questionstruct{
    var question:String
    var choose:[String]
    var answer:String
}

class ViewController: UIViewController {
    @IBOutlet var selecteButton: [UIButton]!
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var QuestionNumber: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    
    //如果要更改Outlet記得要重新拉 才不會發生THREAD1: SIGNAL SIGABRT ERROR!
    //改名稱可以使用rename不要自行刪除


var questionArray:[questionstruct]=[]
var count=0
var score=0
var click=0
func set_questionArray(){
    questionArray.append(questionstruct(question:"請問貓咪血型有三種，下列哪一種不是貓的血型", choose:["Ｏ","Ａ","ＡＢ","Ｂ"], answer: "Ｏ"))
    questionArray.append(questionstruct(question:"請問貓咪因為基因缺陷，而無法感知下列哪一種味覺呢？", choose:["苦","酸","鹹","甜"], answer:"甜"))
    questionArray.append(questionstruct(question:"請問混種貓在台灣稱為什麼？", choose:["基因貓","米克斯","波斯貓","喜馬拉雅貓"], answer: "米克斯"))
    questionArray.append(questionstruct(question:"請問貓咪的平均壽命大約是多長呢？", choose:["２０","１２","３０","５"], answer: "１２"))
    questionArray.append(questionstruct(question:"請問貓咪在古埃及文化象徵什麼？", choose:["惡靈","神","妖精","小可愛"], answer: "神"))
    questionArray.append(questionstruct(question:"在西方國家，英文稱雄貓為Tom，雌貓為queen，請問幼貓則被稱作為？", choose:["hello kitty","panda","kitten","cat"], answer: "kitten"))
    questionArray.append(questionstruct(question:"摸貓咪的哪裡，他會很開心？", choose:["肚子","肉球","鼻子","屁屁"], answer: "屁屁"))
    questionArray.append(questionstruct(question:"47有養一隻貓，請問那隻貓的名字叫做什麼？", choose:["學妹","鮪魚罐頭","阿肥","球球"], answer: "球球"))
    questionArray.append(questionstruct(question:"尾巴有缺陷的貓稱通常稱作什麼？", choose:["短尾貓","無尾貓","小可愛","麒麟尾"], answer: "麒麟尾"))
    questionArray.append(questionstruct(question:"歷史上最長壽的貓來自美國德州，牠總共活了幾歲呢？", choose:["４４","３８","２８","４８"], answer: "３８"))
    questionArray.append(questionstruct(question:"古代的中國人認為，哪種顏色的貓可以用來避邪呢？", choose:["棕色","灰色","白色","黑色"], answer: "黑色"))
    questionArray.append(questionstruct(question:"請問下列何種不是貓咪卡通?", choose:["鞋貓劍客","加菲貓","湯姆與傑利","膽小狗英雄"], answer: "膽小狗英雄"))
    questionArray.append(questionstruct(question:"彼得潘和貓咪誰才是你的救世主?", choose:["貓咪","彼得潘唯一選擇","都是我的救世主","彼得潘和彼得潘的貓"], answer: "彼得潘唯一選擇"))
    questionArray.append(questionstruct(question:"貓咪呼嚕呼嚕的時候代表什麼？", choose:["人類你死定了","奴才快點餵我吃飯喔","想上廁所","本貓很爽很蘇胡"], answer: "本貓很爽很蘇胡"))
}

    
    func set(){
        QuestionNumber.text="貓奴交戰手冊第"+String(count+1)+"題"
        
        Question.text=questionArray[count].question
        questionArray[count].choose.shuffle()
        selecteButton[0].setTitle(questionArray[count].choose[0], for:UIControl.State.normal)
        selecteButton[1].setTitle(questionArray[count].choose[1], for:UIControl.State.normal)
        selecteButton[2].setTitle(questionArray[count].choose[2], for:UIControl.State.normal)
        selecteButton[3].setTitle(questionArray[count].choose[3], for:UIControl.State.normal)
        Score.text="分數："+String(score)
        
        //把題目塞入label和button
        
        
    }
    @IBAction func previous(_ sender: UIButton) {
        if(count>0){
            count=count-1
            set()
            
        }
    }
    //count==0是第一題 按previous可以回到上一題的選項
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        nextBtn.setTitle("下一題", for:UIControl.State.normal)
        QuestionNumber.isHidden=false
        next()
    }
    
    func next(){
        if click==1{
            count=count-1
            click=0
        }
        if count == 9{
            alarm()
        }
        
        else{
            count=count+1
            Question.isHidden = false
            Question.text = questionArray[count].question
            set()
            selecteButton[0].isHidden = false
            selecteButton[1].isHidden = false
            selecteButton[2].isHidden = false
            selecteButton[3].isHidden = false
        }
    }
    @IBAction func selectedButton1(_ sender: UIButton) {
        
        if  questionArray[count].choose[0]==questionArray[count].answer {
            score += 10
            
            selecteButton[1].isHidden = true
            selecteButton[2].isHidden = true
            selecteButton[3].isHidden = true
        }
        else{
            score -= 10
        }
        if count == 9{
            alarm()
        }
    }
    @IBAction func selectedButton2(_ sender: UIButton) {
        
        
        if  questionArray[count].choose[1]==questionArray[count].answer {
            score += 10
            selecteButton[0].isHidden = true
            selecteButton[3].isHidden = true
            selecteButton[2].isHidden = true
        }
        else{
            score -= 10
        }
        if count == 9{
            alarm()
        }
    }
    @IBAction func selectedButton3(_ sender: UIButton) {
        
        
        if  questionArray[count].choose[2]==questionArray[count].answer {
            score += 10
            selecteButton[1].isHidden = true
            selecteButton[0].isHidden = true
            selecteButton[3].isHidden = true
        }
        else{
            score -= 10
        }
        if count == 9{
            alarm()
        }
        
    }
    @IBAction func selectedButton4(_ sender: UIButton) {
        
        
        if  questionArray[count].choose[3]==questionArray[count].answer {
            score += 10
            selecteButton[1].isHidden = true
            selecteButton[2].isHidden = true
            selecteButton[0].isHidden = true
        }
        else{
            score -= 10
        }
        if count == 9{
            alarm()
        }
    }
    func restart(){
        
        Question.isHidden = true
        QuestionNumber.isHidden = true
        selecteButton[0].isHidden = true
        selecteButton[1].isHidden = true
        selecteButton[2].isHidden = true
        selecteButton[3].isHidden = true
        Score.text = "分數：才剛告訴你！奴才的記憶只有3秒？"
        count=0 /* 記得要初始化！！！ */
        score=0
        nextBtn.setTitle("重新開始", for:UIControl.State.normal)
        }
    func alarm () {
        var S = ""
        if  score <= 60{
            S = "看來你還不夠格當貓奴喔！"
        }
        else if score == 100 {
            S = "恭喜你成為忠誠的貓奴！"
        }
        else if score <= 90 && score > 60 {
            S = "朝最猛貓奴邁進中！"
        }
        let alert =  UIAlertController(title: S, message: "\(score)分", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "重新開始", style: .default, handler:{ UIAlertAction in  self.restart()})
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        click=1
        questionArray.shuffle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set_questionArray()
        questionArray.shuffle() // 把問題打亂
        set()
        
        selecteButton[0].layer.shadowOpacity = 0.5
        selecteButton[0].layer.cornerRadius = 10
        selecteButton[0].clipsToBounds = true
        selecteButton[0].layer.cornerRadius = 10
        
        selecteButton[1].layer.shadowOpacity = 0.5
        selecteButton[1].layer.cornerRadius = 10
        selecteButton[1].clipsToBounds = true
        selecteButton[1].layer.cornerRadius = 10
        
        selecteButton[2].layer.shadowOpacity = 0.5
        selecteButton[2].layer.cornerRadius = 10
        selecteButton[2].clipsToBounds = true
        selecteButton[2].layer.cornerRadius = 10
        
        selecteButton[3].layer.shadowOpacity = 0.5
        selecteButton[3].layer.cornerRadius = 10
        selecteButton[3].clipsToBounds = true
        selecteButton[3].layer.cornerRadius = 10
        
        
        nextBtn.layer.shadowOpacity = 0.5
        nextBtn.layer.cornerRadius = 90
        nextBtn.clipsToBounds = true
        nextBtn.layer.cornerRadius = 90
        
        previousBtn.layer.shadowOpacity = 0.5
        previousBtn.layer.cornerRadius = 90
        previousBtn.clipsToBounds = true
        previousBtn.layer.cornerRadius = 90
        
    }
    
}


