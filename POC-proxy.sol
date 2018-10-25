pragma solidity ^0.4.25;

//balance is in  wei and not ether

contract RecievePayment {
    function () public payable {
    }
    function getBalance() public returns (uint) {
        return address(this).balance;
	//the contract where this is held acts as a standard adress as a result
    }
}

contract PaymentProxy {
    
    RecievePayment private _instance;
    
    function PaymentProxy() public {
        // _instance = RecievePayment(address(this));
        _instance = new RecievePayment();
    }
    
    function getBalance() public returns (uint) {
        return address(this).balance;
    }
    
    function getBalanceOfInstance() public returns (uint) {
        return _instance.getBalance();
    }
    
    function () public payable {
        address(_instance).send(msg.value);
    }
}
