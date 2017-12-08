import Typed from 'typed.js';

function loadDynamicBannerText() {
  const bannerText = document.getElementById('banner-typed-text');
  if (bannerText) {
    new Typed('#banner-typed-text', {
      strings: ["Winter is coming ...",
        "SnowBot finds for you the best ski resort",
        "SnowBot tracks for you the ski resorts weather",
        "SnowBot finds for you a confortable car",
        "SnowBot finds for you a warmful apartment",
        "SnowBot finds for you the right package that fit your need!"],
      typeSpeed: 60,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
