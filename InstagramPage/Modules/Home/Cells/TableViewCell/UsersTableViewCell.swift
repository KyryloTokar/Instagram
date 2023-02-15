//
//  UsersTableViewCell.swift
//  InstagramPage
//
//  Created by Kyrylo Tokar on 2023-02-14.
//

import UIKit

protocol UsersTableViewCellDelegate: AnyObject {
    func didTapUser(cell: UsersTableViewCell)
}

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var usersCollectionView: UICollectionView!
    
    weak var delegate: UsersTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell(reuseId: String(describing: UsersCollectionViewCell.self))
    }
    
    // MARK: - Preparations
    private func registerCell(reuseId: String) {
        usersCollectionView.register(UINib(nibName: reuseId, bundle: nil),
                                     forCellWithReuseIdentifier: reuseId)
        usersCollectionView.delegate = self
        usersCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate funcs
extension UsersTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        usersCollectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didTapUser(cell: self)
    }
}

extension UsersTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseId = String(describing: UsersCollectionViewCell.self)
        
        guard let cell = usersCollectionView.dequeueReusableCell(
            withReuseIdentifier: reuseId,
            for: indexPath) as? UsersCollectionViewCell else { fatalError() }
        
        cell.configure(with: imagesCollectionView[indexPath.row])
        
        return cell
    }
}
