//
//  MapViewController.swift
//  RideSharer
//
//

import CoreLocation
import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

	let manager = CLLocationManager()

	let mapView : MKMapView = {
		return MKMapView()
	}()
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground

		setMapConstraints()
		checkLocationServices()
    }

	func checkLocationServices() {

	  if CLLocationManager.locationServicesEnabled() {
		checkLocationAuthorization()
//		  self.present(alert, animated: true, completion: nil)
	  } else {
		// Show alert letting the user know they have to turn this on.

	  }
	}
	func checkLocationAuthorization() {

		switch CLLocationManager.authorizationStatus() {
		  case .authorizedWhenInUse:
			mapView.showsUserLocation = true
			setMapConstraints()
		   case .denied:
		   	print("denied")
			newView()
			mapView.removeFromSuperview()

		  case .notDetermined:
			print("not determined")
			manager.requestWhenInUseAuthorization()
//			mapView.showsUserLocation = true
		  case .restricted: // Show an alert letting them know what’s up
			print("restricted")
		  case .authorizedAlways:
		   break
		@unknown default:
			break
		}
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		manager.desiredAccuracy = kCLLocationAccuracyBest
		manager.delegate = self
		manager.requestWhenInUseAuthorization()
		manager.startUpdatingLocation()


	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let location = locations.first {
			manager.stopUpdatingLocation()

			render(location)
		}
	}

	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		switch CLLocationManager.authorizationStatus() {
		  case .authorizedWhenInUse:
			mapView.showsUserLocation = true
			setMapConstraints()
		   case .denied:
			print("denied")
			newView()
			mapView.removeFromSuperview()

		  case .notDetermined:
			print("not determined")
			manager.requestWhenInUseAuthorization()
//			mapView.showsUserLocation = true
		  case .restricted: // Show an alert letting them know what’s up
			print("restricted")
		  case .authorizedAlways:
		   break
		@unknown default:
			break
		}
	}

	func render(_ location: CLLocation){

		let coordinates = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
		let spanDegree = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
		let region = MKCoordinateRegion(center: coordinates, span: spanDegree)

		mapView.setRegion(region, animated: true)
	}


	func setMapConstraints() {

		view.addSubview(mapView)
		mapView.translatesAutoresizingMaskIntoConstraints = false
		mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
		mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
		mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
		mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
		mapView.showsUserLocation = true
		mapView.showsBuildings = true
		mapView.showsTraffic = true



	}

	func newView() {
		let label = UILabel(frame: CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 100))
		label.text = "You need to give location access to utilize the app features."
		label.numberOfLines = 5
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//		label.adjustsFontSizeToFitWidth = true
		label.textAlignment = .center



//		manager.requestWhenInUseAuthorization()

		let myButton = UIButton(frame: CGRect(x: 25, y: 200, width: UIScreen.main.bounds.size.width-50, height: 100))
		myButton.configuration = .tinted()
		myButton.configuration?.title = "Please Click to allow location access."
		myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		view.addSubview(label)
		view.addSubview(myButton)
	}
	@objc func buttonTapped(){
		manager.requestWhenInUseAuthorization()
		UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)

		print("ok")

	}
    
}


