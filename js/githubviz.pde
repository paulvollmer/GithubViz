
// github api userdata
String gravatar_id;
String company;
String name;
String created_at;
String location;
String public_repo_count;
String public_gist_count;
String blog;
String following_count;
String id;
String type;
String permission;
String followers_count;
String login;
String email;
PImage gravatarImage;

// github api repodata
ArrayList repos;



void setup() {
  size(750, 400);
  frameRate(25);
  
  // userdata
  gravatar_id = "8aa3a1b1a5238b9a8f375688dfa14e49";
  company = "wrong-entertainment";
  name = "wng";
  created_at = "0x11120119";
  location = "Germany";
  public_repo_count = "1";
  public_gist_count = "0";
  blog = "http://www.wng.cc";
  following_count = "11120119";
  id = "0x11120119";
  type = "User";
  permission = "null";
  followers_count = "11120119";
  login = "wng";
  email = "contact@wng.cc";
  gravatarImage = loadImage("https://secure.gravatar.com/avatar/" + gravatar_id + "?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png");
  
  //TODO: clear arraylist correctly.
  repos = new ArrayList();
  repos.add(new Repo("tst"));
}



void draw() {
  background(0xFF4D4D4D);
  
  // top rectangle
  fill(0xFF48A1F0);
  noStroke();
  rect(0, 0, width, 5);

  // gravatar image
  image(gravatarImage, 0, 20);

  // Text userdata
  int tx = 90;
  fill(255);
  text("company: "+company, tx, 30);
  text("name: "+name, tx, 50);
  text("created_at: "+created_at, tx, 70);
  text("location: "+location, tx, 90);
  text("public_repo_count: "+public_repo_count, tx, 110);
  text("public_gist_count: "+public_gist_count, tx, 130);
  text("blog: "+blog, tx, 150);
  text("following_count: "+following_count, tx, 170);
  text("id: "+id, tx, 190);
  text("type: "+type, tx, 210);
  text("permission: "+permission, tx, 230);
  text("followers_count: "+followers_count, tx, 250);
  text("login: "+login, tx, 270);
  text("email: "+email, tx, 290);
  
  // Repo graph
  for(int i=0; i<parseInt(public_repo_count); i++) {
	 int n = 4;
  	 rect(240+(i*7), 110-n, 5, n);
  }

  // Text repodata
  //text("repo name: "+repoName, tx+200, 30);
  /*for(int i=0; i<repoName.length; i++) {
    println("repodata test "+repoName[i]);
  }*/
  for (int i = repos.size()-1; i >= 0; i--) {
    Repo repo = (Repo) repos.get(i);
    repo.display(400+(20*i), 20);
  }
	
}


/**
 * repodata class.
 */
class Repo {

  String type;
  String language;
  String has_downloads;
  String url;
  String homepage;
  String pushed_at;
  String created_at;
  String fork;
  String has_wiki;
  String score;
  String size;
  String private_repo;
  String name;
  String watchers;
  String owner;
  String open_issues;
  String description;
  String forks;
  String has_issues;
  String followers;
  String pushed;
  String created;
  String username;

  Repo(String _type,
  String _language,
  String _has_downloads,
  String _url,
  String _homepage,
  String _pushed_at,
  String _created_at,
  String _fork,
  String _has_wiki,
  String _score,
  String _size,
  String _private_repo,
  String _name,
  String _watchers,
  String _owner,
  String _open_issues,
  String _description,
  String _forks,
  String _has_issues,
  String _followers,
  String _pushed,
  String _created,
  String _username) {
	//Repo(String _type, String _language, String _has_downloads, String _name) {
    type = _type;
	 language = _language;
	 has_downloads = _has_downloads;
	 url = _url;
	 homepage = _homepage;
	 pushed_at = _pushed_at;
	 created_at = _created_at;
	 fork = _fork;
	 has_wiki = _has_wiki;
	 score = _score;
	 size = _size;
	 private_repo = _private_repo;
	 name = _name;
	 watchers = _watchers;
	 owner = _owner;
	 open_issues = _open_issues;
	 description = _description;
	 forks = _forks;
	 has_issues = _has_issues;
	 followers = _followers;
	 pushed = _pushed;
	 created = _created;
	 username = _username;
    
    println("type:          "+type);
    println("language:      "+language);
    println("has_downloads: "+has_downloads);
    println("url:           "+url);
    println("homepage:      "+homepage);
    println("pushed_at:     "+pushed_at);
    println("created_at:    "+created_at);
    println("fork:          "+fork);
    println("has_wiki:      "+has_wiki);
    println("score:         "+score);
    println("size:          "+size);
    println("private_repo:  "+private_repo);
    println("name:          "+name);
    println("watchers:      "+watchers);
    println("owner:         "+owner);
    println("open_issues:   "+open_issues);
    println("description:   "+description);
    println("forks:         "+forks);
    println("has_issues:    "+has_issues);
    println("followers:     "+followers);
    println("pushed:        "+pushed);
    println("created:       "+created);
    println("username:      "+username);
    println("---");
  }
  
  void display(int x, int y) {
    rect(x, y, 10 ,10);
  }

}



/**
 * This is our javaScript connection
 * If you change something, you must also update the javascript at the .html file.
 */
void userdata(String _gravatar_id,
String _company,
String _name,
String _created_at,
String _location,
String _public_repo_count,
String _public_gist_count,
String _blog,
String _following_count,
String _id,
String _type,
String _permission,
String _followers_count,
String _login,
String _mail) {
	gravatar_id = _gravatar_id;
	company = _company;
	name = _name;
	created_at = _created_at;
	location = _location;
	public_repo_count = _public_repo_count;
	public_gist_count = _public_gist_count;
	blog = _blog;
	following_count = _following_count;
	id = _id;
	type = _type;
	permission = _permission;
	followers_count = _followers_count;
	login = _login;
	email = _mail;
	
	gravatarImage = loadImage("https://secure.gravatar.com/avatar/" + gravatar_id + "?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png");
	
	//for(int i=0; i<=repos.size(); i++) {
	  //repos.clear();
	//}
	//println(repos.size());
	//repos.remove(repos.size()-1);
}


/**
 * This is our javaScript connection
 * If you change something, you must also update the javascript at the .html file.
 */
void repodata(String _type,
  String _language,
  String _has_downloads,
  String _url,
  String _homepage,
  String _pushed_at,
  String _created_at,
  String _fork,
  String _has_wiki,
  String _score,
  String _size,
  String _private_repo,
  String _name,
  String _watchers,
  String _owner,
  String _open_issues,
  String _description,
  String _forks,
  String _has_issues,
  String _followers,
  String _pushed,
  String _created,
  String _username) {
//void repodata(String _type, String _language, String _has_downloads, String _name) {
  //repos.add(new Repo(_type, _language, _has_downloads, _name));
  repos.add(new Repo(_type,
  _language,
  _has_downloads,
  _url,
  _homepage,
  _pushed_at,
  _created_at,
  _fork,
  _has_wiki,
  _score,
  _size,
  _private_repo,
  _name,
  _watchers,
  _owner,
  _open_issues,
  _description,
  _forks,
  _has_issues,
  _followers,
  _pushed,
  _created,
  _username));
}
