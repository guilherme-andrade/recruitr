import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'
import Chart from 'chart.js'

export default class extends Controller {
  connect() {
    StimulusReflex.register(this)
    this.load();
    this.addReloadListener();
  }

  addReloadListener() {
    // Reloads when a new review is succesfully created
    this.element.addEventListener('cable-ready:after-set-attribute', e => {
      console.log(e);
    })
  }

  disconnect() {
    if (this.chart) {
      this.chart.destroy()
    }
  }

  load() {
    if (this.chart) { this.chart.destroy(); }
    this.chart = new Chart(this.element, {
      type: this.type,
      data: {
        labels: this.labels,
        datasets: this.datasets,
      },
      options: this.options
    })
  }

  get labels() {
    return JSON.parse(this.data.get('labels'));
  }

  get datasets() {
    return JSON.parse(this.data.get('datasets'));
  }

  get type() {
    return this.data.get('type');
  }

  get options() {
    return {
      scale: {
        angleLines: {
          display: false
        },
        ticks: {
          suggestedMin: 1,
          suggestedMax: 5
        }
      }
    };
  }
}
