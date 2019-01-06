//
//  FrogTests.swift
//  FrogTests
//
//  Created by Vyacheslav Khorkov on 11/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import XCTest
@testable import Frog

class FrogTests: XCTestCase {
	
	private func pathInBundle(resource: String, type: String) -> String? {
		let bundle = Bundle(for: FrogTests.self)
		return bundle.path(forResource: resource, ofType: type)
	}
	
	private func pathInDocuments(name: String) -> String {
		let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
		return documents.appending("/" + name)
	}
	
	func testRead() {
		guard let path = pathInBundle(resource: "Numb", type: "txt") else {
			XCTFail("File not found.")
			return
		}
		
		let frog = Frog(path, mode: .r)
		XCTAssertEqual(frog.readLine(), "I'm tired of being what you want me to be")
		XCTAssertEqual(frog.readLine(), "Feeling so faithless, lost under the surface")
		XCTAssertEqual(frog.readLine(), "Don't know what you're expecting of me")
		XCTAssertEqual(frog.readLine(), "Put under the pressure of walking in your shoes")
		XCTAssertEqual(frog.readLine(), "Every step that I take is another mistake to you")
		
		XCTAssertEqual(frog.readLine(), "")
		
		XCTAssertEqual(frog.readLine(), "I've become so numb, I can't feel you there")
		XCTAssertEqual(frog.readLine(), "Become so tired, so much more aware")
		XCTAssertEqual(frog.readLine(), "I'm becoming this, all I want to do")
		XCTAssertEqual(frog.readLine(), "Is be more like me and be less like you")
		
		XCTAssertNil(frog.readLine())
	}
	
	func testWrite() {
		guard let inputPath = pathInBundle(resource: "Numb", type: "txt") else {
			XCTFail("File not found.")
			return
		}
		
		let outputPath = pathInDocuments(name: "Numb.txt")
		
		let input = Frog(inputPath, mode: .r)
		let output = Frog(outputPath, mode: .w)
		
		let croakLine = "(Croak-croak)"
		var line = input.readLine()
		var count = 1
		while line != nil {
			output.write(line: line!)
			if count % 2 == 0 {
				output.write(line: croakLine)
			}
			
			line = input.readLine()
			count += 1
		}
        output.close()
		
		let checkInput = Frog(outputPath, mode: .r)
		XCTAssertEqual(checkInput.readLine(), "I'm tired of being what you want me to be")
		XCTAssertEqual(checkInput.readLine(), "Feeling so faithless, lost under the surface")
		XCTAssertEqual(checkInput.readLine(), croakLine)
		XCTAssertEqual(checkInput.readLine(), "Don't know what you're expecting of me")
		XCTAssertEqual(checkInput.readLine(), "Put under the pressure of walking in your shoes")
		XCTAssertEqual(checkInput.readLine(), croakLine)
		XCTAssertEqual(checkInput.readLine(), "Every step that I take is another mistake to you")
		
		XCTAssertEqual(checkInput.readLine(), "")
		
		XCTAssertEqual(checkInput.readLine(), croakLine)
		XCTAssertEqual(checkInput.readLine(), "I've become so numb, I can't feel you there")
		XCTAssertEqual(checkInput.readLine(), "Become so tired, so much more aware")
		XCTAssertEqual(checkInput.readLine(), croakLine)
		XCTAssertEqual(checkInput.readLine(), "I'm becoming this, all I want to do")
		XCTAssertEqual(checkInput.readLine(), "Is be more like me and be less like you")
		XCTAssertEqual(checkInput.readLine(), croakLine)
		
		XCTAssertNil(checkInput.readLine())
	}
	
}
