
import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = [
        "title", "body", "price", 
        "photo", "modal", "coupon"
    ]

    setModalData() {
        return {
            title: this.titleTarget.innerText,
            price: this.priceTarget.innerText,
            body: this.bodyTarget.innerText,
            photo: this.photoTarget.src,
            coupon: this.couponTarget.innerText
        }
    }

    initModal() {
        const data = this.setModalData()
        const modalController = this.application.getControllerForElementAndIdentifier(
            document.getElementById("offer-modal"),
            "modal"
        );
        modalController.launchModal(data)
    }

}