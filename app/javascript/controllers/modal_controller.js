// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from 'stimulus'

export default class extends Controller {

    static targets = [
        'title', 'photo', 'price', 'coupon'
     ];


    setContent({photo, price, title, coupon = ''}) {
        this.titleTarget.innerText = title;
        this.priceTarget.innerText = price;
        this.couponTarget.innerText = coupon;
        this.photoTarget.src = photo;
    }

    launchModal(data) {
        debugger
        this.setContent(data)
        this.element.classList.add("open");
    }
}