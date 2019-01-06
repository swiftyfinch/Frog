//
//  Frog.swift
//  Frog
//
//  Created by Vyacheslav Khorkov on 11/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

/// Tiny utility for (read from | write to) file line by line.
public class Frog {
	
	/// File open mode.
	///
	/// - r: Opens a file for reading. The file must exist.
	///
	/// - w: Creates an empty file for writing.
	///		 If a file with the same name already exists, its content is erased
	///		 and the file is considered as a new empty file.
	public enum Mode: String {
		case r = "r"
		case w = "w"
	}
	
	/// Pointer to file.
	private var file: UnsafeMutablePointer<FILE>
	
	/// Mode of file opening (**see** `Mode`).
	private let mode: Mode
	
	/// Initializes the tiny green file frog with path and mode.
	///
	/// - Parameters:
	///		- path: The path to file.
	///		- mode: Mode of file opening (**see** `Mode`).
	///
	/// - Returns: The tiny green file frog.
	public init(_ path: String, mode: Mode = .r) {
		let file = fopen(path, mode.rawValue)
		precondition(file != nil, "File can't be open.")
		self.file = file!
		self.mode = mode
	}
	
	/// Read line and move cursor to next line. **Mode must be equal .r**.
	public func readLine() -> String? {
		precondition(mode == .r, "Can't read in this mode.")
		guard let line = file.readLine() else { return nil }
		return line.cutNewline
	}
    
    /// Read all lines. **Mode must be equal .r**.
    public func readLines() -> [String] {
        precondition(mode == .r, "Can't read in this mode.")
        var lines: [String] = []
        while let line = readLine() {
            lines.append(line)
        }
        return lines
    }
	
	/// Write line at the end of file. **Mode must be equal .w**.
	///
	/// - Parameter line: The line for write.
	///
	/// - Returns: True, if the line was written successfully. Otherwise false.
	@discardableResult public func write(line: String) -> Bool {
		precondition(mode == .w, "Can't write in this mode.")
		return file.write(line: line.addNewline)
	}
	
    /// Close file stream.
    public func close() {
        fclose(file)
    }
    
	deinit {
		close()
	}
}
