//
//  TodoViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/04.
//

import UIKit

class TodoViewController: UIViewController {
    
    private enum Mode{
        case edit, view
    }
    
    static let storyBoardID: String = "TodoViewController"
    
    var todo: Todo?
    
    private var mode: Mode = Mode.edit {
        didSet {
            self.titleField.isUserInteractionEnabled = (mode == .edit)
            self.memoTextView.isUserInteractionEnabled = (mode == .edit)
            self.dueDatePicker.isUserInteractionEnabled = (mode == .edit)
            self.alramButton.isEnabled = (mode == .edit)
            
            if mode == Mode.edit {
                if todo == nil {
                    self.navigationItem.leftBarButtonItems = [self.cancelButton]
                } else {
                    self.navigationItem.rightBarButtonItems = [self.doneButton, self.cancelButton]
                }
            } else {
                self.navigationItem.rightBarButtonItems = [self.editButton]
            }
        }
    }
    private var editButton: UIBarButtonItem {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: self, action: #selector(touchUpEditButton(_:)))
        return button
    }
    private var cancelButton: UIBarButtonItem {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(touchUpCancelButton(_:)))
        return button
    }
    private var doneButton: UIBarButtonItem {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(touchUpDoneButton(_:)))
        return button
    }
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var alramButton: UISwitch!
    
    private func initializeViews() {
        if let todo: Todo = self.todo {
            self.navigationItem.title = todo.title
            self.titleField.text = todo.title
            self.memoTextView.text = todo.memo
            self.dueDatePicker.date = todo.due
            self.mode = Mode.view
        }
    }
    
    private func showSimpleAlert(message: String, cancelTitle: String = "확인", cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        let action: UIAlertAction = UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: cancelHandler)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @objc private func touchUpEditButton(_ sender: UIBarButtonItem) {
        self.mode = Mode.edit
    }
    
    @objc private func touchUpCancelButton(_ sender: UIBarButtonItem) {
        if self.todo == nil {
            self.navigationController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            self.initializeViews()
        }
    }
    
    @objc private func touchUpDoneButton(_ sender: UIBarButtonItem) {
        guard let title: String = self.titleField.text, title.isEmpty == false else {
            self.showSimpleAlert(message: "제목을 입력해주세요", cancelHandler: { (action: UIAlertAction) in self.titleField.becomeFirstResponder() })
            return
        }
        let todo: Todo
        todo = Todo(title: title, due: self.dueDatePicker.date, memo: self.memoTextView.text, shouldNotify: self.alramButton.isOn, id: self.todo?.id ?? String(Date().timeIntervalSince1970))
        
        let isSuccess: Bool
        
        if self.todo == nil {
            isSuccess = todo.save {
                self.navigationController?.presentingViewController?.dismiss(animated: true, completion: nil)
            }
        } else {
            isSuccess = todo.save(completion: {
                self.todo = todo
                self.mode = Mode.view
            })
        }
        if isSuccess == false {
            self.showSimpleAlert(message: "저장 실패")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleField.delegate = self
        
        if self.todo == nil {
            self.navigationItem.leftBarButtonItem = self.cancelButton
            self.navigationItem.rightBarButtonItem = self.doneButton
        } else {
            self.navigationItem.rightBarButtonItem = self.editButton
        }
        
        self.initializeViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.mode == Mode.edit {
            self.titleField.becomeFirstResponder()
        }
    }
}

extension TodoViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.navigationItem.title = textField.text
    }
}
