import UIKit

class ViewController: UIViewController {

  var field: [Bool?] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  var crossZero: Bool!

  @IBOutlet weak var restart: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    newGameBut()
  }

  func newGameBut() {
    zeroBut.isHidden = true
    crossBut.isHidden = true
    label.text = ""
    restart.isHidden = true
    start.isHidden = false
  }

  //    рестарт игры
  @IBAction func restart(_ sender: Any) {
    viewDidLoad()
    field = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    let buttons = [button1, button2, button3, button4, button5, button6, button7, button8, button9]
    crossZero = nil
    for b in buttons {
      b?.setImage(nil, for: .normal)
    }
    newGameBut()

  }

    
  //играет бот
  func roundBot() {
    
    
    let buttons = [button1, button2, button3, button4, button5, button6, button7, button8, button9]

    //    если свободно в центре, то ставит туда
    if field[4] == nil {
      print("center")
      field[4] = false
      forButtonBot(name: buttons[4]!)
      return
    }

    //    если есть возможность выиграть - выигрываем
    for i in 0...8 {
      if field[i] == nil {
        field[i] = false
        if (testFieldWin()) {
          print("Win\(i)")
          forButtonBot(name: buttons[i]!)
          botWinner()
          return
        } else {
          field[i] = nil
        }
      }
    }

    //    если есть опасность - защищаемся
    for i in 0...8 {
      if field[i] == nil {
        field[i] = true
        if (testFieldWin()) {
          print("noLose\(i)")
          field[i] = false
          forButtonBot(name: buttons[i]!)
         drawZero()
          return
        } else {
          field[i] = nil
        }
      }
    }

    //    если нет ничего выше - в первый попавшийся ставим
    for i in 0...8 {
      if field[i] == nil {
        print("random\(i)")
        field[i] = false
        forButtonBot(name: buttons[i]!)
        drawZero()
        return
      }
    }

    //    если уже нет nil полей
    label.text = "Ничья!"
  }
    
//    при ничье если играешь за нолики нужен еще один вызов
    func drawZero(){
        if(!crossZero){
            for i in 0...8{
                if(field[i] == nil){
                    return
                }
            }
        label.text = "Ничья!"
        }
    }

  //    если бот выиграл
  func botWinner() {
    crossZero = nil
    label.text = "Вы проиграли"
  }

  //    проверка на возможность выигрыша
  func testFieldWin() -> Bool {
    if (field[0] == field[1]) && (field[1] == field[2]) && (field[0] != nil) {
      return true
    }
    if (field[3] == field[4]) && (field[4] == field[5]) && (field[3] != nil) {
      return true
    }
    if (field[6] == field[7]) && (field[7] == field[8]) && (field[6] != nil) {
      return true
    }
    if (field[0] == field[3]) && (field[3] == field[6]) && (field[0] != nil) {
      return true
    }
    if (field[1] == field[4]) && (field[4] == field[7]) && (field[1] != nil) {
      return true
    }
    if (field[2] == field[5]) && (field[5] == field[8]) && (field[2] != nil) {
      return true
    }
    if (field[0] == field[4]) && (field[4] == field[8]) && (field[0] != nil) {
      return true
    }
    if (field[2] == field[4]) && (field[4] == field[6]) && (field[2] != nil) {
      return true
    }
    return false
  }

  //    для начала игры
  @IBOutlet weak var start: UIButton!
  @IBOutlet weak var zeroBut: UIButton!
  @IBOutlet weak var crossBut: UIButton!
  @IBOutlet weak var label: UILabel!
    
//    start
  @IBAction func start(_ sender: Any) {
    start.isHidden = true
    zeroBut.isHidden = false
    crossBut.isHidden = false
    label.text = "Выберите за кого хотите сыграть"
  }

  //    если играть за крестик
  @IBAction func Cross(_ sender: Any) {
    crossZero = true
    zeroBut.isHidden = true
    crossBut.isHidden = true
    label.text = ""
    restart.isHidden = false
  }

  //    если играть за нолик
  @IBAction func Zero(_ sender: Any) {
    crossZero = false
    zeroBut.isHidden = true
    crossBut.isHidden = true
    label.text = ""
    restart.isHidden = false
    roundBot()
  }

  //    если нажал игрок на кнопку
  func forButtonPlayer(n: Int, name: UIButton) {
    if !(crossZero == nil) && (field[n] == nil) {
      field[n] = true
      print("player")
      if crossZero {
        name.setImage(UIImage(named: "x"), for: .normal)
      } else {
        name.setImage(UIImage(named: "o"), for: .normal)
      }
      roundBot()
    }
  }

  //    если сходил бот
  func forButtonBot(name: UIButton) {
    if !(crossZero) {
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
    forButtonPlayer(n: 0, name: button1)
  }
  @IBAction func Button2(_ sender: Any) {
    forButtonPlayer(n: 1, name: button2)
  }
  @IBAction func Button3(_ sender: Any) {
    forButtonPlayer(n: 2, name: button3)
  }
  @IBAction func Button4(_ sender: Any) {
    forButtonPlayer(n: 3, name: button4)
  }
  @IBAction func Button5(_ sender: Any) {
    forButtonPlayer(n: 4, name: button5)
  }
  @IBAction func Button6(_ sender: Any) {
    forButtonPlayer(n: 5, name: button6)
  }
  @IBAction func Button7(_ sender: Any) {
    forButtonPlayer(n: 6, name: button7)
  }
  @IBAction func Button8(_ sender: Any) {
    forButtonPlayer(n: 7, name: button8)
  }
  @IBAction func Button9(_ sender: Any) {
    forButtonPlayer(n: 8, name: button9)
  }
}
