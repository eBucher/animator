/*  Create a place for debug information to be displayed on the screen and add any
    necessary event listeners needed for debugging.
*/
function initDebug() {

    // Create a place to show all the debug information
    var debugContainer = document.getElementById("debugContainer");
    debugContainer.innerHTML += '<p><b>DEBUG INFORMATION</b></p>';
    debugContainer.innerHTML += '<p><b>Mouse Coordinates: </b><span id = "mouseCoords">None</span></p>';
    debugContainer.innerHTML += '<p><b>Seconds Elapsed: </b><span id = "secondsElapsed">0</span></p>';
    var mouseCoords = document.getElementById("mouseCoords");

    // Show the mouse coordinates in the canvas
    var canvas = document.getElementById("myCanvas");

    canvas.addEventListener('mousemove', function(e) {
        const rect = canvas.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        // Considering the zoom level is necessary because the scaling will throw off the x and y value returned
        mouseCoords.innerHTML = "x: " + Math.round(x*(1/zoomLevel)) + " y: " + Math.round(y*(1/zoomLevel));
    })
    canvas.addEventListener('mouseleave', (event) => {
        mouseCoords.innerHTML = "None";
    });
}
