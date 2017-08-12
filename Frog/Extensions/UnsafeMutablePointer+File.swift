//
//  UnsafeMutablePointer+File.swift
//  Frog
//
//  Created by Vyacheslav Khorkov on 12/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public extension UnsafeMutablePointer where Pointee == FILE {
	
	func readLine() -> String? {
		var line: UnsafeMutablePointer<CChar>?
		var linecap = 0
		defer { free(line) }
		if getline(&line, &linecap, self) > 0 {
			guard let line = line else { return nil }
			return String(cString: line)
		}
		return nil
	}
	
	func write(line: String) -> Bool {
		let size = 1
		let count = line.utf8.count
		return count == fwrite(line, size, count, self)
	}
	
}
