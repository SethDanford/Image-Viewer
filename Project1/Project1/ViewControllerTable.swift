//
//  ViewControllerTable.swift
//  Project1
//
//  Created by AnoraxAlmanac on 24/10/20.
//

import UIKit

// We inherite from a UITableViewController because we are using a table UIView as apossed to a normal UIView.
class ViewControllerTable: UITableViewController {
    var pictures = [String]()
    
    // When the view loads do the following.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Strom Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // The following lines get the pictures from their path and put them in our pictures array.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            // If item starts with nssl then add it to the array.
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
        print(pictures)
    }
    // iOS calls this method automataically when deciding how many rows will be in the tableview.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PIcture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If the if let statement returns nil then the code inside will not be executed.
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // Sets the seleceted image variable as the picture that was selected in the table.
            vc.selectedImage = pictures[indexPath.row]
            vc.arraySize = pictures.count
            vc.placementInArray = pictures.firstIndex(of: pictures[indexPath.row])
            // Slides over to the Detail view (view showing image) and shows the selected image.
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

