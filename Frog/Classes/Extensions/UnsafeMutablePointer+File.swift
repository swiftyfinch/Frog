//
//  UnsafeMutablePointer+File.swift
//  Frog
//
//  Created by Vyacheslav Khorkov on 12/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

extension UnsafeMutablePointer where Pointee == FILE {
	
	func readLine() -> String? {
		var line: UnsafeMutablePointer<CChar>? // Line pointer.
		var linecap = 0 // Line capacity.
		defer { free(line) } // Need to free the line anyway.
		if getline(&line, &linecap, self) > 0 {
			guard let line = line else { return nil }
			return String(cString: line)
		}
		return nil
	}
	
	func write(line: String) -> Bool {
		let size = 1 // Size in bytes of each element to be written.
		let count = line.utf8.count // Number of elements, each one with a size of size bytes.
		return count == fwrite(line, size, count, self)
	}
}
