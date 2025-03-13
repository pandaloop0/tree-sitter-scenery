import XCTest
import SwiftTreeSitter
import TreeSitterScenery

final class TreeSitterSceneryTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_scenery())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Scenery grammar")
    }
}
