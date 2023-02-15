//
//  ViewController.swift
//  InstagramPage
//
//  Created by Kyrylo Tokar on 2023-02-12.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tabBar: UITabBar!
    @IBOutlet private weak var instaButton: UIButton!
    
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var likeButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell(reuseId: String(describing: UsersTableViewCell.self))
        registerCell(reuseId: String(describing: InstaTableViewCell.self))
        tabBar.selectedItem = self.tabBar.items![0]        
        setupPopUpButton()
    }
    
    // MARK: - Preparations
    private func registerCell(reuseId: String) {
        tableView.register(UINib(nibName: reuseId, bundle: nil),
                           forCellReuseIdentifier: reuseId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupPopUpButton() {
        let popUpButtonClosure1 = { (action: UIAction) in
            print("Following")
        }
        let popUpButtonClosure2 = { (action: UIAction) in
            print("Favorites")
        }
        
        instaButton.menu = UIMenu(title: "", children: [
            UIAction(title: "Following",
                     image: UIImage(systemName: "person.2"),
                     handler: popUpButtonClosure1),
            UIAction(title: "Favorites",
                     image: UIImage(systemName: "star"),
                     handler: popUpButtonClosure2)
        ])
        instaButton.showsMenuAsPrimaryAction = true
    }
    
    // MARK: - Private funcs
    @IBAction private func sharePressButton(_ sender: UIButton) {
        sender.changeColor(sender, systemName: "paperplane", color: .systemBlue)
    }
    
    @IBAction private func likePressButton(_ sender: UIButton) {
        sender.changeColor(sender, systemName: "heart", color: .systemRed)
    }
    
    @IBAction private func addPressButton(_ sender: UIButton) {
        sender.changeColor(sender, systemName: "plus.app", color: .systemGreen)
    }
}

// MARK: - UITableViewDelegate funcs
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextVC = NextViewController.loadFromStoryboard(type: NextViewController.self)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 1 {
            let reuseId = String(describing: UsersTableViewCell.self)
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: reuseId,
                for: indexPath) as? UsersTableViewCell else { fatalError() }
            
            cell.delegate = self
            
            return cell
        }
        
        let reuseId = String(describing: InstaTableViewCell.self)
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseId,
            for: indexPath) as? InstaTableViewCell else { fatalError() }
        
        cell.configure(with: imagesTableView[indexPath.row])
        
        return cell
    }
}

// MARK: - UsersTableViewCellDelegate funcs
extension HomeViewController: UsersTableViewCellDelegate {
    func didTapUser(cell: UsersTableViewCell) {
        let nextVC = NextViewController.loadFromStoryboard(type: NextViewController.self)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
