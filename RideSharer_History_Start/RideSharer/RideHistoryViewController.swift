//
//  RideHistoryViewController.swift
//  RideSharer
//
//

import UIKit

extension UIColor {

	convenience init(hex: Int) {
		let components = (
			r: CGFloat((hex >> 16) & 0xff) / 255,
			g: CGFloat((hex >> 08) & 0xff) / 255,
			b: CGFloat((hex >> 00) & 0xff) / 255
		)
		self.init(red: components.r, green: components.g, blue: components.b, alpha: 1)
	}

}

let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
				   ("Driver: Sandra, 01/03/2022", "$13.10"),
				   ("Driver: Hank, 01/11/2022", "$16.20"),
				   ("Driver: Michelle, 01/19/2022", "$8.50")]

//for distinguishing between business and personal we can just add another element in the tuple saying if it is Business or Personal Ride.

class RideHistoryViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground

		let vc1 = UINavigationController(rootViewController: AllRideViewController())
		let vc2 = UINavigationController(rootViewController: PersonalRideViewController())
		let vc3 = UINavigationController(rootViewController: BusinessRideViewController())

		vc1.title = "All Rides"
		vc2.title = "Personal"
		vc3.title = "Business"


		tabBar.tintColor = UIColor(hex: 0xFF00BF)

		setViewControllers([vc1,vc2,vc3], animated: true)

    }


}


