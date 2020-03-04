//
//  RulesShared.swift
//  SwiftFormat
//
//  Created by Daniel Crampton on 2020-06-17.
//  Copyright © 2020 Nick Lockwood. All rights reserved.
//

import XCTest
@testable import SwiftFormat

final class RulesShared {

    static func testFormatting(for input: String, _ output: String? = nil, rule: FormatRule,
                               options: FormatOptions = .default, exclude: [String] = []) {
        testFormatting(for: input, output.map { [$0] } ?? [], rules: [rule],
                       options: options, exclude: exclude)
    }

    static func testFormatting(for input: String, _ outputs: [String] = [], rules: [FormatRule],
                               options: FormatOptions = .default, exclude: [String] = []) {
        precondition(input != outputs.first || input != outputs.last, "Redundant output parameter")
        precondition((0 ... 2).contains(outputs.count), "Only 0, 1 or 2 output parameters permitted")
        precondition(Set(exclude).intersection(rules.map { $0.name }).isEmpty, "Cannot exclude rule under test")
        let output = outputs.first ?? input, output2 = outputs.last ?? input
        let exclude = exclude + (rules.first?.name == "linebreakAtEndOfFile" ? [] : ["linebreakAtEndOfFile"])
        XCTAssertEqual(try format(input, rules: rules, options: options), output)
        XCTAssertEqual(try format(input, rules: FormatRules.all(except: exclude),
                                  options: options), output2)
        if input != output {
            XCTAssertEqual(try format(output, rules: rules, options: options), output)
        }
        if input != output2, output != output2 {
            XCTAssertEqual(try format(output2, rules: FormatRules.all(except: exclude),
                                      options: options), output2)
        }

        #if os(macOS)
        // These tests are flakey on Linux, and it's hard to debug
        XCTAssertEqual(try lint(output, rules: rules, options: options), [])
        XCTAssertEqual(try lint(output2, rules: FormatRules.all(except: exclude),
                                options: options), [])
        #endif
    }
}
