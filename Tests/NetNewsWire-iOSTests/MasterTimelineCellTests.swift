//
//  MasterTimelineCellTests.swift
//  NetNewsWire-iOSTests
//
//  Created by Duncan Babbage on 13/04/21.
//  Copyright © 2021 Ranchero Software. All rights reserved.
//

import Foundation
import XCTest
import Articles

@testable import NetNewsWire

class MasterTimelineCellTests: XCTestCase {
	var masterTimelineViewController: MasterTimelineViewController?
	let coordinator = MockSceneCoordinator()

    override func setUpWithError() throws {
		// Required to prompt Coordinator to instantiate its own essential
		// internal properties that are force unwrapped and automatically
		// accessed during app execution
		_ = coordinator.start(for: UIScreen.main.bounds.size)

		// A coordinator creates its own masterTimelineViewController but this is not accessible to our
		// test methods. For our current purposes, it is adequate to instantiate another one and inspect the
		// tableView properties of that instance. A masterTimelineViewController must be supplied a coordinator
		// after being created or it will crash.
		masterTimelineViewController = UIStoryboard.main.instantiateController(ofType: MasterTimelineViewController.self)
		masterTimelineViewController?.coordinator = coordinator
    }

	func testMasterTimelineUnreadCell_hasExpectedAccessibilityActionLabels() throws {
		// The coordinator must have content set as if it does not, swipeActionsConfigurtions accessed
		// in the tests will be nil as there will be no cells in the table.
		coordinator.setTestData(with: [testArticle(read: false)], animated: false)
		let (leadConfiguration, _) = try configurationActions(for: masterTimelineViewController)

		// Note that when VoiceOver voices 'Read' by itself it rhymes with 'need' not 'head'. Therefore,
		// 'Read' is not a suitable label for the 'Mark as Read' action, as a user will expect it to
		// instead open the article for reading.
		XCTAssertEqual(leadConfiguration?.actions[0].title, "Mark as Read")
	}
	
	func testMasterTimelineReadCell_hasExpectedAccessibilityActionLabels() throws {
		coordinator.setTestData(with: [testArticle(read: true)], animated: false)
		let (leadConfiguration, _) = try configurationActions(for: masterTimelineViewController)
		XCTAssertEqual(leadConfiguration?.actions[0].title, "Mark as Unread")
	}
	
	func testMasterTimelineUnstarredCell_hasExpectedAccessibilityActionLabels() throws {
		coordinator.setTestData(with: [testArticle(starred: false)], animated: false)
		let (_, trailingConfiguration) = try configurationActions(for: masterTimelineViewController)
		XCTAssertEqual(trailingConfiguration?.actions[0].title, "Star")
		XCTAssertEqual(trailingConfiguration?.actions[1].title, "More")
	}
	
	func testMasterTimelineStarredCell_hasExpectedAccessibilityActionLabels() throws {
		coordinator.setTestData(with: [testArticle(starred: true)], animated: false)
		let (_, trailingConfiguration) = try configurationActions(for: masterTimelineViewController)
		XCTAssertEqual(trailingConfiguration?.actions[0].title, "Unstar")
		XCTAssertEqual(trailingConfiguration?.actions[1].title, "More")
	}

	private func testArticle(titled title: String = "Test Article", read: Bool = false, starred: Bool = false) -> Article {
		let articleID = randomID()
		let articleStatus = ArticleStatus(articleID: articleID, read: read, starred: starred, dateArrived: Date())
		let testArticle = Article(accountID: randomID(), articleID: articleID, webFeedID: randomID(), uniqueID: randomID(), title: nil, contentHTML: nil, contentText: nil, url: nil, externalURL: nil, summary: nil, imageURL: nil, datePublished: nil, dateModified: nil, authors: nil, status: articleStatus)
		 return testArticle
	}
	
	private func randomID() -> String {
		return UUID().uuidString
	}

	private func configurationActions(for viewController: MasterTimelineViewController?) throws -> (leading: UISwipeActionsConfiguration?, trailing: UISwipeActionsConfiguration?) {
		// The swipe actions applied to table view cells are available to VoiceOver users via an "Actions Available"
		// prompt. The titles set on these swipe actions are what is read out to the user.
		let vc = try XCTUnwrap(viewController)
		let tableView = try XCTUnwrap(vc.tableView)
		let indexPath = IndexPath(item: 0, section: 0)
		let leadConfiguration = vc.tableView(tableView, leadingSwipeActionsConfigurationForRowAt: indexPath)
		let trailingConfiguration = vc.tableView(tableView, trailingSwipeActionsConfigurationForRowAt: indexPath)
		return (leadConfiguration, trailingConfiguration)
	}

}
