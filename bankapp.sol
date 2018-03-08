pragma solidity ^0.4.0;

contract newtoken {
    address owner;
    string public symbol;
    //uint256 public totalsupply;
    mapping(address=>uint)  balance;
   
   function newtoken() public payable{
       owner=msg.sender;
       uint256 totalsupply=50000;
        balance[msg.sender]=totalsupply;
        symbol="MNWORG";
        
    }
  
      modifier onlyowner() {
        require(msg.sender==owner);
        _;
    }
    
    function transfer(address to, uint256 value) onlyowner public returns (bool)
    {
        
        balance[msg.sender]=balance[msg.sender]-value;
        balance[to]=balance[to]+value;
        
        return true;
    }
  
     function mint(uint256 amount) onlyowner public  {
         require(balance[msg.sender]>amount);
        balance[msg.sender]=balance[msg.sender]+amount;
       
    }
    
 
    function balanceOf(address _addr) public view returns (uint256)
    {
        return balance[_addr];
    }
    
    
}
