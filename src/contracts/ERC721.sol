// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/*
    building out the minting function
    1. nft가 주를 제대로 가르키기
    2. 토큰ID 추적, 생성되는 nft마다 1,2,3으로 추적
    3. 토큰id로 토큰 소유자를 추적(누구껀지) 
    4. 주소 또는 소유자의 주소에 대해 몇개의 NFT를 가지고 있는지
    5. 추적에 대한 정보 로그 방출 여부(이벤트 생성으로 방출- 계약 주소 민팅된 위치, id)
*/

contract ERC721{

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId);


    // mapping in solidity creates a hash table of key pair values
    // Mapping from token id to the owner
    mapping(uint256 => address) private _tokenOwner; // 기본적으로 모든 정보는 private으로 유지
    mapping(address => uint256) private _OwnedTokensCount; // Mapping from owner to number of owned tokens

    function _exists(uint256 tokenId) internal view returns(bool){
        // setting the address of nft owner to check the mapping
        // of the address from tokenOwner at the tokenId
        address owner = _tokenOwner[tokenId];
        // return truthiness the address is not zero
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal{
        // requires that the address isn't zero
        require(to != address(0),'ERC721: minting to the 0 address');
        // requires that the address does not already exist
        require(!_exists(tokenId), 'ERC721: token already minted');
        // we are adding a new address with a token id for minting
        _tokenOwner[tokenId] = to; //해당 tokenId가 주소로 전달
        // keeping track of each address that is minting and adding one to the account
        _OwnedTokensCount[to] +=1;

        emit Transfer(address(0), to, tokenId);
    }
}