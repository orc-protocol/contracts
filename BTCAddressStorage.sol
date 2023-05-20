pragma solidity ^0.8.0;

contract BTCAddressStorage {
    mapping(address => string) private addressToBTCAddress;
    mapping(string => address) private BTCAddressToAddress;
    address[] private addresses;
    uint256 private totalBTCAddresses;

    function storeBTCAddress(string memory _btcAddress) public {
        require(bytes(addressToBTCAddress[msg.sender]).length == 0, "Address already has a BTC address");
        require(BTCAddressToAddress[_btcAddress] == address(0), "BTC address already exists");

        addressToBTCAddress[msg.sender] = _btcAddress;
        BTCAddressToAddress[_btcAddress] = msg.sender;
        addresses.push(msg.sender);
        totalBTCAddresses++;
    }

    function getBTCAddressByAddress(address _address) public view returns (string memory) {
        return addressToBTCAddress[_address];
    }

    function getAddressByBTCAddress(string memory _btcAddress) public view returns (address) {
        return BTCAddressToAddress[_btcAddress];
    }

    function getTotalBTCAddresses() public view returns (uint256) {
        return totalBTCAddresses;
    }

    function getBTCAddressesByAddresses(address[] memory _addresses) public view returns (string[] memory) {
        string[] memory btcAddresses = new string[](_addresses.length);
        for (uint256 i = 0; i < _addresses.length; i++) {
            btcAddresses[i] = addressToBTCAddress[_addresses[i]];
        }
        return btcAddresses;
    }
}
