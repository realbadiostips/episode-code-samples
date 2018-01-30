func 🔺(_ x: Int) -> Int {
  return x + 1
}

🔺(2)

func 🔲(_ x: Int) -> Int {
  return x * x
}

🔲(🔺(2))

extension Int {
  func 🔺() -> Int {
    return self + 1
  }

  func 🔲() -> Int {
    return self * self
  }
}

2.🔺()
2.🔺().🔲()

precedencegroup ForwardApplication {
  associativity: left
}

infix operator ⛵️: ForwardApplication

func ⛵️ <A, B>(x: A, f: (A) -> B) -> B {
  return f(x)
}

2 ⛵️ 🔺 ⛵️ 🔲

extension Int {
  func incrAndSquare() -> Int {
    return self.🔺().🔲()
  }
}

precedencegroup ForwardComposition {
  higherThan: ForwardApplication
  associativity: right
}
infix operator ✨✨✨: ForwardComposition

func ✨✨✨ <A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> ((A) -> C) {
  return { a in g(f(a)) }
}

2 ⛵️ 🔺 ✨✨✨ 🔲

[1, 2, 3]
  .map(🔲)
  .map(🔺)

[1, 2, 3]
  .map(🔲 ✨✨✨ 🔺)
