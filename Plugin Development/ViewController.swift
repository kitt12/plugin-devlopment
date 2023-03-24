//
//  ViewController.swift
//  Plugin Development
//
//  Created by Theara Kit on 9/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let pluginTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        view.addSubview(pluginTableView)
        
        pluginTableView.delegate = self
        pluginTableView.dataSource = self
        pluginTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pluginTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pluginTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pluginTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pluginTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        pluginTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pluginList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      cell.textLabel?.text = pluginList[indexPath.row].title
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pluginTableView.deselectRow(at: indexPath, animated: true)
        
        let view = pluginList[indexPath.row].screen
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)
    }

}

