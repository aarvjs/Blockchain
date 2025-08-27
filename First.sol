// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract aarv{

    function checked(uint a) public  pure returns (string memory) {  //here if else condition
        string memory value;
        if(a>0){
            value = "greater";

        }else if(a==0){
            value = "equal";

        }else{
            value = "not eqal";
        }
        return value;
    }
    //uint[4] public  arr=[1,2,3,4]; //fixed size arry practice

//     uint[] public arr; //dynamic arry============================
//     function setarr(uint value) public 
// {
//     arr.push(value);
// }
// =============================================

// event LogArray(uint value);

// uint[4] public  arr = [2,4,5,6];
// function getArray() public {
//     for(uint i=0;i<arr.length;i++){
//         // arr[i]=arr[i];
//         emit LogArray(arr[i]);
//     }
// }

    // function set(uint index, uint value) public {
    //     arr[index]=value;
    // }
}

// contract arvind {

//     string name;
//     uint age;

//     constructor() {
//         name = "arvind";
//         age=19;
//     }

//     function getName() view  public returns (string memory){
//         return name;
//     }

//     function getAge() view public returns (uint){
      
//         return age;
//     }
    
//     function setage() public {
//         age = age+1;
//     }
// }