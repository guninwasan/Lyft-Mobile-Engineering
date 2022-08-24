//
//  GlobalFunctions.swift
//  RideSharer
//
//  Created by Gunin Wasan on 2022-08-20.
//

import Foundation


func extractDate(driverNameDate: String) -> String {
	let beforeIndex = driverNameDate.firstIndex(of: ",") ?? driverNameDate.endIndex
	let afterIndex = driverNameDate.index(beforeIndex, offsetBy: 2)
	let date = driverNameDate.suffix(from: afterIndex)
	return "" + date
}


func extractDriverName(driverNameDate: String) -> String {
	var beforeIndex = driverNameDate.firstIndex(of: ",") ?? driverNameDate.endIndex
	beforeIndex = driverNameDate.index(beforeIndex, offsetBy: -1)
	let beginning = driverNameDate[...beforeIndex]
	let newIndex = beginning.firstIndex(of: ":") ?? beginning.endIndex
	let afterIndex = beginning.index(newIndex, offsetBy: 2)
	let driverName = beginning.suffix(from: afterIndex)
	return "" + driverName
}

func expandDate(rideDate: String) -> String {
	let beforeIndex = rideDate.firstIndex(of: "/") ?? rideDate.endIndex
	let afterIndex = rideDate.index(beforeIndex, offsetBy: 1)
	let dateYear = rideDate.suffix(from: afterIndex)

	let beforeDateIndex = dateYear.firstIndex(of: "/") ?? dateYear.endIndex
	let afterDateIndex = dateYear.index(beforeDateIndex, offsetBy: 1)

	let getDate = String(dateYear.prefix(2))
	let getYear = String(rideDate.suffix(from: afterDateIndex))

	let getMonth  = extractMonth(checkMonth: String(rideDate[...beforeIndex]))

	return getMonth + " " + getDate + ", " + getYear
}

func extractMonth(checkMonth: String) -> String {
	var monthName = ""
	switch checkMonth{
		case "01/":
			monthName = "Jan"
		case "02/":
			monthName = "Feb"
		case "03/":
			monthName = "Mar"
		case "04/":
			monthName = "Apr"
		case "05/":
			monthName = "May"
		case "06/":
			monthName = "Jun"
		case "07/":
			monthName = "Jul"
		case "08/":
			monthName = "Aug"
		case "09/":
			monthName = "Sep"
		case "10/":
			monthName = "Oct"
		case "11/":
			monthName = "Nov"
		case "12/":
			monthName = "Dec"

		default:
			monthName = "Jan"
	}
	return String(monthName)
}

