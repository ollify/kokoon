const $arrow = $("#toggle-aside a");
const $aside = $(".account-aside");
const $openedAside = true;

$arrow.on("click", openAside);

function openAside() {
  if($openedAside){
    $aside.animate({left: "0"});
    $openedAside = false;
  }

  else {
    $aside.animate({left: "-100%"});
    $openAside = true;
  }
}

