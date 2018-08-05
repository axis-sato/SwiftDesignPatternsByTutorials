//
//  AppSettingsViewController.swift
//  RabbleWabble
//
//  Created by Masahiko Sato on 2018/08/05.
//  Copyright © 2018年 sato. All rights reserved.
//

import UIKit

public class AppSettingsViewController: UITableViewController {
    // MARK: - Properties
    public let appSettings = AppSettings.shared
    private let cellIdentifier = "basicCell"
    
    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension AppSettingsViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionStrategyType.allCaces.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let questionStrategyType = QuestionStrategyType.allCaces[indexPath.row]
        
        cell.textLabel?.text = questionStrategyType.title()
        
        if appSettings.questionStrategyType == questionStrategyType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

// MARK: - UITableViewDataSource
extension AppSettingsViewController {
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType = QuestionStrategyType.allCaces[indexPath.row]
        appSettings.questionStrategyType = questionStrategyType
        tableView.reloadData()
    }
}
