import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    btnNumbers = '';
    showResult = 0;

    handleBtnNumbers(event) {
        this.btnNumbers = this.btnNumbers + event.target.label;
    }

    // handleClick(event) {
    //     if (event.target.label == 'Del') {
    //         this.showResult = this.btnNumbers.substring(0, this.btnNumbers.length - 1); 
    //     }
    // }
}