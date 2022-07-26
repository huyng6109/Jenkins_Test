import { LightningElement } from 'lwc';

export default class Calculators extends LightningElement {
    showResult = '';
    currentNumber = '';

    handleClick(event){
        if (event.target.label === 'Clear') {
            this.showResult = '';
            this.currentNumber = '';
        } else if (event.target.label === 'Del') {
            this.currentNumber = this.currentNumber.substring(0, this.currentNumber.length -1);
            if (this.currentNumber.length != 0){
                this.currentNumber = this.currentNumber.join('');
            } else {
                this.currentNumber = '';
            }
        } else if (event.target.label === '=') {
            this.showResult = eval(this.currentNumber);
            this.showResult = this.showResult.toFixed(10).replace(/\.?0+$/, '');
        } else {
            this.currentNumber = this.currentNumber + event.target.label;
        }
    }
}