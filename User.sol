pragma solidity >= 0.4.1 <= 0.6.9;

import "./Ownable.sol";
import "./userDB.sol";
contract User is Ownable {
    UserDB db = new UserDB();
    event onFreelancerAdded(address userId);
    event onEmployerAdded(address userId);

    function setUser(
        string memory  fist_name,
       // string memory last_name,
        string memory email,
        bytes32  gravatar,
        bytes32  country,
        bytes32[] memory languages,
        string memory  github,
        string  memory linkedin
       // string  memory twitter
    )public
        onlyOwner
    {
        if (languages.length > 10) revert("languages greater");
        if (languages.length < 2) revert("languages less");
        uint256 nameLen = bytes(fist_name).length;
        if (nameLen > 30) revert("name lenght greater");
        if (nameLen < 0) revert("name lenght less");
        if (bytes(email).length > 254) revert("email greater");
       // if (bytes(linkedin).length > 100) revert("linkedin greater");
        if (bytes(github).length > 100) revert("github greater");
        db.setUser(msg.sender, fist_name, "last_name", email, gravatar, country, languages, github, linkedin, "twitter");
    }

    function setFreelancer(
       bool isAvailable,
        string memory tagline,
        uint hourlyRate,
        bytes32[] memory categories,
        bytes32[] memory skills,
        bytes32[] memory attachments,
        string memory description
    )public
        onlyOwner
        
    {
        if (categories.length > 10) revert("");
        if (categories.length < 2) revert("");
        if (skills.length > 20) revert("");
        if (skills.length < 3) revert("");
        if (bytes(description).length > 100) revert("");
        
        db.setFreelancer(isAvailable, tagline, hourlyRate, categories, skills, attachments, description);
    }


    function setEmployer(string memory description
    )public
        onlyOwner
        
    {
        if (bytes(description).length > 100) revert("");
        db.setEmployer(description);
    }
}