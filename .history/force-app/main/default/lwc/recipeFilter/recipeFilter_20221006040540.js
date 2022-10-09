import { LightningElement } from 'lwc';
import apexMethodName from '@salesforce/apex/Namespace.Spoonacular.getRandomReceipe';

export default class RecipeFilter extends LightningElement {

queryTerm;
clickedButtonLabel;

    handleKeyUp(event) {
        const isEnterKey = event.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = event.target.value;
        }
    }


    handleClick(event) {
        this.clickedButtonLabel = event.target.label;
    }


}