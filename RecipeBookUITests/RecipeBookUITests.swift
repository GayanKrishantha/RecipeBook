// Created by Gayan Dias on 12/09/2022.

import XCTest

class RecipeBookUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
    }

    func test_recipeBookListView_listLoader_exist() throws {
        let listLoader = self.app.otherElements["listLoader"]
        XCTAssert(listLoader.exists)
    }
    
    func test_recipeBookListView_menu_exist() throws{
        let appNavigationBar = app.navigationBars["RecipeBook.RecipeBookListView"]
        let menuButton = appNavigationBar.buttons["menu"]
        XCTAssert(menuButton.exists)
    }

    // TO DO
    
}
