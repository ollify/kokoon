import Tribute from "tributejs";

const comment = document.getElementById('comment_content');
const subscribers = JSON.parse(comment.dataset.subscribers);
let i = 0;
let valueSet = [];
subscribers.forEach((subscriber) => {
  valueSet[i] = {key: subscriber.first_name, value: subscriber.full_name, email: subscriber.email};
  i = i + 1;
})

let tribute = new Tribute({
  values: valueSet
});


tribute.attach(comment);
