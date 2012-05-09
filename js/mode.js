
var viewEnum = {
	USER: 'user',
	REPO: 'repo'	
};

var curView = viewEnum.USER; // current view mode
var curUser = ''; // current user name
var curRepo = ''; // current repository object, you can call everything like 'curRepo.name' directly!
var curRepoUrlParam = ''; // When browsing the site via disover.php&repo=... , the name will be stored, to search for it later.




