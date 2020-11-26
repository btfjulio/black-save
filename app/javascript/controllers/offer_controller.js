
import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = [
        "title", "body", "price", 
        "photo", "modal", "coupon",
        "link"
    ]

    setModalData() {
        return {
            title: this.titleTarget.dataset.title,
            price: this.priceTarget.innerText,
            body: this.bodyTarget.innerText,
            photo: this.photoTarget.src,
            coupon: this.hasCouponTarget ? this.couponTarget.innerText : "",
            link: this.linkTarget.innerText
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