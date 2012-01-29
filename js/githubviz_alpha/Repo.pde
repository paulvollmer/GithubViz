
/**
 * Repo
 * Our Repo class to create repo circles, follower/following table and worldmap.
 * Description about used Variables can befound at the GitHub API reference.
 * http://developer.github.com/v3/users/
 */
 
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

