signature STACK = 
    sig
      type 'a stack
      exception EmptyStack

      val empty : 'a stack
      val isEmpty : 'a stack -> bool

      val push : ('a * 'a stack) -> 'a stack
      val pop : 'a stack -> 'a stack
      val top : 'a stack -> 'a
      val map : ('a -> 'b) -> 'a stack -> 'b stack
      val app :  ('a -> unit) -> 'a stack -> unit
      val listItems : ('a stack) -> 'a list
      (* note: app traverses from top of stack down *)
end 

structure Stack :> STACK = 
    struct
      type 'a stack = 'a list
      exception EmptyStack

      val empty : 'a stack = []
      fun isEmpty (l:'a list): bool = 
        (case l of
           [] => true
         | _ => false)

      fun push (x:'a, l:'a stack):'a stack = x::l
      fun pop (l:'a stack):'a stack = 
        (case l of 
           [] => raise Empty
         | (x::xs) => xs)

      fun top (l:'a stack):'a = 
        (case l of
           [] => raise Empty
         | (x::xs) => x)

      fun map (f:'a -> 'b) (l:'a stack):'b stack = List.map f l
      fun app (f:'a -> unit) (l:'a stack):unit = List.app f l

      fun listItems (l : 'a stack):'a list = l
      
end