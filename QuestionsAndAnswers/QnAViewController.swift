//
//  QnAViewController.swift
//  QuestionsAndAnswers
//
//  Created by MyMac on 2017/3/7.
//  Copyright © 2017年 JackLai. All rights reserved.
//

import UIKit

class QnAViewController: UIViewController {
    
    struct QnA{
        
       var QnAImage:String
       var question:String
       var choose:[String]=[]
       var answer:Int
    
    }

    var number = [0,1,2,3,4,5,6,7,8]
    var score = 0
    var answer = 0
    var questionCount = 0
    var questions = [
        QnA(QnAImage:"三年四班的副班長是誰?.jpg",question:"三年四班的副班長是誰?",choose:["野口","美環","前田","丸尾"],answer:2),
        QnA(QnAImage:"小丸子住在哪裡?.jpg",question:"小丸子住在哪裡?",choose:["神戶","沖繩","京都","清水"],answer:4),
        QnA(QnAImage:"小綠暗戀的對象是誰?.jpg",question:"小綠暗戀的對象是誰?",choose:["大野","藤木","杉木","濱崎"],answer:2),
        QnA(QnAImage:"山根的問題是哪裡不好?.jpg",question:"山根的問題是哪裡不好?",choose:["肝臟","腸胃","眼睛","心臟"],answer:2),
        QnA(QnAImage:"永澤最怕什麼東西?.jpg",question:"永澤最怕什麼東西?",choose:["蟲","青椒","火","高的地方"],answer:3),
        QnA(QnAImage:"姐姐的偶像是誰?.jpg",question:"姐姐的偶像是誰?",choose:["西城秀樹","山口百惠","山本琳達","櫻淳子"],answer:1),
        QnA(QnAImage:"長山的妹妹叫什麼名字?.jpg",question:"長山的妹妹叫什麼名字?",choose:["小花","小春","小夏","小桃"],answer:2),
        QnA(QnAImage:"美環暗戀的對象是誰?.jpg",question:"美環暗戀的對象是誰?",choose:["丸尾","大野","關口","花輪"],answer:4),
        QnA(QnAImage:"哪一句話最能激怒丸尾?.jpg",question:"哪一句話最能激怒丸尾?",choose:["丸尾是小氣鬼","你長得一點都不帥","你是不是發胖了","下學期不要選丸尾當班長"],answer:4)]
    
    @IBOutlet var ChooseButtons: [UIButton]!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBAction func answerBtn(_ sender: UIButton) {
        let userChooser = sender.tag
        
        if(questionCount == 9)
        {
            
            let alertController = UIAlertController(title: "猜題結束", message: "分數\(score)", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(
                title: "繼續",
                style: .default,
                handler: {
                    action in self.Questions()
            }
            )
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            number = [0,1,2,3,4,5,6,7,8]
            score = 0
            questionCount = 0
        }
        else if (userChooser == answer)
        {
            score = score + 10
            let alertPASS = UIAlertController(title: "恭喜", message: "聽人誇獎原來那麼舒服啊！", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(
                title: "下一題",
                style: .default,
                handler: {
                    action in self.Questions()
            }
            )
            alertPASS.addAction(okAction)
            self.present(alertPASS, animated: true, completion: nil)
        }else
        {
            let alertFAIL = UIAlertController(title: "爺爺", message: "我和你一樣笨，也挺好的", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(
                title: "下一題",
                style: .default,
                handler: {
                    action in self.Questions()
            }
            )
            alertFAIL.addAction(okAction)
            self.present(alertFAIL, animated: true, completion: nil)
        }
        
        
    }

    
    func Questions()
        
    {
        questionCount = questionCount + 1
        
        let random = Int(arc4random_uniform(UInt32(number.count)))
        let index = number[random]

        
       for i in 0 ..< ChooseButtons.count{
        ChooseButtons[i].setTitle("\(questions[index].choose[i])", for: UIControlState.normal)
        }
        number.remove(at: random)
        questionLabel.text = String(questions[index].question)
        questionImage.image = UIImage(named: questions[index].QnAImage)
        answer = questions[index].answer

    }
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        Questions()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
