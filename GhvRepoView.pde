
class RepoView{

	RepoView(){}
	void init(){
		println("Repo init called...");
	}
	
	void drawRepoView(){
		text(curRepo.name, 50, 50);
	}
}