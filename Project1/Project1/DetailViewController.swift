//
//  DetailViewController.swift
//  Project1
//
//  Created by AnoraxAlmanac on 25/10/20.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var arraySize: Int?
    var placementInArray: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the title of this screen to the name of the image.
        placementInArray! += 1
        title = String(format: "Picture %d of %d", placementInArray!, arraySize!)
        // No matter what, this screen should never use large titles.
        navigationItem.largeTitleDisplayMode = .never

        // If this if statement returns nill then the code inside will never be executed.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // When you tap on the screen (image) the navigation controller will disappear.
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // When you tap again the navigation controller will appear.
        navigationController?.hidesBarsOnTap = false
    }
}
