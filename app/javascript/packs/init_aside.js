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
    const textAside1 = document.querySelector(".account-aside h1");
    const textAside2 = document.querySelector(".account-aside h4");
    const textAside3 = document.querySelector(".account-aside h5");
    const textAside4 = document.querySelector(".account-aside li");


    toggleAside.addEventListener("click", (event) => {
        userAside.classList.toggle("hide");
        userMain.classList.toggle("hide");
        userMain.classList.toggle("expanded");


        if (userAside.classList.contains("hide")) {
          toggleAside.innerHTML = `<img src=${rightArrow.src}>`
          imgAside.style.opacity = "0";
          btnAside.style.opacity = "0";
          textAside1.style.opacity = "0";
          textAside2.style.opacity = "0";
          textAside3.style.opacity = "0";
          textAside4.style.opacity = "0";

        }

        else {
          toggleAside.innerHTML = `<img src=${leftArrow.src}>`
          imgAside.style.opacity = "1";
          btnAside.style.opacity = "1";
          textAside1.style.opacity = "1";
          textAside2.style.opacity = "1";
          textAside3.style.opacity = "1";
          textAside4.style.opacity = "1";
        }
    });

  };

initToggleAside();
