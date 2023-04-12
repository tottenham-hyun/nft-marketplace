// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
  address public owner = msg.sender; //호출자 주소(ganache 첫번째 주소를 지갑으로 쓸거임,owner)
  uint public last_completed_migration; //각 migrationd의 정보를 보관

  modifier restricted() {
    require( // solidity의 오류처리자, 첫번째 인자(참), 두번째 인자: 참 아니면 실행되는것
      msg.sender == owner, //이 migration이 실행되려면 주소가 owner로 설정되어야 함
      "This function is restricted to the contract's owner!"
    );
    _; // 함수를 계속해서 실행한다
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  } 

}
