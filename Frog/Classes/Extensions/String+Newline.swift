//
//  String+Newline.swift
//  Frog
//
//  Created by Vyacheslav Khorkov on 12/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

extension String {
	
	var cutNewline: String {
		return !hasSuffix("\n") ? self : String(dropLast(1))
	}
	
    var addNewline: String {
		return self + "\n"
    }
}
