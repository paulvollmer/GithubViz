/**
 * GhvRepoView.pde
 * GitHubViz
 *
 * Tim Pulver <tim.pulver@fh-potsdam.de>
 * Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * 
 *
 * @version    1.0.0
 * @modified   2012.05.10
 */

boolean userDataLoaded;

Timeline timeline;



/**
 * Processing Main Setup
 */
void setup(){
  	size(800,600);
  	frameRate(25);
  
	timeline = new Timeline(10, 10, width-20, height-20);
}



/**
 * NOTE: look at callback_handler.js
 */
void userDataReady(){
	var userData = getUser(getUrlVars()["user"]);
	
	/*println("\nAccessing a Javascript Object from within P5: ");
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
	println("followers      =   " + userData.followers_count);
	println("following      =   " + userData.following_count);
	println("html_url       =   " + userData.html_url);
	println("created_at     =   " + userData.created_at);
	println("type           =   " + userData.type);
	
	println("\nrepoData =============================================================================");
	for(int i=0; i<userData.public_repo_count; i++){
		println("\nrepo[" + userData.repos[i].name + "]");
		println("url           =   " + userData.repos[i].url);
		println("homepage      =   " + userData.repos[i].homepage);
		println("watchers      =   " + userData.repos[i].watchers);
		println("created_at    =   " + userData.repos[i].created_at);
		println("has_wiki      =   " + userData.repos[i].has_wiki);
		println("pushed_at     =   " + userData.repos[i].pushed_at);
		println("fork          =   " + userData.repos[i].fork);
		println("open_issues   =   " + userData.repos[i].open_issues);
		println("private       =   " + userData.repos[i].private);
		println("description   =   " + userData.repos[i].description);
		println("owner         =   " + userData.repos[i].owner);
		println("has_issues    =   " + userData.repos[i].has_issues);
		println("forks         =   " + userData.repos[i].forks);
		println("has_downloads =   " + userData.repos[i].has_downloads);
	}*/
	
	
	// initialize our timeline
	timeline.init(userData.repos[3].created_at,
				  userData.repos[3].pushed_at,
			      userData.repos[3].open_issues);
	
	userDataLoaded = true;
}



/**
 * Processing Main Draw
 */
void draw(){  
  	//background(#4D4D4D);

	if(userDataLoaded){
  		//println("Hello");
		timeline.draw();
	} else {
		//println("Hello ErrorLog!");
	}
	
}





/**
 * Timeline
 */
class Timeline {

	// position and size of our Timeline
	int x, y, w, h;
	
	String created_at;
	String pushed_at;
	int numIssues;
	//int numMilestones;
	
	
	
	/**
	 * @param x
   	 * @param y
	 * @param w
	 * @param h
	 */
	Timeline(int x, int y, int w, int h){
		this.x = x;
		this.y = y;
		this.w = w;
		this.h = h;
		println("[Timeline] x="+x+", y="+y+", w="+w+", h="+h);
	}
	
	
	
	/**
	 * init
	 *
	 * @param created_at
	 * @param pushed_at
	 * @param numMilestones
	 * ? @param numIssues
	 */
	void init(String created_at, String pushed_at, int numIssues){
		this.created_at = created_at;
		this.pushed_at = pushed_at;
		this.numIssues = numIssues;
		//this.numMilestones = numMilestones;
		
		println("[Timeline] init() created_at       =   " + created_at);
		println("[Timeline] init() pushed_at       =   " + pushed_at);
		println("[Timeline] init() numIssues        =   " + numIssues);
		//println("[Timeline] init() numMilestones   =   " + numMilestones);
		
		//mapping(created_at, pushed_at, "2012/05/08 12:12:12 -700");
	}
	
	
	/**
	 * Draw our Timeline
	 */
	void draw(){
		fill(150);
		rect(x, y, w, h);
		
		// we draw all issues
		for(int i=0; i<numIssues; i++){
			issueFlag(25*i, 100, 20);
		}
		milestoneFlag(x+100, y+200, "1");
		
	}



	/**
	 * Draw our issueFlag
	 */
	void issueFlag(int x, int y, int s){
		noStroke();
		fill(255,0,0);
		
		triangle(x, y+s,
		         x-(s/2), y,
		         x+(s/2), y);
	}
	
	
	
	/**
	 * Draw our milestoneFlag
	 */
	void milestoneFlag(int x, int w, String name){
		noFill();
		stroke(0);
		line(x, y, x, w);

		fill(0);
		noStroke();
		rect(x, w, 14, 14);

		fill(255);
		text(name, x+2, w+12);
	}
	
	
	void mapping(String input, String output, String cur){
		println("[Timeline] mapping() in        =   " + input);
		println("[Timeline] mapping() out       =   " + output);
		println("[Timeline] mapping() current   =   " + cur);
	}
	
}
