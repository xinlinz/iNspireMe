//
//  FirstViewController.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 3/25/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var moods = ["happy", "angry", "confused", "inspired", "sad"]
    var selectedMoodinCollectionView: String!
    
    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var firstViewCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstViewCollectionView.delegate = self
        firstViewCollectionView.dataSource = self
        topImage.image = UIImage(named: "bg")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("here")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? FirstViewCollectionViewCell {
            cell.moodName.text = self.moods[indexPath.item]
            return cell
        }
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? FirstViewCollectionViewCell {
//            print("4")
//            cell.moodName.text = moods[indexPath.item]
//            print("5")
//           return cell
//        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMoodinCollectionView = moods[indexPath.row]
        print("Selected \(String(describing: selectedMoodinCollectionView))")
        performSegue(withIdentifier: "firstToSecondView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let dest = segue.destination as? SecondViewController {
            dest.selectedMood = selectedMoodinCollectionView
        }
    }

    


}

