import { LightningElement,wire } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';
import getRandomReceipeString from '@salesforce/apex/Spoonacular.getRandomString';

export default class RecipeFilter extends LightningElement {

queryTerm;
clickedButtonLabel;
error;
recipe = [];


@wire(getRandomReceipeString) recipesRandom;

connectedCallback(){
    console.log(this.recipesRandom);
}


    handleRandomRecipe() {
        geRandomRecipe()
            .then(result => {
                console.log('recipe results passed - start');
                console.log(result);
                this.recipe = result;
                console.log('recipe results passed - end');
            })
            .catch(error => {
                this.error = error;
            });
    }

    handleKeyUp(event) {
        const isEnterKey = event.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = event.target.value;
        }
    }


    handleClick(event) {
        this.handleRandomRecipe();
    }


}