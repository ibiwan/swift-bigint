//
//  main.swift
//  bigint
//
//  Created by Jeremiah Kent on 6/15/14.
//  Copyright (c) 2014 Jeremiah Kent. All rights reserved.
//

import Foundation

let n1 = BigInt(fromString: "1o248679124")
let n2 = BigInt(fromString: "1298745192812412441246")
let n3 = BigInt(fromString: "99999999")
let n4 = BigInt(fromString: "1")
let n5 = BigInt(fromString: "-32769")
let n6 = BigInt(fromString: "1248679x124")
let n7 = BigInt(fromString: "32769")
let n8 = BigInt(fromString: "13000")
let n9 = BigInt(fromString: "4567")

let parseTests = [
    (n1, "1248679124"),
    (n2, "1298745192812412441246"),
    (n3, "99999999"),
    (n4, "1"),
    (n5, "-32769"),
    (n6, "1248679124"),
    (n7, "32769"),
    (n8, "13000"),
    (n9, "4567"),
]

for (bigint, str) in parseTests {
    assert("\(bigint)" == str, "error parsing from string")
}

let intTests:Array<(BigInt, Int?)> = [
    (n1, 1248679124),
    (n2, nil),
]

for (bigint, asint) in intTests {
//    println("\(bigint).intVal: \(bigint.intVal)")
    assert(bigint.intVal == asint, "error converting back to int")
}

let negationTests = [
    (n1, "-1248679124"),
    (n5, "32769"),
]

for (bigint, negated) in negationTests {
//    println("-(\(bigint)): \(-bigint)")
    assert("\(-bigint)" == negated, "error negating")
}

let equalityTests = [
    ( n1,  n6, true),
    ( n1,  n2, false),
    ( n5,  n7, false),
    (-n5,  n7, true),
    ( n5, -n7, true),
]

for (bigint1, bigint2, equals) in equalityTests {
//    println("\(bigint1) == \(bigint2): \(bigint1 == bigint2)")
    assert((bigint1 == bigint2) == equals, "error comparing for equality")
}

let greaterTests = [
    (n5, n7, false),
    (n7, n5, true),
]

for (bigint1, bigint2, greater) in greaterTests {
//    println("\(bigint1) > \(bigint2): \(bigint1 > bigint2)")
    assert((bigint1 > bigint2) == greater, "error comparing for greatness")
}

let addTests = [
    ( n1,  n2, "1298745192813661120370"),
    ( n3,  n4, "100000000"),
    ( n7,  n8, "45769"),
    (-n7,  n8, "-19769"),
    ( n7, -n8, "19769"),
    (-n7, -n8, "-45769"),
    ( n8,  n7, "45769"),
    (-n8,  n7, "19769"),
    ( n8, -n7, "-19769"),
    (-n8, -n7, "-45769"),
    ( n9,  n8, "17567"),
    (-n9,  n8, "8433"),
    ( n9, -n8, "-8433"),
    (-n9, -n8, "-17567"),
    ( n8,  n9, "17567"),
    (-n8,  n9, "-8433"),
    ( n8, -n9, "8433"),
    (-n8, -n9, "-17567"),
]

for (bigint1, bigint2, sum) in addTests {
//    println("\(bigint1) + \(bigint2): \(bigint1 + bigint2)")
    assert("\(bigint1 + bigint2)" == sum, "error adding")
}

let subTests = [
    ( n1,  n2, "-1298745192811163762122"),
    ( n3,  n4, "99999998"),
    ( n7,  n8, "19769"),
    (n7, n4, "32768"),
    (n4, n7, "-32768"),
    (n3, n7, "99967230"),
    (n7, n3, "-99967230"),
    (n5, n5, "0"),
    (n7, n7, "0"),
    (-n7,  n8, "-45769"),
    ( n7, -n8, "45769"),
    (-n7, -n8, "-19769"),
    ( n8,  n7, "-19769"),
    (-n8,  n7, "-45769"),
    ( n8, -n7, "45769"),
    (-n8, -n7, "19769"),
    ( n9,  n8, "-8433"),
    (-n9,  n8, "-17567"),
    ( n9, -n8, "17567"),
    (-n9, -n8, "8433"),
    ( n8,  n9, "8433"),
    (-n8,  n9, "-17567"),
    ( n8, -n9, "17567"),
    (-n8, -n9, "-8433"),
]

for (bigint1, bigint2, sum) in subTests {
//    println("\(bigint1) - \(bigint2): \(bigint1 - bigint2)")
    assert("\(bigint1 - bigint2)" == sum, "error subtracting")
}

let mulTests = [
    ( n3,  n7, "999772287231"),
    (-n3,  n7, "-999772287231"),
    ( n3, -n7, "-999772287231"),
    (-n3, -n7, "999772287231"),
]

for (bigint1, bigint2, sum) in mulTests {
//    println("\(bigint1) * \(bigint2): \(bigint1 * bigint2)")
    assert("\(bigint1 * bigint2)" == sum, "error multiplying")
}

println("no testing errors.")
