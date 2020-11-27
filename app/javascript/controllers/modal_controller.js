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
        'title', 'photo', 'price', 
        'coupon', 'body', 'link'
     ];

    setCoupon({ coupon }) {
        if (coupon) { 
            this.couponTarget.style.display = 'block';
            this.couponTarget.innerText = coupon;
        } else {
            this.couponTarget.style.display = 'none';
        }
    }

    setPrice({ price }) {
        debugger
        if (price && price > 1) { 
            this.priceTarget.style.display = 'inline';
            this.priceTarget.innerText = price;
        } else {
            this.priceTarget.style.display = 'none';
        }
    }


    setContent({ photo, price, title, body, link }) {
        this.titleTarget.innerText = title;
        this.bodyTarget.innerText = body;
        this.photoTarget.src = photo;
        this.linkTarget.href = link;
    }

    launchModal(data) {
        this.setContent(data)
        this.setCoupon(data)
        this.setPrice(data)
        this.element.classList.add("open");
    }

    closeModal() {
        this.element.classList.remove("open")
    }
}