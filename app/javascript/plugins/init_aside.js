
const toggleAsideMethod = () => {
    const toggleAside = document.querySelector("a.toggle-aside");
    const userAside = document.querySelector("account-aside");

    toggleAside.addEventListener("click", function() {
        userAside.classList.toggle("hide");

        if (userAside.classList.contains("hide")) {
          toggleAside.innerHTML = `<img src=<%= asset_path("right-arrow.png")%>>`
        }

        else {
          toggleAside.innerHTML = `<img src=<%= asset_path("left-arrow.png")%>>`
        }
    });

  };


export { toggleAsideMethod };
