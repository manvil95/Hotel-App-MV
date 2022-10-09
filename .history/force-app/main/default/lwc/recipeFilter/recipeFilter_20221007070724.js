import { LightningElement,api } from 'lwc';
import geRandomRecipe from '@salesforce/apex/Spoonacular.getRandomReceipe';

export default class RecipeFilter extends LightningElement {

error;
recipedata = [];
time;
searchId ='716429';


    handleRandomRecipe() {
        geRandomRecipe()
            .then((data) => {
                console.log(data);
                this.recipedata = data;
                console.log(this.recipedata);

            })
            .catch(error => {
                console.error(error);
            });
    }

    handleClick() {
        this.handleRandomRecipe();
    }

    handleSearch(){

        const selectedEvent = new CustomEvent('selected',{ detail: this.searchId });
        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
        console.log(selectedEvent.detail);
        console.log('event dispatched');
    }

    handleInputChange(event) {
            this.searchId = event.target.value;
    }

    connectedCallback(){

        console.log('connected callback parent');
    }


}