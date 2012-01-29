
/**
 * User
 * Our User class to create repo circles, follower/following table and worldmap.
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

  //Repo repo;


  /**
   * Constructor
   */
  User() {
  }


  /**
   * Initialize our User and calculate chart.
   *
   * @param login
   * @param gravatar_id
   * @param url
   * @param name
   * @param company
   * @param blog
   * @param location
   * @param public_repos
   * @param public_gists
   * @param followers
   * @param following
   * @param created_at
   * @param type
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

    //repo = new Repo();
    //repo.init("GitHubViz", "Visualize your Social Coding Projects", "githubviz.com", "javascript", 23, 47, 1209);
  }


  /**
   * Draw our User chart.
   */
  void draw() {
    // text
    /*noStroke();
    fill(#FFFFFF);
    text(login + " aka " + name, 50, 50);
    text(url, 50, 70);
    text("company " + company, 50, 110);
    text(blog, 50, 130);
    text(location, 50, 150);*
    
    // create repo circles
    float cDiam = width/public_repos;
    println(cDiam);
    for (int i=0; i<public_repos; i++) {
      ellipse(i*cDiam+(cDiam/2), height/2, cDiam, cDiam);
    }*/
    
    float posX = width/2;
    float posY = height/2;
    
    noStroke();
    fill(#999999);
    ellipse(posX, posY, height-40, height-40);
    
    // code
    // gists
    fill(#3399FF);
    //ellipse(width/2, height/2, );
    
    // peoples
    int peoples = followers+following;
    noStroke();
    // follower
    fill(#ffffff);
    //ellipse(posX, posY, 300, 300);
    // following
    fill(#3399FF);
    float followingDegree = map(following, 0, peoples, 0, 360);
    println(followingDegree);
    arc(posX, posY, 300, 300, 0, followingDegree);
    
  }
}

