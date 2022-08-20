//
//  AllRideViewController.swift
//  RideSharer
//
//  Created by Gunin Wasan on 2022-08-19.
//

import UIKit

var sectionTitles = ["1", "2", "3", "4","5","6","7","8","9","10"]

class AllRideViewController: UIViewController {

	private let allRideHistoryTable: UITableView = {
		let table = UITableView(frame: .zero, style: .grouped)
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return table
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		view.backgroundColor = .systemBackground
		view.addSubview(allRideHistoryTable)
		allRideHistoryTable.delegate = self
		allRideHistoryTable.dataSource = self

		configureNavBar()

    }

	private func configureNavBar() {

		var logoImage = UIImage(named: "LyftLogo")
		logoImage = logoImage?.withRenderingMode(.alwaysOriginal)
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: nil)
		navigationItem.title = "Ride History"

	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		allRideHistoryTable.frame = view.bounds
	}

}

extension AllRideViewController: UITableViewDelegate, UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return 10
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}

	func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		return 40
	}


	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = "This is a new table row"
		cell.backgroundColor = .systemBackground
		return cell
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sectionTitles[section]
	}

}


