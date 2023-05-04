// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Signature{
    
    function getMessageHash(address _to,uint _amount,string memory _message,uint _nonce)public pure returns(bytes32){
        return keccak256(abi.encodePacked(_to,_amount,_message,_nonce));
    }

    function getEthSignedMessageHash(bytes32 _getMessageHash)public pure returns(bytes32)
    {
        return keccak256(
                abi.encodePacked("\x19Ethereum Signed Message:\n32", _getMessageHash)
            );
    }

    /* 3. Sign message hash
    # using browser
    account = "copy paste account of signer here"
    ethereum.request({ method: "personal_sign", params: [account, hash]}).then(console.log)

    # using web3
    web3.personal.sign(hash, web3.eth.defaultAccount, console.log)

    Signature will be different for different accounts
    0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    */

    function verify(address _signer,address _to,uint _amount,string memory message,uint _nonce,bytes memory signature)public pure returns(bool){
        bytes32 messageHash = getMessageHash(_to,_amount,message,_nonce);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recoverSigner(ethSignedMessageHash, signature) == _signer;
    }

    function recoverSigner(bytes32 _ethSignedMessageHash, bytes memory _signature)public pure returns(address){
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignature(bytes memory sig)public pure returns(bytes32 r,bytes32 s,uint8 v){
        require(sig.length == 65,"Invalid signature length");
        assembly{
            // first 32 bytes, after the length prefix
            r := mload(add(sig, 32))
            // second 32 bytes
            s := mload(add(sig, 64))
            // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(sig, 96)))
        }
    }
}