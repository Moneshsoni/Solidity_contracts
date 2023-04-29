// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract A{
    event Log(string message);
    function foo()public virtual{
        emit Log("Foo.A() is called");
    }

    function bar()public virtual{
        emit Log("Bar.A() is called");
    }
}

contract B is A{
    function foo()public  virtual override{
        emit Log("Foo.B contract is called");
    }

    function bar()public virtual override{
        emit Log("Bar.B contract is called");
    }
}

contract C is A{
    function foo()public virtual override{
        emit Log("Foo.C contract is called");
    }

    function bar()public virtual override{
        emit Log("Bar.C contract is called");
    }
}

contract D is B,C{

    // Try:
    // - Call D.foo and check the transaction logs.
    //   Although D inherits A, B and C, it only called C and then A.
    // - Call D.bar and check the transaction logs
    //   D called C, then B, and finally A.
    //   Although super was called twice (by B and C) it only called A once.
    function foo()public virtual override(B,C){
        super.foo();
    }

    function bar()public virtual override (B,C){
        super.bar();
    }

}