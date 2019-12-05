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
    const imgAside = document.querySelector(".image-aside");
    const btnAside = document.querySelector(".btn-primary.aside");

    toggleAside.addEventListener("click", (event) => {
        userAside.classList.toggle("hide");
        userMain.classList.toggle("hide");
        userMain.classList.toggle("expanded");


        if (userAside.classList.contains("hide")) {
          toggleAside.innerHTML = `<img src=${rightArrow.src}>`
          imgAside.style.opacity = "0";
          btnAside.style.opacity = "0";

        }

        else {
          toggleAside.innerHTML = `<img src=${leftArrow.src}>`
          imgAside.style.opacity = "1";
          btnAside.style.opacity = "1";
        }
    });

  };

initToggleAside();
