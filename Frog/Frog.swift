//
//  Frog.swift
//  Frog
//
//  Created by Vyacheslav Khorkov on 11/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public class Frog {
	
	public enum Mode: String {
		case r = "r"
		case w = "w"
	}
	
	private var file: UnsafeMutablePointer<FILE>
	private let mode: Mode
	
	public init?(_ path: String, mode: Mode = .r) {
		let file = fopen(path, mode.rawValue)
		precondition(file != nil, "🤷🏼‍♂️ File can't be open.")
		
		self.file = file!
		self.mode = mode
	}
	
	public func readLine() -> String? {
		precondition(mode == .r, "🤷🏼‍♂️ Can't read in this mode.")
		guard let line = file.readLine() else { return nil }
		return line.cutNewline
	}
	
	@discardableResult public func write(line: String) -> Bool {
		precondition(mode == .w, "🤷🏼‍♂️ Can't write in this mode.")
		return file.write(line: line.addNewline)
	}
	
	deinit {
		fclose(file)
	}
	
}
