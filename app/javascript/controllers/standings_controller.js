import {Controller} from "@hotwired/stimulus"
import consumer from "channels/consumer";

// Connects to data-controller="standings"
export default class extends Controller {
    static targets = ["table", "results"]

    connect() {
        console.log("standings controller connected")
        this.subscription = consumer.subscriptions.create("MatchesChannel", {
            received: (data) => {
                console.log("data: ", data)

                if (data.standings_html) {
                    this.tableTarget.innerHTML = data.standings_html
                }
                if (data.results_html) {
                    this.resultsTarget.innerHTML = data.results_html
                }
            }
        })
    }

    disconnect() {
        this.subscription?.unsubscribe()
    }
}
