/**
 * GitHubViz
 */


User user;

void setup() {
  // processing java
  size(800, 600);
  // processing javascript
  //size(window.innerWidth-20, window.innerHeight-250);
  
  smooth();
  noCursor();
  frameRate(60);

  user = new User();
  user.init("octocat", "https://github.com/images/error/octocat_happy.gif", "https://api.github.com/users/octocat", "monalisa octocat", "GitHub", "https://github.com/blog", "San Francisco", 2, 1, 20, 0, "2008-01-14T04:33:35Z", "User");
}

void draw() {
  background(#4D4D4D);
  cursor(mouseX, mouseY);

  user.draw();

  // red outline arround the canvas
  /*stroke(255, 0, 0);
   	noFill();
   	rect(1, 1, width-2, height-2);*/



  /*noStroke();
   fill(#3399FF);
   ellipse(mouseX, mouseY, 20, 20);*/
}

/**
 * Create our own cursor
 */
void cursor(int x, int y) {
  stroke(#3399FF);
  strokeWeight(2);
  noFill();
  line(x, y, x+10, y+10);
  line(x, y, x+5, y);
  line(x, y, x, y+5);
}







/**
 * User
 * Our User class to create repo circles, follower/following table and worldmap.
 *
 * Here is a example JSON File:
 *   "login": "octocat",
 *   "id": 1,
 *   "avatar_url": "https://github.com/images/error/octocat_happy.gif",
 *   "gravatar_id": "somehexcode",
 *   "url": "https://api.github.com/users/octocat",
 *   "name": "monalisa octocat",
 *   "company": "GitHub",
 *   "blog": "https://github.com/blog",
 *   "location": "San Francisco",
 *   "email": "octocat@github.com",
 *   "hireable": false,
 *   "bio": "There once was...",
 *   "public_repos": 2,
 *   "public_gists": 1,
 *   "followers": 20,
 *   "following": 0,
 *   "html_url": "https://github.com/octocat",
 *   "created_at": "2008-01-14T04:33:35Z",
 *   "type": "User"
 * Description about used Variables can befound at the GitHub API reference.
 * http://developer.github.com/v3/users/
 */
class User {
  String login;
  String gravatar_id;
  String url;
  String name;
  String company;
  String blog;
  String location;
  int public_repos;
  int public_gists;
  int followers;
  int following;
  String created_at;
  String type;

  Repo repo;


  /**
   * Constructor
   */
  User() {
  }


  /**
   * Initialize our User and calculate chart.
   * a default dataset:
   *   login = "octocat";
   *   gravatar_id = "https://github.com/images/error/octocat_happy.gif";
   *   url = "https://api.github.com/users/octocat";
   *   name = "monalisa octocat";
   *   company = "GitHub";
   *   blog = "https://github.com/blog";
   *   location = "San Francisco";
   *   public_repos = 2;
   *   public_gists = 1;
   *   followers = 20;
   *   following = 0;
   *   created_at = "2008-01-14T04:33:35Z";
   *   type = "User";
   */
  void init(String tempLogin, String tempGravatar, String tempUrl, String tempName, String tempCompany, String tempBlog, String tempLocation, int tempRepos, int tempGists, int tempFollowers, int tempFollowing, String tempCreatedAt, String tempType) {
    login = tempLogin;
    gravatar_id = tempGravatar;
    url = tempUrl;
    name = tempName;
    company = tempCompany;
    blog = tempBlog;
    location = tempLocation;
    public_repos = tempRepos;
    public_gists = tempGists;
    followers = tempFollowers;
    following = tempFollowing;
    created_at = tempCreatedAt;
    type = tempType;

    repo = new Repo();
    repo.init("GitHubViz", "Visualize your Social Coding Projects", "githubviz.com", "javascript", 23, 47, 1209);
  }


  /**
   * Draw our User chart.
   */
  void draw() {
  }
}





/**
 * http://developer.github.com/v3/repos/
 */
class Repo {
  String name;
  String description;
  String homepage;
  String language;
  int forks;
  int watchers;
  int size;


  /**
   * Constructor
   */
  Repo() {
  }


  /**
   * Initialize and calculate chart.
   */
  void init(String tempName, String tempDescription, String tempHomepage, String tempLanguage, int tempForks, int tempWatchers, int tempSize) {
    name = tempName;
    description = tempDescription;
    homepage = tempHomepage;
    language = tempLanguage;
    forks = tempForks;
    watchers = tempWatchers;
    size = tempSize;

    println("Name: " + name);
  }


  /**
   * Draw chart.
   */
  void draw() {
    noStroke();
    fill(255, 0, 0);
    ellipse(width, height, size, size);
  }
}

