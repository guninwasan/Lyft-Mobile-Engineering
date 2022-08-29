//
//  PersonalRideViewController.swift
//  RideSharer
//
//  Created by Gunin Wasan on 2022-08-19.
//

import UIKit

class PersonalRideViewController: UIViewController {

	private let personalRideTable: UITableView = {
		let table = UITableView(frame: .zero, style: .grouped)
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return table
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = .systemBackground
		view.addSubview(personalRideTable)
		personalRideTable.delegate = self
		personalRideTable.dataSource = self

		configureNavBar()

	}

	private func configureNavBar() {

		var logoImage = UIImage(named: "LyftLogo")
		logoImage = logoImage?.withRenderingMode(.alwaysOriginal)
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: nil)
		navigationItem.title = "Personal Ride History"

	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		personalRideTable.frame = view.bounds
	}

}

extension PersonalRideViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(
		_ tableView: UITableView,
		didSelectRowAt indexPath: IndexPath
	){

		let alertMessage = " \n Driver: " + extractDriverName(driverNameDate: rideHistory[indexPath[0]].0) + "\n \n Ride Date: " + extractDate(driverNameDate: rideHistory[indexPath[0]].0) + "\n \n Price: " + rideHistory[indexPath[0]].1


		let attributedText = NSMutableAttributedString(string: alertMessage, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold),
			NSAttributedString.Key.foregroundColor: UIColor(hex: 0xFF00BF)])
		let alert = UIAlertController(title: "Personal Ride Details", message: "", preferredStyle: .alert)

		alert.setValue(attributedText, forKey: "attributedMessage")

		let okAction = UIAlertAction(title: "OK", style: .cancel, handler: {_ in
			tableView.deselectRow(at: indexPath, animated: true)
			})
		alert.addAction(okAction)

		self.present(alert, animated: true, completion: nil)
//		tableView.deselectRow(at: indexPath, animated: true)
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return rideHistory.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}

	func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		return 40
	}


	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text =  extractDriverName(driverNameDate: rideHistory[indexPath[0]].0)

		cell.backgroundColor = .systemBackground
		return cell
	}

	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		guard let header = view as? UITableViewHeaderFooterView else {return}

		header.textLabel?.font = .systemFont(ofSize: 20, weight: .bold)
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return expandDate(rideDate: extractDate(driverNameDate: rideHistory[section].0))
	}


}



