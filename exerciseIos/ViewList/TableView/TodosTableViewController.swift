//
//  TodosTableViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/04.
//

import UIKit
import UserNotifications

class TodosTableViewController: UITableViewController {
    
    private var todos: [Todo] = Todo.all
    
    private let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.short
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.todos = Todo.all
        self.tableView.reloadSections(IndexSet(integer: 0), with: UITableView.RowAnimation.automatic)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        guard indexPath.row < self.todos.count else { return cell }
        
        let todo: Todo = self.todos[indexPath.row]
        
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = self.dateFormatter.string(from: todo.due)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let todoViewController: TodoViewController = segue.destination as? TodoViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else { return }
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else { return }
        
        guard index.row < todos.count else { return }
        let todo: Todo = todos[index.row]
        todoViewController.todo = todo
    }
}

extension TodosTableViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let idToShow: String = response.notification.request.identifier
        
        guard let todoToShow: Todo = self.todos.filter({ (todo: Todo) -> Bool in
            return todo.id == idToShow
        }).first else {
            return
        }
        
        guard let todoViewController: TodoViewController = self.storyboard?.instantiateViewController(withIdentifier: TodoViewController.storyBoardID) as? TodoViewController else { return }
        
        todoViewController.todo = todoToShow
        
        self.navigationController?.pushViewController(todoViewController, animated: true)
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        completionHandler()
    }
}
