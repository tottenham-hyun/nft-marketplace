// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import './ERC721Connector.sol';

// 모든 erc-721, 인터페이스, 라이브러리, 메타데이터등 포함 예정
contract Kryptobird is ERC721Connector{
    
    // array to store our nfts
    string [] public kryptoBirdz;

    mapping(string => bool) _kryptoBirdzExists;

    function mint(string memory _kryptoBird) public {
        require(!_kryptoBirdzExists[_kryptoBird],
        'Error - kryptoBird already exists');
        
        kryptoBirdz.push(_kryptoBird);
         uint _id = kryptoBirdz.length - 1;
        _mint(msg.sender, _id);

        _kryptoBirdzExists[_kryptoBird] = true;
    }
   
    constructor() ERC721Connector('KryptoBird','KBIRDZ'){
        
    }

    
}