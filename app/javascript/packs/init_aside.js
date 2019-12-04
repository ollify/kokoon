console.log("Hello");

const initToggleAside = () => {
    const toggleAside = document.querySelector("#toggle-aside");
    const userAside = document.querySelector(".account-aside");
    const userMain = document.querySelector(".account-main");
    const myProperties = document.querySelector(".myproperties");
    const myFlats = document.querySelector(".myflats");
    const leftArrow = document.getElementById("image-arrow");
    const rightArrow = document.getElementById("image-arrow-right");
    const gridRow = document.querySelector(".row");

    toggleAside.addEventListener("click", (event) => {
        userAside.classList.toggle("hide");
        userMain.classList.toggle("hide");
        myProperties.classList.toggle("expanded");
        myFlats.classList.toggle("expanded");
        gridRow.classList.toggle("expanded");

        if (userAside.classList.contains("hide")) {
          toggleAside.innerHTML = `<img src=${rightArrow.src}>`
        }

        else {
          toggleAside.innerHTML = `<img src=${leftArrow.src}>`
        }
    });

  };

initToggleAside();
