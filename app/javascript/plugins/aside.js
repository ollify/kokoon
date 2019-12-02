
const toggleAsideMethod = () => {
  const toggleAside = document.querySelector("a#toggle-aside");
  const aside = document.querySelector("account-aside");
  const show == true;

  toggleAside.addEventListener("click", function() {
    if(show == true) {
      aside.style.left = "0";
      show == false;
    }

    else {
      aside.style.left = "-100%";
      show == true;
    }

  });

  };


export { toggleAsideMethod };
