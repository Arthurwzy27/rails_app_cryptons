import { Chart, registerables } from 'chart.js';
Chart.register(...registerables);

const buildChart = (data, graph) => {

  const d = new Date()
  let bordercolor = [];
  if((data[6] - data[5]) > 0) {
    bordercolor = [
      'rgb(57, 255, 20, 1)',
      'rgb(57, 255, 20, 1)',
      'rgb(57, 255, 20, 1)',
      'rgb(57, 255, 20, 1)',
      'rgb(57, 255, 20, 1)',
      'rgb(57, 255, 20, 1)',
      'rgb(57, 255, 20, 1)',
      'rgb(57, 255, 20, 1)'
    ]
  } else {
    bordercolor = [
      'rgb(255, 0, 0, 1)',
      'rgb(255, 0, 0, 1)',
      'rgb(255, 0, 0, 1)',
      'rgb(255, 0, 0, 1)',
      'rgb(255, 0, 0, 1)',
      'rgb(255, 0, 0, 1)',
      'rgb(255, 0, 0, 1)',
      'rgb(255, 0, 0, 1)'
    ]
  }

  const regChart = new Chart(graph, {
    type: 'line',
    data: {
      labels: [`${d.getDate() - 7}`, `${d.getDate() - 6}`, `${d.getDate() - 5}`, `${d.getDate() - 4}`, `${d.getDate() - 3}`,`${d.getDate() - 2}`,`${d.getDate() - 1}`],
      datasets: [{
        data: [data[0], data[1], data[2], data[3], data[4], data[5], data[6]],
        borderColor: bordercolor,
        borderWidth: 3,
        pointRadius: 4,
        pointHoverRadius: 4,
        lineTension: 0.4
      }]
    },
    options: {
      plugins: {
        legend: {
          display: false
        }
      },
      pointBorderWidth: 0,
    }
  });
}

const getData = () => {
  const graphs = document.querySelectorAll('.chart')

  if(graphs) {
    graphs.forEach((graph) => {
      const graphData = JSON.parse(graph.dataset.history);
      console.log(graphData);
      buildChart(graphData, graph)
    })
  }
}

export { getData }
