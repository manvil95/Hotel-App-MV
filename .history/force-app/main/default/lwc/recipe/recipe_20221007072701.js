import { LightningElement,api } from 'lwc';
import getRecipeById from '@salesforce/apex/Spoonacular.getReceipe';

export default class Recipe extends LightningElement {

showTemplate = true;
 @api recipe;
 recipedata;



     handleRecipe() {
        getRecipeById({ receipeId: this.recipe })
            .then((data) => {
                console.log(data);
                this.recipedata = data;
                console.log(this.recipedata);

            })
            .catch(error => {
                console.error(error);
            });
    }

    @api
    recipeSelected(){
        console.log('fetch recipe triggered');
        console.log(this.recipe);
       this.handleRecipe();
       console.log('handleRecipeTriggered');
    }


}