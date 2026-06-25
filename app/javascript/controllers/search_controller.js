import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

    filter(event) {
        const q = event.target.value.toLowerCase()
        document.querySelectorAll(".player-card").forEach(card => {
            card.style.display = card.dataset.name.includes(q) ? "" : "none"
        })
    }
}
