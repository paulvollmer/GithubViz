
/**
 * Processing Main Setup
 */
void setup(){
  size(800,600);
  background(#4D4D4D);
  fill(255);
  noLoop();

  PFont fontA = loadFont("courier");
  textFont(fontA, 14);
}



/**
 * Processing Main Draw
 */
void draw(){    
  println("Hello ErrorLog!");
}



/**
 * NOTE: look at callback_handler.js
 */
void userDataReady(){
	var userData = getUser(getUrlVars()["user"]);;
	println("### Log test");
	
	// make sure userData has been loaded already!!
	
	println("\nAccessing a Javascript Object from within P5: ");
	println("\nuserData =============================================================================");
	println("login          =   " + userData.login);
	println("id             =   " + userData.id);
	println("avatar_url     =   " + userData.avatar_url);
	println("gravatar_id    =   " + userData.gravatar_id);
	println("url            =   " + userData.url);
	println("name           =   " + userData.name);
	println("company        =   " + userData.company);
	println("blog           =   " + userData.blog);
	println("location       =   " + userData.location);
	println("email          =   " + userData.email);
	println("hireable       =   " + userData.hireable);
	println("bio            =   " + userData.bio);
	println("public_repos   =   " + userData.public_repo_count);
	println("public_gists   =   " + userData.public_gist_count);
	println("followers      =   " + userData.followers.length);
	println("following      =   " + userData.following.length);
	println("html_url       =   " + userData.html_url);
	println("created_at     =   " + userData.created_at);
	println("type           =   " + userData.type);
	
	println("\nrepoData =============================================================================");
	int tempL = userData.repos.length();
	for(int i=0; i<tempL; i++){
		println("\nrepo[" + userData.repos[i].name + "]");
		println("watchers      =   " + userData.repos[i].watchers);
		println("description   =   " + userData.repos[i].description);
		println("size          =   " + userData.repos[i].size);
		println("updated_at    =   " + userData.repos[i].updated_at);
		println("open_issues   =   " + userData.repos[i].open_issues);
	}
	
	
	/*fill(0);
	rect(90, 90, 200, 200);
	fill(255);
	text("test", 100, 100);*/
}
