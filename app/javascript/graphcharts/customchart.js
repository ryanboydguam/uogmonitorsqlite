import {Chart, registerables} from "chart.js"
Chart.register(...registerables);
document.addEventListener("turbolinks:load",function(){
    var ctx = document.getElementById("myChart");
    var myData = JSON.parse(ctx.dataset["potato"]);
    var myChart = new Chart(ctx,myData);
})
