console.log("Hello");

const initToggleAside = () => {
    const toggleAside = document.querySelector("#toggle-aside");
    const userAside = document.querySelector(".account-aside");

    toggleAside.addEventListener("click", (event) => {
        userAside.classList.toggle("hide");

        if (userAside.classList.contains("hide")) {
          toggleAside.innerHTML = `<%= image_tag "right-arrow.png" %>`
        }

        else {
          toggleAside.innerHTML = `<img src="../../images/left-arrow.png">`
        }
    });

  };

