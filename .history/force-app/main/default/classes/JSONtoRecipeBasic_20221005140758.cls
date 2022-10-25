//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class JSONtoRecipeBasic {

	public class Recipes {
		public Boolean vegetarian;
		public Boolean vegan;
		public Boolean glutenFree;
		public Boolean dairyFree;
		public Boolean veryHealthy;
		public Boolean cheap;
		public Boolean veryPopular;
		public Boolean sustainable;
		public Boolean lowFodmap;
		public Integer weightWatcherSmartPoints;
		public String gaps;
		public Integer preparationMinutes;
		public Integer cookingMinutes;
		public Integer aggregateLikes;
		public Integer healthScore;
		public String creditsText;
		public String sourceName;
		public Double pricePerServing;
		public Integer id;
		public String title;
		public Integer readyInMinutes;
		public Integer servings;
		public String sourceUrl;
		public String image;
		public String imageType;
		public String summary;
		public String instructions;
		public Object originalId;
		public String spoonacularSourceUrl;
	}

	public List<Recipes> recipes;
    String 


	public static JSONtoRecipeBasic parse(String json) {
		return (JSONtoRecipeBasic) System.JSON.deserialize(json, JSONtoRecipeBasic.class);
	}
}