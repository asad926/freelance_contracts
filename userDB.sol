pragma solidity >= 0.4.1 <= 0.6.9;

contract UserDB{
    
    modifier onlyUserAllowed{
        require(users[msg.sender].status,"User is not Registered!");
        
        _;
    }
     modifier userIsFreelancer{
        require(!users[msg.sender].freelancers[msg.sender].freelancer,"User is Freelancer!!");

        _;
    } 
    modifier userIsEmployer{
        require(!users[msg.sender].employers[msg.sender].employer,"User is Employer!!");
        
        _;
    }
    
     uint internal countUser = 0;
  
     struct Freelancer{
        bool isAvailable;
        string  tagline;
        uint hourlyRate;
        bytes32[]  categories;
        bytes32[]  skills;
        bytes32[] attachments;
        string  description;
        bool freelancer;
    }
     struct Employer{
        string  description;
        bool employer;
    }
      struct User{
        address userId;
        string  fist_name;
        string  last_name;
        string  email;
        bytes32  gravatar;
        bytes32  country;
        bytes32[]  languages;
        string   github;
        string   linkedin;
        string   twitter;
        bool status;
    mapping(address => Freelancer) freelancers;
    mapping(address => Employer) employers;
    }
    
    mapping(address => User) users;
    
    function getUserCount() internal view returns(uint) {
        return countUser;
    }

    function userExists(address userId) public view returns(bool) {
        return users[userId].status;
    }

    
    function setUser(
         address userId,
        string memory  fist_name,
        string memory last_name,
        string memory email,
        bytes32  gravatar,
        bytes32  country,
        bytes32[] memory languages,
        string memory  github,
        string  memory linkedin,
        string  memory twitter
    )
        public
    {
        require(country.length != 0,"country can't be empty");

        users[userId].userId = userId;
        users[userId].fist_name = fist_name;
        users[userId].last_name = last_name;
        users[userId].email = email;
        users[userId].gravatar = gravatar;
        users[userId].country = country;
        users[userId].github = github;
        users[userId].linkedin = linkedin;
        users[userId].twitter = twitter;
        users[userId].languages = languages;
        users[userId].status = true;

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
    onlyUserAllowed
    userIsEmployer
    {
        users[msg.sender].freelancers[msg.sender].isAvailable = isAvailable;
        users[msg.sender].freelancers[msg.sender].hourlyRate = hourlyRate;
        users[msg.sender].freelancers[msg.sender].categories = categories;
        users[msg.sender].freelancers[msg.sender].skills = skills;
        users[msg.sender].freelancers[msg.sender].tagline = tagline;
        users[msg.sender].freelancers[msg.sender].attachments = attachments;
        users[msg.sender].freelancers[msg.sender].description = description;
        users[msg.sender].freelancers[msg.sender].freelancer = true;
    }
    
    function setEmployer(string memory description
    )public 
    onlyUserAllowed
    userIsFreelancer
    {
        users[msg.sender].employers[msg.sender].description = description;
        users[msg.sender].employers[msg.sender].employer = true;

    }
    
    function setUserLanguages(address userId, bytes32[] memory languages) internal {
        
       
        
    }
}