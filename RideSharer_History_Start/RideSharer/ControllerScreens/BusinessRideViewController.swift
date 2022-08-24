//
//  BusinessRideViewController.swift
//  RideSharer
//
//  Created by Gunin Wasan on 2022-08-19.
//


import UIKit


class BusinessRideViewController: UIViewController {



	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = .systemBackground

		let label = UILabel(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 100))
		label.text = "No rides yet"
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		label.adjustsFontSizeToFitWidth = true
		label.textAlignment = .center


		let noRidesText = UILabel(frame: CGRect(x: 10, y: 200, width: UIScreen.main.bounds.size.width-20, height: 100))
		noRidesText.text = "You don't have any completed Business Rides for us to show yet. \n \n Take your first ride today!"
		noRidesText.font = UIFont.systemFont(ofSize: 20, weight: .medium)
		noRidesText.numberOfLines = 5
//		noRidesText.adjustsFontSizeToFitWidth = true
		noRidesText.textAlignment = .center
		noRidesText.textColor = UIColor(hex: 0x8D8D94)

		view.addSubview(label)
		view.addSubview(noRidesText)
		configureNavBar()

	}

	private func configureNavBar() {

		var logoImage = UIImage(named: "LyftLogo")
		logoImage = logoImage?.withRenderingMode(.alwaysOriginal)
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: nil)
		navigationItem.title = "Business Ride History"

	}

}
