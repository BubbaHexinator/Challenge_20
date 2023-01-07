/*
Joint Savings Account
---------------------

To automate the creation of joint savings accounts, you will create a solidity smart contract that accepts two user addresses that are then able to control a joint savings account. Your smart contract will use ether management functions to implement various requirements from the financial institution to provide the features of the joint savings account.

The Starting file provided for this challenge contains a `pragma` for solidity version `5.0.0`.
You will do the following:

1. Create and work within a local blockchain development environment using the JavaScript VM provided by the Remix IDE.

2. Script and deploy a **JointSavings** smart contract.

3. Interact with your deployed smart contract to transfer and withdraw funds.

*/

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    /*
    Inside the new contract define the following variables:
    - Two variables of type `address payable` named `accountOne` and `accountTwo`
    - A variable of type `address public` named `lastToWithdraw`
    - Two variables of type `uint public` named `lastWithdrawAmount` and `contractBalance`.
    */
    //payable allows to use transfer function on values(token) sending and receiving.
    address payable accountOne = 0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb;
    address payable accountTwo = 0x7A1f3dFAa0a4a19844B606CD6e91d693083B12c0;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

    //Remittance is way a sending money.....sending money from a sender to a reciever

    //so the recipient is recieving money from the sender.




    /*
    Define a function named **withdraw** that will accept two arguments.
    - A `uint` variable named `amount`
    - A `payable address` named `recipient`
    Specifically, making this variable public will allow both you and others to check the balance of ether in the contract when depositing or withdrawing ether.
    */
    function withdraw(uint amount, address payable recipient) public {

        /*
        Define a `require` statement that checks if the `recipient` is equal to either `accountOne` or `accountTwo`. 
        The `requiere` statement returns the text `"You don't own this account!"` if it does not.
        You need to have a complete statemtent in order for this function to work. = Sets the value , "==" checks and confirms the value.
        Require statment says these are the conditions and if the condition is not met I will stop the contract. 
        */
        require(recipient == accountOne || recipient == accountTwo, "you don't own this account!");
            
        //Define a `require` statement that checks if the `balance` is sufficient to accomplish the withdraw operation. If there are insufficient funds, the text `Insufficient funds!` is returned.
        //if i have 100 in my ammoutna and I want to take 100 from my balance. 
        require(amount <= contractBalance, "insufficient funds!");

        /*
        Add and `if` statement to check if the `lastToWithdraw` is not equal to (`!=`) to `recipient` If `lastToWithdraw` is not equal, 
        then set it to the current value of `recipient`.
        */
        
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }
        

        // Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
        

        // Set  `lastWithdrawAmount` equal to `amount`
        lastWithdrawAmount = amount;

        // Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance` to reflect the new balance of the contract.
        contractBalance = address(this).balance;
    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {

        /*
        Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance`.
        */
        contractBalance = address(this).balance;
    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public{

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        accountOne = account1;
        accountTwo = account2;
        account1 = 0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb;
        account2 = 0x7A1f3dFAa0a4a19844B606CD6e91d693083B12c0;
    }

    /*
    Finally, add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.
    */
    function() external payable {}
}
