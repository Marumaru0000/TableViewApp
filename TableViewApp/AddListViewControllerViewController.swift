//
//  AddListViewControllerViewController.swift
//  TableViewApp
//
//  Created by 丸山航輝 on 2023/08/27.
//

import UIKit

class AddListViewControllerViewController: UIViewController {
    @IBOutlet weak var addTextField: UITextField!
    var taskArray: [String] = [] //入力したリストを格納する配列

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //まずはUserDefaultsからすでに入力されているタスクをtaskArrayに読み込む
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
    }
    @IBAction func addTask(_ sender: UIButton) {
        // TextFieldのテキストをオプショナルバインディングを使用して取得
        if let text = addTextField.text, !text.isEmpty {
            let userDefaults = UserDefaults.standard
            taskArray.append(text)
            userDefaults.set(taskArray, forKey: "add")
            self.navigationController?.popViewController(animated: true)
        } else {
            // エラーメッセージを表示（オプション）
            let alert = UIAlertController(title: "エラー", message: "タスクを入力してください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
