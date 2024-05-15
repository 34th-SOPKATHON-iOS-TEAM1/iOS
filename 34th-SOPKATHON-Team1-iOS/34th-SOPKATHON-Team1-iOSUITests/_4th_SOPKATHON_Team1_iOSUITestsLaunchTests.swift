//
//  _4th_SOPKATHON_Team1_iOSUITestsLaunchTests.swift
//  34th-SOPKATHON-Team1-iOSUITests
//
//  Created by 박신영 on 5/16/24.
//

import XCTest

final class _4th_SOPKATHON_Team1_iOSUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
