//
//  String+Newline.swift
//  Frog
//
//  Created by Vyacheslav Khorkov on 12/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public extension String {
	
	public var cutNewline: String {
		return !hasSuffix("\n") ? self : String(characters.dropLast(1))
	}
	
	public var addNewline: String {
		return self + "\n"
	}
	
}
