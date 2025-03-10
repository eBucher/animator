let loaded_images = [];

// Return all of the unique values in the given array
function uniqueValuesInArray(a) {
    var unique = a.filter((function(value, index, array) {
        return array.indexOf(value) === index;
    }));
    return unique;
}

// Given an array of objects representing a dataframe, the function will return all of
// the values in the given column (ie the values of all attributes with the given name)
function getValuesInColumn(df, col_name) {
    return(df.map(df => df[col_name]));
}

function preloadImage(source) {
    return new Promise((resolve, reject) => {
        const base_image = new Image();

        base_image.addEventListener("load", resolve.bind(null, base_image));
        base_image.src = source;
    });
}

function loadImages() {
    console.log("Loading images...");

    var unique_image_paths = uniqueValuesInArray(getValuesInColumn(imageData, "image"));
    unique_image_paths = unique_image_paths.concat(bgImagePath);

    Promise.all(unique_image_paths.map(preloadImage)).then((images) => {
        for(var i = 0; i < unique_image_paths.length; i++) {
            loaded_images[unique_image_paths[i]] = images[i];
        }
        console.log(Object.keys(loaded_images).length + " images have loaded");
        // Enable the play button once the images are loaded
        let playButton = document.getElementById("play");
        playButton.innerText = "Play";
        playButton.disabled = false;

        canvasWidth = loaded_images[bgImagePath].width;
        canvasHeight = loaded_images[bgImagePath].height;
        document.getElementById("myCanvas").setAttribute("width", canvasWidth);
        document.getElementById("myCanvas").setAttribute("height", canvasHeight);
        console.log(canvasHeight);
        console.log("Ready to go")
    });
}

let maxTime = Math.max(...imageData.map(item => item.endTime)); // Get max end time for the slider
document.getElementById("slider").max = maxTime; // Set slider max value based on animation end time
loadImages();
