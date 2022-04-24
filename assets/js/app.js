import 'jquery';

import '@fortawesome/fontawesome-free/js/fontawesome';
import '@fortawesome/fontawesome-free/js/solid';
import '@fortawesome/fontawesome-free/js/regular';
import '@fortawesome/fontawesome-free/js/brands';

import "phoenix_html";

import EmojiConvertor from 'emoji-js';

window.addEventListener("DOMContentLoaded", () => {
  let emojiConverter = new EmojiConvertor();

  emojiConverter.img_sets.apple.path = 'https://raw.githubusercontent.com/iamcal/emoji-data/master/img-apple-64/';

  document.querySelectorAll(".emoji-replace").forEach((el) => {
    let emoji = emojiConverter.replace_colons(el.innerHTML);
    el.innerHTML = emoji;
  });
});
