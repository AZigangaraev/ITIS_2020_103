//
//  ViewController.swift
//  cross-zero
//
//  Created by Рустем on 22.09.2020.
//  Copyright © 2020 Rustem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var field: [Bool?] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  var start = true
  var crossZero: Bool?

  override func viewDidLoad() {
    super.viewDidLoad()

    game()

    self.dismiss(animated: true, completion: nil)

  }

  func game() {
    if crossZero! {
      roundBot()
    }
  }

  func roundBot() {
    if field[0] == nil {
      field[0] == false
      if (testFieldWin()) {
        forButtonBot(name: button1)
      }
    }


  }

  func testFieldWin() -> Bool {
    if (field[0] == field[1]) && (field[1] == field[2]) && (field.b1 != nil) {
      return field.b1!
    }
    if (field.b4 == field.b5) && (field.b5 == field.b6) && (field.b4 != nil) {
      return field.b4!
    }
    if (field.b7 == field.b8) && (field.b8 == field.b9) && (field.b7 != nil) {
      return field.b7!
    }
    if (field.b1 == field.b4) && (field.b4 == field.b7) && (field.b1 != nil) {
      return field.b1!
    }
    if (field.b2 == field.b5) && (field.b5 == field.b8) && (field.b2 != nil) {
      return field.b1!
    }
    if (field.b3 == field.b6) && (field.b6 == field.b9) && (field.b3 != nil) {
      return field.b1!
    }
    if (field.b1 == field.b5) && (field.b5 == field.b9) && (field.b1 != nil) {
      return field.b1!
    }
    if (field.b3 == field.b5) && (field.b5 == field.b7) && (field.b3 != nil) {
      return field.b1!
    }
    return true
  }

  @IBAction func Cross(_ sender: Any) {
    crossZero = true
    print("cross")
  }

  @IBAction func Zero(_ sender: Any) {
    crossZero = false
  }

  func forButtonPlayer(name: UIButton) {
    if crossZero! {
      name.setImage(UIImage(named: "x"), for: .normal)
    } else {
      name.setImage(UIImage(named: "o"), for: .normal)
    }
  }

  func forButtonBot(name: UIButton) {
    if !(crossZero!) {
      name.setImage(UIImage(named: "x"), for: .normal)
    } else {
      name.setImage(UIImage(named: "o"), for: .normal)
    }
  }

  @IBOutlet weak var button1: UIButton!
  @IBOutlet weak var button2: UIButton!
  @IBOutlet weak var button3: UIButton!
  @IBOutlet weak var button4: UIButton!
  @IBOutlet weak var button5: UIButton!
  @IBOutlet weak var button6: UIButton!
  @IBOutlet weak var button7: UIButton!
  @IBOutlet weak var button8: UIButton!
  @IBOutlet weak var button9: UIButton!

  @IBAction func Button1(_ sender: Any) {
    if field.b1 == nil { field.b1 = true }
    forButtonPlayer(name: button1)
  }
  @IBAction func Button2(_ sender: Any) {
    if field.b2 == nil { field.b2 = true }
    forButtonPlayer(name: button2)
  }
  @IBAction func Button3(_ sender: Any) {
    if field.b3 == nil { field.b3 = true }
    forButtonPlayer(name: button3)
  }
  @IBAction func Button4(_ sender: Any) {
    if field.b4 == nil { field.b4 = true }
    forButtonPlayer(name: button4)
  }
  @IBAction func Button5(_ sender: Any) {
    if field.b5 == nil { field.b5 = true }
    forButtonPlayer(name: button5)
  }
  @IBAction func Button6(_ sender: Any) {
    if field.b6 == nil { field.b6 = true }
    forButtonPlayer(name: button6)
  }
  @IBAction func Button7(_ sender: Any) {
    if field.b7 == nil { field.b7 = true }
    forButtonPlayer(name: button7)
  }
  @IBAction func Button8(_ sender: Any) {
    if field.b8 == nil { field.b8 = true }
    forButtonPlayer(name: button8)
  }
  @IBAction func Button9(_ sender: Any) {
    if field.b9 == nil { field.b9 = true }
    forButtonPlayer(name: button9)
  }
}
